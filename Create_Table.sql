
#Run these queries to create Tables in Library Database
#Branch

CREATE TABLE `BRANCH` (
`BID` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
 `LNAME` VARCHAR(30) NOT NULL ,
`LOCATION` VARCHAR(50) NOT NULL ,
 PRIMARY KEY (`BID`));

#Copy

CREATE TABLE `COPY` (
 `DOCID` INT UNSIGNED NOT NULL ,
`COPYNO` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
`BID` INT UNSIGNED NOT NULL ,
`POSITION` VARCHAR(10) NULL DEFAULT NULL ,
 PRIMARY KEY (`DOCID`,`COPYNO`, `BID`) ,
 CONSTRAINT `fk_Copy_bid` FOREIGN KEY (`BID`) REFERENCES BRANCH (`BID`),
 CONSTRAINT `fk_Copy_docid` FOREIGN KEY (`DOCID`) REFERENCES DOCUMENT (`DOCID`)
);

#PERSON Table
CREATE TABLE `PERSON` (
  `PID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PNAME` VARCHAR(45) NULL,
  PRIMARY KEY (`PID`));


#PUBLISHER Table

CREATE TABLE `PUBLISHER` (
  `PUBLISHERID` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PUBNAME` VARCHAR(45) NOT NULL,
  `ADDRESS` VARCHAR(200) NULL,
  PRIMARY KEY (`PUBLISHERID`));

#AUTHORS Table

CREATE TABLE `AUTHORS` (
  `PID` int unsigned NOT NULL,
  `DOCID` int unsigned NOT NULL,
  PRIMARY KEY (`PID`,`DOCID`),
  KEY `DOCID_idx` (`DOCID`),
  CONSTRAINT `DOCID` FOREIGN KEY (`DOCID`) REFERENCES `BOOK` (`DOCID`),
  CONSTRAINT `PID` FOREIGN KEY (`PID`) REFERENCES `PERSON` (`PID`)
);


#DOCUMENT Table

CREATE TABLE `DOCUMENT` (
  `DOCID` int unsigned NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(45) NOT NULL,
  `PDATE` date DEFAULT NULL,
  `PUBLISHERID` int DEFAULT NULL,
  PRIMARY KEY (`DOCID`),
  KEY `PUBLISHERID` (`PUBLISHERID`),
  CONSTRAINT `PUBLISHERID` FOREIGN KEY (`PUBLISHERID`) REFERENCES `PUBLISHER` (`PUBLISHERID`)
);


#BOOKS Table

CREATE TABLE `BOOK` (
  `DOCID` int unsigned NOT NULL,
  `ISBN` char(17) DEFAULT NULL,
  PRIMARY KEY (`DOCID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
);


#PROCEEDINGS Table#

CREATE TABLE `PROCEEDINGS` (
  `DOCID` int unsigned NOT NULL,
  `CDATE` date DEFAULT NULL,
  `CLOCATION` varchar(45) DEFAULT NULL,
  `CEDITOR` varchar(45) NOT NULL,
  PRIMARY KEY (`DOCID`),
 FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
);

#CHAIRS Table


CREATE TABLE `CHAIRS`(
`PID` INT NOT NULL,
  `DOCID` INT NOT NULL,
  PRIMARY KEY (`DOCID`, `PID`),
FOREIGN KEY (`PID`) REFERENCES `PERSON`(`PID`),
FOREIGN KEY (`DOCID`) REFERENCES `PROCEEDINGS`(`DOCID`));


#GEDITS

CREATE TABLE `GEDITS` (
  `DOCID` INT UNSIGNED NOT NULL,
  `ISSUE_NO` INT NOT NULL,
  `PID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`DOCID`, `ISSUE_NO`, `PID`),
FOREIGN KEY (`PID`) REFERENCES `PERSON`(`PID`),
FOREIGN KEY (`DOCID`, `ISSUE_NO`) REFERENCES `JOURNAL_ISSUE`(`DOCID`, `ISSUE_NO`) );

#JOURNAL VOLUME

CREATE TABLE `JOURNAL_VOLUME` (
  `DOCID` int unsigned NOT NULL,
  `VOLUME_NO` int NOT NULL,
  `EDITOR` int unsigned NOT NULL,
  PRIMARY KEY (`DOCID`),
 FOREIGN KEY (`DOCID`) REFERENCES `DOCUMENT` (`DOCID`)
);

#JOURNAL_ISSUE

CREATE TABLE `JOURNAL_ISSUE` (
  `DOCID` int unsigned NOT NULL,
  `ISSUE_NO` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `SCOPE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DOCID`,`ISSUE_NO`),
 FOREIGN KEY (`DOCID`) REFERENCES `JOURNAL_VOLUME` (`DOCID`)
);


#READER

CREATE TABLE `READER`(
`RID` INT NOT NULL AUTO_INCREMENT,
`RTYPE` VARCHAR(128),
`RNAME` VARCHAR(128),
`RADDRESS` VARCHAR(128),
`PHONE_NO` INT(10),
 PRIMARY KEY (`RID`) );

#RESERVATION

CREATE TABLE `RESERVATION`(
`RES_NO` INT NOT NULL AUTO_INCREMENT,
`DTIME` DATETIME,
PRIMARY KEY (`RES_NO`) );

#RESERVES

CREATE TABLE `RESERVES`(
`RESERVATION_NO` INT NOT NULL,
`RID` INT,
`DOCID` INT,
`COPYNO` INT,
`BID` INT,
PRIMARY KEY (`RESERVATION_NO`,`DOCID`, `COPYNO`, `BID`),
FOREIGN KEY (`RESERVATION_NO`) REFERENCES `RESERVATION`(`RES_NO`),
FOREIGN KEY (`RID`) REFERENCES `READER`(`RID`),
FOREIGN KEY (`DOCID`, `COPYNO`, `BID`) REFERENCES `COPY`(`DOCID`, `COPYNO`, `BID`));

#BORROWING

CREATE TABLE `BORROWING`(
`BOR_NO` INT NOT NULL AUTO_INCREMENT,
`BDTIME` DATETIME,
`RDTIME` DATETIME,
`DUEDATE` DATETIME,
PRIMARY KEY (`BOR_NO`) );


#BORROWS

CREATE TABLE `BORROWS`(
`BOR_NO` INT NOT NULL,
`RID` INT
,`DOCID` INT,
 `BID` INT,
 `COPYNO` INT,
PRIMARY KEY (`BOR_NO`,`DOCID`, `COPYNO`, `BID`),
FOREIGN KEY (`BOR_NO`) REFERENCES `borrowing`(`BOR_NO`),
FOREIGN KEY (`RID`) REFERENCES `reader`(`RID`),
FOREIGN KEY (`DOCID`, `COPYNO`, `BID`) REFERENCES `COPY`(`DOCID`, `COPYNO`, `BID`) );
