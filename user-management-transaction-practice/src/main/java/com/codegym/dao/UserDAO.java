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

    // =========================================================================
    // LUYỆN TẬP TRANSACTION: CỐ TÌNH GÂY LỖI SQL ĐỂ THỰC THI ROLLBACK
    // =========================================================================
    @Override
    public void addUserTransaction(User user, int[] permissionIds) {
        Connection connection = null;
        PreparedStatement pstmtUser = null;
        PreparedStatement pstmtAssignment = null;
        ResultSet rs = null;

        try {
            connection = DBConnection.getConnection();

            // 1. Tắt Auto-Commit để bắt đầu Transaction
            connection.setAutoCommit(false);

            // 2. Chèn thông tin User vào bảng users
            String insertUserSql = "INSERT INTO users (name, email, country) VALUES (?, ?, ?)";
            pstmtUser = connection.prepareStatement(insertUserSql, Statement.RETURN_GENERATED_KEYS);
            pstmtUser.setString(1, user.getName());
            pstmtUser.setString(2, user.getEmail());
            pstmtUser.setString(3, user.getCountry());
            pstmtUser.executeUpdate();

            // Lấy ID tự động sinh ra
            rs = pstmtUser.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            // 3. Chèn thông tin Phân quyền vào bảng user_permission
            if (permissionIds != null && permissionIds.length > 0) {
                
                // -----------------------------------------------------------------
                // [KỊCH BẢN 1: CỐ TÌNH TẠO LỖI SQL ĐỂ BÀI TẬP BẮT LỖI & ROLLBACK]
                // Câu lệnh SQL dưới đây gõ sai tên bảng thành 'invalid_user_permission'
                // -----------------------------------------------------------------
                String insertPermissionSql = "INSERT INTO invalid_user_permission (user_id, permission_id) VALUES (?, ?)";

                // -----------------------------------------------------------------
                // [KỊCH BẢN 2: CÂU LỆNH CHUẨN ĐỂ TRANSACTION COMMIT THÀNH CÔNG]
                // Khi muốn thử nghiệm chạy thành công, hãy mở comment câu lệnh dưới:
                // String insertPermissionSql = "INSERT INTO user_permission (user_id, permission_id) VALUES (?, ?)";
                // -----------------------------------------------------------------

                pstmtAssignment = connection.prepareStatement(insertPermissionSql);

                for (int permissionId : permissionIds) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permissionId);
                    pstmtAssignment.executeUpdate(); // Sẽ ném ra SQLException tại đây nếu dùng Kịch bản 1
                }
            }

            // 4. Nếu toàn bộ trót lọt -> Tiến hành Commit
            connection.commit();
            System.out.println(">>> SUCCESS: Transaction đã commit thành công!");

        } catch (SQLException e) {
            // 5. Nếu gặp bất kỳ lỗi nào -> Tiến hành ROLLBACK khôi phục CSDL
            try {
                if (connection != null) {
                    connection.rollback();
                    System.err.println(">>> ROLLBACK: Đã bắt được lỗi SQL! Toàn bộ thao tác chèn User và Phân quyền đã bị hủy bỏ.");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // 6. Đóng tài nguyên và khôi phục cờ Auto-commit
            try {
                if (rs != null) rs.close();
                if (pstmtUser != null) pstmtUser.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
