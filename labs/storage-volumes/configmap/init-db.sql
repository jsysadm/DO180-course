-- ============================================================
-- Database Initialization Script: init-db.sql
-- Description: Initializes the 'items' database with a sample table and data
-- ============================================================

-- Use the target database (ensure it exists before running this script)
USE items;

-- Remove the table if it already exists
DROP TABLE IF EXISTS `Item`;

-- Create the Item table
CREATE TABLE `Item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `description` VARCHAR(100) NOT NULL,
  `done` BIT DEFAULT 0
);

-- Insert sample records
INSERT INTO `Item` (`id`, `description`, `done`) VALUES
(1, 'Pick up newspaper', 0),
(2, 'Buy groceries', 1);

-- Verify insertion
SELECT * FROM `Item`;
