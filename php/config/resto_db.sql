-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Aug 03, 2025 at 02:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `kode_bahan` varchar(10) NOT NULL,
  `id_so` int(11) DEFAULT NULL,
  `nama_bahan` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`kode_bahan`, `id_so`, `nama_bahan`, `stok`) VALUES
('B001', 1, 'Nasi', 200),
('B002', 1, 'Ayam', 50),
('B003', 1, 'Ikan Gurame', 20),
('B004', 1, 'Tahu', 100),
('B005', 1, 'Tempe', 100),
('B006', 1, 'Udang', 30),
('B007', 1, 'Cumi', 30),
('B008', 1, 'Iga Sapi', 15),
('B009', 1, 'Kangkung', 25),
('B010', 1, 'Sambal', 10),
('B011', 1, 'Pisang', 40),
('B012', 1, 'Mangga', 30),
('B013', 1, 'Teh', 50),
('B014', 1, 'Air Mineral', 100),
('B015', 1, 'Lemon', 20),
('B016', 1, 'Coklat', 10),
('B017', 1, 'Keju', 5),
('B018', 1, 'Bumbu Cajun', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama`, `username`, `password`) VALUES
(1, 'Rina Wijaya', 'rina.wijaya', 'kasir123'),
(2, 'Agus Setiawan', 'agus.setiawan', 'kasir123');

-- --------------------------------------------------------

--
-- Table structure for table `koki`
--

CREATE TABLE `koki` (
  `id_koki` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koki`
--

INSERT INTO `koki` (`id_koki`, `nama`, `username`, `password`) VALUES
(1, 'Agus Santoso', 'agus.santoso', 'password123'),
(2, 'Siti Rahayu', 'siti.rahayu', 'password123'),
(3, 'Budi Gunawan', 'budi.gunawan', 'password123');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_keuangan`
--

CREATE TABLE `laporan_keuangan` (
  `id_laporan` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_owner` int(11) DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `jumlah_transaksi` int(11) DEFAULT NULL,
  `periode` varchar(50) DEFAULT NULL,
  `total_pembayaran` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `nomor_meja` int(11) NOT NULL,
  `id_pelayan` int(11) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  `status_meja` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `kode_menu` varchar(10) NOT NULL,
  `id_koki` int(11) DEFAULT NULL,
  `kode_bahan` varchar(10) DEFAULT NULL,
  `nama_menu` varchar(100) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `status_ketersediaan` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`kode_menu`, `id_koki`, `kode_bahan`, `nama_menu`, `kategori`, `deskripsi`, `harga`, `status_ketersediaan`) VALUES
('M001', 1, 'B002', 'Paket Nasi Ayam Goreng', 'Paket', 'Paket lengkap berisi ayam goreng renyah, nasi hangat sambal pedas khas, lalapan segar, dan tempe goreng gurih.', 27000.00, 1),
('M002', 1, 'B001', 'Paket Nasi Liwet', 'Paket', 'Nasi liwet dengan lauk ayam suwir, telur, dan ikan teri.', 35000.00, 1),
('M003', 1, 'B002', 'Paket Ayam Bakar', 'Paket', 'Paket lengkap dengan ayam bakar bumbu, nasi, sambal, dan lalapan.', 30000.00, 1),
('M004', 1, 'B004', 'Tahu Goreng', 'Main Menu', 'Tahu goreng renyah dengan bumbu pilihan.', 10000.00, 1),
('M005', 1, 'B005', 'Tempe Goreng', 'Main Menu', 'Tempe goreng gurih dengan bumbu spesial.', 10000.00, 1),
('M006', 1, 'B003', 'Ikan Gurame Bakar', 'Main Menu', 'Ikan gurame segar dibakar dengan bumbu kecap manis.', 85000.00, 1),
('M007', 1, 'B002', 'Ayam Goreng Penyet', 'Main Menu', 'Ayam goreng dengan sambal penyet pedas.', 32000.00, 1),
('M008', 1, 'B009', 'Kangkung', 'Main Menu', 'Tumis kangkung dengan bumbu bawang putih.', 15000.00, 1),
('M009', 1, 'B007', 'Cumi Asin Sambal Ijo', 'Main Menu', 'Cumi asin dimasak dengan sambal ijo yang menggugah selera.', 45000.00, 1),
('M010', 1, 'B008', 'Sop Iga', 'Main Menu', 'Sop iga sapi dengan kuah bening yang kaya rasa.', 55000.00, 1),
('M011', 1, 'B010', 'Sambal Ijo', 'Main Menu', 'Sambal ijo pedas khas Padang.', 5000.00, 1),
('M012', 1, 'B010', 'Sambal Matah', 'Main Menu', 'Sambal matah segar khas Bali.', 5000.00, 1),
('M013', 1, 'B010', 'Sambal Bawang', 'Main Menu', 'Sambal bawang pedas dengan aroma yang kuat.', 5000.00, 1),
('M014', 1, 'B001', 'Nasi', 'Main Menu', 'Satu porsi nasi putih hangat.', 7000.00, 1),
('M015', 1, 'B006', 'Udang Asam Manis', 'Seafood', 'Udang segar dimasak dengan saus asam manis.', 50000.00, 1),
('M016', 1, 'B018', 'Cajun Seafood Butter', 'Seafood', 'Aneka seafood dengan saus butter cajun yang gurih.', 120000.00, 1),
('M017', 1, 'B007', 'Cumi Asam Manis', 'Seafood', 'Cumi segar dimasak dengan saus asam manis.', 45000.00, 1),
('M018', 1, 'B014', 'Air Mineral', 'Minuman', 'Air mineral dingin atau suhu ruangan.', 5000.00, 1),
('M019', 1, 'B013', 'Teh Manis', 'Minuman', 'Teh manis hangat atau es.', 7000.00, 1),
('M020', 1, 'B015', 'Teh Lemon', 'Minuman', 'Teh dengan perasan lemon segar.', 10000.00, 1),
('M021', 1, 'B012', 'Jus Mangga', 'Minuman', 'Jus mangga murni yang segar.', 15000.00, 1),
('M022', 1, 'B001', 'Es Campur', 'Dessert', 'Es campur dengan aneka buah dan isian segar.', 18000.00, 1),
('M023', 1, 'B011', 'Pisang Coklat Keju', 'Dessert', 'Pisang goreng dengan taburan coklat dan keju.', 15000.00, 1),
('M024', 1, 'B011', 'Pisang Goreng', 'Dessert', 'Pisang goreng renyah.', 12000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nota_pembayaran`
--

CREATE TABLE `nota_pembayaran` (
  `nomor_nota` varchar(10) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `status_pembayaran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id_owner` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id_owner`, `nama`, `username`, `password`) VALUES
