-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Agu 2023 pada 10.11
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_latihan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_dosen`
--

CREATE TABLE `tabel_dosen` (
  `kode_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_dosen`
--

INSERT INTO `tabel_dosen` (`kode_dosen`, `nama_dosen`, `jenis_kelamin`, `alamat`, `telepon`) VALUES
(1001, 'joko susilo M.Kom', 'L', 'jl. kebahagiaan No. 10 Tangerang selatan', 12345678),
(1002, 'saya adalah', 'L', ' jl. bintaro utama no.178', 2147483647),
(1004, 'gak tau', 'P', ' jalan rempoa raya no.17A', 98766545);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_jadwal`
--

CREATE TABLE `tabel_jadwal` (
  `id` int(11) NOT NULL,
  `kode_matakuliah` int(11) NOT NULL,
  `kode_dosen` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_jadwal`
--

INSERT INTO `tabel_jadwal` (`id`, `kode_matakuliah`, `kode_dosen`, `hari`, `jam`) VALUES
(2, 2001, 1001, 'senin', '07-40 - 09.00 W'),
(5, 2002, 1002, 'rabu', '09.00-11.00 WIB'),
(6, 2002, 1004, 'selasa', '09.00-11.00 WIB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_krs`
--

CREATE TABLE `tabel_krs` (
  `id` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `kode_semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_krs`
--

INSERT INTO `tabel_krs` (`id`, `nim`, `id_jadwal`, `kode_semester`) VALUES
(1, 3001, 6, 20211),
(6, 3002, 5, 20211),
(7, 3001, 6, 20212),
(8, 3001, 2, 20212);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_mahasiswa`
--

CREATE TABLE `tabel_mahasiswa` (
  `nim` int(11) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(2) NOT NULL,
  `alamat` text NOT NULL,
  `jurusan` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_mahasiswa`
--

INSERT INTO `tabel_mahasiswa` (`nim`, `nama_mahasiswa`, `jenis_kelamin`, `alamat`, `jurusan`) VALUES
(3001, 'siswanto', 'L', 'jl. h. mugini no. 12 jakarta selatan', 'IT'),
(3002, 'suryono ', 'P', 'jl. pamulang raya no. 15A pamulang', 'SI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_matakuliah`
--

CREATE TABLE `tabel_matakuliah` (
  `kode_matakuliah` int(11) NOT NULL,
  `nama_matakuliah` varchar(20) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_matakuliah`
--

INSERT INTO `tabel_matakuliah` (`kode_matakuliah`, `nama_matakuliah`, `sks`) VALUES
(2001, 'pemrograman web 2', 3),
(2002, 'fisika dasar', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_semester`
--

CREATE TABLE `tabel_semester` (
  `kode_semester` int(11) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_semester`
--

INSERT INTO `tabel_semester` (`kode_semester`, `semester`, `status`) VALUES
(20211, 'ganjil 2021/2022', 1),
(20212, 'genap 2021/2022', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_user`
--

CREATE TABLE `tabel_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_user`
--

INSERT INTO `tabel_user` (`id`, `username`, `password`) VALUES
(1, 'admin', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_dosen`
--
ALTER TABLE `tabel_dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indeks untuk tabel `tabel_jadwal`
--
ALTER TABLE `tabel_jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_matakuliah` (`kode_matakuliah`),
  ADD KEY `fk_dosen` (`kode_dosen`);

--
-- Indeks untuk tabel `tabel_krs`
--
ALTER TABLE `tabel_krs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal` (`id_jadwal`),
  ADD KEY `fk_mahasiswa` (`nim`),
  ADD KEY `fk_semester` (`kode_semester`);

--
-- Indeks untuk tabel `tabel_mahasiswa`
--
ALTER TABLE `tabel_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tabel_matakuliah`
--
ALTER TABLE `tabel_matakuliah`
  ADD PRIMARY KEY (`kode_matakuliah`);

--
-- Indeks untuk tabel `tabel_semester`
--
ALTER TABLE `tabel_semester`
  ADD PRIMARY KEY (`kode_semester`);

--
-- Indeks untuk tabel `tabel_user`
--
ALTER TABLE `tabel_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tabel_jadwal`
--
ALTER TABLE `tabel_jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tabel_krs`
--
ALTER TABLE `tabel_krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tabel_user`
--
ALTER TABLE `tabel_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tabel_jadwal`
--
ALTER TABLE `tabel_jadwal`
  ADD CONSTRAINT `fk_dosen` FOREIGN KEY (`kode_dosen`) REFERENCES `tabel_dosen` (`kode_dosen`),
  ADD CONSTRAINT `fk_matakuliah` FOREIGN KEY (`kode_matakuliah`) REFERENCES `tabel_matakuliah` (`kode_matakuliah`);

--
-- Ketidakleluasaan untuk tabel `tabel_krs`
--
ALTER TABLE `tabel_krs`
  ADD CONSTRAINT `fk_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `tabel_jadwal` (`id`),
  ADD CONSTRAINT `fk_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `tabel_mahasiswa` (`nim`),
  ADD CONSTRAINT `fk_semester` FOREIGN KEY (`kode_semester`) REFERENCES `tabel_semester` (`kode_semester`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
