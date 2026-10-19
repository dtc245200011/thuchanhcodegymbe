CREATE DATABASE IF NOT EXISTS `demo`;
USE `demo`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(120) NOT NULL,
    `email` VARCHAR(220) NOT NULL,
    `country` VARCHAR(120)
);

INSERT INTO `users` (`name`, `email`, `country`) VALUES
('Nguyen Van A', 'ana@codegym.vn', 'Viet Nam'),
('John Doe', 'john@gmail.com', 'USA'),
('Alice Smith', 'alice@yahoo.com', 'UK'),
('Tran Van B', 'btv@codegym.vn', 'Viet Nam'),
('Michael Jordan', 'michaell@nba.com', 'USA');
