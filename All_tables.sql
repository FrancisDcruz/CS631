-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 05:38 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(255) NOT NULL,
  `id` int(2) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `id`, `code`) VALUES
('Francis', 24, '152018'),
('Joyce', 42, '151011');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `PID` int(10) UNSIGNED NOT NULL,
  `DOCID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`PID`, `DOCID`) VALUES
(1, 1),
(2, 3),
(2, 4),
(3, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `DOCID` int(10) UNSIGNED NOT NULL,
  `ISBN` char(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`DOCID`, `ISBN`) VALUES
(1, '999-3-16-188870-0'),
(2, '960-9-16-141910-0'),
(3, '938-3-10-146510-0'),
(4, ''),
(5, '978-3-15-148410-0');

-- --------------------------------------------------------

--
-- Table structure for table `borrowing`
--

CREATE TABLE `borrowing` (
  `BOR_NO` int(11) NOT NULL,
  `BDTIME` datetime DEFAULT NULL,
  `RDTIME` datetime DEFAULT NULL,
  `DUEDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowing`
--

INSERT INTO `borrowing` (`BOR_NO`, `BDTIME`, `RDTIME`, `DUEDATE`) VALUES
(1, '2012-12-03 00:00:00', '2012-12-05 00:00:00', '2012-12-23 00:00:00'),
(2, '2012-12-04 00:00:00', NULL, '2012-12-24 00:00:00'),
(3, '2012-12-05 00:00:00', NULL, '2012-12-25 00:00:00'),
(4, '2012-12-06 00:00:00', '2012-12-15 00:00:00', '2012-12-26 00:00:00'),
(5, '2012-12-07 00:00:00', NULL, '2012-12-27 00:00:00'),
(6, '2012-12-03 00:00:00', '2012-12-05 00:00:00', '2012-12-23 00:00:00'),
(7, '2012-12-04 00:00:00', '2021-05-03 10:56:48', '2012-12-24 00:00:00'),
(8, '2012-12-05 00:00:00', NULL, '2012-12-25 00:00:00'),
(9, '2012-12-06 00:00:00', '2012-12-15 00:00:00', '2012-12-26 00:00:00'),
(10, '2012-12-07 00:00:00', NULL, '2012-12-27 00:00:00'),
(15, '2021-05-03 10:55:00', NULL, '2021-06-02 10:55:00'),
(16, '2021-05-03 10:55:56', NULL, '2021-06-02 10:55:56');

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `BOR_NO` int(11) NOT NULL,
  `RID` int(11) DEFAULT NULL,
  `DOCID` int(11) UNSIGNED NOT NULL,
  `BID` int(11) UNSIGNED NOT NULL,
  `COPYNO` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`BOR_NO`, `RID`, `DOCID`, `BID`, `COPYNO`) VALUES
(7, 1, 1, 1, 3),
(10, 1, 4, 2, 5),
(16, 1, 2, 1, 2),
(8, 2, 2, 1, 2),
(15, 2, 1, 1, 1),
(6, 4, 1, 1, 1),
(9, 6, 3, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BID` int(10) UNSIGNED NOT NULL,
  `LNAME` varchar(30) NOT NULL,
  `LOCATION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BID`, `LNAME`, `LOCATION`) VALUES
(1, 'Jersey City', '121, Grant St, Jersey City, NJ'),
(2, 'Newark', '555 Washington St, Newark, NJ'),
(3, 'Trenton', '345 Franklin Ave, Trenton, NJ'),
(4, 'Edison', '234, MLK St, Edison, NJ');

-- --------------------------------------------------------

--
-- Table structure for table `chairs`
--

