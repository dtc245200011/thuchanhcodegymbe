CREATE DATABASE IF NOT EXISTS `product_exam_db`;
USE `product_exam_db`;

CREATE TABLE IF NOT EXISTS `products` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `price` DOUBLE NOT NULL,
    `quantity` INT NOT NULL
);

-- Dữ liệu mẫu
INSERT INTO `products` (`name`, `price`, `quantity`) VALUES
('Laptop Dell XPS 13', 25000000, 10),
('iPhone 15 Pro Max', 30000000, 15),
('Bàn phím cơ Keychron K2', 1800000, 30),
('Chuột không dây Logitech MX Master 3S', 2400000, 20);
