-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 26, 2024 at 09:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PetSite`
--

-- --------------------------------------------------------

--
-- Table structure for table `PetRequests`
--

CREATE TABLE `PetRequests` (
  `RequestID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Gender` enum('Male','Female','Unknown') NOT NULL,
  `Age` int(11) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PetRequests`
--

INSERT INTO `PetRequests` (`RequestID`, `UserID`, `Category`, `Gender`, `Age`, `CreatedAt`) VALUES
(8, 3, 'Hamster', 'Female', 1, '2024-09-12 08:01:26'),
(9, 4, 'Cat', 'Male', 2, '2024-09-12 08:01:26'),
(10, 5, 'Dog', 'Female', 5, '2024-09-12 08:01:26'),
(17, 15, 'Cat', 'Male', 2, '2024-09-25 21:37:55'),
(18, 26, 'Cat', 'Male', 3, '2024-09-26 06:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `Pets`
--

CREATE TABLE `Pets` (
  `PetID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Description` text DEFAULT NULL,
  `AdoptionStatus` enum('Available','Adopted') NOT NULL,
  `VaccinationStatus` enum('Vaccinated','Not Vaccinated') NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Pets`
--

INSERT INTO `Pets` (`PetID`, `UserID`, `Name`, `Category`, `Age`, `Gender`, `Description`, `AdoptionStatus`, `VaccinationStatus`, `CreatedAt`) VALUES
(21, 1, 'Bella', 'Dog', 3, 'Female', 'Friendly and playful, loves being around people.', 'Adopted', 'Vaccinated', '2024-09-12 08:00:18'),
(22, 2, 'Milo', 'Cat', 2, 'Male', 'Loves to cuddle and is very calm.', 'Adopted', 'Vaccinated', '2024-09-12 08:00:18'),
(23, 3, 'Charlie', 'Dog', 1, 'Male', 'Energetic puppy that loves to run around.', 'Adopted', 'Not Vaccinated', '2024-09-12 08:00:18'),
(24, 4, 'Lucy', 'Rabbit', 1, 'Female', 'Very gentle, enjoys being petted.', 'Available', 'Not Vaccinated', '2024-09-12 08:00:18'),
(25, 5, 'Max', 'Dog', 5, 'Male', 'Very loyal, protective, and well-trained.', 'Available', 'Vaccinated', '2024-09-12 08:00:18'),
(26, 1, 'Daisy', 'Cat', 4, 'Female', 'Loves climbing and exploring, very curious.', 'Available', 'Vaccinated', '2024-09-12 08:00:18'),
(27, 2, 'Oscar', 'Parrot', 2, 'Female', 'Colorful parrot that can mimic sounds and words.', 'Available', 'Vaccinated', '2024-09-12 08:00:18'),
(28, 3, 'Luna', 'Hamster', 1, 'Female', 'Small and active, enjoys running in her wheel.', 'Available', 'Not Vaccinated', '2024-09-12 08:00:18'),
(29, 4, 'Rocky', 'Dog', 6, 'Male', 'Older dog but very friendly and loves walks.', 'Adopted', 'Vaccinated', '2024-09-12 08:00:18'),
(30, 5, 'Molly', 'Cat', 3, 'Female', 'Independent but loves attention when in the mood.', 'Adopted', 'Not Vaccinated', '2024-09-12 08:00:18'),
(31, 15, 'Kader', 'Cat', 1, 'Male', 'Orange car', 'Available', 'Not Vaccinated', '2024-09-18 20:33:32'),
(32, 2, 'Carrot', 'Rabbit', 1, 'Male', '', 'Adopted', 'Vaccinated', '2024-09-18 20:57:17'),
(33, 15, 'Jerry', 'Mouse', 2, 'Male', '', 'Available', 'Vaccinated', '2024-09-19 09:16:41'),
(34, 15, 'Kiki', 'Hamster', 1, 'Female', '', 'Available', 'Vaccinated', '2024-09-25 15:37:39'),
(35, 23, 'Nana', 'Cat', 2, 'Male', '', 'Available', 'Vaccinated', '2024-09-25 16:29:38'),
(36, 15, '--', 'Cat', 2, 'Male', '', 'Available', 'Vaccinated', '2024-09-25 17:01:46'),
(37, 23, '---', 'Bird', 1, 'Male', '', 'Available', 'Vaccinated', '2024-09-25 18:11:55'),
(38, 23, 'Scooby', 'Dog', 2, 'Male', '', 'Adopted', 'Vaccinated', '2024-09-25 20:17:04'),
(39, 15, 'Dooby', 'Dog', 2, 'Male', '', 'Available', 'Vaccinated', '2024-09-25 20:44:47'),
(40, 15, '', 'Dog', 2, 'Male', '', 'Available', 'Not Vaccinated', '2024-09-25 21:36:35'),
(41, 23, 'katto', 'Cat', 2, 'Male', '', 'Available', 'Not Vaccinated', '2024-09-25 21:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Type` enum('User','Vet') NOT NULL,
  `Notification` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `Email`, `Password`, `FirstName`, `LastName`, `Address`, `PhoneNumber`, `Type`, `Notification`, `CreatedAt`) VALUES
(1, 'john.doe@example.com', 'password123', 'John', 'Doe', '123 Elm St, Springfield', '555-1234', 'User', NULL, '2024-09-12 07:59:57'),
(2, 'jane.smith@example.com', 'mypassword', 'Jane', 'Smith', '456 Oak St, Springfield', '555-5678', 'User', NULL, '2024-09-12 07:59:57'),
(3, 'bob.jones@example.com', 'securepass', 'Bob', 'Jones', '789 Maple St, Springfield', '555-9876', 'User', NULL, '2024-09-12 07:59:57'),
(4, 'alice.brown@example.com', 'alice123', 'Alice', 'Brown', '321 Pine St, Springfield', '555-4321', 'User', 'pet_profile.php?PetID=41\n', '2024-09-12 07:59:57'),
(5, 'charlie.wilson@example.com', 'charliepass', 'Charlie', 'Wilson', '654 Birch St, Springfield', '555-8765', 'User', NULL, '2024-09-12 07:59:57'),
(6, 'lucy.evans@example.com', 'lucypassword', 'Lucy', 'Evans', '987 Cedar St, Springfield', '555-3456', 'User', NULL, '2024-09-12 07:59:57'),
(7, 'michael.lee@example.com', 'mikelee123', 'Michael', 'Lee', '135 Willow St, Springfield', '555-6543', 'User', NULL, '2024-09-12 07:59:57'),
(8, 'olivia.davis@example.com', 'oliviapass', 'Olivia', 'Davis', '246 Walnut St, Springfield', '555-7654', 'User', NULL, '2024-09-12 07:59:57'),
(9, 'noah.white@example.com', 'noahsecure', 'Noah', 'White', '369 Chestnut St, Springfield', '555-8764', 'User', NULL, '2024-09-12 07:59:57'),
(10, 'emma.martin@example.com', 'emma123', 'Emma', 'Martin', '852 Aspen St, Springfield', '555-2345', 'User', NULL, '2024-09-12 07:59:57'),
(11, 'dr.jameson@example.com', 'vetpass123', 'James', 'On', NULL, '555-1111', 'Vet', NULL, '2024-09-12 02:02:09'),
(12, 'dr.smith@example.com', 'smithpass456', 'Emily', 'Smith', NULL, '555-2222', 'Vet', NULL, '2024-09-12 02:02:09'),
(13, 'dr.brown@example.com', 'brownpass789', 'Michael', 'Brown', NULL, '555-3333', 'Vet', NULL, '2024-09-12 02:02:09'),
(14, 'dr.johnson@example.com', 'johnsonpass321', 'Sarah', 'Johnson', NULL, '555-4444', 'Vet', NULL, '2024-09-12 02:02:09'),
(15, 'shababanam4@gmail.com', 'Helloworld', 'Shabab', 'Anam', '41/1/A, Chanmia Housing', '01305302758', 'User', 'pet_profile.php?PetID=41\n', '2024-09-18 16:40:33'),
(16, 'dr.lee@example.com', 'leepass654', 'David', 'Lee', NULL, '555-5555', 'Vet', NULL, '2024-09-12 02:02:09'),
(22, 'kaito.akatsuki@example.com', 'MoonlitF0xHikari', 'Kaito', 'Akatsuki', '123 Ekoda Street, Tokyo, Japan', '(03) 555-7890', 'User', NULL, '2024-09-20 19:11:30'),
(23, 'nht@gmail.com', 'nhtnht', 'Nawroz', 'Haseen', 'Example Address', '0177777777777', 'User', NULL, '2024-09-25 15:48:13'),
(24, 'new@gmail.com', 'newpass', 'New', 'Account', '   ', '017770000', 'User', NULL, '2024-09-25 22:47:57'),
(25, 'nafim@gmail.com', 'password', 'Nafim', 'Rahman', NULL, '1975899121', 'Vet', NULL, '2024-09-26 05:26:48'),
(26, 'test@gmail.com', 'testtest', 'te', 'st', '   ', '878667', 'User', NULL, '2024-09-26 06:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `VetAppointments`
--

CREATE TABLE `VetAppointments` (
  `AppointmentID` int(11) NOT NULL,
  `UserID_User` int(11) NOT NULL,
  `UserID_Vet` int(11) NOT NULL,
  `AppointmentDate` datetime NOT NULL,
  `Reason` varchar(255) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `VetAppointments`
--

INSERT INTO `VetAppointments` (`AppointmentID`, `UserID_User`, `UserID_Vet`, `AppointmentDate`, `Reason`, `CreatedAt`) VALUES
(1, 1, 16, '2024-09-25 10:00:00', 'Annual checkup for dog', '2024-09-21 02:00:00'),
(2, 2, 14, '2024-09-26 14:00:00', 'Vaccination for cat', '2024-09-21 02:15:00'),
(3, 3, 14, '2024-09-27 11:30:00', 'Follow-up appointment for injury', '2024-09-21 02:20:00'),
(4, 15, 13, '2024-09-10 07:11:00', 'Vaccination', '2024-09-26 01:11:57'),
(5, 15, 25, '2024-09-20 12:39:00', 'vaccine', '2024-09-26 06:39:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `PetRequests`
--
ALTER TABLE `PetRequests`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Pets`
--
ALTER TABLE `Pets`
  ADD PRIMARY KEY (`PetID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `VetAppointments`
--
ALTER TABLE `VetAppointments`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `UserID_User` (`UserID_User`),
  ADD KEY `UserID_Vet` (`UserID_Vet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `PetRequests`
--
ALTER TABLE `PetRequests`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Pets`
--
ALTER TABLE `Pets`
  MODIFY `PetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `VetAppointments`
--
ALTER TABLE `VetAppointments`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PetRequests`
--
ALTER TABLE `PetRequests`
  ADD CONSTRAINT `petrequests_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `Pets`
--
ALTER TABLE `Pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `VetAppointments`
--
ALTER TABLE `VetAppointments`
  ADD CONSTRAINT `vetappointments_ibfk_1` FOREIGN KEY (`UserID_User`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `vetappointments_ibfk_2` FOREIGN KEY (`UserID_Vet`) REFERENCES `Users` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
