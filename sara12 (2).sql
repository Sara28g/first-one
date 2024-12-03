-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2024 at 11:04 AM
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
-- Database: `sara12`
--

-- --------------------------------------------------------

--
-- Table structure for table `moves`
--

CREATE TABLE `moves` (
  `moveID` int(11) NOT NULL,
  `lastPosition` point DEFAULT current_timestamp(),
  `firstPosition` point NOT NULL DEFAULT current_timestamp(),
  `puzzlesolved` int(11) NOT NULL DEFAULT current_timestamp(),
  `placement` multipoint NOT NULL DEFAULT current_timestamp(),
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `puzzels`
--

CREATE TABLE `puzzels` (
  `puzzelID` int(11) NOT NULL,
  `puzzelContext` text NOT NULL,
  `puzzelAnswer` int(11) NOT NULL,
  `complete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `userName` varchar(250) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Email` text NOT NULL,
  `password` varchar(500) NOT NULL,
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `lastName`, `userName`, `Phone`, `Email`, `password`, `createdDateTime`) VALUES
(1, 'sara', 'garah', '', 0, '', 'sara28', '2024-11-02 07:22:20'),
(2, 'omar', 'garah', '', 0, '', 'omar2001', '2024-11-02 07:22:20'),
(10, 'sara', 'sarra', 'sar_auser', 0, 'aaa@gmail.com', '123123', '2024-12-03 10:01:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `moves`
--
ALTER TABLE `moves`
  ADD PRIMARY KEY (`moveID`);

--
-- Indexes for table `puzzels`
--
ALTER TABLE `puzzels`
  ADD PRIMARY KEY (`puzzelID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `moves`
--
ALTER TABLE `moves`
  MODIFY `moveID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `puzzels`
--
ALTER TABLE `puzzels`
  MODIFY `puzzelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
