CREATE DATABASE IF NOT EXISTS `inotes_db`;
USE `inotes_db`;

-- 1. Tạo bảng note_type
CREATE TABLE IF NOT EXISTS `note_type` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `description` VARCHAR(255)
);

-- 2. Tạo bảng notes
CREATE TABLE IF NOT EXISTS `notes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT,
    `type_id` INT,
    FOREIGN KEY (`type_id`) REFERENCES `note_type`(`id`) ON DELETE SET NULL
);

-- 3. Chèn dữ liệu mẫu cho Thể loại ghi chú
INSERT INTO `note_type` (`id`, `name`, `description`) VALUES
(1, 'Cá nhân', 'Ghi chú phục vụ đời sống cá nhân'),
(2, 'Công việc', 'Nhiệm vụ và kế hoạch công việc'),
(3, 'Học tập', 'Kiến thức và bài tập học tập');

-- 4. Chèn dữ liệu mẫu cho Ghi chú
INSERT INTO `notes` (`title`, `content`, `type_id`) VALUES
('Họp giao ban đầu tuần', 'Thảo luận kế hoạch tiến độ dự án iNotes', 2),
('Ôn tập Design Pattern Servlet', 'Luyện tập Strategy Pattern và MVC architecture', 3),
('Mua sắm cuối tuần', 'Mua hoa quả, sữa và thực phẩm cho gia đình', 1);
