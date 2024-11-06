-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 05, 2024 at 08:56 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_galeri`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `nama_album` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal_dibuat` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_album`, `nama_album`, `deskripsi`, `tanggal_dibuat`, `id_user`) VALUES
(11, 'Animal', 'hewan', '2024-10-25', 9),
(13, 'w1', 'wpp', '2024-11-04', 1),
(14, 'w2', 'wpp2', '2024-11-04', 9),
(15, 'w3', 'wpp3', '2024-11-04', 8),
(17, 'otomotif', 'aa', '2024-11-05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `id_foto` int(11) NOT NULL,
  `judul_foto` varchar(255) NOT NULL,
  `deskripsi_foto` text NOT NULL,
  `tanggal_unggah` date NOT NULL,
  `lokasi_file` varchar(255) NOT NULL,
  `id_album` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id_foto`, `judul_foto`, `deskripsi_foto`, `tanggal_unggah`, `lokasi_file`, `id_album`, `id_user`) VALUES
(24, 'w1', 'wpp1', '2024-11-04', '1041796045-wallpaperflare.com_wallpaper.jpg', 13, 1),
(25, 'w2', 'wpp2', '2024-11-04', '1243861697-wallpaperflare.com_wallpaper (1).jpg', 14, 9),
(27, 'ww1', 'wppp1', '2024-11-04', '878845802-wallpaperflare.com_wallpaper (3).jpg', 13, 1),
(28, 'w11', 'wpppp1', '2024-11-04', '1994205371-wallpaperflare.com_wallpaper (4).jpg', 13, 1),
(29, 'wwwww', 'wwwww', '2024-11-04', '891540191-wallpaperflare.com_wallpaper (5).jpg', 13, 1),
(30, 'wpppppp', 'wppppp', '2024-11-04', '2508280-wallpaperflare.com_wallpaper (6).jpg', 13, 1),
(31, 'wqwqwq', 'qwqwqw', '2024-11-04', '1391604661-wallpaperflare.com_wallpaper (7).jpg', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_foto` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `isi_komentar` text NOT NULL,
  `tanggal_komentar` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `komentar_foto`
--

CREATE TABLE `komentar_foto` (
  `id_komentar` int(11) NOT NULL,
  `id_foto` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `isi_komentar` text NOT NULL,
  `tanggal_komentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `komentar_foto`
--

INSERT INTO `komentar_foto` (`id_komentar`, `id_foto`, `id_user`, `isi_komentar`, `tanggal_komentar`) VALUES
(6, 24, 11, 'kerennnn', '2024-11-05'),
(8, 24, 11, 'sadaa', '2024-11-05');

-- --------------------------------------------------------

--
-- Table structure for table `like_foto`
--

CREATE TABLE `like_foto` (
  `id_like` int(11) NOT NULL,
  `id_foto` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal_like` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `like_foto`
--

INSERT INTO `like_foto` (`id_like`, `id_foto`, `id_user`, `tanggal_like`) VALUES
(24, 24, 1, '2024-11-04'),
(25, 28, 1, '2024-11-04'),
(26, 29, 1, '2024-11-04'),
(27, 31, 1, '2024-11-04'),
(28, 30, 1, '2024-11-04'),
(35, 27, 9, '2024-11-05'),
(37, 28, 9, '2024-11-05'),
(44, 25, 9, '2024-11-05'),
(45, 24, 9, '2024-11-05'),
(46, 29, 9, '2024-11-05'),
(48, 25, 1, '2024-11-05'),
(51, 27, 1, '2024-11-05');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `nama_lengkap`, `alamat`, `is_admin`) VALUES
(1, 'aa', '4124bc0a9335c27f086f24ba207a4912', 'aa@gmail.com', 'aa', 'aa', 1),
(8, 'bbb', '08f8e0260c64418510cefb2b06eee5cd', 'bbb@gmail.com', 'bbb', 'bbb', 0),
(9, 'cc', 'e0323a9039add2978bf5b49550572c7c', 'cc@gmail.com', 'cc', 'cc', 0),
(10, 'bb', '21ad0bd836b90d08f4cf640b4c298e7c', 'bb@gmail.com', 'bb', 'bb', 0),
(11, 'user', '24c9e15e52afc47c225b757e7bee1f9d', 'user1@gmail.com', 'bot1', 'encrypt', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `user_id` (`id_user`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `user_id` (`id_user`),
  ADD KEY `album_id` (`id_album`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `id_foto` (`id_foto`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `komentar_foto`
--
ALTER TABLE `komentar_foto`
  ADD PRIMARY KEY (`id_komentar`),
  ADD KEY `foto_id` (`id_foto`),
  ADD KEY `user_id` (`id_user`);

--
-- Indexes for table `like_foto`
--
ALTER TABLE `like_foto`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `foto_id` (`id_foto`),
  ADD KEY `user_id` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komentar_foto`
--
ALTER TABLE `komentar_foto`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `like_foto`
--
ALTER TABLE `like_foto`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_foto`) REFERENCES `foto` (`id_foto`) ON DELETE CASCADE,
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `komentar_foto`
--
ALTER TABLE `komentar_foto`
  ADD CONSTRAINT `komentar_foto_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komentar_foto_ibfk_2` FOREIGN KEY (`id_foto`) REFERENCES `foto` (`id_foto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `like_foto`
--
ALTER TABLE `like_foto`
  ADD CONSTRAINT `like_foto_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_foto_ibfk_2` FOREIGN KEY (`id_foto`) REFERENCES `foto` (`id_foto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
