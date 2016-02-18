-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2016 at 11:49 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `violationdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `appeal ticket`
--

CREATE TABLE `appeal ticket` (
  `id` int(11) NOT NULL,
  `appeal_statement` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `disciplinary_personnel`
--

CREATE TABLE `disciplinary_personnel` (
  `id` int(11) NOT NULL,
  `dp_id` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `dp_picture_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message_type` varchar(255) NOT NULL,
  `body` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message details`
--

CREATE TABLE `message details` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `rf_id` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `school` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `id_picture_path` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `passowrd` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student violations`
--

CREATE TABLE `student violations` (
  `id` int(11) NOT NULL,
  `violation_id` int(11) NOT NULL,
  `violation_date_created` datetime NOT NULL,
  `violation list_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated)at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `violation`
--

CREATE TABLE `violation` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `remarks` text,
  `valid_date` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `violation_picture_path` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `disciplinary_personnel_id` int(11) NOT NULL,
  `student_id1` int(11) NOT NULL,
  `appeal ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `violation list`
--

CREATE TABLE `violation list` (
  `id` int(11) NOT NULL,
  `violation_code` int(11) NOT NULL,
  `violation_name` varchar(255) DEFAULT NULL,
  `gender` char(15) DEFAULT NULL,
  `active` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_administrator_user1_idx` (`user_id`);

--
-- Indexes for table `appeal ticket`
--
ALTER TABLE `appeal ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disciplinary_personnel`
--
ALTER TABLE `disciplinary_personnel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message details`
--
ALTER TABLE `message details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_message details_student1_idx` (`student_id`),
  ADD KEY `fk_message details_message1_idx` (`message_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_user1_idx` (`user_id`);

--
-- Indexes for table `student violations`
--
ALTER TABLE `student violations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student violations_violation1_idx` (`violation_id`,`violation_date_created`),
  ADD KEY `fk_student violations_violation list1_idx` (`violation list_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `violation`
--
ALTER TABLE `violation`
  ADD PRIMARY KEY (`id`,`date_created`),
  ADD KEY `fk_violation_disciplinary_personnel_idx` (`disciplinary_personnel_id`),
  ADD KEY `fk_violation_student1_idx` (`student_id1`),
  ADD KEY `fk_violation_appeal ticket1_idx` (`appeal ticket_id`);

--
-- Indexes for table `violation list`
--
ALTER TABLE `violation list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appeal ticket`
--
ALTER TABLE `appeal ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disciplinary_personnel`
--
ALTER TABLE `disciplinary_personnel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message details`
--
ALTER TABLE `message details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student violations`
--
ALTER TABLE `student violations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `violation`
--
ALTER TABLE `violation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `violation list`
--
ALTER TABLE `violation list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `fk_administrator_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message details`
--
ALTER TABLE `message details`
  ADD CONSTRAINT `fk_message details_message1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_message details_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student violations`
--
ALTER TABLE `student violations`
  ADD CONSTRAINT `fk_student violations_violation list1` FOREIGN KEY (`violation list_id`) REFERENCES `violation list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student violations_violation1` FOREIGN KEY (`violation_id`,`violation_date_created`) REFERENCES `violation` (`id`, `date_created`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `violation`
--
ALTER TABLE `violation`
  ADD CONSTRAINT `fk_violation_appeal ticket1` FOREIGN KEY (`appeal ticket_id`) REFERENCES `appeal ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_violation_disciplinary_personnel` FOREIGN KEY (`disciplinary_personnel_id`) REFERENCES `disciplinary_personnel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_violation_student1` FOREIGN KEY (`student_id1`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
