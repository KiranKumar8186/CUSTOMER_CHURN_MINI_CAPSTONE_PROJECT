#=========================================================================================================================================================================#
## Q1. Analyze the data to check if the table is normalized i.e follows all the normal forms, mention all the problems you find and how would you solve it.
#=========================================================================================================================================================================#

-- After analyzing the data that the given data with table of 33 columns is not normalized.
-- As per the rules of 1NF the columns should have single values. But, in 'Lat Long' column is having 2 values and also lattitude and longitude values are given in seperate columns.
-- Which are present in Lat Long column. So, Im not taking Lat long column.
-- And 'Count' column is also not usefull of my data and it containing only one value which is no allow or usefull. 
-- So, not taking 'Count' column also.
-- As per 2nd rule of 1NF all columns entries are same type.
-- As per 3rd rule rows are uniquely identified. 1Nf is satisfied.
-- In this table taking 'Customer_Id' as Primery Key.

-- 2NF (NO PARTIAL DEPENDENCY)
-- This complete table is not satisfies the 2NF. 
-- Because, non prime attributes are partially depending on Candidate Key.
-- Like for all attributes information we can not get through only 'Costomer_Id'.
-- So, Seperating whole to multiple tables. And keeping 'Customer id' as PK for few tables.
-- And adding extra columns to remaing tables and making them as primery key.
-- Now 2NF is also satisfied.

-- 3NF (NO TRANSITIVE DEPENDENCY)
-- "Make sure that non prime attributes can not dependent on non prime attributes"
-- Based on the rule seperated all columns which are depending on NPA and creating new table.

#=========================================================================================================================================================================#
## Q2. If the data is normalized, you can simply create one table with all the 33 columns, but if it is not, you need to see how many tables are to be created.
## Q3. Feel free to add ID columns as primary keys if you are creating multiple tables.
#=========================================================================================================================================================================#


