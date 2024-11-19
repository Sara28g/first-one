-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2024 at 09:35 AM
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
  `password` varchar(500) NOT NULL,
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `lastName`, `password`, `createdDateTime`) VALUES
(1, 'sara', 'garah', 'sara28', '2024-11-02 07:22:20'),
(2, 'omar', 'garah', 'omar2001', '2024-11-02 07:22:20'),
(3, 'rabab', '_12', '123', '2024-11-12 09:47:59'),
(4, 'Bob', 'momo', '123', '2024-11-12 09:48:08'),
(5, 'Bob', '123', 'momo', '2024-11-12 09:55:58'),
(6, 'Bob', '123', 'momo', '2024-11-12 10:01:26');

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
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
