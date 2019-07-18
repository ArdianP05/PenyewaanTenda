-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2019 pada 18.40
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekuas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_denda`
--

CREATE TABLE `tbl_denda` (
  `kd_denda` varchar(10) NOT NULL,
  `kd_alat` int(10) NOT NULL,
  `nm_alat` varchar(25) NOT NULL,
  `jenis` varchar(25) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_denda`
--

INSERT INTO `tbl_denda` (`kd_denda`, `kd_alat`, `nm_alat`, `jenis`, `total`) VALUES
('123456', 12, 'Tenda Dum', 'Patah', 1100000),
('1567', 13, 'tenda rumah', 'Hilang', 800000),
('444', 12, 'Tenda Dum', 'Patah', 1400000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kode_kategori` int(10) NOT NULL,
  `jenis_kategori` varchar(25) NOT NULL,
  `harga` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kode_kategori`, `jenis_kategori`, `harga`) VALUES
(111, 'Kualitas Super', '0'),
(222, 'Kualitas Baik', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_login`
--

CREATE TABLE `tbl_login` (
  `user` varchar(15) NOT NULL,
  `pass` varchar(15) NOT NULL,
  `hak` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_login`
--

INSERT INTO `tbl_login` (`user`, `pass`, `hak`) VALUES
('ardian', '1234567', 'Menu Utama'),
('iyan', '12345', 'Menu Karyawan'),
('yohanes', '123456', 'Menu Pemilik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_member`
--

CREATE TABLE `tbl_member` (
  `id_member` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `no_tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_member`
--

INSERT INTO `tbl_member` (`id_member`, `nama`, `alamat`, `no_tlp`) VALUES
(1, 'ArdianP', 'Gemawang', '087654345263'),
(2, 'Yohanes', 'Wonogiri', '0897564738274'),
(3, 'flower', 'solo', '081397345678');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `kode_alat` int(10) NOT NULL,
  `kode_kategori` int(10) NOT NULL,
  `nama_produk` varchar(25) NOT NULL,
  `harga_sewa` int(10) NOT NULL,
  `stok` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_produk`
--

INSERT INTO `tbl_produk` (`kode_alat`, `kode_kategori`, `nama_produk`, `harga_sewa`, `stok`) VALUES
(12, 111, 'Tenda Dum', 12500, 5),
(13, 222, 'tenda rumah', 300000, 45),
(14, 222, 'Tenda Segitiga', 200000, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `kd_transaksi` varchar(11) NOT NULL,
  `kd_alat` int(10) NOT NULL,
  `id_member` int(11) NOT NULL,
  `alat` varchar(25) NOT NULL,
  `harga_sewa` int(11) NOT NULL,
  `lama_sewa` int(11) NOT NULL,
  `kuantitas` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`kd_transaksi`, `kd_alat`, `id_member`, `alat`, `harga_sewa`, `lama_sewa`, `kuantitas`, `total_bayar`) VALUES
('12', 13, 2, 'tenda rumah', 300000, 3, 2, 1800000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_denda`
--
ALTER TABLE `tbl_denda`
  ADD PRIMARY KEY (`kd_denda`),
  ADD KEY `kd_denda` (`kd_denda`),
  ADD KEY `kd_denda_2` (`kd_denda`),
  ADD KEY `kd_alat` (`kd_alat`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indeks untuk tabel `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`kode_alat`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `kode_alat` (`kode_alat`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`kd_transaksi`),
  ADD KEY `kd_alat` (`kd_alat`),
  ADD KEY `kd_alat_2` (`kd_alat`),
  ADD KEY `id_member` (`id_member`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_denda`
--
ALTER TABLE `tbl_denda`
  ADD CONSTRAINT `tbl_denda_ibfk_1` FOREIGN KEY (`kd_alat`) REFERENCES `tbl_produk` (`kode_alat`);

--
-- Ketidakleluasaan untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD CONSTRAINT `tbl_produk_ibfk_1` FOREIGN KEY (`kode_kategori`) REFERENCES `tbl_kategori` (`kode_kategori`);

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`kd_alat`) REFERENCES `tbl_produk` (`kode_alat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
