-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2021 at 07:54 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imk`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(40) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`bill_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES
(1, 2, 'RAM - Corsair 16GB', 1000000, 1),
(2, 3, 'SSD - Adata 240GB', 400000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`product_id`, `product_name`, `stock`, `price`) VALUES
(1, 'HDD - Seagate 1TB', 99, 500000),
(2, 'RAM - Corsair 16GB', 100, 1200000),
(3, 'SSD - Adata 240GB', 97, 400000),
(4, 'VGA - Nvidia RTX 2080Ti', 100, 8000000),
(5, 'Intel - Core i3 Gen 9', 100, 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `bill_id` int(11) NOT NULL,
  `cs_name` varchar(40) NOT NULL,
  `total_price` int(11) NOT NULL,
  `date` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`bill_id`, `cs_name`, `total_price`, `date`) VALUES
(1, 'zaka', 1000000, '2020-12-24'),
(2, 'zaki', 1200000, '2020-12-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `FK_bill_id` (`bill_id`),
  ADD KEY `FK_product_id` (`product_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`bill_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `FK_bill_id` FOREIGN KEY (`bill_id`) REFERENCES `transaksi` (`bill_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `produk` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
