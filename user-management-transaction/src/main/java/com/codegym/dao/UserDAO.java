package com.codegym.dao;

import com.codegym.model.User;
import com.codegym.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "SELECT id, name, email, country FROM users WHERE id = ?;";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users;";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?, email = ?, country = ? WHERE id = ?;";

    @Override
    public void insertUser(User user) throws SQLException {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // --- BƯỚC 3: TRIỂN KHẠI HÀM THÊM USER BẰNG JDBC TRANSACTION ---
    @Override
    public void addUserTransaction(User user, int[] permissionIds) throws SQLException {
        Connection connection = null;
        PreparedStatement pstmtUser = null;
        PreparedStatement pstmtAssignment = null;
        ResultSet rs = null;

        try {
            connection = DBConnection.getConnection();

            // 1. Tắt auto-commit để bắt đầu một Transaction
            connection.setAutoCommit(false);

            // 2. Chèn dữ liệu vào bảng users và lấy ID vừa tạo tự động
            String insertUserSql = "INSERT INTO users (name, email, country) VALUES (?, ?, ?)";
            pstmtUser = connection.prepareStatement(insertUserSql, Statement.RETURN_GENERATED_KEYS);
            pstmtUser.setString(1, user.getName());
            pstmtUser.setString(2, user.getEmail());
            pstmtUser.setString(3, user.getCountry());
            pstmtUser.executeUpdate();

            // 3. Lấy ID của user vừa được tạo
            rs = pstmtUser.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            // 4. Chèn dữ liệu vào bảng trung gian user_permission
            if (permissionIds != null && permissionIds.length > 0) {
                String insertPermissionSql = "INSERT INTO user_permission (user_id, permission_id) VALUES (?, ?)";
                pstmtAssignment = connection.prepareStatement(insertPermissionSql);

                for (int permissionId : permissionIds) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permissionId);
                    pstmtAssignment.executeUpdate();
                }
            }

            // 5. Commit Transaction nếu không có lỗi
            connection.commit();
            System.out.println("Transaction đã được commit thành công!");

        } catch (SQLException e) {
            // 6. Rollback lại toàn bộ nếu xảy ra bất kỳ lỗi nào
            try {
                if (connection != null) {
                    connection.rollback();
                    System.out.println("Có lỗi xảy ra! Transaction đã bị rollback.");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // 7. Giải phóng tài nguyên và bật lại auto-commit
            if (rs != null) rs.close();
            if (pstmtUser != null) pstmtUser.close();
            if (pstmtAssignment != null) pstmtAssignment.close();
            if (connection != null) {
                connection.setAutoCommit(true);
                connection.close();
            }
        }
    }
}
