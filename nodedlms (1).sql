-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2019 at 07:27 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodedlms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(3) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`) VALUES
(1, 'ganesh', 'prasathmsc5@gmail.com', '123456'),
(2, 'murugan', 'murugan@gmail.com', '123456'),
(8, 'ravi', 'ravikjjhjhj', '123456'),
(9, 'shivan', 'shivan@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_details`
--

CREATE TABLE `candidate_details` (
  `candidate_id` varchar(20) NOT NULL,
  `candidate_password` varchar(20) NOT NULL,
  `candidate_name` varchar(40) NOT NULL,
  `candidate_age` int(10) NOT NULL,
  `candidate_gender` varchar(20) NOT NULL,
  `candidate_phone_number` bigint(10) NOT NULL,
  `candidate_email` varchar(40) NOT NULL,
  `candidate_address` varchar(40) NOT NULL,
  `candidate_edu_quali` varchar(20) NOT NULL,
  `candidate_experience` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate_details`
--

INSERT INTO `candidate_details` (`candidate_id`, `candidate_password`, `candidate_name`, `candidate_age`, `candidate_gender`, `candidate_phone_number`, `candidate_email`, `candidate_address`, `candidate_edu_quali`, `candidate_experience`) VALUES
('c101', '123456', 'ravi', 23, 'male', 9012365478, 'ravi123@gmail.com', 'erode', 'ug', '1');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_job_applied`
--

CREATE TABLE `candidate_job_applied` (
  `id` int(6) NOT NULL,
  `job_id` varchar(20) NOT NULL,
  `candidate_id` varchar(3) NOT NULL,
  `resume_upload` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `address`, `email`, `phone`) VALUES
(1, 'ganesh', 'erode', 'ganesh@gmail.com', '9632145860');

-- --------------------------------------------------------

--
-- Table structure for table `hr_details`
--

CREATE TABLE `hr_details` (
  `hr_id` varchar(20) NOT NULL,
  `hr_company_name` varchar(40) NOT NULL,
  `hr_name` varchar(40) NOT NULL,
  `hr_password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hr_details`
--

INSERT INTO `hr_details` (`hr_id`, `hr_company_name`, `hr_name`, `hr_password`) VALUES
('ram123', 'gogreen', 'ram', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `job_details`
--

CREATE TABLE `job_details` (
  `job_id` varchar(10) NOT NULL,
  `hr_id` varchar(10) NOT NULL,
  `job_role` varchar(40) NOT NULL,
  `job_description` varchar(40) NOT NULL,
  `job_experience_required` int(3) NOT NULL,
  `job_location` varchar(40) NOT NULL,
  `job_skills_required` varchar(40) NOT NULL,
  `job_salary` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_details`
--

INSERT INTO `job_details` (`job_id`, `hr_id`, `job_role`, `job_description`, `job_experience_required`, `job_location`, `job_skills_required`, `job_salary`) VALUES
('gogreen123', 'ram123', 'devops', 'Automatic the system', 1, 'chennai', 'cloud-docker-shell', '5lpa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_details`
--
ALTER TABLE `candidate_details`
  ADD PRIMARY KEY (`candidate_id`);

--
-- Indexes for table `candidate_job_applied`
--
ALTER TABLE `candidate_job_applied`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr_details`
--
ALTER TABLE `hr_details`
  ADD PRIMARY KEY (`hr_id`);

--
-- Indexes for table `job_details`
--
ALTER TABLE `job_details`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `hr_id` (`hr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `candidate_job_applied`
--
ALTER TABLE `candidate_job_applied`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidate_job_applied`
--
ALTER TABLE `candidate_job_applied`
  ADD CONSTRAINT `candidate_job_applied_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_details` (`job_id`),
  ADD CONSTRAINT `candidate_job_applied_ibfk_3` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`candidate_id`);

--
-- Constraints for table `job_details`
--
ALTER TABLE `job_details`
  ADD CONSTRAINT `job_details_ibfk_1` FOREIGN KEY (`hr_id`) REFERENCES `hr_details` (`hr_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