-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2022 at 04:11 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Empty`
--

-- CREATING DATA BASE.
----------------------------------------------------------
CREATE DATABASE TELCO_CUSTOMER_CHURN ;
----------------------------------------------------------
--
-- CREATING 'CUSTOMERS_DETAILS' TABLE
--
CREATE TABLE `Customer_Details` (
  `CUSTOMER_ID` varchar(20) NOT NULL,
   `GENDER` varchar(60) NOT NULL,
  `SENIOR CITIZEN` varchar(30) NOT NULL,
  `PARTNER` varchar(30) NOT NULL,
  `DEPENDENTS` varchar(30) NOT NULL
  ) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;
  
--
-- Dumping data for table `CUSTOMERS_DETAILS`
--

INSERT INTO `Customer_Details` (`CUSTOMER_ID`, `GENDER`, `SENIOR CITIZEN`, `PARTNER`, `DEPENDENTS`) VALUES
('9237-HQITU', 'Female', 'No', 'No', 'Yes'),
('9305-CDSKC', 'Female', 'No', 'No', 'Yes'),
('7892-POOKP', 'Female', 'No', 'Yes', 'Yes'),
('0280-XJGEX', 'Male', 'No', 'No', 'Yes'),
('4190-MFLUW', 'Female', 'No', 'Yes', 'No'),
('8779-QRDMV', 'Male', 'Yes', 'No', 'No'),
('1066-JKSGK', 'Male', 'No', 'No', 'No'),
('6467-CHFZW', 'Male', 'No', 'Yes', 'Yes'),
('8665-UTDHZ', 'Male', 'No', 'Yes', 'No'),
('6047-YHPVI', 'Male', 'No', 'No', 'Yes');

--
-- CREATING 'LOCATION_ID' TABLE 
--

CREATE TABLE `Location_id` (
  `ZIP CODE` int(50) NOT NULL,
  `CUSTOMER_ID` varchar(20) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `LOCATION_ID`
--

INSERT INTO `Location_id` (`ZIP CODE`, `CUSTOMER_ID`) VALUES 
(90005, '9237-HQITU'),
(90006, '9305-CDSKC'),
(900010, '7892-POOKP'),
(90015, '0280-XJGEX'),
(90020, '4190-MFLUW'),
(90022, '8779-QRDMV'),
(90024, '1066-JKSGK'),
(90028, '6467-CHFZW'),
(90029, '8665-UTDHZ'),
(90039, '6047-YHPVI');

--
-- CREATING 'COUNTRY' TABLE
--

CREATE TABLE `COUNTRY` (
   `ZIP CODE` int(50) NOT NULL,
   `COUNTRY` varchar(60) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  `LATITUDE` decimal(20, 6)NOT NULL,
  `LONGITUDE` decimal(20, 6) NOT NULL
  ) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;
  
--
-- Dumping data for table `COUNTRY`
--
  
INSERT INTO `COUNTRY` ( `ZIP CODE`, `COUNTRY`, `STATE`, `CITY`,`LATITUDE`,`LONGITUDE`) VALUES 
(90005, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES', '34.059281', '-118.307420'),
(90006, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES', '34.048013', '-118.293953'),
(900010, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.06213', '-118.316'),
(90015, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.03922', '-118.266'),
(90020, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.06637', '-118.31'),
(90022, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.02381', '-118.157'),
(90024, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.06630', '-118.435'),
(90028, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.09987', '-118.327'),
(90029, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.08995', '-118.295'),
(90039, 'UNITED STATES', 'CALIFORNIA', 'LOS ANGELES','34.110845', '-118.259595');

--
-- CREATING 'CHURN_ID' TABLE
--

CREATE TABLE `CHURN_ID` (
  `CHURN_ID` varchar(20) NOT NULL,
  `CUSTOMER_ID` varchar(20) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `CHURN_ID`
--
  
 INSERT INTO `CHURN_ID` (`CHURN_ID`, `CUSTOMER_ID`) VALUES 
('C1', '9237-HQITU'),
('C2', '9305-CDSKC'),
('C3', '7892-POOKP'),
('C4', '0280-XJGEX'),
('C5', '4190-MFLUW'),
('C6', '8779-QRDMV'),
('C7', '1066-JKSGK'),
('C8', '6467-CHFZW'),
('C9', '8665-UTDHZ'),
('C10', '6047-YHPVI'); 

--
-- CREATING 'CHURN_DETAILS' TABLE
--

CREATE TABLE `CHURN_DETAILS` (
  `CHURN_ID` varchar(20) NOT NULL,
  `CHURN LABEL` varchar(3) NOT NULL,
  `CHURN VALUE` int(20) NOT NULL,
  `CHURN SCORE` int(20) NOT NULL,
  `CUSTOMER LIFE TIME VALUE` int(20) NOT NULL,
  `CHURN REASON` varchar(50) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `CHURN_DETAILS`
--
  
 INSERT INTO `CHURN_DETAILS` (`CHURN_ID`, `CHURN LABEL`,`CHURN VALUE`,`CHURN SCORE`,`CUSTOMER LIFE TIME VALUE` ,`CHURN REASON`) VALUES
 ('C1', 'Yes','1','67','2701','Moved'),
 ('C2', 'Yes','1','86','5372','Moved'),
 ('C3', 'Yes','1','84','5003','Moved'),
 ('C4', 'Yes','1','89','5340','Competitor had better devices'),
 ('C5', 'Yes','1','78','5925','Competitor offered higher download speeds'),
 ('C6', 'Yes','1','100','5433','Competitor offered more data'),
 ('C7', 'Yes','1','92','4832','Competitor made better offer'),
 ('C8', 'Yes','1','77','5789','Competitor had better devices'),
 ('C9', 'Yes','1','97','2915','Competitor had better devices'),
 ('C10', 'Yes','1','66','2454','Competitor offered higher download speeds');
 
-- 
-- CREATING 'PAYMENT ID' TABLE
--

CREATE TABLE `PAYMENT_ID` (
  `PAYMENT_ID` varchar(20) NOT NULL,
  `CUSTOMER_ID` varchar(20) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `PAYMENT_ID`
--
 
INSERT INTO `PAYMENT_ID` (`PAYMENT_ID`, `CUSTOMER_ID`) VALUES 
('EC1', '9237-HQITU'),
('EC2', '9305-CDSKC'),
('EC3', '7892-POOKP'),
('BT1', '0280-XJGEX'),
('CC1', '4190-MFLUW'),
('EC4', '8779-QRDMV'),
('MC1', '1066-JKSGK'),
('EC5', '6467-CHFZW'),
('EC6', '8665-UTDHZ'),
('EC7', '6047-YHPVI');

--
-- CREATING 'PAYMENT DETAILS' TABLE
--

CREATE TABLE `PAYMENT_DETAILS` (
  `PAYMENT_ID` varchar(20) NOT NULL,
  `PAPERLESS BILLING` varchar(30) NOT NULL,
  `PAYMENT METHOD` varchar(30) NOT NULL,
  `MONTHLY CHARGES`  decimal(20, 2) NOT NULL,
  `TOTAL CHARGES`  decimal(20, 2) NOT NULL
   ) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `PAYMENT_DETAILS`
--
 
INSERT INTO `PAYMENT_DETAILS` (`PAYMENT_ID`, `PAPERLESS BILLING`,`PAYMENT METHOD`,`MONTHLY CHARGES`,`TOTAL CHARGES`) VALUES 
('EC1', 'Yes','Electronic check','70.7','151.65'),
('EC2', 'Yes','Electronic check','99.65','820.5'),
('EC3', 'Yes','Electronic check','104.8','3046.05'),
('BT1', 'Yes','Bank transfer(automatic)','103.7','5036.3'),
('CC1', 'No','Credit card(automatic)','55.2','528.35'),
('EC4', 'Yes','Electronic check','39.65','39.65'),
('MC1', 'No','Mailed check','20.15','20.15'),
('EC5', 'Yes','Electronic check','99.35','4749.15'),
('EC6', 'No','Electronic check','30.2','30.2'),
('EC7', 'Yes','Electronic check','69.7','316.9');

--
-- CREATING 'SERVICE_ID' TABLE
--
 
CREATE TABLE `SERVICE_ID` (
  `SERVICE_ID` varchar(20) NOT NULL,
  `CUSTOMER_ID` varchar(20) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `SERVICE_ID`
--
 
INSERT INTO `SERVICE_ID` (`SERVICE_ID`, `CUSTOMER_ID`) VALUES 
('S1', '9237-HQITU'),
('S2', '9305-CDSKC'),
('S3', '7892-POOKP'),
('S4', '0280-XJGEX'),
('S5', '4190-MFLUW'),
('S6', '8779-QRDMV'),
('S7', '1066-JKSGK'),
('S8', '6467-CHFZW'),
('S9', '8665-UTDHZ'),
('S10', '6047-YHPVI');

--
-- CREATING 'SERVICE_DETAILS' TABLE
--

CREATE TABLE `SERVICE_DETAILS` (
  `SERVICE_ID` varchar(20) NOT NULL,
  `TENURE MONTHS` int(20) NOT NULL,
  `PHONE SERVICE` varchar(30) NOT NULL,
  `MULTIPLE LINES` varchar(30) NOT NULL,
  `INTERNET SERVICE` varchar(30) NOT NULL,
  `ONLINE SECURITY` varchar(30) NOT NULL,
  `ONLINE BACKUP` varchar(30) NOT NULL,
  `DEVICE PROTECTION` varchar(30) NOT NULL,
  `TECH SUPPORT` varchar(30) NOT NULL,
  `STREAMING TV` varchar(30) NOT NULL,
   `STREAMING MOVIES` varchar(30) NOT NULL,
  `CONTRACT` varchar(15) NOT NULL
   ) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `SERVICE_DETAILS`
--
 
INSERT INTO `SERVICE_DETAILS` (`SERVICE_ID`,`TENURE MONTHS`,`PHONE SERVICE`,`MULTIPLE LINES`,`INTERNET SERVICE`,  `ONLINE SECURITY`,
`ONLINE BACKUP`,`DEVICE PROTECTION`,`TECH SUPPORT`,`STREAMING TV`,`STREAMING MOVIES`,`CONTRACT`) VALUES 
('S1', '2','Yes','No','Fiber optic','No','No','No','No','No','No','Month-to-month'),
('S2', '8','Yes','Yes','Fiber optic','No','No','Yes','No','Yes','Yes','Month-to-month'),
('S3', '28','Yes','Yes','Fiber optic','No','No','Yes','Yes','Yes','Yes','Month-to-month'),
('S4', '49','Yes','Yes','Fiber optic','No','Yes','Yes','No','Yes','Yes','Month-to-month'),
('S5', '10','Yes','No','DSL','No','No','Yes','Yes','No','No','Month-to-month'),
('S6', '1','No','No','DSL','No','No','Yes','No','No','Yes','Month-to-month'),
('S7', '1','Yes','No','Fiber optic','No','No','No','No','No','No','Month-to-month'),
('S8', '47','Yes','Yes','Fiber optic','No','Yes','No','No','Yes','Yes','Month-to-month'),
('S9', '1','No','No','DSL','No','Yes','No','No','No','No','Month-to-month'),
('S10', '5', 'Yes', 'No', 'Fiber optic','No','No','No','No','No','No','Month-to-month');


#=========================================================================================================================================================================#
## Q4. If you created multiple tables, mention the foreign keys for each table and the candidate keys.
#=========================================================================================================================================================================#


--
-- Indexes for dumped tables
--

--
-- Indexes for table `CHURN_DETALS`
--
ALTER TABLE `churn_details`
  ADD PRIMARY KEY (`CHURN_ID`);


--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ZIP CODE`);
  

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`CUSTOMER_ID`);  


--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`PAYMENT_ID`);
  

--
-- Indexes for table `service_details`
--
ALTER TABLE `service_details`
  ADD PRIMARY KEY (`SERVICE_ID`);  
  

--
-- Indexes for table `churn_id`
--
ALTER TABLE `churn_id`
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`CHURN_ID`);  


--
-- Indexes for table `location_id`
--
ALTER TABLE `location_id`
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`ZIP CODE`);
  
  
--
-- Indexes for table `payment_id`
--
ALTER TABLE `payment_id`
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`PAYMENT_ID`);
  
  
--
-- Indexes for table `service_id`
--
ALTER TABLE `service_id`
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`SERVICE_ID`);
  
#================================================================================================================================================================================#
## Q5. Create an ER diagram to refer to when analyzing the database.
#================================================================================================================================================================================#

