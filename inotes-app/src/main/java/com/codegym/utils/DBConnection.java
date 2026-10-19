package com.codegym.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/inotes_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "root"; // Đổi mật khẩu phù hợp với máy của bạn

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
