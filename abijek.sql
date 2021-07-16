-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2021 at 10:26 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abijek`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_area`
--

CREATE TABLE `tb_area` (
  `area_id` int(10) NOT NULL,
  `Kota/Kabupaten` varchar(50) NOT NULL,
  `Provinsi` varchar(50) NOT NULL,
  `kode_pos` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_nohp` int(15) NOT NULL,
  `customer_ttl` date NOT NULL,
  `customer_lokasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`customer_id`, `customer_name`, `customer_email`, `customer_nohp`, `customer_ttl`, `customer_lokasi`) VALUES
(222222222, 'Bagus', 'bagus69@gmail.com', 231333442, '1999-11-20', 'Wonosobo'),
(1111111111, 'Abiyansa', 'bagss69@gmail.com', 2138812581, '1999-11-20', 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer_service`
--

CREATE TABLE `tb_customer_service` (
  `customer_service` int(10) NOT NULL,
  `rating` int(5) NOT NULL,
  `keluhan` varchar(50) NOT NULL,
  `driver_id` int(10) NOT NULL,
  `tracking_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_driver`
--

CREATE TABLE `tb_driver` (
  `driver_id` int(10) NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `driver_email` varchar(50) NOT NULL,
  `driver_nohp` int(15) NOT NULL,
  `driver_nosim` int(20) NOT NULL,
  `driver_ttl` date NOT NULL,
  `driver_kendaraan` varchar(50) NOT NULL,
  `shipments_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `orders_id` int(10) NOT NULL,
  `area_id` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` int(10) NOT NULL,
  `titik_jemput` int(11) NOT NULL,
  `jarak_tempuh` decimal(10,0) NOT NULL,
  `payment_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE `tb_payment` (
  `payment_id` int(10) NOT NULL,
  `jenis_pembayaran` varchar(50) NOT NULL,
  `area_id` int(10) NOT NULL,
  `titik_jemput` int(11) NOT NULL,
  `jarak_perjalanan` decimal(10,0) NOT NULL,
  `diskon_id` int(10) NOT NULL,
  `jenis_pengiriman` int(10) NOT NULL,
  `total_harga` float NOT NULL,
  `customer_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_shipment`
--

CREATE TABLE `tb_shipment` (
  `shipments_id` int(10) NOT NULL,
  `shipment_date` date NOT NULL,
  `driver_id` int(10) NOT NULL,
  `titik_kirim` int(10) NOT NULL,
  `jenis_barang` int(10) NOT NULL,
  `jenis_pengiriman` int(10) NOT NULL,
  `order_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_titik_jemput`
--

CREATE TABLE `tb_titik_jemput` (
  `titik_jemput` int(10) NOT NULL,
  `koordinat_jemput` varchar(15) NOT NULL,
  `area_id` int(10) NOT NULL,
  `harga` varchar(12) NOT NULL,
  `lokasi_jemput` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tb_customer_service`
--
ALTER TABLE `tb_customer_service`
  ADD PRIMARY KEY (`customer_service`);

--
-- Indexes for table `tb_driver`
--
ALTER TABLE `tb_driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_shipment_driver` (`shipments_id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `fk_order_customer` (`customer_id`),
  ADD KEY `fk_order_payment` (`payment_id`);

--
-- Indexes for table `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_customer_payment` (`customer_id`);

--
-- Indexes for table `tb_shipment`
--
ALTER TABLE `tb_shipment`
  ADD PRIMARY KEY (`shipments_id`),
  ADD KEY `fk_order_shipment` (`order_id`);

--
-- Indexes for table `tb_titik_jemput`
--
ALTER TABLE `tb_titik_jemput`
  ADD PRIMARY KEY (`titik_jemput`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_driver`
--
ALTER TABLE `tb_driver`
  ADD CONSTRAINT `fk_shipment_driver` FOREIGN KEY (`shipments_id`) REFERENCES `tb_shipment` (`shipments_id`);

--
-- Constraints for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`),
  ADD CONSTRAINT `fk_order_payment` FOREIGN KEY (`payment_id`) REFERENCES `tb_payment` (`payment_id`);

--
-- Constraints for table `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD CONSTRAINT `fk_customer_payment` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`);

--
-- Constraints for table `tb_shipment`
--
ALTER TABLE `tb_shipment`
  ADD CONSTRAINT `fk_order_shipment` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`orders_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
