-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2023 at 04:44 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labpbo_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id_item` varchar(50) NOT NULL,
  `nama_item` varchar(50) NOT NULL,
  `harga_item` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id_item`, `nama_item`, `harga_item`) VALUES
('B10', 'Fruitea Rasa Cetar Membahana', 5000),
('B11', 'Golda Coffee Cappucino', 5000),
('F10', 'Indomie Kremes Mamak', 10000),
('F11', 'Sari Roti Gandum Eneg Parah', 15000),
('M10', 'HotWheels Sedan Camry', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `pass` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `pass`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3'),
('admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `total_transaksi`
--

CREATE TABLE `total_transaksi` (
  `id_transaksi` int(50) NOT NULL,
  `grand_total` double NOT NULL,
  `uang_dibayar` double NOT NULL,
  `kembalian` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `total_transaksi`
--

INSERT INTO `total_transaksi` (`id_transaksi`, `grand_total`, `uang_dibayar`, `kembalian`) VALUES
(1, 75000, 100000, 25000),
(2, 35000, 50000, 15000),
(3, 25000, 50000, 25000),
(4, 10000, 50000, 40000),
(5, 30000, 50000, 20000),
(6, 120000, 150000, 30000),
(7, 25000, 50000, 25000),
(8, 55000, 100000, 45000),
(9, 25000, 50000, 25000),
(10, 110000, 150000, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pembelian` int(50) NOT NULL,
  `id_transaksi` int(50) NOT NULL,
  `id_item` varchar(50) NOT NULL,
  `nama_item` varchar(50) NOT NULL,
  `harga_item` double NOT NULL,
  `total_item` int(50) NOT NULL,
  `total_harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_pembelian`, `id_transaksi`, `id_item`, `nama_item`, `harga_item`, `total_item`, `total_harga`) VALUES
(1, 1, 'F10', 'Indomie Kremes Mamak', 10000, 2, 20000),
(2, 1, 'F11', 'Sari Roti Gandum Eneg Parah', 15000, 2, 30000),
(3, 1, 'M10', 'HotWheels Sedan Camry', 25000, 1, 25000),
(4, 2, 'B10', 'Fruitea Rasa Cetar Membahana', 5000, 5, 25000),
(5, 2, 'B11', 'Golda Coffee Cappucino', 5000, 2, 10000),
(6, 3, 'M10', 'HotWheels Sedan Camry', 25000, 1, 25000),
(7, 4, 'F10', 'Indomie Kremes Mamak', 10000, 1, 10000),
(8, 5, 'F10', 'Indomie Kremes Mamak', 10000, 3, 30000),
(9, 6, 'F10', 'Indomie Kremes Mamak', 10000, 12, 120000),
(10, 7, 'B10', 'Fruitea Rasa Cetar Membahana', 5000, 2, 10000),
(11, 7, 'B11', 'Golda Coffee Cappucino', 5000, 3, 15000),
(12, 8, 'B10', 'Fruitea Rasa Cetar Membahana', 5000, 2, 10000),
(13, 8, 'B11', 'Golda Coffee Cappucino', 5000, 3, 15000),
(14, 8, 'B10', 'Fruitea Rasa Cetar Membahana', 5000, 1, 5000),
(15, 8, 'M10', 'HotWheels Sedan Camry', 25000, 2, 50000),
(16, 9, 'B10', 'Fruitea Rasa Cetar Membahana', 5000, 2, 10000),
(17, 9, 'B11', 'Golda Coffee Cappucino', 5000, 3, 15000),
(18, 10, 'B10', 'Fruitea Rasa Cetar Membahana', 5000, 2, 10000),
(19, 10, 'B11', 'Golda Coffee Cappucino', 5000, 3, 15000),
(20, 10, 'B10', 'Fruitea Rasa Cetar Membahana', 5000, 1, 5000),
(21, 10, 'F10', 'Indomie Kremes Mamak', 10000, 2, 20000),
(22, 10, 'M10', 'HotWheels Sedan Camry', 25000, 3, 75000),
(23, 10, 'B11', 'Golda Coffee Cappucino', 5000, 2, 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `total_transaksi`
--
ALTER TABLE `total_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `total_transaksi`
--
ALTER TABLE `total_transaksi`
  MODIFY `id_transaksi` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_pembelian` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