CREATE TABLE `chairs` (
  `PID` int(11) UNSIGNED NOT NULL,
  `DOCID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chairs`
--

INSERT INTO `chairs` (`PID`, `DOCID`) VALUES
(1, 3),
(5, 4),
(4, 5),
(2, 7),
(7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `DOCID` int(10) UNSIGNED NOT NULL,
  `COPYNO` int(10) UNSIGNED NOT NULL,
  `BID` int(10) UNSIGNED NOT NULL,
  `POSITION` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `copy`
--

INSERT INTO `copy` (`DOCID`, `COPYNO`, `BID`, `POSITION`) VALUES
(1, 1, 1, 'SA-Q-124'),
(1, 3, 1, 'SQ-G-123'),
(2, 2, 1, 'SB-K-5223'),
(3, 4, 2, 'SD-F-4563'),
(4, 5, 2, 'DE-G-3456');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `DOCID` int(10) UNSIGNED NOT NULL,
  `TITLE` varchar(45) NOT NULL,
  `PDATE` date DEFAULT NULL,
  `PUBLISHERID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`DOCID`, `TITLE`, `PDATE`, `PUBLISHERID`) VALUES
(1, 'To Kill a Mockingbird', '1999-12-03', 1),
(2, 'Harry Potter and the Philosophers Stone', '1999-12-04', 2),
(3, 'The Lord of the Rings', '1999-12-05', 3),
(4, 'The Great Gatsby', '1999-12-06', 1),
(5, 'Pride and Prejudice', '1999-12-07', 2),
(6, 'The Diary Of A Young Girl', '1999-12-08', 5),
(7, 'The Book Thief', '1999-12-09', 4),
(8, 'The Power of Habit', '1999-12-10', 2),
(9, 'High Performance Habits', '1999-12-11', 3),
(11, 'Joyce chettiar', '2020-04-12', 4);

-- --------------------------------------------------------

--
-- Table structure for table `gedits`
--

CREATE TABLE `gedits` (
  `DOCID` int(10) UNSIGNED NOT NULL,
  `ISSUE_NO` int(11) UNSIGNED NOT NULL,
  `PID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gedits`
--

INSERT INTO `gedits` (`DOCID`, `ISSUE_NO`, `PID`) VALUES
(1, 1, 1),
(3, 2, 3),
(5, 3, 7),
(7, 4, 2),
(9, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `journal_issue`
--

CREATE TABLE `journal_issue` (
  `DOCID` int(10) UNSIGNED NOT NULL,
  `ISSUE_NO` int(10) UNSIGNED NOT NULL,
  `SCOPE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `journal_issue`
--

INSERT INTO `journal_issue` (`DOCID`, `ISSUE_NO`, `SCOPE`) VALUES
(1, 1, 'POLITICS'),
(3, 2, 'TECH'),
(5, 3, 'BIOLOGY'),
(7, 4, 'SOCIAL'),
(9, 5, 'TECH');

-- --------------------------------------------------------

--
-- Table structure for table `journal_volume`
--

CREATE TABLE `journal_volume` (
  `DOCID` int(10) UNSIGNED NOT NULL,
  `VOLUME_NO` int(11) NOT NULL,
  `EDITOR` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `journal_volume`
--

INSERT INTO `journal_volume` (`DOCID`, `VOLUME_NO`, `EDITOR`) VALUES
(1, 6, 2),
(3, 2, 4),
(5, 2, 1),
(6, 2, 4),
(7, 7, 7),
(9, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PID` int(10) UNSIGNED NOT NULL,
  `PNAME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`PID`, `PNAME`) VALUES
(1, 'Darshan'),
(2, 'Alex'),
(3, 'Ketki'),
(4, 'Jasneek'),
(5, 'Thomas'),
(6, 'Ravi'),
(7, 'Ashley');

-- --------------------------------------------------------

--
-- Table structure for table `proceedings`
--

CREATE TABLE `proceedings` (
  `DOCID` int(10) UNSIGNED NOT NULL,
  `CDATE` date DEFAULT NULL,
  `CLOCATION` varchar(45) DEFAULT NULL,
  `CEDITOR` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proceedings`
--

INSERT INTO `proceedings` (`DOCID`, `CDATE`, `CLOCATION`, `CEDITOR`) VALUES
(3, '1989-09-07', 'New York', 'Noah'),
(4, '2000-02-18', 'San Diego', 'Maxwell'),
(5, '2000-01-20', 'Houston', 'Elijah'),
(7, '1999-12-03', 'Miami', 'Liam'),
(9, '1999-12-22', 'Chicago', 'Benjamin');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `PUBLISHERID` int(9) UNSIGNED NOT NULL,
  `PUBNAME` varchar(45) NOT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PUBLISHERID`, `PUBNAME`, `ADDRESS`) VALUES
(1, 'Bloomberg ', '123 Central Ave Newark, NJ'),
(2, 'Harper ', '234 Broad St, Jersey City, NJ'),
(3, 'Wiley ', '345 Newark Ave, Elizabeth, NJ'),
(4, 'Pearson', '456 North Street, West Orange, NJ'),
(5, 'Penguin', '678 Grove St, Newport, NJ');

-- --------------------------------------------------------

--
-- Table structure for table `reader`
--

CREATE TABLE `reader` (
  `RID` int(11) NOT NULL,
  `RTYPE` varchar(128) DEFAULT NULL,
  `RNAME` varchar(128) DEFAULT NULL,
  `RADDRESS` varchar(128) DEFAULT NULL,
  `PHONE_NO` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reader`
--

INSERT INTO `reader` (`RID`, `RTYPE`, `RNAME`, `RADDRESS`, `PHONE_NO`) VALUES
(1, 'Student', 'Alex Hamilton', '1804, Greenwich Village, New York, NY', 9917890704),
(2, 'Senior Citizen', 'George Washington', 'George Washington\'s Mount Vernon, Mount Vernon, VA', 9217320899),
(3, 'Student', 'Benjamin Franklin', 'Milk Street, Boston, MA', 9717060490),
(4, 'Staff', 'John Adams', '', 1017350726),
(5, 'Senior Citizen', 'Samuel Adams', 'Boston, MA', 9917221003),
(6, 'Senior Citizen', 'Thomas Jefferson', 'Monticello, VA', 9417430726),
(7, 'Student', 'James Madison', 'James Madison\'s Montpelier, Montpelier Station, VA', 9317510636),
(8, 'Staff', 'John Jay', 'Bedford, NY', 1217450529);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `RES_NO` int(11) NOT NULL,
  `DTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`RES_NO`, `DTIME`) VALUES
(1, '2012-12-05 00:00:00'),
(2, '2012-12-06 00:00:00'),
(3, '2012-12-09 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reserves`
--

CREATE TABLE `reserves` (
  `RESERVATION_NO` int(11) NOT NULL,
  `RID` int(11) DEFAULT NULL,
  `DOCID` int(11) UNSIGNED NOT NULL,
  `COPYNO` int(11) UNSIGNED NOT NULL,
  `BID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reserves`
--

INSERT INTO `reserves` (`RESERVATION_NO`, `RID`, `DOCID`, `COPYNO`, `BID`) VALUES
(2, 3, 3, 4, 2),
(3, 4, 1, 1, 1),
(1, 7, 4, 5, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`PID`,`DOCID`),
  ADD KEY `DOCID_idx` (`DOCID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`DOCID`);

--
-- Indexes for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD PRIMARY KEY (`BOR_NO`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`BOR_NO`,`DOCID`,`COPYNO`,`BID`),
  ADD KEY `RID` (`RID`),
  ADD KEY `DOCID` (`DOCID`,`COPYNO`,`BID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `chairs`
--
ALTER TABLE `chairs`
  ADD PRIMARY KEY (`DOCID`,`PID`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`DOCID`,`COPYNO`,`BID`),
  ADD UNIQUE KEY `COPYNO` (`COPYNO`),
  ADD KEY `fk_Copy_bid` (`BID`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`DOCID`),
  ADD KEY `PUBLISHERID` (`PUBLISHERID`);

--
-- Indexes for table `gedits`
--
ALTER TABLE `gedits`
  ADD PRIMARY KEY (`DOCID`,`ISSUE_NO`,`PID`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `journal_issue`
--
ALTER TABLE `journal_issue`
  ADD PRIMARY KEY (`DOCID`,`ISSUE_NO`),
  ADD UNIQUE KEY `ISSUE_NO` (`ISSUE_NO`);

--
-- Indexes for table `journal_volume`
--
ALTER TABLE `journal_volume`
  ADD PRIMARY KEY (`DOCID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `proceedings`
--
ALTER TABLE `proceedings`
  ADD PRIMARY KEY (`DOCID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`PUBLISHERID`);

--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`RES_NO`);

--
-- Indexes for table `reserves`
--
ALTER TABLE `reserves`
  ADD PRIMARY KEY (`RESERVATION_NO`,`DOCID`,`COPYNO`,`BID`),
  ADD KEY `RID` (`RID`),
  ADD KEY `DOCID` (`DOCID`,`COPYNO`,`BID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowing`
--
ALTER TABLE `borrowing`
  MODIFY `BOR_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `copy`
--
ALTER TABLE `copy`
  MODIFY `COPYNO` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `DOCID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `journal_issue`
--
ALTER TABLE `journal_issue`
  MODIFY `ISSUE_NO` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `PID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `PUBLISHERID` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reader`
--
ALTER TABLE `reader`
  MODIFY `RID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `RES_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `DOCID` FOREIGN KEY (`DOCID`) REFERENCES `book` (`DOCID`),
  ADD CONSTRAINT `PID` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`);

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`BOR_NO`) REFERENCES `borrowing` (`BOR_NO`),
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`),
  ADD CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`BOR_NO`) REFERENCES `borrowing` (`BOR_NO`),
  ADD CONSTRAINT `borrows_ibfk_4` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`),
  ADD CONSTRAINT `borrows_ibfk_5` FOREIGN KEY (`BOR_NO`) REFERENCES `borrowing` (`BOR_NO`),
  ADD CONSTRAINT `borrows_ibfk_6` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`),
  ADD CONSTRAINT `borrows_ibfk_7` FOREIGN KEY (`BOR_NO`) REFERENCES `borrowing` (`BOR_NO`),
  ADD CONSTRAINT `borrows_ibfk_8` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`),
  ADD CONSTRAINT `borrows_ibfk_9` FOREIGN KEY (`DOCID`,`COPYNO`,`BID`) REFERENCES `copy` (`DOCID`, `COPYNO`, `BID`);

--
-- Constraints for table `chairs`
--
ALTER TABLE `chairs`
  ADD CONSTRAINT `chairs_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`),
  ADD CONSTRAINT `chairs_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `proceedings` (`DOCID`);

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `fk_Copy_bid` FOREIGN KEY (`BID`) REFERENCES `branch` (`BID`),
  ADD CONSTRAINT `fk_Copy_docid` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`);

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `PUBLISHERID` FOREIGN KEY (`PUBLISHERID`) REFERENCES `publisher` (`PUBLISHERID`);

--
-- Constraints for table `gedits`
--
ALTER TABLE `gedits`
  ADD CONSTRAINT `gedits_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`),
  ADD CONSTRAINT `gedits_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`),
  ADD CONSTRAINT `gedits_ibfk_3` FOREIGN KEY (`PID`) REFERENCES `person` (`PID`),
  ADD CONSTRAINT `gedits_ibfk_4` FOREIGN KEY (`DOCID`,`ISSUE_NO`) REFERENCES `journal_issue` (`DOCID`, `ISSUE_NO`);

--
-- Constraints for table `journal_issue`
--
ALTER TABLE `journal_issue`
  ADD CONSTRAINT `journal_issue_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `journal_volume` (`DOCID`);

--
-- Constraints for table `journal_volume`
--
ALTER TABLE `journal_volume`
  ADD CONSTRAINT `journal_volume_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`);

--
-- Constraints for table `proceedings`
--
ALTER TABLE `proceedings`
  ADD CONSTRAINT `proceedings_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`),
  ADD CONSTRAINT `proceedings_ibfk_2` FOREIGN KEY (`DOCID`) REFERENCES `document` (`DOCID`);

--
-- Constraints for table `reserves`
--
ALTER TABLE `reserves`
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`RESERVATION_NO`) REFERENCES `reservation` (`RES_NO`),
  ADD CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`),
  ADD CONSTRAINT `reserves_ibfk_3` FOREIGN KEY (`RESERVATION_NO`) REFERENCES `reservation` (`RES_NO`),
  ADD CONSTRAINT `reserves_ibfk_4` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`),
  ADD CONSTRAINT `reserves_ibfk_5` FOREIGN KEY (`RESERVATION_NO`) REFERENCES `reservation` (`RES_NO`),
  ADD CONSTRAINT `reserves_ibfk_6` FOREIGN KEY (`RID`) REFERENCES `reader` (`RID`),
  ADD CONSTRAINT `reserves_ibfk_7` FOREIGN KEY (`DOCID`,`COPYNO`,`BID`) REFERENCES `copy` (`DOCID`, `COPYNO`, `BID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
