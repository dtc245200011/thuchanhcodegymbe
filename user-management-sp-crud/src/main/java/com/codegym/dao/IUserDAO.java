package com.codegym.dao;

import com.codegym.model.User;
import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;
    User selectUser(int id);
    
    // BƯỚC 2: KHAI BÁO CÁC PHƯƠNG THỨC SỬ DỤNG STORED PROCEDURE
    List<User> selectAllUsersStore();
    boolean updateUserStore(User user) throws SQLException;
    boolean deleteUserStore(int id) throws SQLException;
}
