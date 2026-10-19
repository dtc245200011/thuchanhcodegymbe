CREATE DATABASE IF NOT EXISTS `demo`;
USE `demo`;

-- 1. Bảng Users
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(120) NOT NULL,
    `email` VARCHAR(220) NOT NULL,
    `country` VARCHAR(120)
);

-- 2. Bảng Permission
CREATE TABLE IF NOT EXISTS `permission` (
    `id` INT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

-- 3. Bảng trung gian User_Permission
CREATE TABLE IF NOT EXISTS `user_permission` (
    `user_id` INT,
    `permission_id` INT,
    PRIMARY KEY (`user_id`, `permission_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`permission_id`) REFERENCES `permission`(`id`) ON DELETE CASCADE
);

-- 4. Chèn danh mục quyền mẫu
INSERT INTO `permission` (`id`, `name`) VALUES 
(1, 'add'),
(2, 'edit'),
(3, 'delete'),
(4, 'view')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);
