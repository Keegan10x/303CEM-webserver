CREATE TABLE IF NOT EXISTS `accounts` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `user` varchar(30),
  `pass` varchar(75)
);

CREATE TABLE IF NOT EXISTS `tours` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `tourName` varchar(30),
  `country` varchar(30),
  `tourPrice` int,
  `tourImg` varchar(255)
);

CREATE TABLE IF NOT EXISTS `hotels` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `hotelName` varchar(30),
  `postcode` varchar(10),
  `country` varchar(30),
  `hotelImg` varchar(255),
  `tier` varchar(25),
  `roomPrice` int
);

CREATE TABLE IF NOT EXISTS `flights` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `class` varchar(25),
  `carrier` varchar(30),
  `flightNumber` varchar(10),
  `destination` varchar(30),
  `ticketPrice` int
);

CREATE TABLE IF NOT EXISTS `insurance` (
  `id` mediumint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `insuranceName` varchar(30),
  `company` varchar(30),
  `insurancePrice` int,
  `description` varchar(150)
);

CREATE TABLE IF NOT EXISTS `holidays` (
  `usr` mediumint UNSIGNED,
  `trs` mediumint UNSIGNED,
  `htl` mediumint UNSIGNED,
  `ins` mediumint UNSIGNED,
  `flt` mediumint UNSIGNED,
  `start` datetime,
  `end` datetime,
  `total` int,
  `isPaid` varchar(15),
  `invoiceRef` varchar(20)
);

ALTER TABLE `holidays` ADD FOREIGN KEY (`usr`) REFERENCES `accounts` (`id`);

ALTER TABLE `holidays` ADD FOREIGN KEY (`trs`) REFERENCES `tours` (`id`);

ALTER TABLE `holidays` ADD FOREIGN KEY (`htl`) REFERENCES `hotels` (`id`);

ALTER TABLE `holidays` ADD FOREIGN KEY (`ins`) REFERENCES `insurance` (`id`);

ALTER TABLE `holidays` ADD FOREIGN KEY (`flt`) REFERENCES `flights` (`id`);