(1, 'Pak Resto', 'pak.resto', 'owner123');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nomor_meja` int(11) DEFAULT NULL,
  `id_pelayan` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelayan`
--

CREATE TABLE `pelayan` (
  `id_pelayan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelayan`
--

INSERT INTO `pelayan` (`id_pelayan`, `nama`, `username`, `password`) VALUES
(1, 'Dinda Sari', 'dinda.sari', 'pelayan123'),
(2, 'Fajar Pratama', 'fajar.pratama', 'pelayan123');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kode_pembayaran` varchar(10) NOT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `kode_menu` varchar(10) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `status_pesanan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok_opname`
--

CREATE TABLE `stok_opname` (
  `id_so` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_opname`
--

INSERT INTO `stok_opname` (`id_so`, `nama`, `username`, `password`) VALUES
(1, 'Rahmat Hidayat', 'rahmat.h', 'stok123'),
(2, 'Fitriani', 'fitri.a', 'stok123');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pesanan` int(11) DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `kode_pembayaran` varchar(10) DEFAULT NULL,
  `nomor_nota` varchar(10) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`kode_bahan`),
  ADD KEY `id_so` (`id_so`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `koki`
--
ALTER TABLE `koki`
  ADD PRIMARY KEY (`id_koki`);

--
-- Indexes for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_owner` (`id_owner`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`nomor_meja`),
  ADD KEY `id_pelayan` (`id_pelayan`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`kode_menu`),
  ADD KEY `id_koki` (`id_koki`),
  ADD KEY `kode_bahan` (`kode_bahan`);

--
-- Indexes for table `nota_pembayaran`
--
ALTER TABLE `nota_pembayaran`
  ADD PRIMARY KEY (`nomor_nota`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id_owner`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `nomor_meja` (`nomor_meja`),
  ADD KEY `id_pelayan` (`id_pelayan`);

--
-- Indexes for table `pelayan`
--
ALTER TABLE `pelayan`
  ADD PRIMARY KEY (`id_pelayan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`kode_pembayaran`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `kode_menu` (`kode_menu`);

--
-- Indexes for table `stok_opname`
--
ALTER TABLE `stok_opname`
  ADD PRIMARY KEY (`id_so`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `kode_pembayaran` (`kode_pembayaran`),
  ADD KEY `nomor_nota` (`nomor_nota`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD CONSTRAINT `bahan_baku_ibfk_1` FOREIGN KEY (`id_so`) REFERENCES `stok_opname` (`id_so`);

--
-- Constraints for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  ADD CONSTRAINT `laporan_keuangan_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `laporan_keuangan_ibfk_2` FOREIGN KEY (`id_owner`) REFERENCES `owner` (`id_owner`),
  ADD CONSTRAINT `laporan_keuangan_ibfk_3` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`);

--
-- Constraints for table `meja`
--
ALTER TABLE `meja`
  ADD CONSTRAINT `meja_ibfk_1` FOREIGN KEY (`id_pelayan`) REFERENCES `pelayan` (`id_pelayan`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_koki`) REFERENCES `koki` (`id_koki`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`kode_bahan`) REFERENCES `bahan_baku` (`kode_bahan`);

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`nomor_meja`) REFERENCES `meja` (`nomor_meja`),
  ADD CONSTRAINT `pelanggan_ibfk_2` FOREIGN KEY (`id_pelayan`) REFERENCES `pelayan` (`id_pelayan`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`kode_menu`) REFERENCES `menu` (`kode_menu`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`kode_pembayaran`) REFERENCES `pembayaran` (`kode_pembayaran`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`nomor_nota`) REFERENCES `nota_pembayaran` (`nomor_nota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
