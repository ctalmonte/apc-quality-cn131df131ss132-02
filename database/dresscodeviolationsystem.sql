-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2016 at 10:38 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dresscodeviolationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `id_picture` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level_access` int(2) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `last_name`, `first_name`, `middle_name`, `id_picture`, `username`, `password`, `level_access`) VALUES
(2, 'Mackie', 'Dizon', 'Ernest', 'disciplinary_personnel/Dizon.jpg', 'medizon', '5f4dcc3b5aa765d61d8327deb882cf99', 10),
(3, 'Barriors', 'Super Administrator', 'Root', '', 'root', '5f4dcc3b5aa765d61d8327deb882cf99', 20);

-- --------------------------------------------------------

--
-- Table structure for table `appeal_ticket`
--

CREATE TABLE `appeal_ticket` (
  `id` int(11) NOT NULL,
  `vio_id` int(11) NOT NULL,
  `appeal_statement` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disciplinary_personnels`
--

CREATE TABLE `disciplinary_personnels` (
  `id` int(11) NOT NULL,
  `dp_id` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `dp_picture` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disciplinary_personnels`
--

INSERT INTO `disciplinary_personnels` (`id`, `dp_id`, `last_name`, `first_name`, `middle_name`, `dp_picture`, `created_at`, `updated_at`) VALUES
(2, '0016645472', 'Alcarde', 'Elijah', 'Mangaser', 'disciplinary_personnel/Elijah.jpg', '2016-03-18 02:59:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message_type` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `message_type`, `body`) VALUES
(3, 'Dress Code Violation Infringement', 'This warning is being issued to you for violating the school dress code under 7.5.11 of the Student Handbook. May you please visit the Disciplinary Office at the prescribed schedule noted in this message. Thank You!');

-- --------------------------------------------------------

--
-- Table structure for table `message_details`
--

CREATE TABLE `message_details` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `partial_seen` int(1) NOT NULL,
  `scheduled_at` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offenses`
--

CREATE TABLE `offenses` (
  `id` int(11) NOT NULL,
  `offense_details_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  `sanctions_id` int(11) NOT NULL,
  `narrative_report` text,
  `status` varchar(254) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_incident` date DEFAULT NULL,
  `school_term_id` int(11) NOT NULL,
  `offense_count` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offenses`
--

INSERT INTO `offenses` (`id`, `offense_details_id`, `students_id`, `sanctions_id`, `narrative_report`, `status`, `date_created`, `date_incident`, `school_term_id`, `offense_count`) VALUES
(66, 22, 7, 5, ' Test ', 'Case Record', '2016-04-17 15:53:09', '2022-02-22', 5, '-'),
(67, 22, 7, 5, ' 22222 issue ', 'Issue', '2016-04-17 15:54:00', '2022-02-22', 5, 'First Offense'),
(68, 22, 7, 5, ' Test ', 'Case Record', '2016-04-17 15:54:39', '2022-02-22', 5, '-'),
(69, 22, 7, 5, ' Test Test ', 'Case Record', '2016-04-17 15:54:52', '2022-02-22', 5, '-'),
(70, 21, 7, 2, ' Issue ', 'Issue', '2016-04-17 15:55:17', '2032-02-22', 5, 'First Offense'),
(71, 22, 7, 5, ' Issue ', 'Issue', '2016-04-17 15:55:38', '2022-02-22', 5, 'Second Offense'),
(72, 22, 7, 5, ' Issue ', 'Issue', '2016-04-17 15:56:21', '2022-02-22', 5, 'Third Offense'),
(73, 23, 7, 4, ' aaa ', 'Case Record', '2016-04-17 16:08:25', '2022-02-22', 5, '-');

-- --------------------------------------------------------

--
-- Table structure for table `offense_details`
--

