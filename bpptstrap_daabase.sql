/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - bootstrap
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bootstrap` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bootstrap`;

/*Table structure for table `checkout_details` */

DROP TABLE IF EXISTS `checkout_details`;

CREATE TABLE `checkout_details` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(30) NOT NULL,
  `customer_id` int(11) NOT NULL,
  KEY `productid` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `checkout_details` */

insert  into `checkout_details`(`productid`,`product_name`,`product_price`,`customer_id`) values 
(23,'Weeping woman painting(1937)',12,1),
(24,'Weeping woman painting(1937)',12,1);

/*Table structure for table `login_details` */

DROP TABLE IF EXISTS `login_details`;

CREATE TABLE `login_details` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass1` varchar(20) NOT NULL,
  `pass2` varchar(20) NOT NULL,
  KEY `login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `login_details` */

insert  into `login_details`(`login_id`,`fname`,`lname`,`email`,`pass1`,`pass2`) values 
(1,'SREERAM','SURENDRAN','srs.sreeram@gmail.com','123','123');

/*Table structure for table `per_det` */

DROP TABLE IF EXISTS `per_det`;

CREATE TABLE `per_det` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `house_name` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` int(50) NOT NULL,
  `name_card` varchar(100) NOT NULL,
  `card_no` int(100) NOT NULL,
  `exp` varchar(20) NOT NULL,
  `cvv` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  KEY `per_id` (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `per_det` */

insert  into `per_det`(`per_id`,`full_name`,`house_name`,`city`,`state`,`zip`,`name_card`,`card_no`,`exp`,`cvv`,`cust_id`) values 
(6,'Hari Krishnan K','Kolladath (H)','Malappuram','Kerala',679576,'sreeram',2147483647,'15/12',10,1);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`item_id`,`name`,`price`) values 
(1,'Weeping woman painting(1937)',12),
(2,'yuuu',6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
