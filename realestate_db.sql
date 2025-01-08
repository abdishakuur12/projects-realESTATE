-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 11:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestate_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `property_id`, `created_at`) VALUES
(1, 1, 8, '2025-01-08 12:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `property_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `preferred_contact` enum('email','phone') DEFAULT 'email',
  `status` enum('new','contacted','closed') DEFAULT 'new',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `response` text DEFAULT NULL,
  `response_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `name`, `email`, `phone`, `property_id`, `message`, `preferred_contact`, `status`, `created_at`, `updated_at`, `response`, `response_date`) VALUES
(1, 'mohan', 'geyix12432@marikuza.com', '252613429913', 8, 'hrloo', 'phone', '', '2025-01-07 12:30:16', '2025-01-07 12:57:21', NULL, NULL),
(2, 'mohan', 'mdmkddvjb@gmail.com', '252614859913', 3, 'hello', 'email', 'new', '2025-01-08 06:46:51', '2025-01-08 06:46:51', NULL, NULL),
(3, 'mohan', 'mdmkddvjb@gmail.com', '252614859913', 3, 'hello', 'email', '', '2025-01-08 06:47:41', '2025-01-08 06:51:58', 'we will contact you', '2025-01-08 07:51:58'),
(4, 'Mohashafici44@gmail.com', 'Mohashafici44@gmail.com', '252613429913', 7, 'wefrgthr', 'email', '', '2025-01-08 09:19:59', '2025-01-08 09:19:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `area_unit` varchar(10) DEFAULT 'sqft',
  `price` decimal(10,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` enum('available','sold','rented') NOT NULL,
  `property_status` enum('draft','published','pending') DEFAULT 'draft',
  `is_featured` tinyint(1) DEFAULT 0,
  `photo` varchar(255) DEFAULT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `title`, `description`, `bedrooms`, `bathrooms`, `area`, `area_unit`, `price`, `location`, `status`, `property_status`, `is_featured`, `photo`, `added_on`, `updated_at`) VALUES
(3, 'City Center Apartment', 'Modern living in heart of the city', 1, 1, 850.00, 'sqft', 450000.00, 'Delhi, India', 'available', 'published', 0, '677be4f422539.jpg', '2025-01-06 12:15:08', '2025-01-06 14:13:08'),
(4, 'alaab', 'dejkqvhwtgjlr', 4, 2, 2500.00, 'sqft', 2500.00, 'muqdishu', 'available', 'published', 0, '677bcd536db1b.png', '2025-01-06 12:32:19', '2025-01-08 09:04:11'),
(5, 'villa somlia', 'dfncedhw vjdf va', 10, 20, 3000.00, 'sqft', 2500.00, 'muqdishu', 'sold', 'pending', 1, '677bda862330b.png', '2025-01-06 13:28:38', '2025-01-06 13:28:38'),
(6, 'sdjnvsdjkvbdj', 'sfgnfb', 10, 3, 34900.00, 'sqft', 4000.00, 'muqdishu', 'sold', 'pending', 1, '677bdabb3db09.png', '2025-01-06 13:29:31', '2025-01-08 06:33:16'),
(7, 'aqalka cad', 'kdnwehkvhlwefh', 10, 10, 30000.00, 'sqft', 10000.00, 'USA', 'available', 'pending', 1, '677cd37d1745e.png', '2025-01-07 07:10:53', '2025-01-08 09:04:25'),
(8, 'aqaalka cas', 'qefhgwerybfvuir', 20, 50, 300.00, 'sqft', 2600.00, 'ruissia', 'available', 'pending', 1, '677cd7c63d45f.jpeg', '2025-01-07 07:29:10', '2025-01-07 08:41:19'),
(9, 'gety', 'qwewrtyujk', 6, 6, 24900.00, 'sqft', 2300.00, 'USA', 'rented', 'pending', 1, '677d02a764587.png', '2025-01-07 10:32:07', '2025-01-07 10:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `parameters` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_path` varchar(255) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `title`, `type`, `parameters`, `created_by`, `created_at`, `file_path`, `format`) VALUES
(1, 'Property Sales Report', 'property_sales', '{\"start_date\":\"2025-01-07\",\"end_date\":\"2025-01-08\"}', 2, '2025-01-08 10:31:29', 'reports/report_2025-01-08_113129.csv', 'csv'),
(2, 'Featured Performance Report', 'featured_performance', '{\"start_date\":\"2025-01-07\",\"end_date\":\"2025-01-08\"}', 2, '2025-01-08 10:31:56', 'reports/report_2025-01-08_113156.csv', 'csv'),
(3, 'User Activity Report', 'user_activity', '{\"start_date\":\"2025-01-08\",\"end_date\":\"2025-01-16\"}', 2, '2025-01-08 10:43:44', 'reports/report_2025-01-08_114344.csv', 'csv'),
(4, 'Inquiries Report', 'inquiries', '{\"start_date\":\"2025-01-08\",\"end_date\":\"2025-01-16\"}', 2, '2025-01-08 10:44:04', 'reports/report_2025-01-08_114404.csv', 'csv'),
(5, 'Inquiries Report', 'inquiries', '{\"start_date\":\"2025-01-08\",\"end_date\":\"2025-01-16\"}', 2, '2025-01-08 10:44:33', 'reports/report_2025-01-08_114433.pdf', 'pdf'),
(6, 'User Activity Report', 'user_activity', '{\"start_date\":\"2025-01-08\",\"end_date\":\"2025-01-16\"}', 2, '2025-01-08 10:44:51', 'reports/report_2025-01-08_114451.pdf', 'pdf');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('buyer','agent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `created_at`, `role`) VALUES
(1, 'Moha shafici', '$2y$10$ygQHsC8mDgCjmtRiQ9iKv.geIwRcysWDB4Gy09d8E0YWtXeJDOJJK', 'Mohashafici44@gmail.com', '2025-01-07 09:17:51', 'buyer'),
(2, 'calas', '$2y$10$Yy3QQV3uRcOOwyjn3Ji3aePtebb8BsTrPfvmrKuWIM6mU1Mq7pIly', 'mdmkddvjb@gmail.com', '2025-01-08 08:20:12', 'agent');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_favorite` (`user_id`,`property_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`);

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