CREATE TABLE `offense_details` (
  `id` int(11) NOT NULL,
  `reference_number` char(10) DEFAULT NULL,
  `description` text,
  `title` varchar(254) DEFAULT NULL,
  `status` varchar(254) NOT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offense_details`
--

INSERT INTO `offense_details` (`id`, `reference_number`, `description`, `title`, `status`, `type`) VALUES
(20, '7.4.1', 'Forgery, alteration, misuse and or tampering with school documents, records or credentials and knowingly furnishing false documents.', 'Tampering with School Documents', 'Active', 'Major Offense'),
(21, '7.5.1', 'Using someone else''s ID card, or possessing two (2) or more ID cards.', 'Possession of two or more ID', 'Active', 'Minor Offense'),
(22, '7.5.2', 'Unauthorized sale or vending of any kind of item or commodity within the College premises, unless approved by the Student Activities Office and related to academic requirements (example: Entrepreneurship).', 'Unauthorized Sale', 'Active', 'Minor Offense'),
(23, '7.4.2', 'Any violation based on the provisions of Republic Act No. 7877 or the Anti-Sexual Harassment Act of 1995.', 'Anti-Sexual Harassment', 'Active', 'Major Offense');

-- --------------------------------------------------------

--
-- Table structure for table `sanctions`
--

CREATE TABLE `sanctions` (
  `id` int(11) NOT NULL,
  `offense_details_id` int(11) NOT NULL,
  `first_offense` varchar(255) DEFAULT NULL,
  `second_offense` varchar(255) DEFAULT NULL,
  `third_offense` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sanctions`
--

INSERT INTO `sanctions` (`id`, `offense_details_id`, `first_offense`, `second_offense`, `third_offense`) VALUES
(2, 21, ' Warning and Counselling (Guidance Office) ', '  Suspension and Community Service (with NSTP)   ', '  To be treated as the equivalent or corresponding to Major Offense   '),
(3, 20, ' Suspension and Counseling (Guidance Office) ', ' Dismissal/Exclusion or Non-readmission ', '    '),
(4, 23, ' Dismissal/Exclusion or Non-readmission ', '    ', '    '),
(5, 22, 'Warning', 'Suspension and Community Service (with NSTP)  ', 'To be treated as the equivalent or corresponding to Major Offense  ');

-- --------------------------------------------------------

--
-- Table structure for table `school_term`
--

CREATE TABLE `school_term` (
  `id` int(11) NOT NULL,
  `term` varchar(35) NOT NULL,
  `status` varchar(35) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_term`
--

INSERT INTO `school_term` (`id`, `term`, `status`, `start_date`, `end_date`) VALUES
(3, '1st', 'Inactive', '2015-06-03', '2015-09-05'),
(4, '2nd', 'Active', '2015-09-21', '2015-12-19'),
(5, '3rd', 'Inactive', '2016-01-11', '2016-04-16');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `card_id` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `id_picture` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `card_id`, `last_name`, `first_name`, `middle_name`, `department`, `course`, `email`, `gender`, `id_picture`, `username`, `password`, `created_at`, `updated_at`) VALUES
(7, '2013-100000', '0012255866', 'Almonte', 'Cyril', 'Mar', 'School of Computing and Information Technologies', 'Digital Forensics', 'ctmalmonte@student.apc.edu.ph', 'Male', 'student_images/Cyril.jpg', 'ctmalmonte', '5f4dcc3b5aa765d61d8327deb882cf99', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '2013-100001', '0012271385', 'Reyes', 'Herminia', NULL, 'School of Computing and Information Technologies', 'Computer Networks', 'mcreyes@student.apc.edu.ph', 'Female', 'student_images/Hermie.jpg', 'mcreyes', '5f4dcc3b5aa765d61d8327deb882cf99', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '2013-100002', '12345678910', 'Rivera', 'Mark', 'Pepito', 'School of Computing and Information Technologies', 'Digital Forensics', 'mprivera@gmail.com', 'Male', 'student_images/Mark.jpg', 'mprivera', '5f4dcc3b5aa765d61d8327deb882cf99', '2016-04-17 09:31:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `id` int(11) NOT NULL,
  `violation_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`id`, `violation_code`) VALUES
(9, 139),
(9, 141),
(10, 139),
(10, 140),
(10, 142);

-- --------------------------------------------------------

--
-- Table structure for table `violation_code`
--

CREATE TABLE `violation_code` (
  `violation_code` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` char(15) NOT NULL,
  `active` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violation_code`
--

INSERT INTO `violation_code` (`violation_code`, `name`, `gender`, `active`) VALUES
(139, 'No ID', 'EVERYONE', 'YES'),
(140, ' No Sock(s)', 'MALE', 'YES'),
(141, 'Above Knee Length Skirt', 'FEMALE', 'YES'),
(142, 'No Necktie', 'MALE', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `violation_details`
--

CREATE TABLE `violation_details` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `dp_id` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `valid_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `partial_seen` int(1) NOT NULL,
  `ticket` varchar(254) NOT NULL DEFAULT 'Clear',
  `ticket_partial` int(1) NOT NULL,
  `violation_picture` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `school_term_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violation_details`
--

INSERT INTO `violation_details` (`id`, `student_id`, `dp_id`, `remarks`, `valid_date`, `status`, `partial_seen`, `ticket`, `ticket_partial`, `violation_picture`, `created_at`, `school_term_id`) VALUES
(9, '2013-100001', '0016645472', 'Use Case Test # 1', '2016-04-19 15:49:40', 'Violated', 0, 'Clear', 0, '', '2016-04-18 15:49:40', 5),
(10, '2013-100000', '0016645472', 'Test', '2016-04-19 15:50:18', 'Excused', 0, 'Clear', 0, '', '2016-04-17 15:50:18', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appeal_ticket`
--
ALTER TABLE `appeal_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disciplinary_personnels`
--
ALTER TABLE `disciplinary_personnels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_details`
--
ALTER TABLE `message_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offenses`
--
ALTER TABLE `offenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offense_details`
--
ALTER TABLE `offense_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanctions`
--
ALTER TABLE `sanctions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_term`
--
ALTER TABLE `school_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`id`,`violation_code`);

--
-- Indexes for table `violation_code`
--
ALTER TABLE `violation_code`
  ADD PRIMARY KEY (`violation_code`);

--
-- Indexes for table `violation_details`
--
ALTER TABLE `violation_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `appeal_ticket`
--
ALTER TABLE `appeal_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disciplinary_personnels`
--
ALTER TABLE `disciplinary_personnels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `message_details`
--
ALTER TABLE `message_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `offenses`
--
ALTER TABLE `offenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `offense_details`
--
ALTER TABLE `offense_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sanctions`
--
ALTER TABLE `sanctions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `school_term`
--
ALTER TABLE `school_term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `violation_code`
--
ALTER TABLE `violation_code`
  MODIFY `violation_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `violation_details`
--
ALTER TABLE `violation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
