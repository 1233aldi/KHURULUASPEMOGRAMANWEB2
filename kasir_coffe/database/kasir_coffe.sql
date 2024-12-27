-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2021 at 11:36 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_coffe`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_jenis_menu`
--

CREATE TABLE `data_jenis_menu` (
  `id` int(11) NOT NULL,
  `nama_jenis_menu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_jenis_menu`
--

INSERT INTO `data_jenis_menu` (`id`, `nama_jenis_menu`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(3, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `data_menu`
--

CREATE TABLE `data_menu` (
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `harga_menu` double DEFAULT '0',
  `diskon_menu` double DEFAULT '0',
  `id_jenis_menu` int(11) NOT NULL,
  `satuan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_menu`
--

INSERT INTO `data_menu` (`kode_menu`, `nama_menu`, `harga_menu`, `diskon_menu`, `id_jenis_menu`, `satuan`) VALUES
('111111', 'Nasi Goreng', 20000, 10, 1, 'Porsi'),
('121212', 'Nasi Goreng Ayam Kalasan', 25000, 0, 1, 'Porsi'),
('122211', 'Kentang Goreng Balado', 15000, 0, 3, 'Porsi'),
('123123', 'Ice Capocino Cincau', 15000, 0, 2, 'Gelas'),
('123456', 'Nasi Goreng Biasa', 14000, 0, 1, 'Porsi');

-- --------------------------------------------------------

--
-- Table structure for table `data_menu_foto`
--

CREATE TABLE `data_menu_foto` (
  `id` int(11) NOT NULL,
  `kode_menu` varchar(50) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_menu_foto`
--

INSERT INTO `data_menu_foto` (`id`, `kode_menu`, `foto`) VALUES
(3, '111111', '11052018122003.png'),
(4, '111111', '11052018122128.png'),
(5, '123456', '11052018122346.png'),
(6, '123456', '11052018122423.png'),
(7, '111111', '12052018222325.png'),
(8, '123123', '16052018235731.png'),
(9, '122211', '17052018193743.png');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `logo_cofe` varchar(100) DEFAULT NULL,
  `alamat` text,
  `kota` varchar(100) DEFAULT NULL,
  `no_telpon` varchar(100) DEFAULT NULL,
  `ppn` double DEFAULT '0',
  `catatan_kaki` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id`, `nama`, `logo_cofe`, `alamat`, `kota`, `no_telpon`, `ppn`, `catatan_kaki`) VALUES
(1, 'HERO KAFFE', '21052018211918.png', '<p>Jl. Hevea Baru</p>\r\n<p>Jl.</p>', 'Barabai', '085249134144', 10, 'For Coming Soon');

-- --------------------------------------------------------

--
-- Table structure for table `temporary_order_detail`
--

CREATE TABLE `temporary_order_detail` (
  `kode_order` varchar(50) NOT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(50) DEFAULT NULL,
  `harga_menu` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `satuan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `trans_order`
--

CREATE TABLE `trans_order` (
  `kode_order` varchar(50) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `diskon` int(11) NOT NULL,
  `no_meja` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `tunai` double DEFAULT NULL,
  `ppn` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_order`
--

INSERT INTO `trans_order` (`kode_order`, `id_user`, `diskon`, `no_meja`, `tanggal`, `jam`, `tunai`, `ppn`) VALUES
('Ord-3b819e', '3', 0, '1', '2018-05-18', '12:56:04', 100000, NULL),
('Ord-5c0109', '3', 0, '12', '2018-05-21', '22:30:15', 60000, NULL),
('Ord-6251e2', '4', 10, '1', '2018-05-21', '15:03:57', 100000, NULL),
('Ord-9e4193', '1', 0, '2', '2018-05-23', '20:50:55', 100000, 10),
('Ord-9ea427', '3', 0, '3', '2018-05-21', '08:23:52', 100000, NULL),
('Ord-d00e55', '1', 0, '1', '2018-05-19', '11:25:37', 100000, NULL),
('Ord-fe3df8', '3', 0, '3', '2018-05-19', '19:32:09', 150000, NULL);

--
-- Triggers `trans_order`
--
DELIMITER $$
CREATE TRIGGER `trans_order_after_delete` AFTER DELETE ON `trans_order` FOR EACH ROW BEGIN
delete from trans_order_detail where kode_order=old.kode_order;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trans_order_detail`
--

CREATE TABLE `trans_order_detail` (
  `kode_order` varchar(50) NOT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(50) DEFAULT NULL,
  `harga_menu` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_order_detail`
--

INSERT INTO `trans_order_detail` (`kode_order`, `kode_menu`, `nama_menu`, `harga_menu`, `qty`, `satuan`) VALUES
('Ord-3b819e', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-3b819e', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-5c0109', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-5c0109', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-5c0109', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-6251e2', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-6251e2', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-9e4193', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 2, 'Porsi'),
('Ord-9e4193', '122211', 'Kentang Goreng Balado', 15000, 2, 'Porsi'),
('Ord-9ea427', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-9ea427', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-9ea427', '123123', 'Ice Capocino Cincau', 15000, 1, 'Gelas'),
('Ord-d00e55', '111111', 'Nasi Goreng', 18000, 1, 'Porsi'),
('Ord-d00e55', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 1, 'Porsi'),
('Ord-d00e55', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-d00e55', '123123', 'Ice Capocino Cincau', 15000, 1, 'Gelas'),
('Ord-fe3df8', '111111', 'Nasi Goreng', 18000, 2, 'Porsi'),
('Ord-fe3df8', '121212', 'Nasi Goreng Ayam Kalasan', 25000, 2, 'Porsi'),
('Ord-fe3df8', '122211', 'Kentang Goreng Balado', 15000, 1, 'Porsi'),
('Ord-fe3df8', '123123', 'Ice Capocino Cincau', 15000, 1, 'Gelas'),
('Ord-fe3df8', '123456', 'Nasi Goreng Biasa', 14000, 1, 'Porsi');

-- --------------------------------------------------------

--
-- Table structure for table `trans_pengeluaran`
--

CREATE TABLE `trans_pengeluaran` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_belanja` varchar(225) DEFAULT NULL,
  `harga` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans_pengeluaran`
--

INSERT INTO `trans_pengeluaran` (`id`, `tanggal`, `id_user`, `nama_belanja`, `harga`) VALUES
(1, '2018-05-19', 1, 'Gula Pasir', 12500),
(2, '2018-05-18', 1, 'Gula Arin', 10000),
(4, '2018-05-19', 3, 'Listrik', 22500),
(5, '2018-05-19', 1, 'Beras 1 Kg', 10000),
(6, '2018-05-19', 3, 'Belanja Nota', 5000),
(7, '2018-05-19', 3, 'Beras', 12000),
(8, '2018-05-19', 3, 'a', 22000),
(9, '2018-05-21', 3, 'GulaPAsir', 12500),
(10, '2018-05-21', 1, 'Gula Pasir', 12500),
(11, '2018-05-21', 4, 'Listrik', 52500);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level_user` int(11) NOT NULL,
  `nama_admin` varchar(128) NOT NULL,
  `foto` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `no_telpon` varchar(25) NOT NULL DEFAULT '08',
  `is_active` bit(1) DEFAULT b'0',
  `last_login_dt` date NOT NULL,
  `last_login_tm` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level_user`, `nama_admin`, `foto`, `email`, `no_telpon`, `is_active`, `last_login_dt`, `last_login_tm`) VALUES
(1, 'admin', 'admin', 1, 'Yusda Helmani', '19052018193514.png', 'yusdahelmani@gmail.com', '08', b'1', '2018-04-26', '2008-04-28'),
(3, 'kasir1', '12345', 2, 'Andika', '21052018150751.png', 'adndika@gamil.com', '085348824545', b'1', '0000-00-00', '0000-00-00'),
(4, 'kasir2', '12345', 2, 'Yamin Subarja', '', 'yamin@gmail.com', '08', b'1', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id` int(11) NOT NULL,
  `level_user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id`, `level_user`) VALUES
(1, 'admin'),
(2, 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_jenis_menu`
--
ALTER TABLE `data_jenis_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_menu`
--
ALTER TABLE `data_menu`
  ADD PRIMARY KEY (`kode_menu`),
  ADD KEY `FK_data_menu_data_jenis_menu` (`id_jenis_menu`);

--
-- Indexes for table `data_menu_foto`
--
ALTER TABLE `data_menu_foto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temporary_order_detail`
--
ALTER TABLE `temporary_order_detail`
  ADD PRIMARY KEY (`kode_order`,`kode_menu`);

--
-- Indexes for table `trans_order`
--
ALTER TABLE `trans_order`
  ADD PRIMARY KEY (`kode_order`);

--
-- Indexes for table `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD PRIMARY KEY (`kode_order`,`kode_menu`);

--
-- Indexes for table `trans_pengeluaran`
--
ALTER TABLE `trans_pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_jenis_menu`
--
ALTER TABLE `data_jenis_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_menu_foto`
--
ALTER TABLE `data_menu_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trans_pengeluaran`
--
ALTER TABLE `trans_pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_menu`
--
ALTER TABLE `data_menu`
  ADD CONSTRAINT `FK_data_menu_data_jenis_menu` FOREIGN KEY (`id_jenis_menu`) REFERENCES `data_jenis_menu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
