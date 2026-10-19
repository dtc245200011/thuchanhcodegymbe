CREATE DATABASE IF NOT EXISTS `demo`;
USE `demo`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(120) NOT NULL,
    `email` VARCHAR(220) NOT NULL,
    `country` VARCHAR(120)
);

-- Dữ liệu mẫu
INSERT INTO `users` (`name`, `email`, `country`) VALUES
('Nguyen Van A', 'ana@codegym.vn', 'Viet Nam'),
('John Doe', 'john@gmail.com', 'USA'),
('Alice Smith', 'alice@yahoo.com', 'UK');

-- ====================================================
-- BƯỚC 1: ĐỊNH NGHĨA CÁC STORED PROCEDURES
-- ====================================================

-- 1. Procedure lấy tất cả danh sách người dùng
DROP PROCEDURE IF EXISTS select_all_users;
DELIMITER $$ CREATE PROCEDURE select_all_users() BEGIN SELECT * FROM users; END$$
DELIMITER ;

-- 2. Procedure cập nhật thông tin người dùng
DROP PROCEDURE IF EXISTS update_user;
DELIMITER $$ CREATE PROCEDURE update_user( IN user_id INT, IN user_name VARCHAR(120), IN user_email VARCHAR(220), IN user_country VARCHAR(120) ) BEGIN UPDATE users SET name = user_name, email = user_email, country = user_country WHERE id = user_id; END$$
DELIMITER ;

-- 3. Procedure xóa người dùng theo ID
DROP PROCEDURE IF EXISTS delete_user;
DELIMITER $$ CREATE PROCEDURE delete_user(IN user_id INT) BEGIN DELETE FROM users WHERE id = user_id; END$$
DELIMITER ;

-- Procedure bổ trợ lấy User theo ID (phục vụ hiển thị form Edit)
DROP PROCEDURE IF EXISTS get_user_by_id;
DELIMITER $$ CREATE PROCEDURE get_user_by_id(IN user_id INT) BEGIN SELECT id, name, email, country FROM users WHERE id = user_id; END$$
DELIMITER ;
