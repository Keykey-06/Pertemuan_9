-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table db_retail.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `id_pemasok` int NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `ukuran` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `id_kategori` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `deskripsi_barang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `FK_barang_pemasok` (`id_pemasok`),
  KEY `FK_barang_kategori` (`id_kategori`),
  CONSTRAINT `FK_barang_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  CONSTRAINT `FK_barang_pemasok` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.barang: ~4 rows (approximately)
INSERT INTO `barang` (`id_barang`, `id_pemasok`, `nama_barang`, `merk`, `ukuran`, `satuan`, `id_kategori`, `harga_beli`, `harga_jual`, `deskripsi_barang`) VALUES
	(1, 2, 'Kopi', 'ABC', 'Kecil', 'Botol', 3, 4000, 7000, 'Baru'),
	(4, 4, 'Pensil', 'joyko', 'Kecil', 'pcs', 4, 1000, 1500, 'Barang Baru'),
	(6, 5, 'Minyak', 'Pinang', 'Sedang', 'pcs', 5, 70000, 10000, 'Baru'),
	(7, 3, 'Pasta gigi', 'Pepsodent', 'Besar', 'Pcs', 6, 5000, 7000, 'Baru');

-- Dumping structure for table db_retail.detail_penjualan
CREATE TABLE IF NOT EXISTS `detail_penjualan` (
  `id_detailpenjualan` int NOT NULL AUTO_INCREMENT,
  `id_penjualan` int NOT NULL,
  `id_barang` int NOT NULL,
  `jumlah` int NOT NULL,
  `harga` int NOT NULL,
  `totalharga` int NOT NULL,
  PRIMARY KEY (`id_detailpenjualan`),
  KEY `FK_detail_penjualan_penjualan` (`id_penjualan`),
  KEY `FK_detail_penjualan_barang` (`id_barang`),
  CONSTRAINT `FK_detail_penjualan_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `FK_detail_penjualan_penjualan` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.detail_penjualan: ~0 rows (approximately)

-- Dumping structure for table db_retail.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` char(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.kategori: ~5 rows (approximately)
INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `status`) VALUES
	(2, 'Makanan', 1),
	(3, 'Minuman', 1),
	(4, 'Alat Tulis', 1),
	(5, 'Keperluan Dapur', 1),
	(6, 'Keperluan Mandi', 1);

-- Dumping structure for table db_retail.pemasok
CREATE TABLE IF NOT EXISTS `pemasok` (
  `id_pemasok` int NOT NULL AUTO_INCREMENT,
  `nama_pemasok` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` char(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_pemasok`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.pemasok: ~4 rows (approximately)
INSERT INTO `pemasok` (`id_pemasok`, `nama_pemasok`, `alamat`, `telepon`, `status`) VALUES
	(2, 'PT.ABC', 'Binjai', '74638933', 1),
	(3, 'PT.123', 'Medan', '6782341', 0),
	(4, 'PT.MAKMUR', 'Lampung', '738908364', 1),
	(5, 'PT.MELATI', 'JAKARTA', '273749984', 1);

-- Dumping structure for table db_retail.penjualan
CREATE TABLE IF NOT EXISTS `penjualan` (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `tanggal_penjualan` date NOT NULL,
  `totalbayar` int NOT NULL,
  `bayar` int NOT NULL,
  `kembalian` int NOT NULL,
  PRIMARY KEY (`id_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.penjualan: ~6 rows (approximately)
INSERT INTO `penjualan` (`id_penjualan`, `tanggal_penjualan`, `totalbayar`, `bayar`, `kembalian`) VALUES
	(1, '2025-01-09', 200000, 200000, 0),
	(3, '2025-01-16', 14000, 14000, 0),
	(4, '2025-01-16', 15000, 20000, 5000),
	(5, '2025-01-16', 50000, 100000, 50000),
	(6, '2025-01-16', 7000, 10000, 3000);

-- Dumping structure for table db_retail.persediaan
CREATE TABLE IF NOT EXISTS `persediaan` (
  `id_persediaan` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NOT NULL,
  `stok_awal` int NOT NULL,
  `stok_masuk` int NOT NULL,
  `stok_keluar` int NOT NULL,
  `stok_akhir` int NOT NULL,
  `deskripsi_persediaan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_persediaan`),
  KEY `FK_persediaan_barang` (`id_barang`),
  CONSTRAINT `FK_persediaan_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.persediaan: ~4 rows (approximately)
INSERT INTO `persediaan` (`id_persediaan`, `id_barang`, `stok_awal`, `stok_masuk`, `stok_keluar`, `stok_akhir`, `deskripsi_persediaan`) VALUES
	(2, 4, 23, 0, 4, 19, ''),
	(3, 1, 32, 0, 3, 29, ''),
	(4, 6, 20, 5, 0, 25, ''),
	(5, 7, 15, 0, 0, 15, 'Baru');

-- Dumping structure for table db_retail.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `username`, `nama_lengkap`, `password`, `level`) VALUES
	(1, 'admin', 'Administrator Web', '202cb962ac59075b964b07152d234b70', 'admin');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
