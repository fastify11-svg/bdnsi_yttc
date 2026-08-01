-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 20, 2026 at 06:00 PM
-- Server version: 11.4.12-MariaDB
-- PHP Version: 8.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yttccomb_bdnsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, NULL, '$2y$10$nKtdQiMmZBPs.wj4ljaBK.bhQK0OmJ4qKRO03wnuVxZxweBY2IyrC', '9PCYGfbMSOKmum8ChV7xucEyx95AOs80I8z59WS4rSh0gzVfX3TbHIOzb8iJ', '2025-08-26 10:31:15', '2025-08-26 10:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE `centers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `director_name` varchar(255) DEFAULT NULL,
  `director_image` varchar(255) DEFAULT NULL,
  `fathers_name` varchar(255) DEFAULT NULL,
  `mothers_name` varchar(255) DEFAULT NULL,
  `religion` tinyint(3) UNSIGNED DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `division` int(10) UNSIGNED NOT NULL,
  `district` int(10) UNSIGNED NOT NULL,
  `upazilla` int(10) UNSIGNED NOT NULL,
  `post_office` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `no_of_computers` int(10) UNSIGNED DEFAULT NULL,
  `institute_age` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `authority_signature` varchar(255) DEFAULT NULL,
  `nid_photo` varchar(255) DEFAULT NULL,
  `nid_back_photo` varchar(255) DEFAULT NULL,
  `trade_license` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`id`, `code`, `name`, `owner_name`, `director_name`, `director_image`, `fathers_name`, `mothers_name`, `religion`, `gender`, `nationality`, `division`, `district`, `upazilla`, `post_office`, `postal_code`, `facebook_url`, `no_of_computers`, `institute_age`, `address`, `mobile`, `email`, `photo`, `authority_signature`, `nid_photo`, `nid_back_photo`, `trade_license`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Bangladesh National Skill Institute', 'Bangladesh National Skill Institute', NULL, 'public/center/photo/Hcfimk9l9TkAok85iPUL6QzoCw6hHcHhMwhuMqkv.jpg', 'Bangladesh National Skill Institute', 'Bangladesh National Skill Institute', 0, 0, NULL, 1, 1, 1, 'Bangladesh National Skill Institute', NULL, NULL, NULL, NULL, 'Bangladesh National Skill Institute', '01752216609', 'Admin@Gmail.Com', 'public/center/photo/muNYWWFlwVbDDswURf2ip8ISpd3b6yAtrGa5tzEj.jpg', 'public/center/authority_signature/j5nwhZdxtsuA5LvK8pH9l8qYXt5FipNXQlrrKKnO.jpg', 'public/center/nid_photo/m0xOJZpZRqlvNBbamzsApW7a9G1n05QARtjwhHfa.jpg', 'public/center/nid_photo/oReDi13F5zqsCQuOqgZYMAGXMPz5RAz8U4eo1vHf.png', NULL, 1, '2025-08-30 11:50:23', '2025-08-30 11:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `config_dictionaries`
--

CREATE TABLE `config_dictionaries` (
  `key` varchar(255) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`value`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `config_dictionaries`
--

INSERT INTO `config_dictionaries` (`key`, `value`) VALUES
('about_us', '\"\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964\"'),
('ar_main_about_us', '\"<p>\\u062d\\u0635\\u0644 \\u0627\\u0644\\u0639\\u062f\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0639\\u0627\\u0637\\u0644\\u064a\\u0646 \\u0639\\u0646 \\u0627\\u0644\\u0639\\u0645\\u0644\\u060c \\u0633\\u0648\\u0627\\u0621\\u064b \\u0643\\u0627\\u0646\\u0648\\u0627 \\u0645\\u062a\\u0639\\u0644\\u0645\\u064a\\u0646 \\u0623\\u0648 \\u0634\\u0628\\u0647 \\u0645\\u062a\\u0639\\u0644\\u0645\\u064a\\u0646\\u060c \\u0639\\u0644\\u0649 \\u0641\\u0631\\u0635 \\u0639\\u0645\\u0644 \\u0628\\u0641\\u0636\\u0644 \\u062a\\u062f\\u0631\\u064a\\u0628\\u0647\\u0645 \\u0627\\u0644\\u062c\\u064a\\u062f \\u0627\\u0644\\u0630\\u064a \\u0642\\u062f\\u0645\\u0647 \\u0627\\u0644\\u0645\\u0639\\u0647\\u062f \\u0627\\u0644\\u0648\\u0637\\u0646\\u064a \\u0644\\u0644\\u0645\\u0647\\u0627\\u0631\\u0627\\u062a \\u0641\\u064a \\u0628\\u0646\\u063a\\u0644\\u0627\\u062f\\u064a\\u0634. \\u0648\\u062a\\u0644\\u0642\\u0649 \\u0637\\u0644\\u0627\\u0628 \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0642\\u0633\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0639\\u0646\\u064a\\u0629 \\u0641\\u064a \\u0645\\u0639\\u0638\\u0645 \\u0627\\u0644\\u062c\\u0627\\u0645\\u0639\\u0627\\u062a \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0641\\u064a \\u0627\\u0644\\u0628\\u0644\\u0627\\u062f \\u062a\\u062f\\u0631\\u064a\\u0628\\u064b\\u0627. \\u0648\\u064a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0639\\u062f\\u064a\\u062f \\u0645\\u0646 \\u0637\\u0644\\u0627\\u0628\\u0646\\u0627 \\u0628\\u0643\\u0641\\u0627\\u0621\\u0629 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u0628\\u0644\\u0627\\u062f \\u0648\\u062e\\u0627\\u0631\\u062c\\u0647\\u0627. \\u0648\\u062a\\u0644\\u0642\\u0649 \\u0645\\u0647\\u0646\\u062f\\u0633\\u0648\\u0646 \\u0645\\u0646 DESA \\u0648DESCO \\u0648PDB \\u0648Palli Bidyut Samity \\u0648\\u0634\\u0631\\u0643\\u0627\\u062a \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0645\\u062d\\u0645\\u0648\\u0644 \\u0648\\u0645\\u0635\\u0627\\u0646\\u0639 \\u0645\\u062e\\u062a\\u0644\\u0641\\u0629 \\u062a\\u062f\\u0631\\u064a\\u0628\\u064b\\u0627. \\u0643\\u0645\\u0627 \\u062a\\u0644\\u0642\\u0649 \\u0627\\u0644\\u0639\\u062f\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u062a\\u062f\\u0631\\u064a\\u0628\\u064b\\u0627 \\u0641\\u064a \\u0625\\u0646\\u062a\\u0627\\u062c \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a \\u0648\\u0625\\u0646\\u0634\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0635\\u0627\\u0646\\u0639.<\\/p>\"'),
('bn_main_about_us', '\"<p>\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964<\\/p>\"'),
('center_notice', '\"\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964\"'),
('created_at', '\"2025-08-28 01:30:36\"'),
('description', '\"<p>fgdsghf<\\/p>\"'),
('facebook_link', '\"#\"'),
('fav_icon', '\"public\\/config\\/pOwnnTGuLOIW6VkLyma3dPfhrTeW7TJXFArfs3PT.png\"'),
('header_logo', '\"public\\/config\\/ChU06g18wvE1VDmQ3oRNjg1ofVd1Ki2EQQEgdQzy.png\"'),
('linkedin_link', '\"#\"'),
('logo', '\"public\\/config\\/z9R1GJUjoTn7rQ6VeSKayUSuHMf0MAFK7DDURYCm.png\"'),
('main_about_us', '\"<p>Many educated or semi-educated unemployed people have been able to get employment by receiving quality training from the Bangladesh National Skill Institute. Students from the relevant departments of almost all public and private universities in the country have received training. Many of our students are working efficiently in the country and abroad. Engineers from DESA, DESCO, PDB, Palli Bidyut Samity, mobile operator companies, and various factories have received training. Many students have received training in product production and set up factories.<\\/p>\"'),
('notice', '\"\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964\"'),
('privacy_policy', '\"dtjhgjdjhdj\"'),
('setting-history', '[{\"center_notice\":\"\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964\",\"notice\":\"\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964\",\"about_us\":\"\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964\",\"terms_and_condition\":\"ghdjdtghjd\",\"privacy_policy\":\"dtjhgjdjhdj\",\"twitter_link\":\"#\",\"facebook_link\":\"#\",\"youtube_link\":\"#\",\"linkedin_link\":\"#\",\"description\":\"<p>fgdsghf<\\/p>\",\"main_about_us\":\"<p>Many educated or semi-educated unemployed people have been able to get employment by receiving quality training from the Bangladesh National Skill Institute. Students from the relevant departments of almost all public and private universities in the country have received training. Many of our students are working efficiently in the country and abroad. Engineers from DESA, DESCO, PDB, Palli Bidyut Samity, mobile operator companies, and various factories have received training. Many students have received training in product production and set up factories.<\\/p>\",\"bn_main_about_us\":\"<p>\\u09ac\\u09be\\u0982\\u09b2\\u09be\\u09a6\\u09c7\\u09b6 \\u099c\\u09be\\u09a4\\u09c0\\u09af\\u09bc \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be \\u0987\\u09a8\\u09b8\\u09cd\\u099f\\u09bf\\u099f\\u09bf\\u0989\\u099f \\u098f\\u09b0 \\u09ae\\u09be\\u09a8\\u09b8\\u09ae\\u09cd\\u09ae\\u09a4 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0985\\u09a8\\u09c7\\u0995 \\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u0995\\u09bf\\u0982\\u09ac\\u09be \\u0985\\u09b0\\u09cd\\u09a7\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09bf\\u09a4 \\u09ac\\u09c7\\u0995\\u09be\\u09b0 \\u0995\\u09b0\\u09cd\\u09ae\\u09b8\\u0982\\u09b8\\u09cd\\u09a5\\u09be\\u09a8 \\u0995\\u09b0\\u09a4\\u09c7 \\u09aa\\u09c7\\u09b0\\u09c7\\u099b\\u09c7\\u0964 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09be\\u09df \\u09b8\\u0995\\u09b2 \\u09aa\\u09be\\u09ac\\u09b2\\u09bf\\u0995 \\u0993 \\u09aa\\u09cd\\u09b0\\u09be\\u0987\\u09ad\\u09c7\\u099f \\u09ac\\u09bf\\u09b6\\u09cd\\u09ac\\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09be\\u09b2\\u09df\\u09c7\\u09b0 \\u09b8\\u0982\\u09b6\\u09cd\\u09b2\\u09bf\\u09b7\\u09cd\\u099f \\u09a1\\u09bf\\u09aa\\u09be\\u09b0\\u09cd\\u099f\\u09ae\\u09c7\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0-\\u099b\\u09be\\u09a4\\u09cd\\u09b0\\u09c0 \\u09a6\\u09c7\\u09b6\\u09c7 \\u098f\\u09ac\\u0982 \\u09ac\\u09bf\\u09a6\\u09c7\\u09b6\\u09c7 \\u09a6\\u0995\\u09cd\\u09b7\\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u0995\\u09be\\u099c \\u0995\\u09b0\\u099b\\u09c7\\u09a8\\u0964 \\u09a1\\u09c7\\u09b8\\u09be, \\u09a1\\u09c7\\u09b8\\u0995\\u09cb, \\u09aa\\u09bf\\u09a1\\u09bf\\u09ac\\u09bf, \\u09aa\\u09b2\\u09cd\\u09b2\\u09c0 \\u09ac\\u09bf\\u09a6\\u09cd\\u09af\\u09c1\\u09ce \\u09b8\\u09ae\\u09bf\\u09a4\\u09bf, \\u09ae\\u09cb\\u09ac\\u09be\\u0987\\u09b2 \\u0985\\u09aa\\u09be\\u09b0\\u09c7\\u099f\\u09b0 \\u0995\\u09cb\\u09ae\\u09cd\\u09aa\\u09be\\u09a8\\u09c0, \\u09ac\\u09bf\\u09ad\\u09bf\\u09a8\\u09cd\\u09a8 \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09c0\\u09b0 \\u0987\\u099e\\u09cd\\u099c\\u09bf\\u09a8\\u09bf\\u09df\\u09be\\u09b0\\u0997\\u09a8 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09c7\\u09a8\\u0964 \\u0985\\u09a8\\u09c7\\u0995 \\u099b\\u09be\\u09a4\\u09cd\\u09b0 \\u09aa\\u09a3\\u09cd\\u09af \\u0989\\u09ce\\u09aa\\u09be\\u09a6\\u09a8\\u09c7\\u09b0 \\u09aa\\u09cd\\u09b0\\u09b6\\u09bf\\u0995\\u09cd\\u09b7\\u09a3 \\u0997\\u09cd\\u09b0\\u09b9\\u09a8 \\u0995\\u09b0\\u09c7 \\u0995\\u09be\\u09b0\\u0996\\u09be\\u09a8\\u09be \\u09b8\\u09cd\\u09a5\\u09be\\u09aa\\u09a8 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\\u0964<\\/p>\",\"ar_main_about_us\":\"<p>\\u062d\\u0635\\u0644 \\u0627\\u0644\\u0639\\u062f\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0639\\u0627\\u0637\\u0644\\u064a\\u0646 \\u0639\\u0646 \\u0627\\u0644\\u0639\\u0645\\u0644\\u060c \\u0633\\u0648\\u0627\\u0621\\u064b \\u0643\\u0627\\u0646\\u0648\\u0627 \\u0645\\u062a\\u0639\\u0644\\u0645\\u064a\\u0646 \\u0623\\u0648 \\u0634\\u0628\\u0647 \\u0645\\u062a\\u0639\\u0644\\u0645\\u064a\\u0646\\u060c \\u0639\\u0644\\u0649 \\u0641\\u0631\\u0635 \\u0639\\u0645\\u0644 \\u0628\\u0641\\u0636\\u0644 \\u062a\\u062f\\u0631\\u064a\\u0628\\u0647\\u0645 \\u0627\\u0644\\u062c\\u064a\\u062f \\u0627\\u0644\\u0630\\u064a \\u0642\\u062f\\u0645\\u0647 \\u0627\\u0644\\u0645\\u0639\\u0647\\u062f \\u0627\\u0644\\u0648\\u0637\\u0646\\u064a \\u0644\\u0644\\u0645\\u0647\\u0627\\u0631\\u0627\\u062a \\u0641\\u064a \\u0628\\u0646\\u063a\\u0644\\u0627\\u062f\\u064a\\u0634. \\u0648\\u062a\\u0644\\u0642\\u0649 \\u0637\\u0644\\u0627\\u0628 \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0642\\u0633\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0639\\u0646\\u064a\\u0629 \\u0641\\u064a \\u0645\\u0639\\u0638\\u0645 \\u0627\\u0644\\u062c\\u0627\\u0645\\u0639\\u0627\\u062a \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0641\\u064a \\u0627\\u0644\\u0628\\u0644\\u0627\\u062f \\u062a\\u062f\\u0631\\u064a\\u0628\\u064b\\u0627. \\u0648\\u064a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0639\\u062f\\u064a\\u062f \\u0645\\u0646 \\u0637\\u0644\\u0627\\u0628\\u0646\\u0627 \\u0628\\u0643\\u0641\\u0627\\u0621\\u0629 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u0628\\u0644\\u0627\\u062f \\u0648\\u062e\\u0627\\u0631\\u062c\\u0647\\u0627. \\u0648\\u062a\\u0644\\u0642\\u0649 \\u0645\\u0647\\u0646\\u062f\\u0633\\u0648\\u0646 \\u0645\\u0646 DESA \\u0648DESCO \\u0648PDB \\u0648Palli Bidyut Samity \\u0648\\u0634\\u0631\\u0643\\u0627\\u062a \\u062a\\u0634\\u063a\\u064a\\u0644 \\u0627\\u0644\\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0645\\u062d\\u0645\\u0648\\u0644 \\u0648\\u0645\\u0635\\u0627\\u0646\\u0639 \\u0645\\u062e\\u062a\\u0644\\u0641\\u0629 \\u062a\\u062f\\u0631\\u064a\\u0628\\u064b\\u0627. \\u0643\\u0645\\u0627 \\u062a\\u0644\\u0642\\u0649 \\u0627\\u0644\\u0639\\u062f\\u064a\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u062a\\u062f\\u0631\\u064a\\u0628\\u064b\\u0627 \\u0641\\u064a \\u0625\\u0646\\u062a\\u0627\\u062c \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a \\u0648\\u0625\\u0646\\u0634\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0635\\u0627\\u0646\\u0639.<\\/p>\",\"logo\":\"public\\/config\\/z9R1GJUjoTn7rQ6VeSKayUSuHMf0MAFK7DDURYCm.png\",\"fav_icon\":\"public\\/config\\/pOwnnTGuLOIW6VkLyma3dPfhrTeW7TJXFArfs3PT.png\",\"header_logo\":\"public\\/config\\/ChU06g18wvE1VDmQ3oRNjg1ofVd1Ki2EQQEgdQzy.png\",\"created_at\":\"2025-08-28 01:30:36\"}]'),
('terms_and_condition', '\"ghdjdtghjd\"'),
('twitter_link', '\"#\"'),
('youtube_link', '\"#\"');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`, `is_seen`) VALUES
(1, 'Kaley Stamm', 'kaley.stamm@msn.com', '882342708', 'With Just 3 Clicks, You Will Be Able To Unlock All TOP AI Models with All Versions + All Upcoming Future Versions… Without Spending A Penny …\r\nhttps://bravo-333.site/MultiverseAI\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nto UNSUBSCRIBE:\r\nhttps://bravo-333.site/unsubscribe?domain=bdnsi.com\r\nAddress: 209 West Street Comstock Park, MI 49321', '2025-11-13 16:28:13', '2025-11-13 16:28:13', 1),
(2, 'Abu Bakar Rifat', 'bhuiyanrifat80@gmail.com', '01301409340', 'Hello. I want to enroll in a 2–3 month Chef/Cooking Course. \r\nMy budget is within 30,000 BDT. \r\nCould you please give me details about the course fee, duration, class schedule and admission process?', '2025-11-28 01:39:36', '2025-11-28 01:39:36', 1),
(3, 'Dwayne Genovese', 'dwayne.genovese@hotmail.com', '470705708', 'This Invisible 10-Minute Faceless Video Hack\r\nPulled in 628,000+ Views…\r\nWith No Camera, No Gear & No Tech Skills\r\nhttps://buy-cialisdiscount.site/InvisibleTrafficSystem\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nto UNSUBSCRIBE:\r\nhttps://buy-cialisdiscount.site/unsubscribe?domain=bdnsi.com\r\nAddress: 108 West Street Comstock Park, MI 48721', '2025-11-28 05:38:48', '2025-11-28 05:38:48', 1),
(4, 'Shorwar Hossain', 'reyad.shorwar@gmail.com', '01680124000', 'I wants to take a short training course of making upholstery. I like to know have you offer this types of course?', '2025-11-29 17:07:41', '2025-11-29 17:07:41', 1),
(5, 'Md Alamin', 'mdalaminsuly1992@gmail.com', '01858170945', 'Assalamualaikum sir \r\nAmi welding lavel 2 3 4 korte chai', '2025-12-02 19:15:51', '2025-12-02 19:15:51', 1),
(6, 'Md Alamin', 'mdalaminsuly1992@gmail.com', '01858170945', 'Assalamualaikum sir ami welding course korte chai', '2025-12-02 20:43:29', '2025-12-02 20:43:29', 1),
(7, 'Md Alamin', 'mdalaminsuly1992@gmail.com', '01858170945', 'Assalamualaikum sir ami welding shikhte chai please apnader contact number ta den', '2025-12-02 21:02:11', '2025-12-02 21:02:11', 1),
(8, 'Akhi Deb', 'rajuiconbd@gmail.com', '01929988139', 'Interested for take a short course on Dress Making and Tailoring.', '2025-12-26 19:10:26', '2025-12-26 19:10:26', 1),
(9, 'Rakibul Islam Rakib', 'rislamrakib2598@gmail.com', '01609323209', 'I want to take training as a MIG Welder to work abroad. Please give me details.', '2025-12-27 00:50:50', '2025-12-27 00:50:50', 1),
(10, 'Jayrn Smith', 'neely.anh@msn.com', '817239781', 'Hi, it’s Jayrn.\r\n\r\nIf your site already uses — or is preparing to use — affiliate links, this will be relevant.\r\n\r\nOne issue I see constantly is that monetization is treated as something you “add later,” instead of something that’s designed into the site from the beginning.\r\n\r\nThat usually leads to:\r\nrandom placement of links\r\nunclear visitor intent\r\nunpredictable income\r\n\r\nIt works, but never consistently.\r\n\r\nI put together a short explanation of why this happens and what changes once monetization is structured properly:\r\n\r\nhttps://marketersmentor.com/recurring-income-system.php?refer=bdnsi.com\r\n\r\nYou’ll know quickly whether this applies to your situation.\r\n\r\nJayrn\r\n\r\n\r\n\r\nPS: And one quick note so you’re not wondering why you’re hearing from me:\r\nI only reach out to website owners because they’re the ones actively building something online. I’m not blasting random emails. \r\nI’m simply sharing a resource that has been helping a lot of people create predictable online income. If it resonates, great. If not, no worries.\r\n\r\n\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=bdnsi.com', '2025-12-27 22:50:27', '2025-12-27 22:50:27', 1),
(11, 'Md Mahbub Alam', 'mahbub.wwww@gmail.com', '01810767886', 'আমি ঘড়ি মেরামত কোর্স সম্পর্কে জানতে চাই।আমার শিক্ষাগত যোগ্যতা উচ্চ মাধ্যমিক।', '2025-12-30 21:59:44', '2025-12-30 21:59:44', 1),
(12, 'Md Ashrafuzzaman Bhuiyna', '12tonmoy88442233@gmail.com', '01886682018', 'I I was going to enroll in your training center.', '2026-01-06 00:25:30', '2026-01-06 00:25:30', 1),
(13, 'MD JAKIR HOSSEN', 'smjakir7@gmail.com', '01710286196', 'Sir I need your institute locations. I can\'t find your contact number or institute location.plz help me find location', '2026-01-15 03:03:53', '2026-01-15 03:03:53', 1),
(14, 'Asif Imtiaz', 'asif.imtiaz15@hotmail.co.uk', '01533300450', 'ami carpentry course er bepare jante chai and carpentry course ta korte chai', '2026-01-27 12:54:03', '2026-01-27 12:54:03', 0),
(15, 'Fuad', 'akfuhad47@gmail.com', '01612528538', 'আমি কসমেটিকস এর উপর কোর্স করতে চাচ্ছি', '2026-01-29 06:42:35', '2026-01-29 06:42:35', 0),
(16, 'Johura Akter', 'johuraakterbonna@gmail.com', '01304054354', 'Cosmetics science course', '2026-02-24 02:44:16', '2026-02-24 02:44:16', 0),
(17, 'Hasnain', 'mdhasnainkhorshed@gmail.com', '01747463651', 'Want to admit..', '2026-03-23 13:39:42', '2026-03-23 13:39:42', 0),
(18, 'MD ANAMUL HAQUE', 'anamultoday.life@gmail.com', '01717117265', 'আমি সিসি ক্যামেরার কাজ শিখতে চাই, বিস্তারিত জানতে চাচ্ছি।', '2026-03-28 13:24:39', '2026-03-28 13:24:39', 0),
(19, 'md hasan bijoy', 'mdhassanbijoy42@gmail.com', '01942044195', 'i want to doing complete  food and baverage production course', '2026-04-08 01:13:34', '2026-04-08 01:13:34', 0),
(20, 'Roxana Philip', 'domains@search-bdnsi.com', '7753263011', 'Hey\r\n\r\nPlace bdnsi.com in GoogleSearchIndex to be displayed in web search results!\r\n\r\nList bdnsi.com now: https://searchregister.info', '2026-04-10 15:51:25', '2026-04-10 15:51:25', 0),
(21, 'Pasquale Carty', 'domains@search-bdnsi.com', '423432497', 'Hey\r\n\r\nInclude bdnsi.com in GoogleSearchIndex so it can be visible in google search results!\r\n\r\nPlace bdnsi.com now: https://searchregister.info', '2026-04-23 02:25:13', '2026-04-23 02:25:13', 0),
(22, 'Md Alamin', 'mda959598@gmail.com', '01882919790', 'carpe tead cours korte cai', '2026-04-25 17:09:58', '2026-04-25 17:09:58', 0),
(23, 'Ashwani Sharma', 'ashwani@rocketdigitaltech.com', '7532833829', 'Hello http://bdnsi.com,\r\n \r\nWe can place your website on Google 1st page.\r\n \r\nI can give you our Complete SEO Action Plan along with a customary reach and add great value to your product/ service.\r\n \r\nI may send you a SEO Packages & price list. If interested.\r\n \r\nBest Regards,\r\nAshwani\r\nOnline SEO Consultant', '2026-04-29 02:31:15', '2026-04-29 02:31:15', 0),
(24, 'Rifat Al Mahmud', 'rifatalmahmud420@gmail.com', '01851771591', 'diploma in survey somporke jante cacchi.', '2026-05-25 00:52:52', '2026-05-25 00:52:52', 0),
(25, 'TimothyCag', 'jacksrenome@gmx.com', '83292875466', 'YyErjcwdkdjwjjwjjdwjddjwsjf ndsaKAqwdweihduncbbwebidaa iudwnishqwuvdwqihbfvweuiojsqjqioqdefiw dwqsqwijbfiewdncbhvdifqhioqsjnqw bdnsi.com', '2026-05-25 16:32:52', '2026-05-25 16:32:52', 0),
(26, 'Abu Sayed', 'abusayed8513@gmail.com', '01341048906', 'আপনারা কি এক্সভেটর শিখান, ১ মাসে শিখানো যাবে কিনা', '2026-06-28 00:00:50', '2026-06-28 00:00:50', 0),
(27, 'Jannatul Priyanka', '143jannatulTRADEinternational@gmail.com', '01777083439', 'Want to know about Hotel management diploma', '2026-07-01 20:24:40', '2026-07-01 20:24:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cumilla', NULL, NULL),
(2, 1, 'Feni', NULL, NULL),
(3, 1, 'Brahmanbaria', NULL, NULL),
(4, 1, 'Rangamati', NULL, NULL),
(5, 1, 'Noakhali', NULL, NULL),
(6, 1, 'Chandpur', NULL, NULL),
(7, 1, 'Lakshmipur', NULL, NULL),
(8, 1, 'Chattogram', NULL, NULL),
(9, 1, 'Cox\'s Bazar', NULL, NULL),
(10, 1, 'Khagrachari', NULL, NULL),
(11, 1, 'Bandarban', NULL, NULL),
(12, 2, 'Sirajganj', NULL, NULL),
(13, 2, 'Pabna', NULL, NULL),
(14, 2, 'Bogura', NULL, NULL),
(15, 2, 'Rajshahi', NULL, NULL),
(16, 2, 'Natore', NULL, NULL),
(17, 2, 'Joypurhat', NULL, NULL),
(18, 2, 'Chapainawabganj', NULL, NULL),
(19, 2, 'Naogaon', NULL, NULL),
(20, 3, 'Jashore', NULL, NULL),
(21, 3, 'Satkhira', NULL, NULL),
(22, 3, 'Meherpur', NULL, NULL),
(23, 3, 'Narail', NULL, NULL),
(24, 3, 'Chuadanga', NULL, NULL),
(25, 3, 'Kushtia', NULL, NULL),
(26, 3, 'Magura', NULL, NULL),
(27, 3, 'Khulna', NULL, NULL),
(28, 3, 'Bagerhat', NULL, NULL),
(29, 3, 'Jhenaidah', NULL, NULL),
(30, 4, 'Jhalokati', NULL, NULL),
(31, 4, 'Patuakhali', NULL, NULL),
(32, 4, 'Pirojpur', NULL, NULL),
(33, 4, 'Barisal', NULL, NULL),
(34, 4, 'Bhola', NULL, NULL),
(35, 4, 'Barguna', NULL, NULL),
(36, 5, 'Sylhet', NULL, NULL),
(37, 5, 'Moulvibazar', NULL, NULL),
(38, 5, 'Habiganj', NULL, NULL),
(39, 5, 'Sunamganj', NULL, NULL),
(40, 6, 'Narsingdi', NULL, NULL),
(41, 6, 'Gazipur', NULL, NULL),
(42, 6, 'Shariatpur', NULL, NULL),
(43, 6, 'Narayanganj', NULL, NULL),
(44, 6, 'Tangail', NULL, NULL),
(45, 6, 'Kishoreganj', NULL, NULL),
(46, 6, 'Manikganj', NULL, NULL),
(47, 6, 'Dhaka', NULL, NULL),
(48, 6, 'Munshiganj', NULL, NULL),
(49, 6, 'Rajbari', NULL, NULL),
(50, 6, 'Madaripur', NULL, NULL),
(51, 6, 'Gopalganj', NULL, NULL),
(52, 6, 'Faridpur', NULL, NULL),
(53, 7, 'Panchagarh', NULL, NULL),
(54, 7, 'Dinajpur', NULL, NULL),
(55, 7, 'Lalmonirhat', NULL, NULL),
(56, 7, 'Nilphamari', NULL, NULL),
(57, 7, 'Gaibandha', NULL, NULL),
(58, 7, 'Thakurgaon', NULL, NULL),
(59, 7, 'Rangpur', NULL, NULL),
(60, 7, 'Kurigram', NULL, NULL),
(61, 8, 'Sherpur', NULL, NULL),
(62, 8, 'Mymensingh', NULL, NULL),
(63, 8, 'Jamalpur', NULL, NULL),
(64, 8, 'Netrokona', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chattogram', 1, NULL, NULL),
(2, 'Rajshahi', 1, NULL, NULL),
(3, 'Khulna', 1, NULL, NULL),
(4, 'Barisal', 1, NULL, NULL),
(5, 'Sylhet', 1, NULL, NULL),
(6, 'Dhaka', 1, NULL, NULL),
(7, 'Rangpur', 1, NULL, NULL),
(8, 'Mymensingh', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `per_mcq_mark` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cnic` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `license_number` varchar(255) NOT NULL,
  `issue_date` timestamp NOT NULL,
  `valid_from` timestamp NOT NULL,
  `valid_to` timestamp NOT NULL,
  `allowed_vehicles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`allowed_vehicles`)),
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `cnic`, `name`, `father_name`, `city`, `state`, `image`, `license_number`, `issue_date`, `valid_from`, `valid_to`, `allowed_vehicles`, `status`, `created_at`, `updated_at`) VALUES
(1, 'A02930784', 'Md Shohidul Islam', 'Md Abdur Rob', 'Begumganj', 'Noakhali', 'public/license/v60AdCYhfP7qqlTwFQ35kUekvRGRMU0tV2fCyXNV.png', 'Dk0007925688', '2023-10-04 04:00:00', '2023-10-04 04:00:00', '2028-10-03 04:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2025-10-23 05:03:43', '2025-10-27 20:26:18'),
(2, 'A19097216', 'Nazrul Islam', 'Md Humayen Kabir', 'Kabirhat', 'Noakhali', 'public/license/FcxbArCk1qiRM8nPFmaU9JsO6LfMhjG2GM4gB88W.jpg', 'Dk0007964851', '2022-11-26 05:00:00', '2022-11-26 05:00:00', '2027-11-25 05:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2025-11-03 17:39:57', '2025-11-04 13:04:55'),
(3, 'A11348537', 'Md Seyam Hossain', 'Md Shadad Hossain', 'Bandar', 'Narayanganj', 'public/license/8gcXTbzkiXaQxTSN9hqw38ljWv4JSGdMFTzubdqE.png', 'Dk0002346987', '2024-01-05 05:00:00', '2024-01-05 05:00:00', '2029-01-04 05:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2025-11-03 17:49:33', '2025-11-03 17:49:33'),
(4, 'A00946894', 'Mehrab Hossain', 'Amzad Hossain', 'Pallabi', 'Dhaka', 'public/license/TioVRS55NqoMJzQo6984AeW7jd9ZhwyWMR6zom1e.png', 'Dk0012674910', '2023-10-10 04:00:00', '2023-10-10 04:00:00', '2028-10-09 04:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2025-11-03 17:55:48', '2025-11-04 13:03:54'),
(5, 'Bk0165083', 'Mohammed Kamal Uddin', 'Abdul Malek', 'Fatikchhari', 'Chittagong', 'public/license/U2bzXgrpOKjeNXwbvzX0qdqfZRm9Fx9ogZGnGRX7.png', 'Cg0135802l00008', '2022-04-04 04:00:00', '2022-04-04 04:00:00', '2027-04-03 04:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2025-11-03 18:05:16', '2025-11-04 13:00:44'),
(6, 'Ej0483566', 'Mohammad Juel Ali', 'Md Muntu Ali', 'Shibganj', 'Chapainawabganj', 'public/license/DDH1fKHlkPVkseReNnZ4KPBXIsZEboCwTJbsuzZw.png', 'Dk1056486317', '2025-02-20 05:00:00', '2025-02-20 05:00:00', '2030-02-19 05:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2025-11-03 18:12:26', '2025-11-07 21:01:23'),
(7, 'Em0492623', 'Md Majharul Islam', 'Md Akbor Ali', 'Kulaura', 'Moulvibazar', 'public/license/GBnPJDzB2cJNdTEgLrXUSM3syySmhd8e5nuDr6nV.jpg', 'Dk0007920022', '2025-03-20 04:00:00', '2025-03-20 04:00:00', '2030-03-19 04:00:00', '[\"M\",\"CAR\"]', 1, '2026-01-26 05:44:00', '2026-01-26 21:26:25'),
(8, 'A01392794', 'Anowar Hossain', 'Jagir Hossain', 'Gongadhar', 'Feni', 'public/license/Suj5DCYGteChymGv0pEKZwKLbgnaSWLm9v7qyBhl.png', 'Dk0007321488', '2025-05-02 04:00:00', '2025-05-02 04:00:00', '2030-05-01 04:00:00', '[\"M\",\"CAR\"]', 1, '2026-01-26 05:51:40', '2026-01-26 21:26:36'),
(9, 'A05618266', 'Iqbal Hassan Santo', 'Abdul Khaleq', 'Shahrasti', 'Chandpur', 'public/license/iZjyQqjIw76mXgeSsKjnRtzSF6JcVkWwnVZjnxht.png', 'Dk0007328989', '2023-07-15 04:00:00', '2023-07-15 04:00:00', '2028-07-14 04:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2026-01-26 23:11:50', '2026-01-26 23:18:24'),
(10, 'A06456460', 'Parvis Mia', 'Md Solaiman', 'Cumilla', 'Nangalkot', 'public/license/pwCRfNiwSja0x4FUjDzYeCgmu9HJ15H3Pdlxa2kO.png', 'Dk0007000009', '2025-03-10 04:00:00', '2025-03-10 04:00:00', '2030-03-09 05:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2026-02-08 00:16:33', '2026-02-15 03:31:54'),
(11, 'Em0579769', 'Sahadat Hossain Sojol', 'Md Hiron', 'Noakhali', 'Sonaimuri', 'public/license/VgohVN9MZQdGZZMtOIKavzOhqRgu5tkUAsEhoevj.jpg', 'Dk0007329999', '2023-01-28 05:00:00', '2023-01-28 05:00:00', '2028-01-27 05:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2026-02-08 00:21:51', '2026-02-15 03:37:14'),
(12, 'En0007636', 'Md Khaled Hasan', 'Md Abul Basher', 'Chandpur', 'Haziganj', 'public/license/4cj68xOOu7uchkMoU3sJsPYt2c5A1Gp9O54bQes5.jpg', 'Dk00079963711', '2022-01-14 05:00:00', '2022-01-14 05:00:00', '2027-01-13 05:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2026-02-08 00:26:45', '2026-02-15 03:38:08'),
(13, 'A18988604', 'Alamin', 'Belayet Hossain', 'Tangail', 'Tangail', 'public/license/IioK1EGTH9Sq39e9RBCX35LjIqmIn89lIY6BdUkh.png', 'Tn0035039l00001', '2024-01-08 05:00:00', '2024-01-08 05:00:00', '2029-01-07 05:00:00', '[\"M\",\"CAR\",\"JEEP\"]', 1, '2026-02-26 06:00:17', '2026-02-26 06:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_06_30_111132_create_centers_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2022_05_12_000000_create_admins_table', 1),
(6, '2022_05_12_104852_laratrust_setup_tables', 1),
(7, '2022_06_30_133433_create_subjects_table', 1),
(8, '2022_06_30_133553_create_sessions_table', 1),
(9, '2022_06_30_134907_create_students_table', 1),
(10, '2022_07_03_112149_create_results_table', 1),
(11, '2023_04_04_081435_create_sliders_table', 1),
(12, '2023_05_10_060328_create_contact_us_table', 1),
(13, '2023_05_10_062630_create_config_dictionaries_table', 1),
(14, '2023_07_16_052329_add_exam_date_to_students', 1),
(15, '2023_09_19_111215_add_status_to_sessions_table', 1),
(16, '2023_09_19_114211_add_paid_to_student_table', 1),
(17, '2024_03_09_064822_add_password_to_students_table', 1),
(18, '2024_03_09_073222_create_exams_table', 1),
(19, '2024_03_09_102810_create_quations_table', 1),
(20, '2024_03_26_065455_create_notices_table', 1),
(21, '2024_03_27_063720_add_subjectdetails_to_subjects_table', 1),
(22, '2024_08_24_180757_add_exam_date_to_students_table', 1),
(23, '2024_11_27_103141_create_teams_table', 1),
(24, '2024_12_12_172228_add_password_to_users_table', 1),
(25, '2024_12_22_171728_add_type_to_subjects_table', 1),
(26, '2024_12_30_122712_add_course_type_to_students_table', 1),
(27, '2025_02_17_145238_create_translations_table', 1),
(28, '2025_02_26_161300_add_lang_to_notices_table', 1),
(29, '2025_05_07_173702_create_divisions_table', 1),
(30, '2025_05_07_174111_create_districts_table', 1),
(31, '2025_05_07_174512_create_upazilas_table', 1),
(32, '2025_05_31_114254_add_seen_to_contact_us_table', 1),
(33, '2025_07_03_202346_create_whatapp_links_table', 1),
(34, '2025_07_15_063732_create_youtube_videos_table', 1),
(35, '2025_10_22_210809_create_licenses_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bn_details` longtext DEFAULT NULL,
  `ar_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'user-create', 'Create User', 'Create User', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(2, 'user-read', 'Read User', 'Read User', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(3, 'user-update', 'Update User', 'Update User', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(4, 'user-delete', 'Delete User', 'Delete User', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(5, 'center-create', 'Create Center', 'Create Center', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(6, 'center-read', 'Read Center', 'Read Center', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(7, 'center-update', 'Update Center', 'Update Center', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(8, 'center-delete', 'Delete Center', 'Delete Center', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(9, 'subject-create', 'Create Subject', 'Create Subject', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(10, 'subject-read', 'Read Subject', 'Read Subject', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(11, 'subject-update', 'Update Subject', 'Update Subject', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(12, 'subject-delete', 'Delete Subject', 'Delete Subject', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(13, 'session-create', 'Create Session', 'Create Session', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(14, 'session-read', 'Read Session', 'Read Session', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(15, 'session-update', 'Update Session', 'Update Session', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(16, 'session-delete', 'Delete Session', 'Delete Session', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(17, 'student-create', 'Create Student', 'Create Student', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(18, 'student-read', 'Read Student', 'Read Student', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(19, 'student-update', 'Update Student', 'Update Student', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(20, 'student-delete', 'Delete Student', 'Delete Student', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(21, 'result-create', 'Create Result', 'Create Result', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(22, 'result-read', 'Read Result', 'Read Result', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(23, 'result-update', 'Update Result', 'Update Result', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(24, 'result-delete', 'Delete Result', 'Delete Result', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(25, 'team-create', 'Create Team', 'Create Team', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(26, 'team-read', 'Read Team', 'Read Team', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(27, 'team-update', 'Update Team', 'Update Team', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(28, 'team-delete', 'Delete Team', 'Delete Team', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(29, 'sub-admin-create', 'Create Sub-admin', 'Create Sub-admin', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(30, 'sub-admin-read', 'Read Sub-admin', 'Read Sub-admin', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(31, 'sub-admin-update', 'Update Sub-admin', 'Update Sub-admin', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(32, 'sub-admin-delete', 'Delete Sub-admin', 'Delete Sub-admin', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(33, 'exam-create', 'Create Exam', 'Create Exam', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(34, 'exam-read', 'Read Exam', 'Read Exam', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(35, 'exam-update', 'Update Exam', 'Update Exam', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(36, 'exam-delete', 'Delete Exam', 'Delete Exam', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(37, 'question-create', 'Create Question', 'Create Question', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(38, 'question-read', 'Read Question', 'Read Question', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(39, 'question-update', 'Update Question', 'Update Question', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(40, 'question-delete', 'Delete Question', 'Delete Question', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(41, 'slider-create', 'Create Slider', 'Create Slider', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(42, 'slider-read', 'Read Slider', 'Read Slider', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(43, 'slider-update', 'Update Slider', 'Update Slider', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(44, 'slider-delete', 'Delete Slider', 'Delete Slider', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(45, 'notice-create', 'Create Notice', 'Create Notice', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(46, 'notice-read', 'Read Notice', 'Read Notice', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(47, 'notice-update', 'Update Notice', 'Update Notice', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(48, 'notice-delete', 'Delete Notice', 'Delete Notice', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(49, 'adminList-create', 'Create AdminList', 'Create AdminList', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(50, 'adminList-read', 'Read AdminList', 'Read AdminList', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(51, 'adminList-update', 'Update AdminList', 'Update AdminList', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(52, 'adminList-delete', 'Delete AdminList', 'Delete AdminList', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(53, 'configDictionary-create', 'Create ConfigDictionary', 'Create ConfigDictionary', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(54, 'configDictionary-read', 'Read ConfigDictionary', 'Read ConfigDictionary', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(55, 'configDictionary-update', 'Update ConfigDictionary', 'Update ConfigDictionary', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(56, 'configDictionary-delete', 'Delete ConfigDictionary', 'Delete ConfigDictionary', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(57, 'translation-create', 'Create Translation', 'Create Translation', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(58, 'translation-read', 'Read Translation', 'Read Translation', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(59, 'translation-update', 'Update Translation', 'Update Translation', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(60, 'translation-delete', 'Delete Translation', 'Delete Translation', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(61, 'sponsor-create', 'Create Sponsor', 'Create Sponsor', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(62, 'sponsor-read', 'Read Sponsor', 'Read Sponsor', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(63, 'sponsor-update', 'Update Sponsor', 'Update Sponsor', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(64, 'sponsor-delete', 'Delete Sponsor', 'Delete Sponsor', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(65, 'upazila-store-create', 'Create Upazila-store', 'Create Upazila-store', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(66, 'upazila-store-read', 'Read Upazila-store', 'Read Upazila-store', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(67, 'upazila-store-update', 'Update Upazila-store', 'Update Upazila-store', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(68, 'upazila-store-delete', 'Delete Upazila-store', 'Delete Upazila-store', '2025-08-26 10:31:16', '2025-08-26 10:31:16'),
(69, 'license-create', 'Create License', 'Create License', '2025-10-23 03:33:34', '2025-10-23 03:33:34'),
(70, 'license-read', 'Read License', 'Read License', '2025-10-23 03:33:34', '2025-10-23 03:33:34'),
(71, 'license-update', 'Update License', 'Update License', '2025-10-23 03:33:34', '2025-10-23 03:33:34'),
(72, 'license-delete', 'Delete License', 'Delete License', '2025-10-23 03:33:34', '2025-10-23 03:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(17, 2),
(18, 2),
(19, 2),
(21, 2),
(22, 2),
(23, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quations`
--

CREATE TABLE `quations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `body` varchar(255) NOT NULL,
  `option_1` varchar(255) DEFAULT NULL,
  `option_2` varchar(255) DEFAULT NULL,
  `option_3` varchar(255) DEFAULT NULL,
  `option_4` varchar(255) DEFAULT NULL,
  `answer` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `written` int(11) NOT NULL,
  `practical` int(11) NOT NULL,
  `viva` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `student_id`, `written`, `practical`, `viva`, `created_at`, `updated_at`) VALUES
(1, 1, 968, 88, 81, '2025-08-30 11:53:35', '2025-08-30 11:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2025-08-26 10:31:15', '2025-08-26 10:31:15'),
(2, 'sub_admin', 'Sub Admin', 'Sub Admin', '2025-08-26 10:31:17', '2025-08-26 10:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\Admin');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `duration` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `name`, `start_date`, `end_date`, `duration`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Jan to Dec 2024', '2024-01-01', '2024-12-31', 1, '2024-12-02 07:17:47', '2025-01-08 21:42:15', 1),
(2, 'Jan to Dec 2023', '2023-01-01', '2023-12-30', 1, '2025-01-04 23:52:34', '2025-01-08 21:42:34', 1),
(3, 'Jan to Dec 2022', '2022-01-01', '2022-12-30', 1, '2025-01-05 00:02:13', '2025-01-08 21:43:49', 1),
(4, 'Jan to Dec 2021', '2021-01-01', '2021-12-30', 1, '2025-01-05 00:02:58', '2025-01-08 21:44:08', 1),
(5, 'Jan to Dec 2020', '2020-01-01', '2020-12-30', 1, '2025-01-05 00:03:38', '2025-01-08 21:49:03', 1),
(6, 'Jan to Dec 2019', '2019-01-01', '2019-12-30', 1, '2025-01-05 00:04:15', '2025-01-08 21:49:19', 1),
(7, 'Jan to Dec 2018', '2018-01-01', '2018-12-30', 1, '2025-01-05 00:04:38', '2025-01-08 21:49:35', 1),
(8, 'Jan to Dec 2017', '2017-01-01', '2017-12-30', 1, '2025-01-05 00:07:04', '2025-01-08 21:49:48', 1),
(9, 'Jan to Dec 2016', '2016-01-01', '2016-12-30', 1, '2025-01-05 00:07:27', '2025-01-08 21:50:04', 1),
(10, 'Jan to Dec 2015', '2015-01-01', '2015-12-30', 1, '2025-01-05 00:08:09', '2025-01-08 21:50:18', 1),
(11, 'Jan to Dec 2014', '2014-01-01', '2014-12-30', 1, '2025-01-05 00:08:30', '2025-01-08 21:50:35', 1),
(12, 'Jan to Dec 2013', '2013-01-01', '2013-12-30', 1, '2025-01-05 00:08:50', '2025-01-08 21:51:42', 1),
(13, 'Jan to Dec 2012', '2012-01-01', '2012-12-30', 1, '2025-01-05 00:09:15', '2025-01-08 21:51:28', 1),
(14, 'Jan to Dec 2011', '2011-01-01', '2011-12-30', 1, '2025-01-05 00:09:48', '2025-01-08 21:50:59', 1),
(15, 'Jan to Dec 2010', '2010-01-01', '2010-12-30', 1, '2025-01-05 00:10:12', '2025-01-08 21:48:41', 1),
(16, 'Jan to Jun 2024', '2024-01-01', '2024-06-30', 6, '2025-01-05 00:15:21', '2025-01-08 21:48:22', 1),
(17, 'Jan to Jun 2023', '2023-01-01', '2023-06-30', 6, '2025-01-05 00:15:46', '2025-01-08 21:48:10', 1),
(18, 'Jan to Jun 2022', '2022-01-01', '2022-06-30', 6, '2025-01-05 00:16:06', '2025-01-08 21:47:56', 1),
(19, 'Jan to Jun 2021', '2021-01-01', '2021-06-03', 6, '2025-01-05 00:16:39', '2025-01-08 21:47:42', 1),
(20, 'Jan to Jun 2020', '2020-01-01', '2020-06-30', 6, '2025-01-05 00:17:03', '2025-01-08 21:47:29', 1),
(21, 'Jan to Jun 2019', '2019-01-01', '2019-06-30', 6, '2025-01-05 00:17:26', '2025-01-08 21:47:13', 1),
(22, 'Jan to Jun 2018', '2018-01-01', '2018-06-03', 6, '2025-01-05 00:17:51', '2025-01-08 21:47:01', 1),
(23, 'Jan to Jun 2017', '2017-01-01', '2017-06-03', 6, '2025-01-05 00:18:10', '2025-01-08 21:46:48', 1),
(24, 'Jan to Jun 2016', '2016-01-01', '2016-06-03', 6, '2025-01-05 00:18:32', '2025-01-08 21:46:33', 1),
(25, 'Jan to Jun 2015', '2015-01-01', '2015-06-03', 6, '2025-01-05 00:18:53', '2025-01-08 21:46:20', 1),
(26, 'Jan to Jun 2014', '2014-01-01', '2014-06-03', 6, '2025-01-05 00:19:56', '2025-01-08 21:45:58', 1),
(27, 'Jan to Jun 2013', '2013-01-01', '2013-06-30', 6, '2025-01-05 00:20:22', '2025-01-08 21:45:40', 1),
(28, 'Jan to Jun 2012', '2012-01-01', '2012-06-03', 6, '2025-01-05 00:20:43', '2025-01-08 21:45:25', 1),
(29, 'Jan to Jun 2011', '2011-01-01', '2011-06-03', 6, '2025-01-05 00:21:23', '2025-01-08 21:45:08', 1),
(30, 'Jan to Jun 2010', '2010-01-01', '2010-06-30', 6, '2025-01-05 00:21:45', '2025-01-08 21:44:53', 1),
(31, 'Jul to Dec 2024', '2024-07-01', '2024-12-30', 6, '2025-01-05 00:23:49', '2025-01-08 21:44:40', 1),
(32, 'Jul to Dec 2023', '2023-07-01', '2023-12-30', 6, '2025-01-05 00:24:43', '2025-01-08 21:41:46', 1),
(33, 'Jul to Dec 2022', '2022-07-01', '2022-12-30', 6, '2025-01-05 00:25:32', '2025-01-08 21:44:25', 1),
(34, 'Jul to Dec 2021', '2021-07-01', '2021-12-30', 6, '2025-01-05 00:25:59', '2025-01-08 21:40:53', 1),
(35, 'Jul to Dec 2020', '2020-07-01', '2020-07-01', 6, '2025-01-05 00:26:24', '2025-01-08 21:39:53', 1),
(36, 'Jul to Dec 2019', '2019-07-01', '2019-12-30', 6, '2025-01-05 00:26:55', '2025-01-08 21:39:31', 1),
(37, 'Jul to Dec 2018', '2018-07-01', '2018-12-30', 6, '2025-01-05 00:29:38', '2025-01-08 21:39:19', 1),
(38, 'Jul to Dec 2017', '2017-07-01', '2017-12-30', 6, '2025-01-05 00:30:27', '2025-01-08 21:39:03', 1),
(39, 'Jul to Dec 2016', '2016-07-01', '2016-12-30', 6, '2025-01-05 00:31:55', '2025-01-08 21:38:52', 1),
(40, 'Jul to Dec 2015', '2015-07-01', '2015-12-30', 6, '2025-01-05 00:32:37', '2025-01-08 21:38:15', 1),
(41, 'Jul to Dec 2014', '2014-07-01', '2014-12-30', 6, '2025-01-05 00:34:53', '2025-01-08 21:37:57', 1),
(42, 'Jul to Dec 2013', '2013-07-01', '2013-12-30', 6, '2025-01-05 00:35:17', '2025-01-08 21:37:39', 1),
(43, 'Jul to Dec 2012', '2012-07-01', '2012-12-30', 6, '2025-01-05 00:35:46', '2025-01-08 21:37:21', 1),
(44, 'Jul to Dec 2011', '2011-07-01', '2011-12-30', 6, '2025-01-05 00:36:23', '2025-01-08 21:37:06', 1),
(45, 'Jul to Dec 2010', '2010-07-01', '2010-12-30', 6, '2025-01-05 00:36:55', '2025-01-08 21:36:45', 1),
(46, 'Jan to Mar 2024', '2024-01-01', '2024-03-30', 3, '2025-01-08 21:54:52', '2025-01-08 21:54:52', 1),
(47, 'Jan to Mar 2023', '2023-01-01', '2023-03-30', 3, '2025-01-08 21:55:18', '2025-01-08 21:55:18', 1),
(48, 'Jan to Mar 2022', '2022-01-01', '2022-03-30', 3, '2025-01-08 21:55:40', '2025-01-08 21:55:40', 1),
(49, 'Jan to Mar 2021', '2021-01-01', '2021-03-30', 3, '2025-01-08 21:55:58', '2025-01-08 21:55:58', 1),
(50, 'Jan to Mar 2020', '2020-01-01', '2020-03-30', 3, '2025-01-08 21:56:19', '2025-01-08 21:56:19', 1),
(51, 'Jan to Mar 2019', '2019-01-01', '2019-03-30', 3, '2025-01-08 21:56:39', '2025-01-08 21:56:39', 1),
(52, 'Jan to Mar 2018', '2018-01-01', '2018-03-30', 3, '2025-01-08 21:56:57', '2025-01-08 21:56:57', 1),
(53, 'Jan to Mar 2017', '2017-01-01', '2017-03-30', 3, '2025-01-08 21:57:13', '2025-01-08 21:57:13', 1),
(54, 'Jan to Mar 2016', '2016-01-01', '2016-01-01', 3, '2025-01-08 21:57:34', '2025-01-08 21:57:34', 1),
(55, 'Jan to Mar 2015', '2015-01-01', '2015-03-30', 3, '2025-01-08 21:57:58', '2025-01-08 21:57:58', 1),
(56, 'Jan to Mar 2014', '2014-01-01', '2014-03-30', 3, '2025-01-08 21:58:27', '2025-01-08 21:58:27', 1),
(57, 'Jan to Mar 2013', '2013-01-01', '2013-03-30', 3, '2025-01-08 21:59:02', '2025-01-08 21:59:02', 1),
(58, 'Jan to Mar 2012', '2012-01-01', '2012-03-30', 3, '2025-01-08 21:59:22', '2025-01-08 21:59:22', 1),
(59, 'Jan to Mar 2011', '2011-01-01', '2011-03-30', 3, '2025-01-08 21:59:40', '2025-01-08 21:59:40', 1),
(60, 'Jan to Mar 2010', '2010-01-01', '2010-03-30', 3, '2025-01-08 22:00:01', '2025-01-08 22:00:01', 1),
(61, 'Apr to Jun 2024', '2024-04-01', '2024-06-30', 3, '2025-01-08 22:03:20', '2025-01-08 22:03:20', 1),
(62, 'Apr to Jun 2023', '2023-04-01', '2023-06-30', 3, '2025-01-08 22:03:42', '2025-01-08 22:03:42', 1),
(63, 'Apr to Jun 2022', '2022-04-01', '2022-06-30', 3, '2025-01-08 22:04:24', '2025-01-08 22:04:24', 1),
(64, 'Apr to Jun 2021', '2021-04-01', '2021-06-30', 3, '2025-01-08 22:05:37', '2025-01-08 22:05:37', 1),
(65, 'Apr to Jun 2020', '2020-04-01', '2020-06-30', 3, '2025-01-08 22:06:13', '2025-01-08 22:06:13', 1),
(66, 'Apr to Jun 2019', '2019-04-01', '2019-06-30', 3, '2025-01-08 22:06:49', '2025-01-08 22:06:49', 1),
(67, 'Apr to Jun 2018', '2018-04-01', '2018-06-30', 3, '2025-01-08 22:07:08', '2025-01-08 22:07:08', 1),
(68, 'Apr to Jun 2017', '2017-04-01', '2017-06-30', 3, '2025-01-08 22:07:54', '2025-01-08 22:07:54', 1),
(69, 'Apr to Jun 2016', '2016-04-01', '2016-06-30', 3, '2025-01-08 22:08:18', '2025-01-08 22:08:18', 1),
(70, 'Apr to Jun 2015', '2015-04-01', '2015-06-30', 3, '2025-01-08 22:08:46', '2025-01-08 22:08:46', 1),
(71, 'Apr to Jun 2014', '2014-04-01', '2014-06-30', 3, '2025-01-08 22:10:22', '2025-01-08 22:10:22', 1),
(72, 'Apr to Jun 2013', '2013-04-01', '2013-06-30', 3, '2025-01-08 22:10:50', '2025-01-08 22:10:50', 1),
(73, 'Apr to Jun 2012', '2012-04-01', '2012-06-30', 3, '2025-01-08 22:11:26', '2025-01-08 22:11:26', 1),
(74, 'Apr to Jun 2011', '2011-04-01', '2011-06-30', 3, '2025-01-08 22:11:51', '2025-01-08 22:11:51', 1),
(75, 'Apr to Jun 2010', '2010-04-01', '2010-06-30', 3, '2025-01-08 22:12:10', '2025-01-08 22:12:10', 1),
(76, 'Jul to Sep 2024', '2024-07-01', '2024-09-30', 3, '2025-01-08 22:36:55', '2025-01-08 22:36:55', 1),
(77, 'Jul to Sep 2023', '2023-07-01', '2023-09-30', 3, '2025-01-08 22:37:24', '2025-01-08 22:37:24', 1),
(78, 'Jul to Sep 2022', '2022-07-01', '2022-09-30', 3, '2025-01-08 22:38:13', '2025-01-08 22:38:13', 1),
(79, 'Jul to Sep 2021', '2021-07-01', '2021-09-30', 3, '2025-01-08 22:38:37', '2025-01-08 22:38:37', 1),
(80, 'Jul to Sep 2020', '2020-07-01', '2020-09-30', 3, '2025-01-08 22:39:05', '2025-01-08 22:39:05', 1),
(81, 'Jul to Sep 2019', '2019-07-01', '2019-09-30', 3, '2025-01-08 22:44:53', '2025-01-08 22:44:53', 1),
(82, 'Jul to Sep 2018', '2018-07-01', '2018-09-30', 3, '2025-01-08 22:46:09', '2025-01-08 22:46:09', 1),
(83, 'Jul to Sep 2017', '2017-07-01', '2017-09-03', 3, '2025-01-08 22:47:40', '2025-01-08 22:47:40', 1),
(84, 'Jul to Sep 2016', '2016-07-01', '2016-09-30', 3, '2025-01-10 03:30:37', '2025-01-10 03:30:37', 1),
(85, 'Jul to Sep 2015', '2015-07-01', '2015-09-30', 3, '2025-01-10 03:31:45', '2025-01-10 03:31:45', 1),
(86, 'Jul to Sep 2014', '2014-07-01', '2014-09-30', 3, '2025-01-10 03:32:15', '2025-01-10 03:32:15', 1),
(87, 'Jul to Sep 2013', '2013-07-01', '2013-09-03', 3, '2025-01-10 03:32:38', '2025-01-10 03:32:38', 1),
(88, 'Jul to Sep 2012', '2012-07-01', '2012-09-30', 3, '2025-01-10 03:33:03', '2025-01-10 03:33:03', 1),
(89, 'Jul to Sep 2011', '2011-07-01', '2011-09-30', 3, '2025-01-10 03:33:25', '2025-01-10 03:33:25', 1),
(90, 'Jul to Sep 2010', '2010-07-01', '2010-09-30', 3, '2025-01-10 03:33:55', '2025-01-10 03:33:55', 1),
(91, 'Oct to Dec 2024', '2024-10-01', '2024-12-30', 3, '2025-01-10 03:40:15', '2025-01-10 03:40:15', 1),
(92, 'Oct to Dec 2023', '2023-10-01', '2023-12-30', 3, '2025-01-10 03:40:49', '2025-01-10 03:40:49', 1),
(93, 'Oct to Dec 2022', '2022-10-01', '2022-12-30', 3, '2025-01-10 03:41:38', '2025-01-10 03:41:38', 1),
(94, 'Oct to Dec 2021', '2021-10-01', '2021-12-30', 3, '2025-01-10 03:42:03', '2025-01-10 03:42:03', 1),
(95, 'Oct to Dec 2020', '2020-10-01', '2020-12-30', 3, '2025-01-10 03:43:34', '2025-01-10 03:43:34', 1),
(96, 'Oct to Dec 2019', '2019-10-01', '2019-12-30', 3, '2025-01-10 03:45:30', '2025-01-10 03:45:30', 1),
(97, 'Oct to Dec 2018', '2018-10-01', '2018-12-30', 3, '2025-01-10 03:46:06', '2025-01-10 03:46:06', 1),
(98, 'Oct to Dec 2017', '2017-10-01', '2017-12-30', 3, '2025-01-10 03:46:38', '2025-01-10 03:46:38', 1),
(99, 'Oct to Dec 2016', '2016-10-01', '2016-12-30', 3, '2025-01-10 03:47:27', '2025-01-10 03:47:27', 1),
(100, 'Oct to Dec 2015', '2015-10-12', '2015-12-30', 3, '2025-01-10 03:47:48', '2025-01-10 03:47:48', 1),
(101, 'Oct to Dec 2014', '2014-10-01', '2014-12-30', 3, '2025-01-10 03:48:14', '2025-01-10 03:48:14', 1),
(102, 'Oct to Dec 2013', '2013-10-01', '2013-12-30', 3, '2025-01-10 03:49:03', '2025-01-10 03:49:03', 1),
(103, 'Oct to Dec 2012', '2012-10-01', '2012-12-30', 3, '2025-01-10 03:49:44', '2025-01-10 03:49:44', 1),
(104, 'Oct to Dec 2011', '2011-10-01', '2011-12-30', 3, '2025-01-10 03:51:00', '2025-01-10 03:51:00', 1),
(105, 'Oct to Dec 2010', '2010-10-01', '2010-12-30', 3, '2025-01-10 03:51:31', '2025-01-10 03:51:31', 1),
(106, '2010 - 2011', '2010-01-01', '2011-12-30', 3, '2025-01-10 03:55:47', '2025-01-10 03:55:47', 1),
(107, '2010 - 2012', '2010-01-01', '2012-12-30', 2, '2025-01-10 03:57:00', '2025-01-10 03:57:00', 1),
(108, '2010 - 2013', '2010-01-01', '2013-12-30', 3, '2025-01-10 03:57:36', '2025-01-10 03:57:36', 1),
(109, '2010 - 2014', '2014-01-01', '2014-12-30', 4, '2025-01-10 03:58:13', '2025-01-10 03:58:13', 1),
(110, '2011 - 2012', '2011-01-01', '2012-12-30', 2, '2025-01-11 23:10:04', '2025-01-11 23:10:04', 1),
(132, '2011 - 2013', '2011-01-01', '2013-12-30', 3, '2025-01-15 02:24:18', '2025-01-15 02:24:18', 1),
(133, '2011 - 2014', '2011-01-01', '2014-12-30', 3, '2025-01-15 02:24:54', '2025-01-15 02:24:54', 1),
(134, '2011 - 2015', '2011-01-01', '2015-12-30', 4, '2025-01-15 02:25:20', '2025-01-15 02:25:20', 1),
(135, '2012 - 2013', '2012-01-01', '2013-12-30', 2, '2025-01-15 02:26:15', '2025-01-15 02:26:15', 1),
(136, '2012 - 2014', '2014-01-01', '2014-12-30', 3, '2025-01-15 02:26:49', '2025-01-15 02:26:49', 1),
(137, '2012 - 2015', '2012-01-01', '2015-12-30', 3, '2025-01-15 02:27:59', '2025-01-15 02:27:59', 1),
(138, '2012 - 2016', '2012-01-01', '2016-12-30', 4, '2025-01-15 02:28:34', '2025-01-15 02:28:34', 1),
(139, '2013 - 2014', '2013-01-01', '2014-12-30', 2, '2025-01-15 02:29:29', '2025-01-15 02:29:29', 1),
(140, '2013 - 2015', '2013-01-01', '2015-12-30', 3, '2025-01-15 02:29:52', '2025-01-15 02:29:52', 1),
(141, '2013 - 2016', '2013-01-01', '2016-12-30', 3, '2025-01-15 02:30:57', '2025-01-15 02:30:57', 1),
(142, '2013 - 2017', '2013-01-01', '2017-12-30', 4, '2025-01-15 02:31:26', '2025-01-15 02:31:26', 1),
(143, '2014 - 2015', '2014-01-01', '2015-12-30', 2, '2025-01-15 02:34:18', '2025-01-15 02:34:18', 1),
(144, '2014 - 2016', '2014-01-01', '2016-12-30', 2, '2025-01-15 02:34:41', '2025-01-15 02:34:41', 1),
(145, '2014 - 2017', '2014-01-01', '2017-12-30', 3, '2025-01-15 02:35:08', '2025-01-15 02:35:08', 1),
(146, '2014 - 2018', '2014-01-01', '2018-12-30', 4, '2025-01-15 02:35:42', '2025-01-15 02:35:42', 1),
(147, '2015 - 2016', '2015-01-01', '2016-12-30', 2, '2025-01-15 02:36:29', '2025-01-15 02:36:29', 1),
(148, '2015 - 2017', '2015-01-01', '2017-12-30', 2, '2025-01-15 02:36:49', '2025-01-15 02:36:49', 1),
(149, '2015 - 2018', '2015-01-01', '2018-12-30', 3, '2025-01-15 02:37:15', '2025-01-15 02:37:15', 1),
(150, '2015 - 2019', '2015-01-01', '2019-12-30', 4, '2025-01-15 02:37:32', '2025-01-15 02:37:32', 1),
(151, '2016 - 2017', '2016-01-01', '2017-12-30', 2, '2025-01-15 02:38:07', '2025-01-15 02:38:07', 1),
(152, '2016 - 2018', '2016-01-01', '2018-12-30', 2, '2025-01-15 02:41:48', '2025-01-15 02:41:48', 1),
(153, '2016 - 2019', '2016-01-01', '2019-12-30', 3, '2025-01-15 02:42:09', '2025-01-15 02:42:09', 1),
(154, '2016 - 2020', '2016-01-01', '2020-12-30', 4, '2025-01-15 02:42:41', '2025-01-15 02:42:41', 1),
(155, '2017 - 2018', '2017-01-01', '2018-12-30', 2, '2025-01-15 02:43:59', '2025-01-15 02:43:59', 1),
(156, '2017 - 2019', '2017-01-01', '2019-12-31', 3, '2025-01-15 02:44:30', '2025-01-15 02:44:30', 1),
(157, '2017 - 2020', '2017-01-01', '2020-12-30', 3, '2025-01-15 02:45:16', '2025-01-15 02:45:16', 1),
(158, '2017 - 2021', '2017-01-01', '2021-12-30', 4, '2025-01-15 02:45:35', '2025-01-15 02:45:35', 1),
(159, '2018 - 2019', '2018-01-01', '2019-12-30', 2, '2025-01-15 02:46:15', '2025-01-15 02:46:15', 1),
(160, '2018 - 2020', '2018-01-01', '2020-12-30', 2, '2025-01-15 02:46:52', '2025-01-15 02:46:52', 1),
(161, '2018 - 2021', '2021-01-01', '2021-12-30', 3, '2025-01-15 02:47:22', '2025-01-15 02:47:22', 1),
(162, '2018 - 2022', '2018-01-01', '2022-12-30', 4, '2025-01-15 02:47:57', '2025-01-15 02:47:57', 1),
(163, '2019 - 2020', '2019-01-01', '2020-12-30', 2, '2025-01-15 02:48:53', '2025-01-15 02:48:53', 1),
(164, '2019 - 2021', '2019-01-01', '2021-12-30', 2, '2025-01-15 02:49:12', '2025-01-15 02:49:12', 1),
(165, '2019 - 2022', '2019-01-01', '2022-12-30', 3, '2025-01-15 02:49:39', '2025-01-15 02:49:39', 1),
(166, '2019 - 2023', '2019-01-01', '2023-12-30', 4, '2025-01-15 02:50:11', '2025-01-15 02:50:11', 1),
(167, '2020 - 2021', '2020-01-01', '2021-12-30', 2, '2025-01-15 02:51:05', '2025-01-15 02:51:05', 1),
(168, '2020 - 2022', '2020-01-01', '2022-12-30', 2, '2025-01-15 02:51:25', '2025-01-15 02:51:25', 1),
(169, '2020 - 2023', '2020-01-01', '2023-12-30', 3, '2025-01-15 02:51:45', '2025-01-15 02:51:45', 1),
(170, '2020 - 2024', '2020-01-01', '2024-12-30', 4, '2025-01-15 02:52:07', '2025-01-15 02:52:07', 1),
(171, '2021 - 2022', '2021-01-01', '2022-12-30', 2, '2025-01-15 02:52:44', '2025-01-15 02:52:44', 1),
(172, '2021 - 2023', '2021-01-01', '2023-12-30', 3, '2025-01-15 03:02:43', '2025-01-15 03:02:43', 1),
(173, '2021 - 2024', '2021-01-01', '2024-12-30', 3, '2025-01-15 03:03:39', '2025-01-15 03:03:39', 1),
(174, '2022 - 2023', '2022-01-01', '2023-12-30', 2, '2025-01-15 03:05:42', '2025-01-15 03:05:42', 1),
(175, '2022 - 2024', '2022-01-01', '2024-12-30', 3, '2025-01-15 03:07:52', '2025-01-15 03:07:52', 1),
(176, '2023 - 2024', '2023-01-01', '2024-12-30', 2, '2025-01-15 03:08:36', '2025-01-15 03:08:36', 1),
(177, 'Jan To Dec 2007', '2007-01-01', '2007-12-30', 1, '2025-02-24 03:40:09', '2025-02-24 03:40:09', 1),
(178, '2005 - 2008', '2005-01-01', '2008-12-30', 4, '2025-03-16 01:03:53', '2025-06-28 19:31:47', 1),
(179, 'Mar To Aug 2025', '2025-03-01', '2025-08-30', 6, '2025-04-01 19:37:32', '2025-08-22 19:38:26', 1),
(180, '2004 - 2007', '1220-12-12', '2020-01-11', 3, '2025-04-10 04:01:32', '2025-04-10 04:01:32', 1),
(181, '2004 - 2005', '2004-12-12', '2005-02-12', 3, '2025-04-11 18:04:02', '2025-04-11 18:04:02', 1),
(182, 'Apr To Sep 2024', '2024-02-02', '2024-12-12', 3, '2025-04-13 16:20:03', '2025-04-13 16:20:03', 1),
(183, '2007 - 2010', '2007-10-01', '2010-12-22', 4, '2025-04-23 02:50:31', '2025-06-17 12:25:50', 1),
(184, 'Jan To Dec 2000', '2000-01-01', '2000-12-12', 1, '2025-04-23 16:47:30', '2025-04-23 16:47:30', 1),
(185, 'Pappu Mia', '2022-01-01', '2024-12-31', 3, '2025-04-26 14:47:51', '2025-04-26 14:47:51', 1),
(188, 'Jul 2023 To Jun 2024', '2023-07-01', '2024-06-30', 1, '2025-04-26 16:52:29', '2025-06-22 07:39:53', 1),
(189, '2006 - 2009', '2006-01-01', '2009-12-31', 4, '2025-04-26 18:47:28', '2025-06-17 12:23:30', 1),
(190, 'Project Management In Development Sector', '2024-06-12', '2024-12-12', 6, '2025-04-30 01:59:23', '2025-04-30 01:59:23', 1),
(191, 'Oct 2024 To  Mar 2025', '0024-10-12', '2025-03-31', 6, '2025-04-30 14:37:24', '2025-04-30 14:37:24', 1),
(192, 'Jan To Dec 2004', '2004-01-01', '2004-12-30', 1, '2025-05-02 03:10:10', '2025-07-10 00:24:34', 1),
(193, 'Jul To Dec 2024', '2024-07-01', '2024-12-31', 6, '2025-05-03 20:05:58', '2025-05-03 20:05:58', 1),
(194, 'April 2021 To April 2022', '2021-04-01', '2022-04-30', 1, '2025-05-07 17:15:05', '2025-08-18 21:56:24', 1),
(195, '2009 To 2012', '2009-01-01', '2012-12-30', 4, '2025-05-09 04:17:42', '2025-05-09 04:17:42', 1),
(196, 'Mar 2023 - Apr 2025', '2023-01-01', '2025-04-30', 2, '2025-05-10 02:49:26', '2025-08-13 00:19:19', 1),
(197, 'Nov 2023 To Nov 2024', '2023-11-01', '2024-11-30', 1, '2025-05-14 19:58:49', '2025-08-10 00:15:55', 1),
(198, 'Apr 2024 - Mar 2025', '2024-01-01', '2025-06-06', 1, '2025-05-15 20:55:54', '2025-05-15 21:11:50', 1),
(199, 'Feb To April 2025', '2025-02-02', '2025-04-30', 3, '2025-05-15 21:11:33', '2025-05-15 21:11:33', 1),
(200, '2002 - 2005', '2002-01-05', '2005-12-03', 4, '2025-05-18 11:25:56', '2025-05-18 11:25:56', 1),
(201, 'Aug - 2020 To Jul - 2021', '1010-01-01', '1010-01-01', 1, '2025-05-19 19:24:35', '2025-05-19 19:24:35', 1),
(202, 'April  2024 To March  2025', '2024-04-01', '2025-03-31', 1, '2025-05-20 17:16:07', '2025-05-20 17:16:07', 1),
(203, 'Mar 2024 To Feb 2025', '2024-01-31', '2025-02-28', 1, '2025-05-20 17:40:37', '2025-06-10 18:48:56', 1),
(204, '2001 - 2003', '2001-01-01', '2003-12-31', 3, '2025-05-21 15:56:55', '2025-07-10 00:14:57', 1),
(205, '2005 To 2006', '2005-01-24', '2006-12-31', 2, '2025-05-21 16:59:01', '2025-05-21 16:59:01', 1),
(206, 'Jan To Dec 2005', '2005-01-03', '2005-12-31', 1, '2025-05-21 17:32:05', '2025-05-21 17:33:33', 1),
(207, '2023 - 2025', '0101-01-01', '1001-01-01', 1, '2025-05-21 23:33:49', '2025-05-21 23:33:49', 1),
(208, 'Jul To Dec 2025', '2025-07-01', '2025-12-31', 6, '2025-05-24 19:07:42', '2025-05-24 19:07:42', 1),
(209, '2024 - 2025', '2024-02-02', '2025-02-02', 1, '2025-05-24 20:13:08', '2025-05-24 20:13:08', 1),
(210, 'Jan To Dec 2008', '2008-01-01', '2008-12-31', 1, '2025-05-26 19:08:00', '2025-05-26 19:08:00', 1),
(211, 'Jan To March 2024', '2024-01-01', '2024-03-31', 3, '2025-05-30 01:39:30', '2025-05-30 01:39:30', 1),
(212, 'Jul To Dec 2026', '2026-07-01', '2026-12-31', 6, '2025-06-02 21:21:04', '2025-06-02 21:21:04', 1),
(213, 'Apr\'23 To Mar\'25', '2023-04-01', '2025-03-31', 2, '2025-06-05 18:57:10', '2025-07-13 17:46:04', 1),
(214, '03 Jun 2009 To 28 May 2010', '2009-06-03', '2010-05-28', 1, '2025-06-14 21:04:04', '2025-06-22 07:39:38', 1),
(215, '2009 - 2010', '2009-01-01', '2010-12-31', 2, '2025-06-17 12:27:18', '2025-06-17 12:27:18', 1),
(216, '2008 - 2011', '1000-10-10', '1000-10-10', 1, '2025-06-17 23:50:35', '2025-06-17 23:50:35', 1),
(217, '2003 - 2005', '1010-01-01', '0101-01-01', 1, '2025-06-19 19:33:38', '2025-06-19 19:33:38', 1),
(218, 'Jan To Jun 2025', '2025-01-01', '2025-06-30', 6, '2025-06-20 21:24:34', '2025-06-22 07:39:17', 1),
(219, 'Jan To Dec 2006', '2020-11-11', '2000-12-21', 2, '2025-06-25 22:00:31', '2025-06-25 22:01:00', 1),
(220, 'Jan 2024 - Jun 2025', '2024-01-01', '2025-06-30', 1, '2025-06-26 15:30:50', '2025-08-05 19:53:37', 1),
(222, 'Jul 2021 To Jun 2023', '2021-07-01', '2023-06-30', 2, '2025-06-27 04:10:15', '2025-06-27 04:10:15', 1),
(223, '1999 - 2000', '1000-01-01', '1000-01-01', 1, '2025-06-27 05:13:22', '2025-06-27 05:13:22', 1),
(224, 'Jun To Nov 2024', '2024-06-01', '2024-11-30', 6, '2025-06-27 18:55:27', '2025-06-27 18:55:27', 1),
(225, '2001 - 2004', '2000-01-01', '2000-01-20', 1, '2025-06-30 02:49:48', '2025-06-30 02:49:48', 1),
(226, '2008 - 2009', '2000-01-01', '2000-02-19', 1, '2025-06-30 02:50:18', '2025-06-30 02:50:18', 1),
(227, '2007 - 2008', '2000-01-01', '2000-01-01', 1, '2025-07-02 03:12:28', '2025-07-02 03:12:28', 1),
(228, '2009 - 2012', '2000-01-01', '2000-01-20', 1, '2025-07-03 22:03:08', '2025-07-03 22:03:08', 1),
(229, '2021 - 2025', '2000-01-01', '2100-02-19', 1, '2025-07-05 04:32:29', '2025-07-05 04:32:29', 1),
(230, 'Aug  2024 - Jul 2025', '2024-08-02', '2025-07-30', 1, '2025-07-09 17:27:46', '2025-08-22 19:24:21', 1),
(231, '2001 - 2002', '2000-12-22', '2000-02-10', 1, '2025-07-10 05:54:05', '2025-07-10 05:54:05', 1),
(232, 'Jul 2020 To Jun 2023', '2020-07-01', '2023-06-30', 3, '2025-07-13 03:26:05', '2025-08-01 00:06:15', 1),
(233, '2000 - 2003', '2000-02-02', '2000-02-01', 1, '2025-07-20 10:38:18', '2025-07-20 10:38:18', 1),
(234, 'Apr 2023 - Apr 2025', '2023-04-01', '2025-04-30', 2, '2025-07-20 18:05:51', '2025-08-01 19:59:10', 1),
(235, '2002 - 2003', '2200-12-22', '1920-02-18', 1, '2025-07-26 01:23:37', '2025-07-26 01:23:37', 1),
(236, 'Jan To Dec 2009', '2000-02-22', '2000-02-01', 1, '2025-07-27 04:27:19', '2025-07-27 04:27:19', 1),
(237, 'Jan To Dec 2003', '2220-12-22', '2200-02-12', 1, '2025-07-27 04:27:41', '2025-07-27 04:27:41', 1),
(238, '2007 - 2009', '2020-02-02', '2015-02-01', 1, '2025-07-31 03:25:26', '2025-07-31 03:25:26', 1),
(239, 'Jul 2023 To Jun 2025', '2010-12-25', '2011-02-19', 2, '2025-08-01 00:47:17', '2025-08-01 00:47:17', 1),
(240, 'Jan To Jun 2008', '2009-12-25', '2010-02-19', 1, '2025-08-01 08:17:49', '2025-08-01 08:17:49', 1),
(241, 'May 2023 - Apr 2025', '2023-05-01', '2025-04-30', 2, '2025-08-01 08:35:56', '2025-08-13 00:27:04', 1),
(242, 'Jul 2024 - Jun 2025', '2016-03-25', '2017-04-16', 1, '2025-08-04 23:29:44', '2025-08-04 23:29:44', 1),
(243, 'Jan To Mar 2005', '2000-10-20', '2001-12-11', 1, '2025-08-05 18:00:39', '2025-08-05 18:00:39', 1),
(244, 'Jan To Mar 2008', '2000-12-22', '2008-02-19', 1, '2025-08-06 00:56:35', '2025-08-06 00:56:35', 1),
(245, '1998 - 1999', '2013-02-06', '2014-04-26', 2, '2025-08-10 17:16:23', '2025-08-10 17:16:23', 1),
(246, 'Jan To Dec 2009', '2009-01-01', '2009-12-12', 1, '2025-08-18 23:33:09', '2025-08-18 23:35:06', 1),
(247, '2006 - 2007', '2006-01-01', '2007-12-29', 2, '2025-08-20 03:04:44', '2025-08-20 03:04:44', 1),
(248, 'Jul 2022 To Jun 2025', '2022-01-07', '2025-06-20', 3, '2025-08-20 03:18:21', '2025-08-20 03:18:21', 1),
(249, '2000 - 2001', '2000-01-01', '2001-12-20', 2, '2025-08-23 18:06:13', '2025-08-23 18:06:13', 1),
(250, 'Jan To Mar 2025', '2025-01-01', '2025-03-20', 3, '2025-08-23 22:08:26', '2025-08-23 22:08:26', 1),
(251, 'Jan To Jun 2003', '2003-01-01', '2003-06-20', 6, '2025-08-24 18:04:14', '2025-08-24 18:04:14', 1),
(252, 'Jul 2021 To Jun 2022', '2021-07-01', '2022-06-20', 1, '2025-08-24 20:23:05', '2025-08-24 20:23:05', 1),
(253, '1996 - 1999', '1996-01-01', '1999-12-30', 4, '2025-08-25 23:42:44', '2025-08-25 23:42:44', 1),
(254, 'Jul 2015 To Jun 2018', '2015-07-01', '2018-06-20', 3, '2025-08-27 03:43:29', '2025-08-27 03:43:29', 1),
(255, 'Mar 2024 To Mar 2025', '2024-03-01', '2025-02-27', 1, '2025-08-28 15:25:41', '2025-08-28 15:25:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT 'default.jpg',
  `type` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `photo`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Rjsc', 'public/upload/slider/9qla9B26mpap51r065nQNXfRGmIYEfdeJnJ82pH6.png', '3', '2025-08-28 05:41:52', '2025-08-28 05:41:52'),
(2, NULL, 'public/upload/slider/tvglhAd9Wg4b4AplhsdQTuEsokaIVaXgM5WVScQu.png', '3', '2025-08-28 05:42:03', '2025-08-28 05:42:03'),
(3, NULL, 'public/upload/slider/EdTjQvDw1XAo0nKY1loXDrCkuhHFgI3UFUu6hib6.png', '3', '2025-08-28 05:42:18', '2025-08-28 05:42:18'),
(4, NULL, 'public/upload/slider/GfIKOarAupCa9B62aX2mGJmYdRDi0xcSkiBaf7hy.png', '3', '2025-08-28 05:42:47', '2025-08-28 05:42:47'),
(5, NULL, 'public/upload/slider/EXaewMvJXyH0hrVBB0XgqYuVZJVNP2xk6jnc1PoV.png', '3', '2025-08-28 05:42:55', '2025-08-28 05:42:55'),
(6, NULL, 'public/upload/slider/55yPnU9fLTgZravHlHGeJsmfJUcMsE7lSDaVnLhR.png', '3', '2025-08-28 05:43:02', '2025-08-28 05:43:02'),
(7, NULL, 'public/upload/slider/dUOkB9VQur3WWD4Q7hPs7PissWLmIBhvDGhHfz0F.png', '3', '2025-08-28 05:43:08', '2025-08-28 05:43:08'),
(8, NULL, 'public/upload/slider/mDbieI1RjT9bkgswd2JM7Q1WuLas67rhAEzUZSbr.png', '3', '2025-08-28 05:43:16', '2025-08-28 05:43:16'),
(9, NULL, 'public/upload/slider/sJO7N1puJrGQ15Y6vmCZsQEBDnkaEVXGjy0qTHLj.png', '3', '2025-08-28 05:43:21', '2025-08-28 05:43:21'),
(10, NULL, 'public/upload/slider/j0baBfP6UOq7dU41NC59np7iBWBLrMw05Y1x0wT0.png', '3', '2025-08-28 05:43:26', '2025-08-28 05:43:26'),
(11, NULL, 'public/upload/slider/8Mkgd35EgQzn6yhx6xvzWSgT5elZFCoVYRI1Tgg3.png', '3', '2025-08-28 05:43:35', '2025-08-28 05:43:35'),
(12, NULL, 'public/upload/slider/fKyEmPMRm0PBoPGIpLdB6PkcXM0BmbsbVFhUqF5c.png', '3', '2025-08-28 05:43:40', '2025-08-28 05:43:40'),
(13, NULL, 'public/upload/slider/xyB5qc6BOSPxtDsIUVczfrAnjjlARcM2vQ1jYxNV.png', '3', '2025-08-28 05:43:47', '2025-08-28 05:43:47'),
(14, NULL, 'public/upload/slider/GTgXCNuYdxGYnPAXOpI1QeeoFSum69ICAQkBz8t6.png', '3', '2025-08-28 05:43:52', '2025-08-28 05:43:52'),
(15, NULL, 'public/upload/slider/SqUHUCatiPVCoF1krHbCo21QuVP7J3uu4Ceor5pN.jpg', '0', '2025-08-28 05:47:04', '2025-08-28 05:47:04'),
(16, NULL, 'public/upload/slider/muSCYh1V4jipVkfcrLKVwpzDUFZ3fFniW2B29vhj.jpg', '0', '2025-08-28 05:47:11', '2025-08-28 05:47:11'),
(17, NULL, 'public/upload/slider/KoiLbggGB47LxTTDBSaFSsC4sPjhFx6krfu7By2g.jpg', '0', '2025-08-28 05:47:17', '2025-08-28 05:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `center_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `fathers_name` varchar(255) NOT NULL,
  `mothers_name` varchar(255) NOT NULL,
  `roll` varchar(255) DEFAULT NULL,
  `registration` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `exam_date` date DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED NOT NULL,
  `blood_group` tinyint(3) UNSIGNED DEFAULT NULL,
  `religion` tinyint(3) UNSIGNED NOT NULL,
  `present_address` varchar(255) NOT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '$2y$10$F9f/uGOarW9190BDZsgXXecIA0T50AmL.JQAULlnpySFMvbsxjVSK',
  `email` varchar(255) DEFAULT NULL,
  `course_duration` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `nid_or_birth` varchar(255) DEFAULT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `due_amount` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `remember_token` varchar(100) DEFAULT NULL,
  `result_publised` timestamp NULL DEFAULT NULL,
  `course_type` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `center_id`, `name`, `fathers_name`, `mothers_name`, `roll`, `registration`, `date_of_birth`, `exam_date`, `gender`, `blood_group`, `religion`, `present_address`, `permanent_address`, `phone`, `password`, `email`, `course_duration`, `qualification`, `guardian_name`, `nid_or_birth`, `session_id`, `subject_id`, `picture`, `passport`, `status`, `created_at`, `updated_at`, `due_amount`, `paid_amount`, `remember_token`, `result_publised`, `course_type`) VALUES
(1, 1, 'Md. Nurunnobi', 'Md. Shirajul Islam', 'Mst: Rahima Begum', '000078', '09340000', '05/01/1986', '2024-12-22', 0, NULL, 0, 'Sirajganj', 'Raiganj', '01700000000', '$2y$10$F9f/uGOarW9190BDZsgXXecIA0T50AmL.JQAULlnpySFMvbsxjVSK', NULL, 'One Year', 'Ssc', NULL, NULL, 1, 2, 'public/images/students/YIjebQEAE52NKw8IhzzDAbV88CJpDtwfVFWBBvJg.jpg', NULL, 2, '2025-08-30 11:51:55', '2025-08-30 11:53:18', 0.00, 0.00, NULL, '2025-02-19 05:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `education_qualification` varchar(255) DEFAULT NULL,
  `course_details` longtext DEFAULT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `photo`, `created_at`, `updated_at`, `duration`, `rate`, `education_qualification`, `course_details`, `type`) VALUES
(1, 'Computer Operator', 'public/upload/subject/iX7QLTzxc0vgUB1lRCZpmK771CjoOmJICjWHopt9.png', '2024-12-02 07:16:38', '2025-01-15 08:18:48', '3-month, 6-month, 1-year, 2-year', '3500-15500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(2, 'Computer Office Application', 'public/upload/subject/KdgGKbcUnYPQlXhE4xUQPAyB7SHjm3hTZYkG2uVM.jpg', '2024-12-24 21:41:55', '2024-12-24 21:41:55', '3-month, 6-month, 1-year, 2-year', '4500-15500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(3, 'Diploma in Construction Site Supervision', 'public/upload/subject/NX6bciirYLls2r55T76XEx4H2Wrv4Ob9xasvxfq6.png', '2024-12-24 21:46:25', '2024-12-24 21:46:25', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(4, 'Hotel Management & Chef', 'public/upload/subject/WgD3PqzWv4Tt5xbWZLZbC9u3FT0vwBqaq5lcyxAb.png', '2024-12-24 21:50:44', '2024-12-24 21:50:44', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(5, 'Food and Beverage Production', 'public/upload/subject/NWwVby7BUxNDQ1aJQupBUNvjVU31oGNhOVJafeSF.png', '2024-12-24 21:55:06', '2025-08-02 01:24:42', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(6, 'Diploma in Mig & Arc Welding', 'public/upload/subject/ShmtbZRiwPwIVwm9aET5ckphd0tVgnE4J4mw7sWA.jpg', '2024-12-24 21:58:09', '2024-12-24 21:58:09', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(7, 'Diploma in Electrician', 'public/upload/subject/jylyKvHQbpneFDo8HhdSpYIuI7QtkVDpfCR0FnEg.png', '2024-12-24 22:04:22', '2024-12-24 22:04:22', '3-month, 6-month, 1-year, 2-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(8, 'Diploma in Plaster', 'public/upload/subject/bs1e6225lguIY3ltmw1gGw9ACTQbeJThvd0MPzE3.png', '2024-12-24 22:10:21', '2024-12-24 22:10:21', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(9, 'Diploma In Store keeper', 'public/upload/subject/YMbZoIG8R012yLj3oU2yRLHjB9NhW4nvFjvC1E7q.png', '2024-12-24 22:12:07', '2024-12-24 22:12:07', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(10, 'Diploma In Tiles Mason', 'public/upload/subject/VI1jvcEIdZ4H8UyPkbIklBrVWQ5H2jbr8XyPYhCf.png', '2024-12-24 22:16:05', '2024-12-24 22:29:25', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(11, 'Diploma In Carpenter & Furniture Design', 'public/upload/subject/QPy0SJpvUpJbt5h1ePNiLaxw95gBsCk7lXYQTxHv.png', '2024-12-24 22:18:30', '2024-12-24 22:18:30', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(12, 'Graphic Design', 'public/upload/subject/ym4TjUAcqks9ejauREM4oOZjkZF2du6vk99qUZay.png', '2024-12-24 22:20:20', '2024-12-24 22:20:20', '3-month, 6-month, 1-year, 2-year', '25000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(13, 'Diploma in Textile Engineering', 'public/upload/subject/ebhxVGEJIcOy5E7Z799NFyQH6wCW6rNw6d44HWdc.png', '2024-12-24 22:22:25', '2024-12-24 22:22:25', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(14, 'Diploma in Mig Welder', 'public/upload/subject/HdAhNcu30SXqsmPH3I7HMmVn8wEvgCYH9wMkvGLo.png', '2024-12-24 22:26:59', '2024-12-24 22:26:59', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(15, 'Cyber Security', 'public/upload/subject/CMWa0UwYlfV7ErDu4iYLaGYeaXgVn3SguVc8v5l7.jpg', '2024-12-24 22:31:02', '2024-12-24 22:31:02', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(16, 'Diploma in Steel Fixture', 'public/upload/subject/aM2S6mnStdckcYCaDfwh2gdoo1fttNoKWaHLfFMV.jpg', '2024-12-24 22:33:46', '2024-12-24 22:33:46', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(17, 'Bricklayer', 'public/upload/subject/ZmxsqlAWYsoNL2OZf5bs53eSXqBPOeI3XvTPw6Wm.png', '2024-12-24 22:36:03', '2025-03-02 05:23:33', '3-Month, 6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(18, 'Professional Content Writing', 'public/upload/subject/0sA8sAjIj9IF1Xjp9QkzvN6gJ3pgx5nc9ghvCN8s.webp', '2024-12-24 22:38:39', '2024-12-24 22:38:39', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(19, 'Diploma in Mason', 'public/upload/subject/cNC6DW6l8xYpq45NH6ITWSGZN5Y52pHRBPkSkFOF.jpg', '2024-12-24 22:40:54', '2024-12-24 22:40:54', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(20, 'Higher Diploma in Graphic Design & Freelancing', 'public/upload/subject/WMBiaQ2WEGSxXzjkOd7pGQyp3IOkQNEUKShWHeE0.jpg', '2024-12-24 22:43:58', '2024-12-24 22:43:58', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(21, 'Diploma in Construction', 'public/upload/subject/RvMMgljCZowE8fO6Spd8WQUNy45BlPiwCpZEKyyw.jpg', '2024-12-24 22:45:58', '2024-12-24 22:45:58', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(22, 'Plumbing & Pipe Fitting', 'public/upload/subject/H1JmUpzizx0a3gWOoT5SJU7KzFCvPDjKBIlj2O1b.png', '2024-12-24 22:47:58', '2024-12-24 22:47:58', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(23, 'Shorthand', 'public/upload/subject/fw5AO1CApiW6JwA7RJ9MbHPTw6BaoLhg27EVITvV.jpg', '2024-12-24 22:49:44', '2024-12-24 22:49:44', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(24, 'Motor Driving', 'public/upload/subject/WGMszCI0BudUVt9JeRKs5wPzmOyLTCdHbwqrKqOZ.jpg', '2024-12-24 22:52:12', '2024-12-24 22:52:12', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(25, 'Diploma in Electronics', 'public/upload/subject/bJpYj95dHIelbf983QAaySbkNK2M61o1LtWgMmVP.jpg', '2024-12-24 22:54:03', '2024-12-24 22:54:03', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(26, 'Diploma in Draftsmen', 'public/upload/subject/VdlwYe0ZwldsYyvOX7VYvaLhMkkViCovP0RZWQXk.jpg', '2024-12-24 22:56:39', '2024-12-24 22:56:39', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(27, 'Diploma in 3G Welder', 'public/upload/subject/BPgk2JnVJz0VveN0mXuEu3tc0Xho8jhc6Xv16Qkt.jpg', '2024-12-24 22:59:16', '2024-12-24 22:59:16', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(28, 'Diploma in Welder', 'public/upload/subject/EGycJHBddxaf1sdXFWDadD6ixNxA1eiYZFvJ2q51.png', '2024-12-24 23:02:46', '2024-12-24 23:02:46', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(29, 'Diploma In Driver Cum Auto Mechanics', 'public/upload/subject/DQixUR87MVF0sTzZaaFnpa9E4K4PxRUVnCcFzQpL.jpg', '2024-12-24 23:05:47', '2025-05-04 00:31:12', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(30, 'Diploma in Technician', 'public/upload/subject/R4ts7NKMlfMu5JhrL62wdoplSKERZkU1eMJaqHlb.jpg', '2024-12-24 23:07:47', '2024-12-24 23:07:47', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(31, 'Diploma in Machinist', 'public/upload/subject/KgN8Zko6Vd2hesrQ978jxEX5IJ5T7jZdtweurwVT.webp', '2024-12-24 23:09:33', '2024-12-24 23:09:33', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(33, 'Civil Construction', 'public/upload/subject/yG7zIiQxobIOfVuLdwucm4LW9RgFgtvrT3Wgxosv.jpg', '2024-12-24 23:14:39', '2025-07-03 16:18:44', '3-Month, 6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(34, 'Training On Practical Agriculture and Information Tech', 'public/upload/subject/TrHlqfnrAfxXCteBnbqeBtjvcEvUTDq2uo28Q9JQ.png', '2024-12-24 23:17:01', '2024-12-24 23:17:01', '3-month, 6-month, 1-year, 2-year', '25000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(35, 'Higher Diploma in Content Writing', 'public/upload/subject/OrFkgLxTz9eZDbPTOtWZMa8Bb11tnSXm62bFXWru.jpg', '2024-12-24 23:18:16', '2024-12-24 23:18:16', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(36, 'Diploma in Painting', 'public/upload/subject/NIJ3EQqmx5JaBd8kfNcdPhrs0EvrqX2VFsV4P8x0.jpg', '2024-12-24 23:20:01', '2024-12-24 23:20:01', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(37, 'Higher Diploma in Digital Marketing', 'public/upload/subject/tUvxwI1SbzWndJ6vIbjK9cbzOnprNwd2qsVjsyU5.webp', '2024-12-24 23:21:36', '2024-12-24 23:21:36', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(38, 'Diploma in Grinding', 'public/upload/subject/X0xXv3SRMJoFHNfi9B2JdNjZpPLTcu8tVKjcx5Y8.jpg', '2024-12-24 23:23:14', '2024-12-24 23:23:14', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(39, 'Diploma In Land Surveyor', 'public/upload/subject/USPKjtWCRIY81lYjlDG8lOXSG31Ue72bhVCwyOyO.jpg', '2024-12-25 07:02:43', '2025-08-10 16:31:08', '3-Month, 6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(40, 'Advance Python with Freelancing', 'public/upload/subject/afWunGPmYCzTkAL9PL5DCIEgeqYniqAGVpzkO14c.jpg', '2024-12-25 07:04:46', '2024-12-25 07:04:46', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(41, 'Networking Security', 'public/upload/subject/jgKysqyf2hQBvnzu7XiiIfheClvzOpvo0MvrUMWc.jpg', '2024-12-25 07:06:38', '2024-12-25 07:06:38', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(42, 'Cyber Security & Ethical Hacking', 'public/upload/subject/Vz9dHxp3Ii89a0zvSPCFfAlwU0TreHIjCssP1NY8.png', '2024-12-25 07:08:01', '2024-12-25 07:08:01', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(43, 'Higher Diploma in Cyber Security & Ethical Hacking', 'public/upload/subject/btxR5E4PVveNi7ydC5UN0vImPnxgDS5NQzOYmsqA.webp', '2024-12-25 07:09:13', '2024-12-25 07:09:13', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(44, 'Diploma in Mechanical Engineering', 'public/upload/subject/k9q7Uxa9bOh2fyndOu3jY1GSPLzCmeSDcZnvXIGp.jpg', '2024-12-25 07:11:48', '2024-12-25 07:11:48', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(46, 'Advanced Certificate in Fine Arts', 'public/upload/subject/IUvxwqIt8dAfMhcY1z4Ovo0CnG929sUqtMz7GaWR.jpg', '2024-12-25 07:15:34', '2024-12-25 07:15:34', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(47, 'Hardware & Networking', 'public/upload/subject/5e0Qd7JSpZe7NvVLEZ2SjpToL3aO8pbf8Yyy8Gnz.png', '2024-12-25 07:17:45', '2024-12-25 07:17:45', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(48, 'Diploma In Refrigeration and Air Conditioning', 'public/upload/subject/zBsfrAKz1DyPkaI9sABG9eEhn3uBuiEq8QhnBb6T.jpg', '2024-12-25 07:19:25', '2024-12-25 07:19:25', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(49, 'Higher Diploma in Database Programming', 'public/upload/subject/USo5vMqQKOltDd0UIrNxAPXTvzDdRo2B2CDTacP4.png', '2024-12-25 07:22:39', '2024-12-25 07:22:39', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(50, 'Digital Marketing', 'public/upload/subject/x3XoWWvgBJqhRrlcQdaY7PWmIeVsxCcFda596nXu.png', '2024-12-25 07:25:56', '2024-12-25 07:25:56', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(51, 'Diploma in Welding', 'public/upload/subject/Xifuaa0Y6Hqqe1ZOINqo70DPaJ65fHImKLOEDQTv.png', '2024-12-25 07:27:58', '2024-12-25 07:27:58', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(52, 'Spoken English', 'public/upload/subject/woT4fPAOxiUzIvkFLp6o2AOI6eKXnZOIYq54oA7R.jpg', '2024-12-25 07:30:35', '2024-12-25 07:30:35', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(53, 'Sewing Operator', 'public/upload/subject/3pwlaKx8UC51w40dicCEcpRQkGwzzqhwqCWuFttb.jpg', '2024-12-25 19:02:07', '2025-02-23 23:59:19', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(54, 'Mobile Apps Development', 'public/upload/subject/BBtRNWvIM2FtKVOUhd3z1xbr1lyWUCDOztH18lQM.png', '2024-12-25 19:03:48', '2024-12-25 19:03:48', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(55, 'Professional Video Editing', 'public/upload/subject/Vc2brzq8VC7kGNa0wK8lx7Wrn37l4bHjKxuNNgDr.webp', '2024-12-25 19:05:27', '2024-12-25 19:05:27', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(56, 'Professional Web Design & Development', 'public/upload/subject/xUXV6hNwZCsmMcX0LQlar26UImYCnbAvNX1KULE0.jpg', '2024-12-25 19:07:15', '2024-12-25 19:07:15', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(57, '3D Studio Max', 'public/upload/subject/CBp0pYI8sDc5r0ZqWJJGahldXY8iQDuwbLMug2cv.jpg', '2024-12-25 19:08:48', '2024-12-25 19:08:48', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(58, 'Civil Auto Cad', 'public/upload/subject/VGdlZnJFT7NLPQacSwBL8OOu4fkHLzwMOQWilGIP.jpg', '2024-12-25 19:10:11', '2024-12-25 19:10:11', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(59, 'Advance Excel', 'public/upload/subject/vTLyHFoj0EW9pdULzeBV27phQ9FobkoqDT8zcCvL.jpg', '2024-12-25 19:12:35', '2024-12-25 19:12:35', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(60, 'Higher In Computer Office Application', 'public/upload/subject/fxgJjvjkJwGaNzgm4DDYt1D37NtilrGbMjd2Tv9U.webp', '2024-12-25 19:39:25', '2025-05-24 19:02:12', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(61, 'Diploma in Hotel Management & Chef', 'public/upload/subject/mQu23UhVKttHxsd6E8rSDWu3VhmgRrjHpDJwIpGU.webp', '2024-12-25 19:42:45', '2024-12-25 19:42:45', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(62, 'Diploma in Dressmaking and Tailoring', 'public/upload/subject/Xl6IOi90VOjjvyXsGEayu4wiPFiFJuOUKmoX03tQ.webp', '2024-12-25 19:44:51', '2024-12-25 19:44:51', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(63, 'Diploma in Electrical & Welding', 'public/upload/subject/Qtf7cnLDLx0TxQRhPmGw22ocAF2zqINHLNxsyzz9.jpg', '2024-12-25 19:47:22', '2024-12-25 19:47:22', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(64, 'Diploma in Sprayer Mechanic', 'public/upload/subject/rxxav8rU39PlzaMMVbH2H9BRowG1XUGD29DSrxgM.webp', '2024-12-25 19:50:42', '2024-12-25 19:50:42', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(65, 'Diploma in Mobile Servicing (Hardware & Software)', 'public/upload/subject/vxecMPZ8zjfcEA15BwiKmoBdJaHtusxyDNc2skmH.jpg', '2024-12-25 19:52:45', '2024-12-25 19:52:45', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(66, 'Diploma in Digital Photography & Mobile Technology', 'public/upload/subject/kjSX2k4FSjty35oqeB9Yw3GYUjI8ZevA2YTQMqou.jpg', '2024-12-25 19:54:37', '2024-12-25 19:54:37', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(67, 'Driving Cum Auto Mechanics Draftsmen', 'public/upload/subject/TxserMaujugQhAi7Ih9ezV1BgVdU2ed9C5CqeyUq.jpg', '2024-12-25 19:58:39', '2024-12-25 19:58:39', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(68, 'Diploma in Electrical Engineering', 'public/upload/subject/FNStz7Uidmd9OyqF2Gz5z2pXkOtNBG8qK9al6pwI.jpg', '2024-12-25 20:03:46', '2024-12-25 20:03:46', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(69, 'Diploma in Surveyor', 'public/upload/subject/7Ln6n0QLQisrqPXdovgf2Orjl6svzH1IUqpmUh8h.jpg', '2024-12-25 20:06:15', '2024-12-25 20:06:46', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(70, 'Communication System Artificial Engineering', 'public/upload/subject/vXeUSG4PPocYCxZW9UbbBPTmh48bDhkGuc6w68ZF.jpg', '2024-12-25 20:08:23', '2024-12-25 20:08:23', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(71, 'Diploma in Spoken English', 'public/upload/subject/euozSkmrFB2Fsvdxa0ZWxqM3Q4HKCoruD1C2R9hP.webp', '2024-12-25 20:10:59', '2024-12-25 20:10:59', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(72, 'Web Design & Development', 'public/upload/subject/A31wkA24ilehlI0caqFb2nlanzT435CQC18lRhSm.jpg', '2024-12-25 20:16:07', '2024-12-25 20:16:07', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(73, 'Hardware & Software Troubleshooting', 'public/upload/subject/lx1tny6sSVAXlkMyEfp45nRfJsUc1YelZXCjjQvR.jpg', '2024-12-25 20:17:57', '2024-12-25 21:03:32', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(74, 'Diploma in Multilingual Secretarial Science (Shorthand)', 'public/upload/subject/RpOTCFHswTObn7WfoiW0ZgGnk8M24N0mljclAgQq.jpg', '2024-12-25 20:30:59', '2024-12-25 20:30:59', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(75, 'Diploma in Graphic Design', 'public/upload/subject/r4gflWBHiYw9TnbOw2bIXrpuncYi512erFmWoIKE.png', '2024-12-25 20:34:25', '2024-12-25 20:34:25', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(76, 'Diploma In Computer Science and Ict', 'public/upload/subject/FGwlScn0GdamIJ75RhYKiVEbAhowjEAANW8UDu2x.jpg', '2024-12-25 20:36:07', '2024-12-25 20:36:07', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(77, 'Database Programming', 'public/upload/subject/tSthUBUMHFQ6OWkxVLFAL2ZT00aoNiHyBrGa9UHR.jpg', '2024-12-25 20:37:14', '2024-12-25 20:37:14', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(78, 'Diploma in Software Application', 'public/upload/subject/jlCyalVOFzFDFPbHDerCuzYalS9B0RQt0a5N9b3E.jpg', '2024-12-25 20:39:13', '2024-12-25 20:39:13', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(79, 'Diploma In Shuttering Carpenter', 'public/upload/subject/rlfcMl292r5h91kdh9LG7um89NHsyfeakMSUeqOs.jpg', '2024-12-25 20:41:50', '2024-12-25 20:41:50', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(80, 'Structural Fitter Construction', 'public/upload/subject/mRmrQ9SOTzL2efvyzUO6Xf4ExutmSQwZEN6iHXaD.webp', '2024-12-25 20:46:28', '2024-12-25 20:46:28', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(81, 'Tiles And Marble Fitting', 'public/upload/subject/wELqBwkWyxCIb6fn4ug5B6BdwHpFUvwyCuBTaiSb.jpg', '2024-12-25 20:50:05', '2024-12-25 20:50:05', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(82, 'Diploma In Bricklayer', 'public/upload/subject/iZvhoRpDwA1StToSZCaVRgFuSF7iiiJVck46qclJ.jpg', '2024-12-25 20:54:30', '2025-05-04 15:52:34', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(83, 'Diploma in Caregiving', 'public/upload/subject/VSO2juc8tAaYOiBlwnfUzsWACd6VxnIHja3eOwS4.webp', '2024-12-25 20:56:40', '2024-12-25 20:56:40', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(84, 'House Worker', 'public/upload/subject/sBx7NcUZgPwqvlDjuLSBPzsGWhQTqnwtQK0q8ZnJ.jpg', '2024-12-25 20:59:55', '2024-12-25 20:59:55', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(85, 'Plastering in Construction', 'public/upload/subject/5Tgd4JkLCJcxNqsmtjS0gzYAx3owy5lc3LI9oSoH.webp', '2024-12-25 21:01:56', '2024-12-25 21:01:56', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(86, 'Artificial Engineering', 'public/upload/subject/fkNspUzfOCZPpbB9SnqLuWLbj4uytSxh1c7QoIgn.png', '2024-12-25 21:06:09', '2024-12-25 21:06:09', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(87, 'Mechanical', 'public/upload/subject/N28Xwr18EaZxIgUSgNSuhI5xrCjVc3j44HGKDtY9.jpg', '2024-12-25 21:08:28', '2024-12-25 21:08:28', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(88, 'Electronics', 'public/upload/subject/gISbrttpDnBp0XkJuCsXo7N3YT7IXLlhd63e2LM1.webp', '2024-12-25 21:10:36', '2024-12-25 21:10:36', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(89, 'Electrical', 'public/upload/subject/NhKkdPGioEb8hb88WEJYMfEhqld9KvwFDCmpO5By.webp', '2024-12-25 21:11:50', '2024-12-25 21:11:50', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(90, 'Radio, Tv & Mobile Repairing', 'public/upload/subject/7DNSYCQT8rF8XMOlGTMeMLvM0IVMRalm6SPQSv90.webp', '2024-12-25 21:15:59', '2024-12-25 21:15:59', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(91, 'Diploma in Civil Technology', 'public/upload/subject/i8iw515dYwNCDADoXJM611rxpnLcjl5eiDwSc72D.jpg', '2024-12-25 21:18:08', '2024-12-25 21:18:08', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(92, 'Diploma in Civil Engineering', 'public/upload/subject/oqQBhD1kdxvYg3WrNZKwlQ667yRAwRyj8f80lYOL.jpg', '2024-12-25 21:21:24', '2024-12-25 21:21:24', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(93, 'Electrical House Wiring', 'public/upload/subject/GInSwqMnvYbwFiSdXjlXZnVtXP0U5DInhP90iFRk.webp', '2024-12-25 21:23:20', '2025-07-29 21:54:37', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(94, 'Operator (Electronic Control & Communication)', 'public/upload/subject/Zczj7XnXjVVcdg58bpIXjS1mFtUWh9pvHMkvHDBP.webp', '2024-12-25 21:26:28', '2024-12-25 21:26:28', '3-month, 6-month, 1-year, 2-year', '25,000-50,000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(95, 'Diploma In Electrical And Electronic Engineering', 'public/upload/subject/ghs91ESVxUmaTwY3gHcq49W49i2sBwtt1dkDVK8T.jpg', '2024-12-25 21:29:32', '2025-05-09 18:46:28', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(96, 'Computer Technology', 'public/upload/subject/1YC4tiD3oRJ4yfzRzbn9nevNUcZgQyWElp2xwQVN.jpg', '2024-12-25 21:33:15', '2024-12-25 21:33:15', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(97, 'Welding & Fabrication', 'public/upload/subject/sxTFgKoryCdXcIkT5Qo7zqmOjItajxw3YGbhYxNu.webp', '2024-12-25 21:35:37', '2024-12-25 21:35:37', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(98, 'Plumbing & Fittings', 'public/upload/subject/excA6P2mmAKDYB5zFnzym7nA7CK0Cn9PB2N41B6b.jpg', '2024-12-25 21:37:22', '2024-12-25 21:37:22', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(99, 'Diploma In Agriculture', 'public/upload/subject/XuCO3ptGcVr34Jyo1im0PLwaMBDF2DJctDJPlDcq.webp', '2024-12-25 21:46:54', '2024-12-25 21:46:54', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(100, 'Diploma in Welding & Fabrication', 'public/upload/subject/7vCa2g66NxBaoRf6cZsT9xLsVMEk4qodh7i3KixE.jpg', '2024-12-25 21:49:34', '2024-12-25 21:49:34', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(101, 'Shipbuilding and Mechanical Draftsmanship', 'public/upload/subject/PBsIXdJU3ywCRd1VX3sEifg5jZ8R4CwmK4gPHZBY.png', '2024-12-25 21:52:52', '2024-12-25 21:52:52', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(102, 'Shipbuilding Welding', 'public/upload/subject/TlkTl0tPRDHNdBEOJJJK1XtyxtRZX7cyrGNJ2M6Y.jpg', '2024-12-25 21:54:29', '2024-12-25 21:54:29', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(103, 'Ship Painter', 'public/upload/subject/AlzYo5bGwWrdxuV21lFFfYznDXXHEWzC8k4MdzzY.png', '2024-12-25 21:56:45', '2025-07-29 01:09:52', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(104, 'Marine Diesel Engine Artificer', 'public/upload/subject/tr8c4eZeEIiBWtPKiVySLzBPbdwwN2jOltfcUuQ7.png', '2024-12-25 22:01:14', '2024-12-25 22:01:14', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(105, 'Diploma in Merchandising', 'public/upload/subject/d5QWhoMFDlckin5Wx2TH2thQbdcsDBiHwCpuqwaj.jpg', '2024-12-25 22:07:20', '2024-12-25 22:07:20', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(106, 'Diploma in livestock', 'public/upload/subject/98d4lRBvDSJOCjW0n7F5wQx9uCBcKdo6h6Jxwy8X.webp', '2024-12-25 22:10:40', '2024-12-25 22:10:40', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(107, 'Diploma in Automobile Engineering', 'public/upload/subject/z9lZ2gS2PJgefK9knoh4o1KHQW8tYVLMLjTOvlRe.jpg', '2024-12-25 22:12:37', '2024-12-25 22:12:37', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(108, 'Diploma in Chef', 'public/upload/subject/ksZy0YewcfC6GyHDptv510VPFJ1dED9viIQ92lj5.jpg', '2024-12-25 22:15:31', '2024-12-25 22:15:31', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(109, 'Diploma in Computer Graphics Design', 'public/upload/subject/k8xAqY9ao15z8duhn4lytw5RyLCSL9WwdtH2ztAh.jpg', '2024-12-25 22:16:55', '2024-12-25 22:16:55', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(110, 'Spoken in German Language', 'public/upload/subject/oykrpKwoxP5Ld8iep81NG4zOlIh9a5AEjLRZ0zki.jpg', '2024-12-25 22:19:18', '2024-12-25 22:19:18', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(111, 'Machine Shop Practice', 'public/upload/subject/Zfj6BsQqauXd7bkP35mEw7qM3w4By1CjZ5aghzQX.jpg', '2024-12-25 22:23:56', '2024-12-25 22:23:56', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(112, 'Diploma in Mig 3G 4G Welding', 'public/upload/subject/pKzuIwrUA9kwvueDBTrJ14C42Oh3Ya4GUAL12G5k.webp', '2024-12-25 22:26:42', '2024-12-25 22:26:42', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(113, 'Diploma in Ceramic Technology', 'public/upload/subject/VuuMiv5rdrhkuRKUkQDOo3h0LwIm3lveDOTFRA0a.jpg', '2024-12-25 22:29:18', '2024-12-25 22:29:18', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(114, 'Diploma In Management And Leadership', 'public/upload/subject/txlTFmbhrKlBxe5VsnFZMCe9WkSyEG5d2YWpoTFr.jpg', '2024-12-25 22:30:38', '2024-12-25 22:30:38', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(115, 'Diploma In Marketing And Sales', 'public/upload/subject/oAU9ZP1Pl5yfeAq7LL8tcwmzkmzHmbzeOu4etk1W.webp', '2024-12-25 22:33:21', '2024-12-25 22:33:21', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(116, 'Construction Site Supervision', 'public/upload/subject/y5ZrXxINQemo6iKtDquLCOE7lQVr9OscDq6a5gwK.webp', '2024-12-25 22:42:07', '2024-12-25 22:42:07', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(117, 'Diploma in Chef & Restaurant Management', 'public/upload/subject/6atlu2hVH0TnABIKSKuGFu7euBJDVTKmNkYXuySy.jpg', '2024-12-25 22:45:15', '2024-12-25 22:45:15', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(118, 'Electrical Autocad', 'public/upload/subject/dUieTwg8cN8kIvIiZWN5nnwo0k8sKtqL9pmsy2Vn.webp', '2024-12-25 22:47:08', '2024-12-25 22:47:08', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(119, 'Diploma In Management', 'public/upload/subject/8ZZccNZabGZhZxdmXxSXiiYGFkfmrRmNnKl6SeB1.webp', '2024-12-25 22:49:01', '2024-12-25 22:49:01', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(120, 'Diploma in Computer Engineering', 'public/upload/subject/FaB0OUQB4qVHJCQ8Q984eVXT3J9QAk6ZpfyjZrbh.jpg', '2024-12-25 22:54:16', '2024-12-25 22:54:16', '6-month, 1-year, 2-year, 3-year, 4-year', '25000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(121, 'Diploma in Warehouse', 'public/upload/subject/AD3tM3ZdXvdweoQsLdLao6jNUzZoBRqkfjevE9bE.webp', '2024-12-25 22:58:34', '2024-12-25 22:58:34', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(122, 'Fire Science Occupational Safety', 'public/upload/subject/NPBbburFjZN0RusY5A5xALwqYrX35ciTOrUNRFrD.jpg', '2024-12-25 23:03:34', '2024-12-26 01:25:32', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(124, 'Diploma in Accounting And Finance', 'public/upload/subject/ImHKudjcW9VPg8OXFuaMS0LFYq2QNVQN9b5X9CXV.jpg', '2024-12-26 01:31:41', '2024-12-26 01:31:41', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(125, 'Construction Materials Technician', 'public/upload/subject/cMAG4FrV8KpCVSSdPqW0xjngIvq6BGqUPgsFj5dP.jpg', '2024-12-26 01:34:50', '2024-12-26 01:34:50', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(126, 'Diploma In Supply Chain Management (SCM)', 'public/upload/subject/eJXaCjPiKSta4hHIiwx238usKlUdXQKWMJMOGXft.webp', '2024-12-26 01:47:22', '2025-07-17 19:23:07', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(127, 'Diploma In Draftsmanship', 'public/upload/subject/1PI0LyTOYGqMFkejJw0gyZGOJBSomaDPFXus9oAK.jpg', '2024-12-26 01:48:40', '2024-12-26 01:48:40', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(128, 'Diploma in Safety Officer', 'public/upload/subject/1csgpLaBgbMyBTThkDHNEPLS1pqnhCIesqI8vGsQ.jpg', '2024-12-26 01:49:39', '2024-12-26 01:49:39', '3-month, 6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(129, 'Diploma In Cardboard And Plastic', 'public/upload/subject/POIBeDpAsbUYEIN5gulGemmWModF6APTkWyZlbsU.png', '2024-12-26 01:51:53', '2024-12-26 01:51:53', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(130, 'Electronics And Information Technology', 'public/upload/subject/z3s6J3raAVDUvmDjLmXyMhcfHvXQZFrzwRBFkKSu.jpg', '2024-12-26 01:53:27', '2024-12-26 01:53:27', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002.', 0),
(131, 'Diploma in Apparel Merchandising', 'public/upload/subject/7q3pAiB1bVm9vjZWQO8o1y1nBs7YgGTapGv8ec2O.jpg', '2024-12-26 01:54:46', '2024-12-26 01:54:46', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(132, 'Lifting Supervisor', 'public/upload/subject/vOKT38BKirytpq2t1vOsdBbTpkpGXemHzbiqCYWj.jpg', '2024-12-26 01:56:12', '2024-12-26 01:57:23', '3-month, 6-month, 1-year, 2-year', '15000-35000', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(133, 'Diploma In MEP (Mechanical, Electrical, & Plumbing)', 'public/upload/subject/kD76DG6Y03gWZM5282WY0jZKI5hv1KpfSsyyEyCX.jpg', '2024-12-26 01:59:44', '2024-12-26 01:59:44', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(134, 'Maintenance Technician', 'public/upload/subject/eXMxpflFHl5C9rddJMYZPw3F9UhBPfuCgCa3Rxsz.webp', '2024-12-26 02:04:33', '2024-12-26 02:04:33', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(135, 'Diploma In Leather Technology', 'public/upload/subject/7Q1mu8oEfJAZrikf9tEniJFpPMGP7Ud4NbHGSIgI.jpg', '2024-12-26 02:06:34', '2024-12-26 02:06:34', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(136, 'Human Resource Managmant', 'public/upload/subject/8zI1c6paTEdBt5mfzO92jVkGi8jtqsyINnRrh4hw.jpg', '2024-12-26 02:09:14', '2024-12-26 02:09:14', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(137, 'Diploma In Diesel Engine Mechanic', 'public/upload/subject/P8oNQCNK7HKWxcOvR2hHG5DDK6BGT2qeiw7O2TlL.webp', '2024-12-26 02:11:37', '2024-12-26 02:11:37', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(138, 'Computer Lab Operator', 'public/upload/subject/PQXoqlVUdafFCn7fz1rl5lbBhuefWoNezMZe6eTg.webp', '2024-12-26 02:13:10', '2024-12-26 02:13:10', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(139, 'Diploma In Business Management', 'public/upload/subject/QVNhMl5bYjMsNc3YtuCrUsjgvVY3AsEXiVf6OyiY.webp', '2024-12-26 02:15:17', '2024-12-26 02:15:17', '6-month, 1-year, 2-year, 3-year, 4-year', '25,000-50,000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(140, 'Diploma in Health safety officer', 'public/upload/subject/DbSzMtGYbn2Q1rHzburP7FGm3oMKkun97OVU2yVD.jpg', '2024-12-26 02:18:37', '2024-12-26 02:18:37', '6-month, 1-year, 2-year, 3-year, 4-year', '10500-19500', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(141, 'Diploma in Arc 4g 5g Welding', 'public/upload/subject/dkUKdCneJ9x3MQsyz2nVlE5TtV2GJOPq9cuUaSny.jpg', '2024-12-26 02:30:47', '2024-12-26 02:30:47', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(142, 'Diploma in Fiber Optical Technician', 'public/upload/subject/VcsvS6M5mevuT8SxDLeUkeDTtFbXqLB0CCAwILQv.png', '2024-12-26 02:34:05', '2024-12-26 02:34:05', '6-month, 1-year, 2-year, 3-year, 4-year', '10500-19500', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(143, 'Diploma in Hotel Management & Culinary Arts.', 'public/upload/subject/Ip3HCpWoxM1RuPjqrpWiENEHgevTbmGbzAwYjYqq.jpg', '2024-12-26 02:36:05', '2024-12-26 02:36:05', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(144, 'Diploma In Hotel Management & Cleaning', 'public/upload/subject/mPycmEcozB19Na2aH1f6epRytaSyLuQKPEzQqfKZ.jpg', '2024-12-26 02:41:31', '2024-12-26 02:41:31', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(145, 'Diploma In Dairy Farm Management', 'public/upload/subject/b5x3NR66OmzHfU6nltN7e8DUU8ywHSeZUzxAaE0S.png', '2024-12-26 02:51:50', '2024-12-26 02:51:50', '6-month, 1-year, 2-year, 3-year, 4-year', '10500-19500', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(146, 'Diploma in Travel & Tourism Management', 'public/upload/subject/jSz3IDTLRixQ4cwZnZPAsA1zshEb8TgXQPXa2jD3.jpg', '2024-12-26 02:53:53', '2024-12-26 02:53:53', '6-month, 1-year, 2-year, 3-year, 4-year', '15000-35000', 'SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(147, 'Cook Assistant', 'public/upload/subject/4nzPQ7hnXAtwtFZMeveIu6fGhjzEWFrh2XR5oODk.jpg', '2025-01-15 08:18:56', '2025-01-15 08:18:56', '3-month, 6-month, 1-year, 2-year', '10500-19500', 'JSC,SSC,HSC+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(148, 'Building Construction', 'public/upload/subject/81hOg5JLxYkNojIl7gOlQufNfy4cZ2uXw1iqPQzT.jpg', '2025-01-19 22:22:05', '2025-01-23 21:48:51', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(149, 'Diploma In Warehouse Management', 'public/upload/subject/U3KgYwXdUyDzeQPX0VZZ0wLnExL0FPSWLsd5OuvK.webp', '2025-01-20 21:48:56', '2025-01-20 21:48:56', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(150, 'Food Handler', 'public/upload/subject/KNI4ZynkUj7PrfJJ3Anr20XvesbqY6IOoc7OAltf.webp', '2025-01-20 22:35:07', '2025-01-20 22:35:07', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(151, 'Diploma In Hotel And Hospitality Management', 'public/upload/subject/N6ofHdMjbufFi487ddxOob85BMTadiveBCRbSk6u.jpg', '2025-01-25 06:00:33', '2025-01-25 06:00:33', '3-Month, 6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '12500-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(152, 'Construction Worker', 'public/upload/subject/5yIyuZaGraSuKLRAuWmwovLd3grWbNL9Q8Boj5Ys.jpg', '2025-01-26 20:55:23', '2025-01-26 20:55:23', '3-Month, 6-Month, 1-Year, 2-Year', '9500-15400', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(153, 'Manual Worker In Transportation', 'public/upload/subject/W1DpNaSwk10mF86WsjW67ifzvqLs2dNRScnsrP1i.jpg', '2025-01-26 21:20:12', '2025-01-26 21:20:12', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(154, 'Worker In Construction And Maintenance', 'public/upload/subject/j1TEumXh4zY9NDa4Y6LelEV5jWwLSsH5g0KXQ9Wg.jpg', '2025-01-29 20:11:41', '2025-01-29 20:11:41', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(155, 'Food & Beverage Cooking', 'public/upload/subject/CUFRSpDd8YkLQ3v836zu8uH6BaTNmVaKXvuqYWIf.jpg', '2025-01-30 06:25:39', '2025-01-30 06:25:39', '3-Month, 6-Month, 1-Year, 2-Year', '7500-15500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(156, 'Journalist', 'public/upload/subject/V8npc5vu2OpsIHTuHe5bWeXbjpTo5XqI4vIDeX2U.jpg', '2025-01-30 06:54:45', '2025-01-30 06:54:45', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(157, 'Welder', 'public/upload/subject/IK1S86FuO5D5FpsZy5EImfwwImewHAppFN6De36N.jpg', '2025-01-30 14:57:22', '2025-01-30 14:57:22', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(158, 'Diploma In Packer', 'public/upload/subject/Lt7nWft3OfODKtHoxR3iF2dWAuYKe1oYWk6ZpKwN.jpg', '2025-01-31 04:42:35', '2025-01-31 04:42:35', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '8,500-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(159, 'Packaging Management', 'public/upload/subject/CXKW4Qu1APLx1fABQuAtupPkZ8JCy7Mpx9ZpYVNS.jpg', '2025-01-31 04:43:50', '2025-01-31 04:43:50', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(160, 'Product Packaging And Shipments', 'public/upload/subject/vNKLzM9QFg1NZVo9jk7m3ueb5KF1t9lRBxPdeZ4D.jpg', '2025-01-31 04:44:58', '2025-01-31 04:44:58', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(161, 'Food Packaging', 'public/upload/subject/z8yBXGouzs75RF0L7n5NDTuS1B6zLmvTPpHAtC0X.jpg', '2025-01-31 04:45:53', '2025-01-31 04:45:53', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(162, 'Diploma In Packaging', 'public/upload/subject/xmZAJUXMT9kblYNghXMAvAnx0HVKlYyXseeC2zfv.jpg', '2025-01-31 04:47:05', '2025-01-31 04:47:05', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '8,500-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2);
INSERT INTO `subjects` (`id`, `name`, `photo`, `created_at`, `updated_at`, `duration`, `rate`, `education_qualification`, `course_details`, `type`) VALUES
(163, 'Meat Packaging And Processing', 'public/upload/subject/RZtWZWlDglboDxtYv7VVJUdacQb03Jx4gxU1KbX8.jpg', '2025-01-31 04:48:11', '2025-01-31 04:48:11', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(164, 'Diploma In Food Packaging', 'public/upload/subject/qHyoP4tfs47efn4ZydPtVbdleMc1ifiQl5meBuiC.jpg', '2025-01-31 04:49:06', '2025-01-31 04:49:06', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '8,500-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(165, 'Product Packaging & Labeling Compliance', 'public/upload/subject/fPh1ya55mU41uOxXcSbKCIg56Bp48YaUTqJNBuuY.jpg', '2025-01-31 04:50:54', '2025-01-31 04:50:54', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(166, 'Electronics Mechanicals', 'public/upload/subject/oyi0h2lYEds4dRfKrUam5DjEYoRhNY3HEA3FHKLX.jpg', '2025-01-31 21:16:02', '2025-01-31 21:16:02', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(167, 'Diploma In Office And Hotel Management', 'public/upload/subject/fgILPvlHACckUwzSstiHuWIgfEHi631R89AreY1o.jpg', '2025-02-01 05:59:09', '2025-02-01 05:59:09', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(168, 'Diploma In Tourism And Hospitality Management', 'public/upload/subject/mI7rxAis7aUIxnw08Fm4kaaM9wlD0ORPiNGMMScq.avif', '2025-02-01 06:10:38', '2025-08-25 17:27:01', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(169, 'Hotel And Restaurant Worker', 'public/upload/subject/9bYaraF3HAL3A3tAqwAdS2eGONNSrdvClc76f6DU.jpg', '2025-02-01 16:56:50', '2025-02-01 16:56:50', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(170, 'Diploma In 6g And Tig Welder', 'public/upload/subject/WhRdCuCqzm1pKPeNXu3rYYQ9tDmvc1Erkm3yo3nw.avif', '2025-02-01 19:19:23', '2025-02-01 19:19:23', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(171, 'Computer Hardware Technician', 'public/upload/subject/n4c34JSJLwo1YxgPIAZhGVnef2k2foyklBsXMGwj.jpg', '2025-02-01 19:37:52', '2025-02-01 19:37:52', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(172, 'Store Keeper', 'public/upload/subject/3q6SA2WSp4P1GBXhTXpF2LDWjB2ZyMyjRmvIJoZ9.jpg', '2025-02-03 01:44:20', '2025-02-03 01:44:20', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(173, 'Electrician Supervisor', 'public/upload/subject/lzUkkWov75x8gqcJTph9u0OJhEryzAlQ0tKniXOk.jpg', '2025-02-03 03:34:28', '2025-02-03 03:34:28', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(174, 'Warehouse Management', 'public/upload/subject/yMUCcMo9zmhNoSTWFJ7JLhEXhMcVfi25oYdP1ZUY.png', '2025-02-03 18:51:12', '2025-02-03 18:51:12', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(175, 'Diploma In Pharmacist', 'public/upload/subject/LMrXTavD4cWADlBC47kTCJcX60AfCUpemT1Blnvh.jpg', '2025-02-04 06:09:22', '2025-02-04 06:09:22', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '8,500-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(176, 'Pharmacist', 'public/upload/subject/D236YoU9u8vQp3DSadHEIZMB6ri7bl9CPoabe4xO.jpg', '2025-02-04 06:10:05', '2025-02-04 06:10:05', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(177, 'Pharmacist Salesman', 'public/upload/subject/Wf8t6N3FnJxMEUQ3bejw4Q1G33HqNFRIMNDJGgmR.jpg', '2025-02-04 06:10:59', '2025-02-04 06:10:59', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-13500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(178, 'Carpenter', 'public/upload/subject/qOJP7PQzH51HE2EyzM4O2n81k9CjbciJyeCpF2En.jpg', '2025-02-04 15:09:30', '2025-02-04 15:09:30', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(179, 'Electrician', 'public/upload/subject/lmu9yDuCTa5UZABDOxQkAJmOn8ZUWzdHXMtrHF6a.jpg', '2025-02-05 00:24:19', '2025-02-05 00:24:19', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(180, 'C And C++', 'public/upload/subject/C3zoJ89BYxPuPDV7GVdA4nNcXmsn4JQnstqnjxAT.png', '2025-02-05 01:32:04', '2025-02-05 01:32:04', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(181, 'Python', 'public/upload/subject/4gij7dxfeTvuMYjr3j2PIR3LwOZZnVTqJGxt9szN.jpg', '2025-02-05 01:42:47', '2025-02-05 01:42:47', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(182, 'Mechanical Fitter', 'public/upload/subject/9yF2IBtpyHNSNDT2YnjUxl4fu3B7xCr9y3DCXpfS.jpg', '2025-02-05 21:04:15', '2025-02-05 21:04:15', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(183, 'Basic Automobile Engineering', 'public/upload/subject/XUnsEFzp0XUbL5o3cYcavFFpbsGzYlgmxhCKTCxh.jpg', '2025-02-07 22:34:04', '2025-02-07 22:34:04', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(184, 'Mechanical Technician ( Washing Development)', 'public/upload/subject/YQ4rgom7fOLYQ0IVJKnChXtb4eoo63PxXvXSev9S.jpg', '2025-02-08 20:25:56', '2025-02-08 20:25:56', '3-Month, 6-Month, 1-Year, 2-Year', '8,500-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(185, 'Industrial Electricity', 'public/upload/subject/P5wo3MX4kDwNSRDiiCynHy031uUV3e2B8iVJ3vq5.jpg', '2025-02-09 22:07:12', '2025-02-09 22:07:12', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(186, 'Electrical (High Voltage)', 'public/upload/subject/TiCSgcnNq0QNCWR8aCBJByBGaOLJ6nl4MFWfNUm0.jpg', '2025-02-09 22:25:36', '2025-02-09 22:25:36', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(187, 'Waiter', 'public/upload/subject/oTw2UPpfuNOiVFspvH7cSyCVErsqraQFekXhmOP1.jpg', '2025-02-10 17:55:32', '2025-02-10 17:55:32', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(188, 'Food & Beverage Service', 'public/upload/subject/0IZwYoJNwBIZWzzSQkv06qQbLag5tYNpFskmtFP0.webp', '2025-02-10 19:01:03', '2025-02-10 19:01:03', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(189, 'Higher Diploma In Computer Science', 'public/upload/subject/R079MvNwni67AIfzp2Nt9RQothsNBG3Vro8zVgN6.jpg', '2025-02-10 19:17:43', '2025-02-10 19:17:43', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(190, 'Diploma In Welding (1G 2G 3G 4G 5G 6G)', 'public/upload/subject/BtfABoxjEFq1lQbUkpTgMgdJRPGA6ViSYmtuFbre.webp', '2025-02-10 22:00:37', '2025-08-13 17:56:12', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(191, 'Software Development', 'public/upload/subject/EOHNGqYyqxIQFRxEwdw7GdaxgxKGAdEnTAxPDjEN.jpg', '2025-02-12 04:15:55', '2025-02-12 04:15:55', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(192, 'Excel For In Finance And Accounting', 'public/upload/subject/Lv36KX6xeFSf0JQDzF5fqoHChG1a1ijbNRORecMI.jpg', '2025-02-13 19:09:30', '2025-02-13 19:09:30', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(193, 'Bookkipping', 'public/upload/subject/z5KLNYKLbGaK3SCB6Mf6JjXaGWDJJC9y1ULBzaUv.webp', '2025-02-13 20:41:48', '2025-02-13 20:41:48', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(194, 'Arc And Mig Welder', 'public/upload/subject/tMkhPNV9NifF4nX88D1c3IecMxCfOhDObKzv4d7x.webp', '2025-02-14 20:24:12', '2025-02-14 20:24:12', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(195, 'Diploma In Arc And Mig Welder', 'public/upload/subject/7LDsvZFnwDSdqkwiuBAcw4n72Zmf4iUTCrp4xfs3.jpg', '2025-02-15 03:20:22', '2025-02-15 03:20:22', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(196, 'Diploma In Electrical', 'public/upload/subject/2oTgwrzEsUcFvvmmQbpIirJrMgkUsiZKV1CYBnWw.png', '2025-02-15 20:35:15', '2025-02-15 20:35:15', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(197, 'Diploma In Fashion Design & Apparel Merchandising', 'public/upload/subject/ybHCc6XWk2IKjqIEehQ6hJCWeF08OWVimD308wo4.jpg', '2025-02-15 21:35:07', '2025-02-15 21:41:07', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(198, 'Super Shop Management', 'public/upload/subject/k9XwrsotPZXCMvI8oG57BbgyPPAl89tO57L1DmwJ.png', '2025-02-17 02:22:34', '2025-02-17 02:22:34', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(199, 'Auto Mechanical Technician', 'public/upload/subject/viFXLJUdCWPAVglTpuHXKrArjlg8jXwdM2713dhB.webp', '2025-02-18 00:33:21', '2025-02-18 00:33:21', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(200, 'Diploma In Plumber', 'public/upload/subject/PFGGz5nAiQBK3YzK986CbIZI8jur61GFvFrya8bM.jpg', '2025-02-18 05:10:23', '2025-08-22 19:18:16', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15,500 - 35,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(201, 'Diploma In Nursing', 'public/upload/subject/jDx3efsV32Xnz58WG1YEXk1Jtg9d4OTm69Xk43hS.jpg', '2025-02-18 05:54:04', '2025-02-18 05:54:04', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15,500 - 35,000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(202, 'Thai Aluminum And Fabrication', 'public/upload/subject/H7Ve3V1ojCKw61ZUJZqVPHM7MtCQFXoY9iRQ8Kyw.jpg', '2025-02-18 16:55:12', '2025-02-18 16:55:12', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(203, 'Auto Mobile Technology', 'public/upload/subject/7pas55vKGNcmpYIWDDW8XVeOsoUwS7bDqbrF1AGz.jpg', '2025-02-18 21:19:41', '2025-02-18 21:19:41', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(204, 'Diploma In Garments Sample And Pattern', 'public/upload/subject/GrQFLH46Y4QbLSAGjDUmcRLqFaybnfRLhHi26Vqb.jpg', '2025-02-18 23:50:36', '2025-02-18 23:50:36', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(205, 'Mason', 'public/upload/subject/rSskwMCwFmVwt5tsAKhU867wT2LaOUA3xZCqZk4j.webp', '2025-02-19 01:24:46', '2025-02-19 01:24:46', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(206, 'Diploma In Electrical & Electronics', 'public/upload/subject/O5TLRTiCBYxmZlgFZc52QoDVgsUnrwHkbrlzDOVo.jpg', '2025-02-19 02:19:02', '2025-02-19 02:19:02', '3-Month, 6-Month, 1-Year, 2-Year', '22,500-39,500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(207, 'C Sharp Programming', 'public/upload/subject/HDHeZBwxCOUnk2tdSao8tpzKQNCaAX3NuEgG9Tqn.png', '2025-02-19 20:49:40', '2025-02-19 20:49:40', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(208, 'Facial And Hair Cutting', 'public/upload/subject/INcWXTZTgIrs910zWJ4b2fSLsJJe7AyTt5h0Abrp.avif', '2025-02-20 02:40:20', '2025-02-20 02:40:20', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(209, 'Wood Processing', 'public/upload/subject/DclAFxy4UaLXNzoyDQvw9PpFuiQkXKCnW2hZ4C6D.jpg', '2025-02-20 03:08:38', '2025-02-20 03:08:38', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(210, 'Diploma In Facial And Hair Cutting', 'public/upload/subject/3DAjumJdP6kmElczeYQXybDJwheDKzVLaWRjCN2F.jpg', '2025-02-20 03:53:03', '2025-02-20 03:53:03', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(211, '3g 4g Mig Welder', 'public/upload/subject/R4gyIByVhAXplEeYfB1nEMGCBB9ftoIUf8KmzO8x.jpg', '2025-02-20 04:08:23', '2025-02-20 04:08:23', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(212, '6g Tig Welder', 'public/upload/subject/MuuEupmjQtOmWV8xgO5n1M8tQ8n2L3akqA6tr4Bt.jpg', '2025-02-20 04:09:12', '2025-02-24 22:46:18', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(213, 'Professional Cooking (Chef)', 'public/upload/subject/E2CCvovFhqA1wGYLb8qedaNcNshG9aj9UhmYzp5D.jpg', '2025-02-21 16:18:55', '2025-02-21 16:18:55', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(214, 'Car Painting', 'public/upload/subject/OIURpw6g2pRMq8qNnNRKkiwRWecuiiZBVgE3K5Hc.webp', '2025-02-23 03:27:17', '2025-02-23 03:29:25', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(215, 'Load Unload Worker', 'public/upload/subject/MMj0iIvWDybBv4JkMkDfCzbQQOXb1zvGARZKyIIl.jpg', '2025-02-23 23:16:29', '2025-02-23 23:16:29', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(216, 'Smaw, Fcaw And Gtaw Welder', 'public/upload/subject/8cInuBFa9o0CAaoYWLpQCMUZumPXjjx5QXIKlgfj.webp', '2025-02-24 22:38:41', '2025-02-25 17:27:46', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(217, 'Steel Fixer And Shuttering Carpenter', 'public/upload/subject/0JBu7rhf8gaXn1U4cyPSNw1fsdRRSkTdO1XXOxyB.jpg', '2025-02-27 22:02:38', '2025-02-27 22:02:38', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(218, 'Hotel Management', 'public/upload/subject/x92UQK75iTUHSmvczbwfNbIYm3FXM3AzGl8nOosD.jpg', '2025-03-01 00:11:42', '2025-03-01 00:11:42', '3-Month, 6-Month, 1-Year, 2-Year', '15,500 - 35,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(219, 'Assistant Chef', 'public/upload/subject/HuCFRyJVzMVrt6gDP6bNAQYC9Iev9wKdrbrYziXF.jpg', '2025-03-01 00:13:04', '2025-03-01 00:13:04', '3-Month, 6-Month, 1-Year, 2-Year', '15,500 - 35,000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(220, 'Fashion Design', 'public/upload/subject/WRdziIRWpK8Y25yYfDDP8dzTyRWg4oeHRqiHMhL8.webp', '2025-03-01 05:42:11', '2025-03-01 05:42:11', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(221, 'Pattern & Marker Making', 'public/upload/subject/iCeh59X9s5zlLhnPZ01rfihoyKPbqFsbJg5nWB70.jpg', '2025-03-01 05:43:23', '2025-03-01 05:43:23', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(222, 'Gpq & Quality Control Management', 'public/upload/subject/9sxQMAnnuiyQYphec4gicgRh3QczpwOzXXB8sV73.jpg', '2025-03-01 05:45:24', '2025-03-01 05:45:24', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(223, 'Mobile Servicing And Repairing Technology', 'public/upload/subject/tZUVIwTdRYru2le9WfYIIQ0aDcE0XSHi9tA4dpv1.jpg', '2025-03-01 22:40:29', '2025-03-01 22:40:29', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(224, 'Butcher', 'public/upload/subject/yv1T5FoXRobiZTiWlzuDKMp9U8AatdZtXUUmkVSh.jpg', '2025-03-02 07:47:37', '2025-03-02 07:47:37', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(225, 'Diploma In Hospitality Management', 'public/upload/subject/hkzfJ4ekpmKoxDQ7Zn3i2aOMi4K9JIcOBj3m22fb.jpg', '2025-03-02 20:08:25', '2025-03-02 20:08:25', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(226, 'Electrical Installation & Maintenance', 'public/upload/subject/1ZVBXWrHirupbz5cKmXGfGcpctBQLLygeXUGnRkq.jpg', '2025-03-02 22:38:02', '2025-03-02 22:38:02', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(227, 'Computer Hardware & Hard Disk Repairing Technician', 'public/upload/subject/TawD97zzTWAL2aE2i2M7WN9d2ujTHFKa2Dn0D0b1.jpg', '2025-03-05 15:50:00', '2025-03-05 15:54:24', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(228, 'Computer Hardware & Software Troubleshooting', 'public/upload/subject/eo58ClYbFHgl5PY8YlIZDJywXX2k8L83fbNQgX53.jpg', '2025-03-05 23:27:53', '2025-03-05 23:47:22', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(229, 'Diploma In Advance Python With Freelancing', 'public/upload/subject/sexz7bsCdoVynJycvfBeeTTtM3ym7d2tyWg0N0A0.jpg', '2025-03-06 21:08:31', '2025-03-06 21:08:31', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(230, 'Dressmaking & Tailoring', 'public/upload/subject/AE5Xm1d9d3MG7IqSBieZoVZBBNah3l4iItJjLAmq.webp', '2025-03-07 10:00:00', '2025-03-07 10:00:00', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(231, 'Diploma In Baking And Pastry', 'public/upload/subject/YYbukGhSPqNKCqOlk1CuWc7ZBe6G6vZtNq5BXE4H.jpg', '2025-03-07 20:53:51', '2025-03-07 20:53:51', '3-Month, 6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(232, 'Diploma In Culinary Arts & Management', 'public/upload/subject/JCzVjuPXTiMqLuUncoiBEMEBVplXnA5JbR0nU74p.jpg', '2025-03-08 05:57:35', '2025-03-08 05:57:35', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(233, 'Auto Electrician', 'public/upload/subject/tHgcTwQC8MlN8zrWtwNafoCk3xIcNdMjp8tKrAbr.jpg', '2025-03-08 15:49:10', '2025-03-08 15:49:10', '3-Month, 6-Month, 1-Year, 2-Year', '15,500 - 35,000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(234, 'Electrical Technology', 'public/upload/subject/DHBp5J3cjxroHlQhvHsNSbN1OIwUVpzFWukZ3sVR.jpg', '2025-03-08 17:17:45', '2025-03-08 17:17:45', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(235, 'Mechanical Technician', 'public/upload/subject/KJPLZwnW7wZwq8TAGx1j8mKEPtOBNeehcVmzpRtL.jpg', '2025-03-08 19:21:43', '2025-03-08 19:27:44', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(236, 'Diploma In Health And Social Care Management', 'public/upload/subject/lNghj31VWgykvGY0MqmNimI2P3i2Noe5MAg6WgJx.jpg', '2025-03-08 20:56:39', '2025-03-08 20:56:39', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(237, 'Diploma In Electrical Technology', 'public/upload/subject/gV13Q059qxDNPdv2XLPVhiLfdKqM9Na4yR97ovGP.jpg', '2025-03-09 01:23:46', '2025-03-09 01:23:46', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15,500 - 35,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(238, 'Restaurant Waiter', 'public/upload/subject/YMGmrMEpvCGkH1n9jrMT7qxdhts6L6wKZBY1Mce5.avif', '2025-03-09 05:47:23', '2025-03-09 05:47:23', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(239, 'Certificate In Operator Communication Unit', 'public/upload/subject/Qwhu9dnMtzEMu7dzgrdrs08ToJTIAoJoYvcwqtnU.avif', '2025-03-10 18:10:58', '2025-05-24 17:56:10', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(240, 'Air Conditioning Technician', 'public/upload/subject/L7zJO4T58nkmwszugIcfgDqDrk0WVE5OnQX9ulJZ.jpg', '2025-03-11 08:54:16', '2025-03-11 08:54:16', '3-Month, 6-Month, 1-Year, 2-Year', '15,500 - 35,000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(241, 'Refrigeration And Air Conditioning', 'public/upload/subject/mBaNmo67QK7BJvt4Yg1CBKixfTh6YCIfsVjoFPvk.jpg', '2025-03-11 08:55:33', '2025-03-11 08:55:33', '3-Month, 6-Month, 1-Year, 2-Year', '15,500 - 35,000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(242, 'Automotive Painting', 'public/upload/subject/f9RiOjdHHVNfneD3eTGubyPuWv2v1fTQfq6BQj8N.jpg', '2025-03-13 20:13:45', '2025-03-13 20:13:45', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(243, 'Diploma In Arc Welding 4g And Mig Welder 3g', 'public/upload/subject/dqLCRJwS2QwIonzrs9t9zo67FLStXFwexDAlY2U4.jpg', '2025-03-13 21:25:25', '2025-03-13 21:25:25', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(244, 'Diploma In Fashion Design', 'public/upload/subject/iEgbdUHvkAPKPisC4mXrbeEO0pnNdgqsKi4kEHmp.png', '2025-03-13 22:55:52', '2025-03-13 22:55:52', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(245, 'Fire Fighting System', 'public/upload/subject/Kloc8BCmTER5rwALTufSRD8EPW7pXXlZAUR8OCrW.jpg', '2025-03-15 23:32:00', '2025-03-15 23:32:00', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(246, 'Diploma In Hotel Management', 'public/upload/subject/eAPJPWBiC7yUe4U45iI5u91c2LTH3EA66Gfrxci2.jpg', '2025-03-16 00:57:31', '2025-03-16 00:57:31', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(247, 'Diploma In Civil Aviation ', 'public/upload/subject/udFC8xHFJzYUcpfjcPMZ2D2gdrn3FwLi1zvNab2C.jpg', '2025-03-16 01:01:50', '2025-03-16 01:01:50', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(248, 'Diploma In  Radiology And Imaging Technology', 'public/upload/subject/CQSYjz02HyseuKgBSdvSQnQMxQxaMmnDi0SoCUPJ.jpg', '2025-03-16 03:44:42', '2025-03-16 03:44:42', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(249, 'Agriculture And Dairy Farm', 'public/upload/subject/XsTEuGiRjhWJ2WkyJkjKiE02calw1eUG2ueLmHu4.webp', '2025-03-16 04:49:44', '2025-03-16 04:49:44', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(250, 'Diesel Heavy Technician', 'public/upload/subject/d8wlBBKtwigiVChAfvAuv2RWK4grsesLRvwx0kIo.webp', '2025-03-16 17:56:24', '2025-03-16 17:56:24', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(251, 'Heavy Diesel Mechanic', 'public/upload/subject/K8wdRc3pXqCN5o0zDW9VN6BGQpfxTWtNtBvO5T7t.jpg', '2025-03-16 18:21:53', '2025-03-16 18:46:20', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(252, 'Tig, Mig And Arc Welding', 'public/upload/subject/67FBwTucmyNofZlfxqKoX6tpKBzzkKhyIsS4hQ2p.webp', '2025-03-17 03:24:40', '2025-03-17 03:26:23', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(253, 'Diploma In Business Management & Administration', 'public/upload/subject/sVyBFcGMSMoxG30Qn5vp8sha3RySbcSh4nmSxjF1.webp', '2025-03-18 21:29:01', '2025-03-21 09:14:14', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(254, 'Housekeeping', 'public/upload/subject/y4zppN3wrHyquKsT7vqo1rX2UoKFRA9ekxYWuavb.webp', '2025-03-19 01:20:22', '2025-03-19 01:20:22', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(255, 'Diploma In Housekeeping & Laundry Management', 'public/upload/subject/Tpa8W2yPaldqaIm2N5BhbnDMG2rMqP5pG4e4JtUA.jpg', '2025-03-19 02:55:54', '2025-03-19 02:55:54', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(256, 'Bricklayer And Mason', 'public/upload/subject/k6l3B5to2ZHDaTkNHSdAHnyQG3k0bTpMERHqhRXs.jpg', '2025-03-20 03:44:12', '2025-03-20 03:44:12', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(257, 'Kitchen Helper', 'public/upload/subject/kxShHPxjuKKxawBzLL5ii0cVWh9AnPnA1wf5mhrS.jpg', '2025-03-20 15:44:36', '2025-03-20 15:44:36', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(258, 'Painter', 'public/upload/subject/5Hk7UI1oZHUb1iwqXoqda0Lml8Y3eJlOci1B4axY.jpg', '2025-03-21 09:12:04', '2025-03-21 09:12:04', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(259, 'Shuttering Carpenter', 'public/upload/subject/BAyc61PgHPdA1VFJmVDWj1Svn0FRnRR01LuXdoe2.png', '2025-03-22 16:15:07', '2025-03-22 16:15:07', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(260, 'Diploma In Cooking (Chef)', 'public/upload/subject/Rtpood46HsmYy5IyR9OUP1vb2qo1E3iwNKCepClT.webp', '2025-03-23 01:16:11', '2025-03-23 01:16:11', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(261, 'Professional Barista', 'public/upload/subject/JLT9RJMBWRWnHXHkmECjA7T96fjQlkwUXnWLPyPB.webp', '2025-03-23 02:25:41', '2025-03-23 02:25:41', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(262, 'Diploma In Medical Technologist', 'public/upload/subject/ADUSwDFODrcRP434ZTG6Yz19OWXlGSbrERWoRuel.png', '2025-03-23 05:10:24', '2025-03-23 05:10:24', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(263, 'Diploma In Food Preparation & Culinary Arts', 'public/upload/subject/iGPdFTxWW4ae3iupL2nb6p2C7H4wSDlHkTmpnAIs.jpg', '2025-03-23 07:08:06', '2025-03-23 07:08:06', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(264, 'Store Management', 'public/upload/subject/DnbDYimRj3qzGbNzadSU9rv7HT1RZzmoWGYEogGJ.webp', '2025-03-23 19:59:50', '2025-03-23 19:59:50', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(265, 'Logistics Management', 'public/upload/subject/gEFqaDcvFVZC5rVmJYwydOB2mCecCQC7CHabhLnJ.jpg', '2025-03-23 20:07:24', '2025-03-23 20:07:24', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(266, 'Caregiver', 'public/upload/subject/s5of3OvECHy2HoTNe4GVUvaXjlWQQPbgTpmg3s0M.jpg', '2025-03-24 06:41:40', '2025-03-24 06:41:40', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(267, 'Diploma In Store Management', 'public/upload/subject/AnjyGwgvVj5lSsGdS9sp8JIRrrYidZvwnJmGh9MO.jpg', '2025-03-24 06:47:43', '2025-03-24 06:47:43', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(268, 'Home Care', 'public/upload/subject/3vBfbDJeqYVFXutDXGBFsE3ZYLO57cu5caeParCG.webp', '2025-03-24 16:08:32', '2025-03-24 16:08:32', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(269, 'Welding 4g And Mig Welder 3g', 'public/upload/subject/HAGJyLVUE3XgpM0TiZ8Gf4tq2ZHFKu1XteTfBo2a.webp', '2025-03-24 23:09:27', '2025-03-24 23:09:27', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(270, '3g 4g 6g Arc Welder', 'public/upload/subject/XxsI7hIBZs8NADv2ThiYa1yANG2Lc1HcDUJq6oJo.jpg', '2025-03-24 23:41:22', '2025-03-24 23:41:22', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(271, 'Diploma In Painter', 'public/upload/subject/BonVmEZlCkpL3xNCTNYTD5ENDZl869Xiss3xch5n.jpg', '2025-03-26 06:25:33', '2025-03-26 06:25:33', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(272, 'Diploma In Manufacturing Engineering', 'public/upload/subject/0olCDuuIoz4S2KjpwI3X02pBVLKXe2uqUeDbjBet.jpg', '2025-03-26 06:26:43', '2025-03-26 06:26:43', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(273, 'Electrical Technician', 'public/upload/subject/hcDOxN1S1LiD81eBVEW76qvWXGUIFyEMMuZqG1YD.jpg', '2025-03-27 20:31:37', '2025-07-19 00:33:01', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(274, 'Welder 6g', 'public/upload/subject/WQIRrXNJENkxX9v5iLSAT2DUtJFPQEYyFbvoBPmQ.webp', '2025-04-01 19:26:19', '2025-04-01 19:26:19', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(275, 'Forklift Operator', 'public/upload/subject/zZQVEdZnJGYbfCyqBJwHWQFmp7G1320ygEd2Uh7s.jpg', '2025-04-02 22:55:51', '2025-04-02 22:55:51', '3-Month, 6-Month, 1-Year,', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(276, 'Indian Cooking Chef', 'public/upload/subject/eskpOkzRhlOlUI54qVgSNhjQYPcqwRcB4yITINaz.jpg', '2025-04-03 02:46:17', '2025-04-03 02:46:17', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(277, 'Automobile Engineering', 'public/upload/subject/Gn8BPfhxYpwRUXoumhIvAwQW8Lb9dytsuaaR6LU8.jpg', '2025-04-05 07:26:28', '2025-04-05 07:26:28', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(278, 'Industrial Electrical House Wiring', 'public/upload/subject/7V9s61xWKV336NirDEJVGF35qLAHKZiGshSt3hgG.webp', '2025-04-05 15:18:52', '2025-04-05 15:18:52', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(279, 'Professional English Speaking And Writing', 'public/upload/subject/H9jTcna21vipggcN4hPHb6TUQWs0zSrkwJcZLJ7Y.webp', '2025-04-05 20:55:52', '2025-04-05 20:55:52', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(280, 'Diploma In Medical Assistant', 'public/upload/subject/Oklpp4copfOREzy19fMrRXQJujX0wbnvY1HjdajP.jpg', '2025-04-07 07:47:55', '2025-04-20 19:35:51', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(281, 'Certification On Microfinance And Development', 'public/upload/subject/LbQttsCO0usJsdn9OFKHHZwrXSdguzsmGOt72YtX.webp', '2025-04-08 22:20:54', '2025-04-08 22:20:54', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(282, 'Diploma In Excavator', 'public/upload/subject/pf95reAvONDFcxwhSaUZLRY8I5zbKFUaeG6a7aeS.webp', '2025-04-08 23:46:46', '2025-04-08 23:46:46', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(283, 'Diploma In Cleaner', 'public/upload/subject/ZARChCOKDpKPShcb2iY71Yn5zupWeTtMEsZ0Caa1.jpg', '2025-04-09 03:44:51', '2025-04-09 03:44:51', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(284, 'Diploma In Arc Tig And Mig Welder', 'public/upload/subject/LM4UxZyLZ8nBrDdbYFC6OQtmLQJelHNIZivdDfgk.jpg', '2025-04-10 04:09:12', '2025-04-10 04:09:12', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(285, 'Supply Chain Warehouse And Logistics Management', 'public/upload/subject/YasM0a3k9Lc97Po5AUR1DSRGAvs6EaYRbZ6jshHy.png', '2025-04-10 04:22:49', '2025-04-10 04:22:49', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(286, 'Card Giving (Maternal Child & Health)', 'public/upload/subject/sRod8f2EpDNsXjxXSsOD3ZvTW64BVBRNVJSWHzs5.jpg', '2025-04-10 20:55:29', '2025-04-10 20:55:29', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(287, 'Lathe Machine Operator', 'public/upload/subject/IMNKdQV9IkPspYFWvZc6vjIl1jSxZmft6asjMEv9.jpg', '2025-04-11 01:26:25', '2025-04-11 01:26:25', '3-Month, 6-Month, 1-Year, 2-Year', '10000 - 19000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(288, 'Machinist Technician', 'public/upload/subject/pkBdmoYBcCl9V9uBAj9jLJCMvE482OFk2oahelMR.png', '2025-04-11 15:38:34', '2025-04-11 15:38:34', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(289, 'Diploma In Computer Science And Engineering', 'public/upload/subject/Fpji4K8aU0QEn0fZKq3tfFZkcaw56SpeGefJNqWp.jpg', '2025-04-12 16:55:11', '2025-04-12 16:59:30', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(290, 'Information Technology & Security', 'public/upload/subject/hdnyfrgiE0zFjEnS4COh01979qCBbz7WpUQJS1Us.png', '2025-04-13 15:58:01', '2025-07-01 22:06:09', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(291, 'Diploma In Ac Technician', 'public/upload/subject/kEpKZUW934EQ9RJNoovCvS8uLU81W0D00VhjFR7U.jpg', '2025-04-14 06:23:23', '2025-04-14 06:23:23', '3-Month, 6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(292, 'Diploma In Mechanical Helper', 'public/upload/subject/Tfhq3RbktTmFlWje3lcngOFATfPgS2FlWuxl2esO.jpg', '2025-04-15 05:32:30', '2025-04-15 05:32:30', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(293, 'Workplace Safety', 'public/upload/subject/N9yH34M7IH7SifzHmFCf34E6whNboJfx1DBFirIH.webp', '2025-04-15 16:00:25', '2025-04-15 16:00:25', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(294, 'Land Survey', 'public/upload/subject/KbZ56PoKV25cInnmq0UGjp1gDFe6dmuc4dVfshm4.jpg', '2025-04-20 21:24:09', '2025-04-20 21:24:09', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(295, 'General Worker', 'public/upload/subject/gePuxwIz2FlVF1TacLIhEBV9cSmWnlsFLZPk4QuM.jpg', '2025-04-21 17:43:51', '2025-04-21 17:43:51', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(296, 'Nursing Home Care', 'public/upload/subject/3dHHSbWiOPWDMIOikVHvMmQ1HKbzwht2j627xJm4.jpg', '2025-04-21 20:25:36', '2025-04-21 20:25:36', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(297, 'Diploma In Pathology', 'public/upload/subject/PdvoXOm7zFo91TfAttlMAqrkODItbDvlFVZpxQUO.webp', '2025-04-23 02:42:01', '2025-04-23 02:42:01', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(298, 'Drilling Worker', 'public/upload/subject/8CTavm2ZYTpMtNFyvzsiH6Fr6sNKSfjBhrkZfdlz.jpg', '2025-04-23 18:08:22', '2025-04-23 18:08:22', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(299, 'Restaurant Management', 'public/upload/subject/9b78IzgkYDB63k7mlBwSECVCZoPfEydV9p7nMq61.webp', '2025-04-23 22:38:52', '2025-04-23 22:38:52', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(300, 'Heating, Ventilation, And Air Conditioning', 'public/upload/subject/JbKjE08wFJ8YQ4GcHh56eqKs63RahPrxwdIm1esG.webp', '2025-04-24 08:04:38', '2025-04-24 08:04:38', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(301, 'Tiles Mason', 'public/upload/subject/vZ6XDPxUy9AGX18jQ34qDhUwFzovp8mGlKowN3KS.jpg', '2025-04-24 14:21:29', '2025-04-24 14:21:29', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(302, 'Korean Language', 'public/upload/subject/0xfHKcoXE7zGvIcMUOQ4nYZq4qz6vdQQ3qgNfPVp.jpg', '2025-04-24 18:19:32', '2025-04-24 18:19:32', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(303, 'Arabic Language', 'public/upload/subject/lG93HGzHz27beCVv0b2CRwpWyxtlR57Z68i1a2RT.jpg', '2025-04-24 19:32:17', '2025-04-24 19:32:17', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(304, 'Diploma In General Electrician', 'public/upload/subject/JyE75hjdUeIu8fkOzEEf1sxk0XEPc8pj5bKXrkcs.jpg', '2025-04-25 23:59:27', '2025-04-25 23:59:27', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'Diploma in General Electrician', 0),
(305, 'Account Management', 'public/upload/subject/TnEPNeBQfq7bm6eJjvE4sy4qTf6V2NFTF864g3Z5.png', '2025-04-26 02:26:31', '2025-07-31 04:05:43', '3 Months, 6 Months, 1 Year, 2 Years', '3500/-  To 15500/-', 'Jsc, Hsc,', NULL, 1),
(306, 'Diploma In General Electrician', 'public/upload/subject/lXzuX9xDn41XHYGF86acPZisSJsb054X66LKRwhP.jpg', '2025-04-26 14:16:36', '2025-04-26 14:16:36', '3 Months, 6 Months, 1 Year, 2 Years', '3500/-  To 15500/-', 'Jsc, Hsc,', NULL, 2),
(307, 'Hotel Management And Chef', 'public/upload/subject/T5pOZMy0qHXhjSOOqN6wc0RY6hWzu9TWtijixUSk.jpg', '2025-04-26 16:47:16', '2025-04-26 16:47:16', '1 Year', '3500/-  To 15500/-', 'Jsc, Hsc,', NULL, 1),
(308, 'Diploma In Computer & Information  Engineering', 'public/upload/subject/yqspyIFhjXoNAP4s2iim82z36tNyLhi2ty8IUuwo.jpg', '2025-04-26 18:41:37', '2025-04-26 18:41:37', '4', '14000/-  To 25500/-', 'Jsc, Hsc,', NULL, 2),
(309, 'Agriculture', 'public/upload/subject/I52fOxFkJK8RXIVu7x8ljdBYkrzQck3LYqvx1Shz.jpg', '2025-04-27 16:42:46', '2025-07-04 19:56:36', '2 Years', '3500/-  To 15500/-', 'Jsc, Hsc,', NULL, 1),
(310, 'Auto Cad 3d Max', 'public/upload/subject/11hIMWTwRhRb6e4Pw7nBtfPOFkZG8SfTDqqYbM6X.jpg', '2025-04-27 18:29:44', '2025-04-27 18:29:44', '1 Year, 6 Months', '3500/-  To 15500/-', 'Jsc, Hsc,', NULL, 0),
(311, 'Auto Cad 3d Civil Environmental Project', 'public/upload/subject/DexCF8BpxxmgB70rKODNEFx04z8DIRTb6zLc8KQZ.png', '2025-04-27 18:30:27', '2025-04-27 18:30:27', '1 Year, 6 Months', '3500/-  To 15500/-', 'Jsc, Hsc,', NULL, 1),
(312, '3G,4G Welder', 'public/upload/subject/jkY00AJenaqZO6cDFdteUaRO6U1jVXw0SVl5vjoy.jpg', '2025-04-28 17:21:57', '2025-08-02 19:43:01', '2 Years', '15000 -30000', 'Jsc , Ssc , Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(313, 'Diploma In Fire & Safety', 'public/upload/subject/0ea54Lh45lPahu0aa7Jv7A0iGB8rMP2ZU67aMnm3.jpg', '2025-04-29 11:43:53', '2025-04-29 11:43:53', '4 Years', '30,000 - 35,000', 'Jsc , Ssc , Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(314, 'Diploma In Mechanical Technician', 'public/upload/subject/DXC3fAWWx2vrR6fgnGNHvvWYzkqvhKCnftKJY8Ge.jpg', '2025-04-29 14:53:41', '2025-04-29 14:53:41', '2 Years', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(315, 'Electric Engineering', 'public/upload/subject/mx0V7vpsxYedS3CqKYlgp37xF8rhmiYFSSWFzEoS.jpg', '2025-04-29 18:30:24', '2025-04-29 18:30:24', '1 Year', '15500 -30000/-', 'Jsc, Ssc, Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(316, 'Diploma In Food & Fruit Management', 'public/upload/subject/98YlF1VXN6MbHlZcGcSCindor5VmnxOvcYOzOkER.jpg', '2025-04-29 20:19:46', '2025-04-29 20:19:46', '1-Year, 2-Year, 3-Year, 4-Year', '10000 - 19000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(317, 'Diploma In Store Inventory & Warehouse Management', 'public/upload/subject/QTDuyJDcaqGKypEeQ3EzWdh5KGhgEoac60WTp2AP.jpg', '2025-04-29 20:20:46', '2025-04-29 20:20:46', '1-Year, 2-Year, 3-Year, 4-Year', '10000 - 19000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(318, 'Project Management In Development  Sector', 'public/upload/subject/0ja87L6h0CiGAV092zXtTj7LrKyg4hhFqHqoqJcc.jpg', '2025-04-30 01:57:01', '2025-04-30 01:57:01', '6 Months', '15500 -30000/-', 'Jsc, Ssc, Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(319, 'Disaster & Environment', 'public/upload/subject/4BXQOM9leeM5JgfG2c55iWPwwmA8NN6KDtMy9Jyo.jpg', '2025-04-30 14:33:32', '2025-04-30 14:33:32', '6 Months', '15500 -30000/-', 'Jsc, Ssc, Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(320, 'Local Medical Assistant & Family Welfare', 'public/upload/subject/UtZLIRUI3j7LlfUSblr1D8DYZKK40jUchnYYxThM.jpg', '2025-04-30 15:04:52', '2025-04-30 15:04:52', '1 Year', '15500 -30000/-', 'Jsc, Ssc, Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(321, 'Diploma In Maternal And Child Health', 'public/upload/subject/C655EyIBt4bW575qU4PgK2duhvGVqhBnDQYiRXVI.jpg', '2025-04-30 15:06:55', '2025-04-30 15:06:55', '1 Year', '15500 -30000/-', 'Jsc, Ssc, Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(322, 'Sewing  Machine Mechanic', 'public/upload/subject/Zuk5N3No4k8XKTX07Me273tIUQnVBXP5zP0QixFp.webp', '2025-05-01 15:35:31', '2025-05-01 15:35:31', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(323, 'Interior Design', 'public/upload/subject/72STgsn8azdkCN0EtaIRm6io1tRIOgk5bW28UFFJ.jpg', '2025-05-01 15:36:41', '2025-05-01 15:36:41', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(324, 'Welding And Gas Welding', 'public/upload/subject/voD0YCTJpkidwq0qpxPfhK1OY4hg2dEg8F7Tz3wC.jpg', '2025-05-02 16:24:24', '2025-05-02 16:24:24', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(325, 'Welder 1g-6g Tig & Arc - Gas Welder', 'public/upload/subject/rbWbAaB5zU6mRrRmrahFTp5B0jNl80pNhddzUcRY.jpg', '2025-05-02 18:38:13', '2025-05-02 18:38:13', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(326, 'Soil Test', 'public/upload/subject/oi6t3BXBAMj40NS3Le3WGvUK2dgyFOUDVtHIA1bk.jpg', '2025-05-03 06:08:45', '2025-05-03 06:08:45', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(328, 'Diploma In Driver Cum Auto Mechanics (Dvr)', 'public/upload/subject/Y2EweXwPaaCfZdJUVEyERABl10RKihHDOLh0QxIb.jpg', '2025-05-03 21:38:42', '2025-05-03 21:38:42', '6 Months', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(329, 'Housekeeping Staff', 'public/upload/subject/DpQeO4Kv8fGq8QpUcvNXAU6qKgQp8HiYERYZGEC6.png', '2025-05-04 03:24:44', '2025-05-04 03:24:44', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(330, 'Diploma In Food & Beverage Service', 'public/upload/subject/A9kNGidiYkx3VkLrHmkiXo5UgzG2ivKidbD5PTs1.jpg', '2025-05-04 04:05:20', '2025-05-04 04:05:20', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(331, 'Diploma In Construction Bricklayer', 'public/upload/subject/1TvKA6Et4Q9CZt9LijIfvNwddPPkpuPpPPSqZpja.png', '2025-05-04 15:36:17', '2025-05-04 15:36:17', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(332, 'Diploma In Plumbing And Pipe Fitting', 'public/upload/subject/xqB9yaNgQ9kbY6IbyVnTLBiutbGKbtpH3uLaF45H.jpg', '2025-05-04 23:11:13', '2025-05-04 23:11:13', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(333, 'Diploma In Forestry Worker', 'public/upload/subject/Jxgdr3wXtlFGs5XNIakGdavgbIZ63cxJZHYBTRBn.jpg', '2025-05-05 03:39:36', '2025-05-05 03:39:36', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(334, 'Sca Coffee Certificate Program', 'public/upload/subject/Zo2a7eYa3xSGpkHowj0gg3xrJDyUny5EJWRtmnWV.jpg', '2025-05-05 16:36:47', '2025-05-05 16:36:47', '1 Year', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(335, 'International Coffee Courses', 'public/upload/subject/cB5lkVvkQFVKZa6YHY1ScUodA6w1TUjUc73sYT7x.jpg', '2025-05-05 16:40:09', '2025-05-05 16:40:09', '2 Years', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(336, 'Warehouse Certified Production Worker', 'public/upload/subject/kDmpnnTAxwy0ao5DTAhAd9aHH0BNgKrT6PRZvMaQ.jpg', '2025-05-05 17:24:11', '2025-05-05 17:24:11', '1 Year', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(337, 'Certified Warehouse Logistics Professional', 'public/upload/subject/xjenHpilq3MVItM4PDgKVQJNQjZVlJQSoiBNchrJ.jpg', '2025-05-05 17:25:48', '2025-05-05 17:25:48', '1 Year', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(338, 'Diploma In Carpenter', 'public/upload/subject/ulw6Ynu7G7iuHL2h2UyLGsMKpYGuCKDdUJU2GZ8p.jpg', '2025-05-06 01:33:00', '2025-05-06 01:33:00', '4 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(339, 'Cng Operator', 'public/upload/subject/qFa83Mio9t9wMCTcBj9Q4C57VRB264SJeLeRErEx.jpg', '2025-05-07 05:46:00', '2025-05-07 05:46:00', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(340, 'Steel Fixer', 'public/upload/subject/fBd35sxTkZlV92uff78RSBdgZ6OBteUZJhoV06BI.jpg', '2025-05-07 17:01:59', '2025-05-07 17:01:59', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(341, 'Laundry Services', 'public/upload/subject/xohEbLcPKXZCpAwBE5OJ8dOIsa91wdB4oYfpyW4o.jpg', '2025-05-07 17:24:26', '2025-05-07 17:24:26', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(342, 'Ncrf/Nsqf Gym', 'public/upload/subject/8wXVt3xY4V2AGeqojI9GFqADm0kvyrSkOAExj4Mv.jpg', '2025-05-09 01:06:27', '2025-05-09 01:06:27', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(343, 'Diploma In Marble Ceramics', 'public/upload/subject/uGpVVYQy7whVsTfNmP7Xvyo7MQsUdQhAkXTek9ti.jpg', '2025-05-09 06:22:45', '2025-05-09 06:22:45', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1);
INSERT INTO `subjects` (`id`, `name`, `photo`, `created_at`, `updated_at`, `duration`, `rate`, `education_qualification`, `course_details`, `type`) VALUES
(344, 'Security Guard', 'public/upload/subject/6w7F4v7SxauhaWy1CKHG4sZKvGNp1lsvxAxUrqHJ.jpg', '2025-05-10 02:14:04', '2025-05-10 02:14:04', '6 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(345, 'Finishing Carpenter', 'public/upload/subject/S6kVQEeeVqmwYdba6KndcEJ4o9w0MXZBKhIAnBR3.webp', '2025-05-10 03:05:22', '2025-05-10 03:05:22', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(346, 'Diploma In Hotel Bartenders', 'public/upload/subject/7QFMPsxiWxWVKDUfcpetjP0lwDacCHDrup62vN8h.jpg', '2025-05-13 18:58:34', '2025-05-13 18:58:34', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(347, 'Building Electrician', 'public/upload/subject/A3BFbGPgJ7YH0stcLeGrHI0yO1DDWBYK40K6o2Xd.jpg', '2025-05-13 22:38:44', '2025-05-13 22:38:44', '3 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(348, 'Diesel Mechanic', 'public/upload/subject/sspepBTi07j20uiouVeXbI7uQzZoxCp4OdLwAI91.webp', '2025-05-14 19:00:11', '2025-05-14 19:46:01', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(349, 'Multi Welding', 'public/upload/subject/VdCHUFMhJGboCZtFCCqrXmyPyDz7IqkZ27YuTPEi.jpg', '2025-05-14 21:24:22', '2025-05-14 21:24:22', '3-Month, 6-Month, 1-Year, 2-Year', '25000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(350, 'General Electric Works', 'public/upload/subject/5Dhloe9neH64OZ9pVennt3GafxpNav3C5unrVSnQ.jpg', '2025-05-14 21:36:14', '2025-05-14 21:36:14', '1 Year , 6 Months , 3 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(352, 'Sales And Marketing', 'public/upload/subject/KtsYkYQTeTDDfOQLfdOWb1cLHJUXXoS89pPcSh1U.jpg', '2025-05-16 05:46:03', '2025-05-16 05:46:03', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(353, 'Tourism Management', 'public/upload/subject/McHJjmc8n4vn2vs1Z0uNHQGYdPT2NGTr8ikhGXO1.jpg', '2025-05-16 19:49:17', '2025-05-16 19:49:17', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(355, 'Hotel And Hospitality Management', 'public/upload/subject/DpJgU2pqtz83ZtKIYvyy7RZdp3E4soyiXH6UkFZh.png', '2025-05-17 18:52:44', '2025-05-17 18:52:44', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(356, 'Electronics Technician', 'public/upload/subject/AbyOooPA3sbJpJAWZG4TmV5YgXg49Ll88wPIhDqw.jpg', '2025-05-18 18:56:10', '2025-05-18 18:56:10', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(357, 'Cutting And Sewing', 'public/upload/subject/qdSO1CPsmydeqlWVoWYWxboNHhEOm8I2NI9P37CQ.jpg', '2025-05-18 19:12:30', '2025-05-18 19:12:30', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(359, 'Brick Masonry', 'public/upload/subject/VfdOY3gHJ4mmDDw4MWxOoGRNyuKRfMpSWIdgSYyE.webp', '2025-05-18 23:13:03', '2025-05-18 23:13:03', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(360, 'Diploma In Computer Science', 'public/upload/subject/yeREhY3KnZ3mH6BjQLW5N08inheYW880zlTBicBp.jpg', '2025-05-20 17:13:44', '2025-05-20 17:13:44', '1 Year', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(361, 'Advance Python With Freelancing Higher', 'public/upload/subject/duu5SAeypcmValMAKFqDx5tidAvHJdlNN4quN0nR.jpg', '2025-05-20 17:29:15', '2025-05-20 17:29:15', '1 Year', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(362, 'Diploma In Laptop Mobile Repairing Technician', 'public/upload/subject/TZBoJ8ag7pbgSCwev81XOAHn0ghJ4u3QSWxVTj5U.jpg', '2025-05-21 14:56:35', '2025-05-21 17:06:51', '4 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(363, 'Paintings, Handicrafts & Photography', 'public/upload/subject/Nm37SKIblYha5mX1zdOZTxVHKYkAzKrE5xiHP3Dn.jpg', '2025-05-21 15:21:22', '2025-05-21 20:08:09', '2 Years', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(364, 'Office Management & Business Development', 'public/upload/subject/wpcITtYf0jtiC3OImUfNRzAfe7jI8eDtV5aAi88G.jpg', '2025-05-21 15:29:07', '2025-05-21 15:29:07', '2 Years', '15000 -30000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(365, 'Diploma In Garments Management', 'public/upload/subject/eGj4S2G8ypJSTN8Ps9RppMprb92BJpZoj3y7KGbU.webp', '2025-05-21 18:25:00', '2025-05-21 23:32:03', '3-Month, 6-Month, 1-Year, 2-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(366, 'Diploma In Business Studies', 'public/upload/subject/NSUPCTueXiRl9uq4xzqhYq2bqQ4tdJA6Ctb156at.jpg', '2025-05-21 18:57:09', '2025-05-21 18:57:09', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(367, 'Computer Operator & Data Entry', 'public/upload/subject/VymfNGSdbuAxrQrecc1HNiuxJL5XbWjnULreBrxF.jpg', '2025-05-21 20:33:07', '2025-05-21 20:33:07', '1 Year', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(368, 'Hotel Room Boy', 'public/upload/subject/WUHQUgrGGXEAUbwTxrui8HtWoDFmzYbMCaHC5uON.jpg', '2025-05-22 15:06:59', '2025-05-22 15:06:59', '2 Years', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(369, 'Sales Representative', 'public/upload/subject/VrbztH1UlzLcLn0NvYlXcwUmbHCpTNOgrYJreRYC.jpg', '2025-05-22 15:35:37', '2025-05-22 15:35:37', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(370, 'Resturant Cleaner', 'public/upload/subject/kCRonbrCkgW2Poz8rDxjYSPWaBe387hX3ssw4Xx2.jpg', '2025-05-22 18:37:57', '2025-05-22 18:37:57', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(371, 'Restaurant Cleaner & Waiter', 'public/upload/subject/yIp3a52H0nMw6tNIG1ZsyNVdMeRzfp6xWU4BY5Gd.jpg', '2025-05-22 18:38:38', '2025-05-22 18:38:38', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(372, 'Cleaner', 'public/upload/subject/tyqxfLkYzWc2muk03WEFW4kPorGWC81rHddWqgfN.jpg', '2025-05-22 18:39:30', '2025-05-22 18:39:30', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(373, 'Restaurant Kitchen Cleaner', 'public/upload/subject/dqTAxv9kLsKKuKIAIdFCCmv3hwievqXL6N3dt5wo.jpg', '2025-05-22 18:40:11', '2025-05-22 18:40:11', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(374, 'Cleaners Of Ventilation System', 'public/upload/subject/oZhs0Dg3mP4eg3WLi1MMKU8RdkPCC2tOyrxoXWMD.jpg', '2025-05-22 18:40:41', '2025-05-22 18:40:41', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(375, 'Residential Hotel Cleaner', 'public/upload/subject/DrY6asLDaY0q9Rj3KLzxUGXVNwGSkWuRlwRXfYgM.webp', '2025-05-22 18:41:25', '2025-05-22 18:41:25', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(376, 'Tiles Cleaner', 'public/upload/subject/zWjrMBrRtzFoE0q01HAHk8b38dTU1dNVLhKXcaX5.jpg', '2025-05-22 18:41:59', '2025-05-22 18:41:59', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(377, 'Hotel Cleaner', 'public/upload/subject/qY6Wvl6N2WHduQibHoTnS022ib69aCo1l95KQ14V.jpg', '2025-05-22 18:42:44', '2025-05-22 18:42:44', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(378, 'Accounting Information System', 'public/upload/subject/kHLFGtxUdlAhS7d467NA3BpI6hapOkYRjtUJjl8L.jpg', '2025-05-22 19:00:41', '2025-05-22 19:00:41', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(379, 'Diploma In Building Construction', 'public/upload/subject/cQ8B3aCrJ0A8YJQYqFvd7QYa7GVRa1GzcO7gGrfl.jpg', '2025-05-23 00:28:11', '2025-05-23 00:28:11', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(380, 'Radiologic Technologist', 'public/upload/subject/JhH3e9dTxY6GgXXRL6O6mQBhWZFpyWpAVMrcAPIG.jpg', '2025-05-24 17:24:08', '2025-05-24 17:24:08', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(381, 'Food Safety', 'public/upload/subject/zIfWrT1rHI6Z1HRxV1tkVzJyr4oiwaefsU19cx46.jpg', '2025-05-24 17:39:07', '2025-05-24 17:39:07', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(382, '(HACCP) Food Safety', 'public/upload/subject/A4xLrM8UMCnyneF1k4oM80spV1Y10a63dhW6UX15.jpg', '2025-05-24 20:59:23', '2025-05-24 20:59:23', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(383, 'Forest & Garden Keeper', 'public/upload/subject/wt8sZnwmBlaqxPii8PM3Tqs1P2Xu2sieOEgxNxdb.webp', '2025-05-25 17:10:13', '2025-05-25 17:10:13', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(384, 'Diploma In Garden Keeper', 'public/upload/subject/bb6wzrFjW3Q0rAkGsEkHdJSRCCp6LNKUDHvz1Rb3.jpg', '2025-05-25 17:17:34', '2025-05-25 17:17:34', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000-50,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(385, 'Diploma In Information Technology', 'public/upload/subject/EXRQT8KOVfzmrjW8d5JjztoXtGYLeTnjjP4nB7tM.jpg', '2025-05-25 17:18:00', '2025-06-26 15:34:42', '1.5 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(386, 'Sewing Machine Operator', 'public/upload/subject/Gmar5kieInQ9cQ1XbXpGcomKrUGe4ZWIIw7VZxWn.jpg', '2025-05-25 20:04:11', '2025-05-25 20:04:11', '1 Year', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(387, 'Caregiver Assistant', 'public/upload/subject/i5VAq2KdKNyxaFhadLRJjhDKpZSF6nvym7NMX6K1.jpg', '2025-05-26 00:26:05', '2025-05-26 00:26:05', '1 Year', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(388, 'Restaurant Food & Beverage Service', 'public/upload/subject/U1gz5C4cGM4BKp0Kfa40SNZS2chh0lpt05WDpXvQ.jpg', '2025-05-26 00:33:37', '2025-05-26 00:33:37', '1 Year', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(389, 'CCTV System Installation & Maintenance', 'public/upload/subject/l1QHt3njRk9bEuYYXHuk3WID4PqRu4FG9Fw6tjlb.png', '2025-05-26 18:40:08', '2025-05-26 18:40:08', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(390, 'Steel Fixture', 'public/upload/subject/9e1o46XGzvvhh97cE3qHG8s4skKnUBmEoNQjNYqo.jpg', '2025-05-26 18:44:35', '2025-05-26 18:44:35', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(391, 'Diploma In Hotel And Restaurant Worker', 'public/upload/subject/dhOzMIa66l7xiRlEABKgJ2fqKpPEwCtTPksr8CxC.jpg', '2025-05-26 22:11:34', '2025-05-26 22:11:34', '1 Year', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(392, 'Electrical Wiring', 'public/upload/subject/8iNsZBsbDyTEL0D8fExTtrnrBbYYZxs0D9ChfmdE.jpg', '2025-05-27 20:35:49', '2025-05-27 20:35:49', '3 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(393, 'Fashion Design and Technology', 'public/upload/subject/EGXBDkzyhx2Zkg9IiaLXngl2uxnBH2nYFVdtWCzy.jpg', '2025-05-30 01:46:03', '2025-05-30 01:46:03', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(394, 'Food Packaging Work Trained', 'public/upload/subject/TqRbuGU6Bf59oCp1karmatAVVVzH9a0vzd1GxXMD.jpg', '2025-05-31 00:33:44', '2025-05-31 00:42:12', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(395, 'Glassware And Ceramic Work Trained', 'public/upload/subject/XPGTqlXkl8SfUrerPSYe7YNWWFN8jdOPQdd2REJK.jpg', '2025-05-31 00:35:09', '2025-05-31 00:43:39', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(396, 'House Keeping & Cantonese Language', 'public/upload/subject/9X2uq47mCDp7IAGZPbhVCu47x1wgWPXZkKHIW9j7.jpg', '2025-05-31 19:03:15', '2025-05-31 19:03:15', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(397, 'Watchmaker', 'public/upload/subject/SPuggS9O5iufgidTBGhWUBb9JjnM9rRVS9fGbab5.jpg', '2025-06-02 03:48:18', '2025-06-02 03:48:18', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(398, 'Microsoft Office Hardware & Graphics', 'public/upload/subject/lB6f7cmHnKZwE2LMwQvBU9kdyRt86S4iRUM6AxWD.jpg', '2025-06-02 21:34:24', '2025-06-02 21:34:24', '6 Months', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(399, 'Diploma In Electronics Technology', 'public/upload/subject/2EEE4w14ZFIX6GlktL5qXEPQkYNuHF1aS7sngv0B.jpg', '2025-06-02 23:13:03', '2025-06-02 23:13:03', '4 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(400, 'Excavator Machine Operator', 'public/upload/subject/5pn7v3v85Q5KjUvn9h5ZLmML3ZywsZXUFKx0A1Hy.jpg', '2025-06-03 07:26:10', '2025-06-03 07:26:10', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(401, 'Diploma in Business Communication', 'public/upload/subject/OgdC3tAOgwxEj14vGnwprJaRCXCrDghn5fDKW9MG.jpg', '2025-06-06 02:57:19', '2025-06-06 02:57:19', '3 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(402, 'Plumber', 'public/upload/subject/gdvqlgcmvVj2xiY0n6CPU9Dobsdv0Tf7Maq4e2m0.jpg', '2025-06-09 03:28:11', '2025-06-09 03:28:11', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(403, 'Chef (Special Food Court)', 'public/upload/subject/kVPtqKL6MbJ9SZ1LKXPjNFeJdw2xBZGCJYTio7VI.jpg', '2025-06-09 20:47:03', '2025-06-09 20:47:03', '6 Months', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(404, '3g 4g Mig Welder & Gas Cutting', 'public/upload/subject/3IhAahiObNpir97ZORwa295w4yVLIIWzLj9BisWV.jpg', '2025-06-10 16:09:21', '2025-06-10 16:09:21', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(405, 'Steel Fabrication', 'public/upload/subject/QsNz4lddgpeXHoegkHthN0iOD5ynBRwrKHjYRvwI.jpg', '2025-06-12 20:20:26', '2025-06-12 20:20:26', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(406, 'Bar Bender And Steel Fixer', 'public/upload/subject/oIEve81O0HL3z9JgMup9UQoIe9jxUkZw0AmWFP0l.jpg', '2025-06-13 03:02:13', '2025-06-13 03:02:13', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(407, 'Diploma in Steel Fabrication', 'public/upload/subject/YkBkJGb046j5NebQa6QxzlDXofrlegLPvEUodq81.jpg', '2025-06-14 00:23:51', '2025-06-16 17:06:42', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(408, 'Vehicle painter', 'public/upload/subject/vrr8olKagliSSmHTwld8evMLezc3MjCdeoLMJoIe.webp', '2025-06-14 20:32:17', '2025-06-14 20:32:17', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(409, 'Diploma In Submarine Welder', 'public/upload/subject/1vcd2uByPBw6Mb83FvA2o1EWLrCCmFGYPTk6bNXV.jpg', '2025-06-16 16:04:26', '2025-06-26 01:23:43', '3 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(410, 'Diploma in Production Management', 'public/upload/subject/YBAwLvluJHQzciPWJJQ51r06lRNvc8ECLuEgfG3k.jpg', '2025-06-16 18:21:05', '2025-06-16 18:21:05', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(411, 'Kiln and Furnace', 'public/upload/subject/r4YrULNSK8r3sqlDUVAVF3QqjKIdA64WVVXAM6dJ.jpg', '2025-06-16 21:27:32', '2025-06-16 21:27:32', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(412, 'Product packaging and design', 'public/upload/subject/X8a9jHJBn9wMXJLp3sXTdmTbaVDHGgrEu036ps6x.jpg', '2025-06-17 00:32:52', '2025-06-17 00:32:52', '3-Month, 6-Month, 1-Year, 2-Year', '3500-15500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(413, 'Advanced Certificate Course in Computer Technology', 'public/upload/subject/Tds7QZ1FKlackFPhSYKbvpsvMBOVvN4Fgaj0ZD2I.jpg', '2025-06-17 03:19:40', '2025-06-17 03:19:40', '6 Months', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(414, 'Diploma In Automobile', 'public/upload/subject/PKNZonIZssdNi1HDehgNT4FJT2sxRA3KHXK3143I.jpg', '2025-06-17 14:20:03', '2025-07-02 22:12:32', '4 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(415, 'Office And Facility Cleaner', 'public/upload/subject/P9uzA91DKldAVYgcfEVnGLtuA5uSduiZ62CaXQI9.jpg', '2025-06-17 17:01:03', '2025-06-17 17:01:03', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(416, 'Shopping Mall Salesman', 'public/upload/subject/UCRWxp7usKh4cfsmoxTTQvy5f6hXOZtQPWLKTSoG.jpg', '2025-06-17 17:52:52', '2025-06-17 17:52:52', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(417, 'Diploma in Hotel Management And Tourism', 'public/upload/subject/Nm9NhPExzw4vyHxChRvUIqvO1Aigd7d7oimojDEP.jpg', '2025-06-17 22:08:14', '2025-06-17 22:08:14', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(418, 'Access Control and personal Security In CTPAT', 'public/upload/subject/tvSodv89YV3tIsltoJcreToKWTSq94k0OOYJnNVf.webp', '2025-06-18 20:05:13', '2025-06-18 20:05:13', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(419, 'Carpenter Finishing', 'public/upload/subject/RFfEpwsoQ0NXPLd6Gg8YOLRqhpSNxC0wKbI8nNnO.jpg', '2025-06-19 16:02:34', '2025-06-19 16:02:34', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(420, 'Advanced Hardware and Software (Mobile)', 'public/upload/subject/cgUhRzxemFLx8ZfGeaadGfJuJj11jhHe9M2EOvUv.jpg', '2025-06-19 23:58:56', '2025-06-19 23:58:56', '6 Months', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(421, 'Diploma In Denting Painting & (Panel Beater)', 'public/upload/subject/iJdkxPGzKOQMeyqRasRFC61VzZNKANv6CvN9IHAg.jpg', '2025-06-20 19:58:03', '2025-06-20 19:58:03', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(422, 'Painting And Plastering', 'public/upload/subject/YRUIiBgepYKe72kNALRFwDrTq3LqpF4qSBxcoFum.jpg', '2025-06-20 21:02:06', '2025-06-20 21:02:06', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(423, 'Diploma in Computer Science and Technology', 'public/upload/subject/952MQy5uh0qebi4O9DoP9t6WrFfDNX9XO8C14ULd.jpg', '2025-06-21 17:20:11', '2025-07-13 18:49:55', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(424, 'Salons Barber', 'public/upload/subject/Ds8dE0WTeS7u1KWdMQdcRJ2qYwDfTeTi39NTzJd9.jpg', '2025-06-22 02:11:40', '2025-06-22 02:11:40', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(425, 'Reinforced Concrete', 'public/upload/subject/KoT0TmPcWwxDy9fmttb9rdRa9BswHIeUAbkZcuc9.jpg', '2025-06-22 06:04:24', '2025-06-22 06:04:24', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(426, 'Diploma in MIG Welding', 'public/upload/subject/sRYl05KrKYdjpSawxn9a1RviuD1vqbuW4jX6Ins5.jpg', '2025-06-22 16:33:06', '2025-06-22 16:33:06', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(427, 'Hospitality Management', 'public/upload/subject/INZ3HaP92dNIOVdPPy3IlOdDMCwStpdKVR1xaqVs.jpg', '2025-06-22 19:30:50', '2025-06-22 19:30:50', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(428, 'Warehouse Packaging', 'public/upload/subject/7HWzfnL42xkLlEiBzFiIEpbxEsvWKQuldqokBo8I.jpg', '2025-06-23 19:10:31', '2025-06-23 19:10:31', '2 Years', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(429, 'Diploma In Sewing Operator', 'public/upload/subject/NODZ2fEHcsefoniyPDLXCUV0FWTzfNpR9WCcfRy9.jpg', '2025-06-24 07:34:47', '2025-06-24 07:34:47', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(430, 'Lab Technician (Water Quality Analyst)', 'public/upload/subject/yYIdJD56ZtBboLyCvRHkJWAFIGijbC1puDZXiqmi.jpg', '2025-06-24 16:15:02', '2025-06-24 16:15:02', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(431, 'Embroidery Machine Operator', 'public/upload/subject/iVJw8hKd62UMvAnOS0y6Pl0nnF1n4t6g4LsEsJM5.jpg', '2025-06-24 16:51:49', '2025-06-24 19:03:38', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(432, 'Diploma in Computer Science & Cyber Security', 'public/upload/subject/0lV6yrw6xrxW8hw7lf4aFTL29jnGe4uG7kcJbOEe.jpg', '2025-06-24 17:17:23', '2025-06-24 17:17:23', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(433, 'Diploma in Painting and Plaster', 'public/upload/subject/WM4xw9Aq436bKeq0QTbzpfbQpi1rPOsPKMrEBcKn.webp', '2025-06-25 03:03:29', '2025-06-25 03:03:29', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(434, 'Diploma In Digital Marketing', 'public/upload/subject/nkNF3Ly2PhfFDeZcGD2PWKWGzGr8sql4XOYwDCZM.jpg', '2025-06-25 17:00:46', '2025-06-25 17:00:46', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(435, 'Diploma In Packaging Warehouse', 'public/upload/subject/mNJPLF1niDCPLjNdIPUf1vToKUtNQWsGZGtg6zkU.jpg', '2025-06-25 22:00:23', '2025-06-25 22:00:23', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(436, 'Industrial & House wiring', 'public/upload/subject/mmp1cdPf6VVPGKpjZVELsjZuUXuIXF5XG0EdVDnZ.jpg', '2025-06-26 02:25:28', '2025-06-26 02:25:28', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(437, 'Mechanical Maintenance Technician', 'public/upload/subject/Huou7xW1DvGSuxAnw8jV0EPUhVt0FwYz1SS0Otvf.jpg', '2025-06-26 16:10:15', '2025-06-26 16:10:15', '6 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(438, 'Diploma In Welding and Fabrication', 'public/upload/subject/GQJd3MNGphZzoR44SolPZAiFZsePP84dT8u3QqBI.jpg', '2025-06-26 19:30:32', '2025-06-26 19:30:32', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 2),
(439, 'Plaster', 'public/upload/subject/9RmcCpfdjlDJ0wl0TEav89ph3idrUPmqFOoQXVAf.jpg', '2025-06-28 01:24:07', '2025-06-28 01:24:07', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(440, 'Dry Wall', 'public/upload/subject/Pia8ZEoZysBx0AtwtCMky8xmdrC7hZxijqi28jeW.jpg', '2025-06-28 01:42:34', '2025-06-28 01:42:34', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 1),
(441, 'Nursing', 'public/upload/subject/8gvAIvw7f2wk9YcMrILThxKgmJfZMBsvQdGLMDM1.jpg', '2025-06-29 15:47:23', '2025-06-29 15:47:23', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(442, 'Diploma in Agriculture & Farm Management', 'public/upload/subject/RDWRhEW9oGCVy6W4N5D2Gu4K7UFCFadkBZ8bqrgb.jpg', '2025-06-30 00:34:21', '2025-06-30 02:26:05', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(443, 'Hospital cleaner', 'public/upload/subject/MlHFAuX54KFhLxNl3asdexRGcRULAxzHS1T2yoOM.jpg', '2025-07-01 18:05:48', '2025-07-01 18:05:48', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(444, 'Hairdresser', 'public/upload/subject/ZNgdFFyAVchSlaWiueRLR4GzcCrZANg2tFlqZ2Bo.jpg', '2025-07-01 18:30:06', '2025-07-01 18:30:06', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(445, 'Diploma In Bricklayer Mason', 'public/upload/subject/umN0qeTPMvPtc1aB7F6HmzHyCp3iL7SxGSHwiEJk.jpg', '2025-07-02 00:16:57', '2025-07-02 00:16:57', '2 Years', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ', 2),
(446, 'Electrical and Mechanical Equipment Maintenance & Operation', 'public/upload/subject/PKawDHq1vtTzoLP1SEgE8TbDRK38OiRuXpW2n1bo.jpg', '2025-07-02 00:49:17', '2025-07-02 00:49:17', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(447, 'Housekeeping Room Attendant', 'public/upload/subject/Vewq0M8Y8LmHCR0uCaGxQ7mCWwys2kobbcIiixGz.jpg', '2025-07-02 01:08:57', '2025-07-02 01:08:57', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ', 1),
(448, 'Certified Pizza & Fast Food Chef', 'public/upload/subject/krf5XuRJuvc9HaZMlvlMYtFWdkug0XWoBeB14PKW.jpg', '2025-07-02 02:01:29', '2025-07-02 03:01:29', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(449, 'Diploma in Driving', 'public/upload/subject/vXawH49FJKn6l0FIEmO9M2rKtFQ7cqktmJAnOYx9.webp', '2025-07-02 06:20:18', '2025-07-02 06:20:18', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(450, 'Diploma in Human Resource Management  (HRM)', 'public/upload/subject/bxeKNSp2P6BgYcD5h0ML2cWDHcEsFg6yi38Kux3u.jpg', '2025-07-02 18:51:56', '2025-07-02 18:51:56', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(451, 'Auto dry cleaner', 'public/upload/subject/zp6tWaMflNpPocPcMh7g5lshLNhgdxBxAlCVATPV.webp', '2025-07-02 21:06:27', '2025-07-02 21:06:27', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(452, 'Driver Cum Auto Mechanics', 'public/upload/subject/ejBy5HWiBEk23y0ArwVbxLDkGdI22ZHV82UhbEMk.jpg', '2025-07-02 23:16:00', '2025-07-02 23:16:00', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(453, 'Pharmacy Assistant', 'public/upload/subject/N9nufz1VznGJfagQAYpVUcbTdNBgtkjKSu8AtYDw.jpg', '2025-07-03 00:21:00', '2025-07-03 00:21:00', '6 Months', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ', 1),
(454, 'Diploma in Veterinary Science and Animal Husbandry (D.V.Sc and A.H)', 'public/upload/subject/E4esCyZ1iilub2bVlhPhSlfw6P2xnZMVFNPSbFzA.bin', '2025-07-04 07:39:33', '2025-07-04 07:39:33', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(455, 'Japanese Language', 'public/upload/subject/XpcY5Vw470J6N4XQmkBStD79PsJZjF94WnpRBlKH.png', '2025-07-04 07:47:35', '2025-07-04 07:47:35', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(456, 'Scaffolding Management', 'public/upload/subject/U9CiqJasQnWLABbJLyq14rHFVEJ7yMYMMgh1N8cs.jpg', '2025-07-04 22:38:23', '2025-07-04 22:38:23', '2 Years', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ', 1),
(457, 'Procurement and Purchasing Office', 'public/upload/subject/fJ2MMNwobPhgMUegnducRLoeIKeTAe7h7Q8X9HIq.webp', '2025-07-05 03:29:02', '2025-07-05 03:29:02', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(458, 'Industrial Occupational Health and Safety (IOHS)', 'public/upload/subject/SJxUyPpRxJISh1uvZH91xcV8pMiEYwEXjns8Oy58.jpg', '2025-07-05 03:40:34', '2025-07-05 03:40:34', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(459, 'Diploma in Hotel & Restaurant Management', 'public/upload/subject/kAw4D92W6actrQAmrAwkcaDaQxbb22xxoOoRIDaW.jpg', '2025-07-05 04:40:45', '2025-07-05 04:40:45', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(460, 'Diploma In Culinary Baking and Pastry Arts', 'public/upload/subject/7k0IWOI0meD4wTVIbc8k7urS1Gp11EJ3cJwqv7Nu.jpg', '2025-07-05 22:22:02', '2025-07-05 22:22:02', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(461, 'Knit Sewing Machine Operation', 'public/upload/subject/ykBpfFHcMl7W0WdT0LwFfQrnIsuvpvi1AAvvpZ19.jpg', '2025-07-06 05:11:02', '2025-07-06 05:11:02', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(462, 'Sewing Machine Operation', 'public/upload/subject/d5BoTe9kxMWIkUf4NIRCxoXqbPz8bBxlFoeUQWJE.jpg', '2025-07-06 05:12:37', '2025-07-06 05:12:37', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(463, 'IT Networking', 'public/upload/subject/yWYWSpgo7qwv5ChSGt4FTW8lVA2RjgSNufGxNjdK.jpg', '2025-07-06 13:34:29', '2025-07-06 13:34:29', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ', 1),
(464, 'Manual Packer', 'public/upload/subject/bzQmrOZOiOs8rCPF0qd3O20trWpXhXctMdKa42Rv.webp', '2025-07-06 15:51:40', '2025-07-06 15:51:40', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(465, '4G,6G, TIG, MIG Welding', 'public/upload/subject/yEYCJzrLsO4FY4039HMmlpOvnEuLtTgEnSrLcCje.webp', '2025-07-06 16:00:12', '2025-07-06 16:00:12', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(466, 'Diploma in Professional Housekeeping and Hospitality Services', 'public/upload/subject/NXBnZIGSxa5nTHD01LSdGCMvHTY3mVov2R7wzdTY.jpg', '2025-07-06 17:38:10', '2025-07-06 17:38:10', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(467, 'SMAW Process Welding', 'public/upload/subject/bYsItE6CyD4jFAL2bxNnGfPuenj015PleaM9WegT.jpg', '2025-07-07 08:21:24', '2025-07-07 08:21:24', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(468, '4G, 6G, TIG, and MIG Welding', 'public/upload/subject/IsydQ6Ufnc0YuzxBTwdCX7xjEaFfPrr1sFD3hNEm.jpg', '2025-07-07 17:20:58', '2025-07-07 17:22:51', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(469, 'Higher In Professional Chef and Culinary Arts', 'public/upload/subject/3N1un3wVzUzQ8PVowx4SE9en9hqSn78AI4OEVUnS.jpg', '2025-07-07 17:38:16', '2025-07-07 17:38:16', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(470, 'Diploma in Civil Construction', 'public/upload/subject/SSVAPiCwUnpVkxH42B5BmZe755TtE6cfGtXXZ4Tk.jpg', '2025-07-08 05:18:02', '2025-07-08 05:18:02', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(471, 'Formwork Carpenter', 'public/upload/subject/z185kC91hvXZLTRzEOuei4B2HAvZPUsvBzk0Qfy8.jpg', '2025-07-08 19:43:30', '2025-07-08 19:43:30', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ', 1),
(472, 'Stretcher Bearer and Caregiving', 'public/upload/subject/yZAaZ3rRv9tkbXQ2shuGZjsOjs6feFNmPqlEGeOT.webp', '2025-07-08 22:13:42', '2025-07-08 22:13:42', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(473, 'Diploma In Product Packaging And Shipments', 'public/upload/subject/5c5uMw0es28ciKpXZkITwQwzzUwTqcKrbzYSGJhk.jpg', '2025-07-09 03:13:51', '2025-07-09 03:13:51', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(474, 'Diploma in Architecture', 'public/upload/subject/2pwEEEW4MwmjX7Kux8IJ33LkLJQ0BvuQwprJnUur.jpg', '2025-07-09 07:05:33', '2025-07-09 07:05:33', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(475, 'Management Assistant', 'public/upload/subject/67kQHQ0uei74cFsWRfzBV1mNzcooeVdEaNbrcu9V.jpg', '2025-07-09 07:17:21', '2025-07-09 07:17:21', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(476, 'Customer Service', 'public/upload/subject/BWHSFbhCbq5EXiOhr2Je6IWyUc4zRwUeWjx4WLZP.jpg', '2025-07-09 16:37:13', '2025-07-09 16:37:13', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(477, 'Diploma In Sales & Presentation Skills', 'public/upload/subject/ojwdEX0BVBTGx6XHrKCYUUheRJPGZYXH2ESlo1Uv.jpg', '2025-07-09 16:44:35', '2025-07-10 16:15:33', '6 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(478, 'Food and Beverage (F&B)', 'public/upload/subject/AfHwCV7u6KRcYWzafYwO4k2rIA2KRI810tMlzzno.jpg', '2025-07-09 17:55:23', '2025-07-09 17:55:23', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(479, 'Diploma In Logistics', 'public/upload/subject/kLXafLLJcgUTc5kg7htL7a7HHhDLAdkue4wRLYC5.jpg', '2025-07-10 00:28:25', '2025-07-10 00:28:25', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(480, 'Diploma in Carpentry and Furniture Maker (Interior Design)', 'public/upload/subject/NKzQrse3IW4k8xrXfJd7RRmxixsE2KLzqXMIwrZV.jpg', '2025-07-10 18:49:23', '2025-07-11 07:54:10', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(481, 'Lathe Machine Operator', 'public/upload/subject/vdnGmCRpM2Ge4KJJ7lttE9ek6E7CVLIY9sL9rzRG.jpg', '2025-07-10 19:40:56', '2025-07-10 19:40:56', '1 Year', '15500 -30000/-', 'Jsc, Ssc, Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(482, 'Driving Cum Auto Mechanics', 'public/upload/subject/qOkfOvhTL57h5pPnwO9VB5dedhaRVFXmhr06wU76.jpg', '2025-07-10 21:48:19', '2025-07-10 21:48:19', '6 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(483, 'Computer Business Management', 'public/upload/subject/htMPOzkmVTrNvoUiN6jMNqld43gKpjcivf0dUEhR.jpg', '2025-07-10 21:50:03', '2025-07-10 21:50:03', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(484, 'Diploma In Computer Hardware & Software', 'public/upload/subject/mvaMlOfMfsCJ3DARbxcTNYamArr130ccsGWc9OPe.jpg', '2025-07-12 04:20:55', '2025-07-12 04:20:55', '6 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(485, 'Diploma in TIG Welding', 'public/upload/subject/yRceDm7BGErgR6bxZA5yPh5LxkVRcW354paCUn79.jpg', '2025-07-12 17:57:56', '2025-07-12 17:57:56', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(486, 'Diploma in Computer Office Application', 'public/upload/subject/gYoSCeY4rI1gshUVPQYUWPLILpcPwry8TjKqyLwk.jpg', '2025-07-12 22:49:00', '2025-07-12 22:49:00', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002 অথবা সরাসরি যোগাযোগ করুণ 26/E/A-1st Colony, Mazar Road Mirpur-1, Dhaka-1216 Dhaka, Dhaka - North, Mirpur 1', 0),
(487, 'Driving', 'public/upload/subject/TaTUk3KS7jsYb6Osy8s3ucCoHCwd1dsnntn2LhsF.jpg', '2025-07-13 01:42:10', '2025-07-13 01:42:10', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(488, 'Masonry (Tiles & Marble)', 'public/upload/subject/BYad02Yy5YEhVHqYbjwC7zzGwjPAagVfIc79FNmy.jpg', '2025-07-13 02:49:06', '2025-07-13 02:49:06', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(489, 'Eye Mitra Optician', 'public/upload/subject/S887qU39weFkW4MqDzCSnloeT7BoNLcsSHBoo4vh.png', '2025-07-13 02:53:12', '2025-07-13 02:53:12', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(490, 'HVAC Duct', 'public/upload/subject/KEdLKYvVtmyvZwoixZd8IiDaIri7ZMEVtst4HeXV.jpg', '2025-07-13 06:37:38', '2025-07-13 06:37:38', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(491, 'Masonry (Plastering)', 'public/upload/subject/WDY2IyeGH4VMKBw1jWuvO4yJg3OW4hQ0wRhUX0Wb.jpg', '2025-07-13 06:52:02', '2025-07-13 06:52:02', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(492, 'Sewing Machinist', 'public/upload/subject/1OnSINlEAWYVgGbKNUNbq9m0CS8sfCmwlPRdRNcp.jpg', '2025-07-13 06:52:48', '2025-07-13 06:52:48', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(493, 'Heavy Vehicle Driving', 'public/upload/subject/PBvTnWlb0k2j0MHXg4XmgtmcGRRtTtCPIP1Q45mu.jpg', '2025-07-13 06:54:08', '2025-07-13 06:54:08', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(494, 'Diploma in Arc Welding', 'public/upload/subject/10ya51sPkfKOnZHZbAZwH7BnPWQ8UN8r1YnuYLva.jpg', '2025-07-13 18:08:56', '2025-07-13 18:08:56', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(495, 'MIG Welding', 'public/upload/subject/mFS9Au32MyvDXzr72s9bklbsKY7ZQZ4ZgFBm3f5E.webp', '2025-07-13 18:22:13', '2025-07-13 18:22:13', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(496, 'TIG Welding', 'public/upload/subject/O0305H2vzOod37VGXi6wRK4VvybWqCgDMt2P76wd.webp', '2025-07-13 18:23:13', '2025-07-13 18:23:13', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(497, 'Professional Diploma in Beauty Cosmetology & Salon Management', 'public/upload/subject/3u1Au20ywxN3NY4hNisBBAIpMCsbjBfyO2VjFt5k.webp', '2025-07-14 00:57:20', '2025-07-14 00:57:20', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(498, 'Diploma in Associate Electrical Engineering and Technology', 'public/upload/subject/EJDvl1QHGGqPF5uDhy5lo84nZZguDy824WoQ4Phw.jpg', '2025-07-14 08:40:28', '2025-07-14 08:40:28', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(499, 'Diploma in Caregiving & Family Medicine (C&FM)', 'public/upload/subject/SEvgAmuJBPR4afKpq4hdb0ruTaZziVMLWzaMYlEa.jpg', '2025-07-14 20:27:27', '2025-07-14 20:27:27', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(500, 'Diploma in Electrical Installation & Maintenance', 'public/upload/subject/0uhZbGeBQxvHpglLqcrWeHfqPijMy0c2im41YPRI.webp', '2025-07-14 21:02:34', '2025-07-14 21:02:34', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(501, 'Production And Quality Control In Paint Industry', 'public/upload/subject/Nsj2VHvMt0ZHKRz6UCVG6lQFFpNkzVY0bQdCzrIc.jpg', '2025-07-15 03:42:09', '2025-07-15 04:07:39', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(502, 'Diploma in Professional Chef', 'public/upload/subject/iIi2ViuPwMJsFCVkwxr0pOfAZ6uloyeiQmLXjf5p.jpg', '2025-07-15 16:45:46', '2025-07-15 16:45:46', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(503, 'Python Data Science Entry Level', 'public/upload/subject/znH5nfOsJxa75JsTiLgAJfFZomWafEI4wzvT6jSz.jpg', '2025-07-16 00:34:41', '2025-07-16 00:34:41', '3 Months', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(504, 'Diploma in Chemical Industrial Technology', 'public/upload/subject/BEe9BqKdCqgaN7tWeMI90axocSNWSMq1ONeAIrCr.jpg', '2025-07-16 00:36:11', '2025-07-16 00:36:11', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000-35000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(505, 'Professional Certificate in Barista', 'public/upload/subject/8EWO5MTNeRhZjqYP2QeCfvXtKpLTxti4EQcCFHqn.webp', '2025-07-16 04:07:49', '2025-07-16 04:07:49', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(506, 'Professional Certificate in Heavy Equipment Operation', 'public/upload/subject/ytEcehk8Koe7l3jaH8pcNuA5wcawQecJmU6Nt7K4.jpg', '2025-07-16 04:19:10', '2025-07-16 04:19:10', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(507, 'Electrical House Wiring and Cost Estimation', 'public/upload/subject/TeewmqodKc4qgOXOnwH6ceoSY8GoBHWEGaz931qe.jpg', '2025-07-16 07:08:10', '2025-07-16 07:08:10', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(508, 'Diploma In Waiter', 'public/upload/subject/5d2k5n3HiQNmz7mGuLZbT4SHmr3kHFJIhuUeZBZg.jpg', '2025-07-16 19:55:51', '2025-07-16 19:55:51', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(509, 'Carpenter Wood Finishing', 'public/upload/subject/xDlXTxeR4nr2ql4hzQ73keNGSuBOTx4VgDCCNeZs.jpg', '2025-07-16 23:17:44', '2025-07-16 23:17:44', '1 Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(510, 'Professional Certificate in Aged and Disability Care', 'public/upload/subject/461bUU9KmxVmG8uN3ASdhSqzw5kgteUsRGYeVtu1.webp', '2025-07-17 19:30:00', '2025-07-17 19:30:00', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(511, 'Cutting,Processing & Packaging', 'public/upload/subject/zb7bFwJr7krjxsxaPAp2YtdoXEXwYDTMt6huIUBW.png', '2025-07-18 04:56:49', '2025-07-18 04:56:49', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 0),
(512, 'Carpenter and Furniture Design', 'public/upload/subject/7bB6pjMZ3TE7XSsdglJx5FpEdK732sNU2YFDA3iK.jpg', '2025-07-18 23:36:28', '2025-07-18 23:36:28', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(513, 'Diploma In Autocad', 'public/upload/subject/QXM9YIMO3Ml6gpWHC9mN7uqlTfypIuAa9udh7Mj1.jpg', '2025-07-19 15:44:58', '2025-07-19 15:44:58', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2);
INSERT INTO `subjects` (`id`, `name`, `photo`, `created_at`, `updated_at`, `duration`, `rate`, `education_qualification`, `course_details`, `type`) VALUES
(514, 'Diploma In AutoCAD', 'public/upload/subject/sp34FmXaLUrSItWCTrJUg0JULwa8pdVIzZxGs49g.jpg', '2025-07-19 15:51:42', '2025-07-19 15:51:42', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(515, 'Tourism and Hospitality Management', 'public/upload/subject/ORVm6EVAlKV2ZScChUlv4BNlqWMDOJfmi9gBe3VD.jpg', '2025-07-19 18:03:44', '2025-08-29 04:10:40', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', NULL, 0),
(516, 'Diploma in Software Engineering', 'public/upload/subject/biFLnMlAvpXjxwUGgaHVngDJHwITAFbsOtfovZhJ.jpg', '2025-07-20 10:39:17', '2025-07-20 10:39:17', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Hsc', NULL, 0),
(517, 'Professional Hairdresser', 'public/upload/subject/xaz5EmUQgQIVGGHnJSdneju8JqcmnWpLoQFJ7bS8.jpg', '2025-07-20 10:40:32', '2025-07-20 10:40:32', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(518, 'Poultry Cutting & Processor', 'public/upload/subject/BclRp0AmiFy8DvvDurIdYmv9iqz9pGbKqUUFsLIN.jpg', '2025-07-20 11:00:02', '2025-07-20 11:00:02', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(519, 'Diploma in Technician (TECH)', 'public/upload/subject/vqkI7hlQIm8QDGcwVe5uU5QXGhdNXaz0PJQGWYTl.jpg', '2025-07-20 13:40:26', '2025-07-20 13:40:26', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', NULL, 0),
(520, 'Health and Safety', 'public/upload/subject/MrlubS2LqVt3HA0GlaZhDx1xD1BzumPm4vB7hI4w.jpg', '2025-07-20 14:28:02', '2025-07-20 14:28:02', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', NULL, 0),
(521, 'Civil AutoCAD and Site Supervision', 'public/upload/subject/9BBRHy92C7JNmNpZrxmIral8jDpncJGuQK9PlJbl.webp', '2025-07-21 20:01:53', '2025-07-21 20:01:53', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', NULL, 0),
(522, 'Diploma in Hotel Management And Reservation', 'public/upload/subject/ssEnOl8PQHQcoAsazGTnsl4IKFp3ZKcyAAUCZiNj.jpg', '2025-07-22 01:25:38', '2025-07-22 01:27:18', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 1),
(523, 'Barber', 'public/upload/subject/X36IyImgXHWAEQOC2DCxskqtiu3RqXTuiyK4a1D3.jpg', '2025-07-22 07:20:35', '2025-07-22 07:20:35', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 1),
(524, 'Food Safety (HACCP)', 'public/upload/subject/vXsgiPuVtycg25BPA8qWUN7wUd7IAkQAbZCYdvQA.jpg', '2025-07-22 19:50:58', '2025-07-22 19:50:58', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(525, 'Diploma In Manufacturing Process Engineering', 'public/upload/subject/rLMIYNRnFr0OLaPigr8YscocwwtXK3pTUSw6YKMX.jpg', '2025-07-22 19:53:16', '2025-07-22 19:53:16', '1 Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(526, 'Mechanical Technology', 'public/upload/subject/8ituDuK72xxFtmhh55MyqirE5vgtyzjqp7MyIDta.jpg', '2025-07-22 21:28:19', '2025-07-22 21:28:19', '4 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(527, 'IT technician', 'public/upload/subject/mmZOW9AihQJHp1uyriSESw3sJyOhsP0sbS6b8akw.jpg', '2025-07-23 02:31:09', '2025-07-23 02:31:09', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', NULL, 0),
(528, 'Restaurant Kitchen Assistant', 'public/upload/subject/lcot4OIX628yGEJnAqAfDkMTLRrlsUaTWJWVBL6A.jpg', '2025-07-23 03:03:54', '2025-07-23 03:03:54', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc', NULL, 0),
(529, 'Basic Graphic design', 'public/upload/subject/4InjOEMemlFBhJ5WfHDrw8u5sP9wBHplo6yr7LNp.webp', '2025-07-23 05:16:19', '2025-07-23 05:16:19', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(530, 'Computer Trainer', 'public/upload/subject/OwgslWWgCftm3YOg8FgOle0mq0SVyrOVUiUVcAkM.jpg', '2025-07-23 05:24:13', '2025-07-23 05:24:13', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(531, 'Operating Machinery', 'public/upload/subject/NStkywaaytZ1ir27MURxliV6BeLTkbwAHCWETgYK.jpg', '2025-07-23 06:06:49', '2025-07-23 06:06:49', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(532, 'Diploma in Housekeeping & Garden Cleaning', 'public/upload/subject/zLTx4Podb8HY9X1qPMghXFkWgCEKAoVdy2HYPbnt.jpg', '2025-07-24 04:44:12', '2025-07-24 04:44:12', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(533, 'Diploma in Taxation', 'public/upload/subject/Dbph8u5JorDqoYDb0ouCuxlyAIS25sOeAkXtycG3.jpg', '2025-07-24 05:42:27', '2025-07-24 05:42:27', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(534, 'Diploma In Packaging Management', 'public/upload/subject/NqIu1DRqSFrv6V2VMEApRjG1V2I2cJHVEvHwZ2cB.jpg', '2025-07-25 00:13:41', '2025-07-25 13:10:15', '2 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(535, 'Hotel and Hospitality Management', 'public/upload/subject/g8lrUfAKmZB0oktlALU4sG1fG2Fb2OamDRdFsWLa.jpg', '2025-07-26 00:57:53', '2025-07-26 00:57:53', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(536, 'Certificate of Achievement Manual Lathe and Milling Machine Operator', 'public/upload/subject/ep8fAvNe9XmNpnJjEjxAuIStsJeviF9olI4JgVwD.jpg', '2025-07-26 01:17:35', '2025-07-26 01:17:35', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(537, 'General Electrical', 'public/upload/subject/xuWQXV1AmUeNWnMVVCg0LERKq9zXgdxoRUhxbPS3.jpg', '2025-07-26 01:23:14', '2025-07-26 01:23:14', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(538, 'Computer Science and Communication', 'public/upload/subject/a2XmayTN0dRqAni6fvHtCDz3WdDIH7XCWbkTPS5t.jpg', '2025-07-26 03:09:04', '2025-07-26 03:09:04', '4 Years', '30,000 - 35,000', NULL, 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(539, 'Diploma in Housekeeping Management', 'public/upload/subject/xmR0RPjiOkDORI00qz3LrROwkCnEN47DUwp6OMPc.webp', '2025-07-26 04:17:29', '2025-07-26 04:17:29', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '30,000 - 35,000', 'Jsc,Ssc,Hsc+', NULL, 0),
(540, 'Diploma in Fire Safety Management', 'public/upload/subject/n6WaPJcFXWiyiv2oNKxDJayH8H2eXX3wWQWATnYx.jpg', '2025-07-26 04:18:36', '2025-07-26 04:18:36', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Ssc,Hsc+', NULL, 0),
(541, 'Diploma in Agriculture and Dairy Farming', 'public/upload/subject/Htul531bIdJpS8oCktWDtnkwubx6bLxU6uMXnWUW.jpg', '2025-07-26 04:19:36', '2025-07-26 04:19:36', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 0),
(542, 'Diploma in Electrical House Wiring & Maintenance', 'public/upload/subject/MgWyFxlOS2pbbrEGFS5v9UwJmoMdEolovrpD6YsM.jpg', '2025-07-26 04:21:00', '2025-07-26 04:21:00', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '30,000 - 35,000', 'Jsc,Ssc,Hsc+', NULL, 2),
(543, 'Diploma in Caregiver Training for Elderly, Child & Health Care', 'public/upload/subject/ssvOsatkwlvvJPOH9F4OrpfceVIrpbR0R7Uussp5.jpg', '2025-07-26 04:22:39', '2025-07-26 04:22:39', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '30,000 - 35,000', 'Jsc,Ssc,Hsc+', NULL, 2),
(544, 'Motorcycle And Car Driving', 'public/upload/subject/vefj6tcWINRvC5wqbEd2f6AtrEXhGaqcFOSK25jh.jpg', '2025-07-26 17:58:58', '2025-08-24 19:17:06', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 1),
(545, 'Scientific Assistant', 'public/upload/subject/dLKEcklX4oK5zgn5W7pQEBNUxJABhOps4snJCGqX.webp', '2025-07-27 18:06:36', '2025-07-27 18:06:36', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Ssc,Hsc+', NULL, 0),
(546, 'Sales cum Delivery', 'public/upload/subject/2QheJAbcvb8k2lu2myJAL3nxY5uosMqNf4PRmWuD.webp', '2025-07-28 22:37:10', '2025-07-28 22:37:10', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(547, 'Oxygen Cylinder Handling & Safety', 'public/upload/subject/NBFNlSj8Z92jFdikfXZltcrMNcOZHnLBgvKSKVbG.jpg', '2025-07-29 22:58:57', '2025-07-29 22:58:57', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(548, 'Diploma in Cosmetology and Beautician professional', 'public/upload/subject/d70V2aBPTwueIYZIo3cuZS3cwq5Mf05cpB02iwBD.jpg', '2025-07-29 23:18:09', '2025-07-29 23:18:09', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '30,000 - 35,000', 'Ssc,Hsc+', NULL, 0),
(549, 'Low Current Systems', 'public/upload/subject/zhOae1AoodgiX7K4Ey6f8570nOd0aUkvzJhU0WXx.jpg', '2025-07-30 00:27:34', '2025-07-30 00:27:34', '3-Month, 6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(550, 'Irrigation & Plumbing Technology', 'public/upload/subject/gET3WGtzVJO9uPVwFOPgu4EMnu3pbnTEk4VZVIP9.jpg', '2025-07-30 03:00:07', '2025-07-30 03:00:07', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', NULL, 0),
(551, 'Barbers and hairdressers', 'public/upload/subject/GGxBl37lN7UH4L5ZeN6RqKB0hMx5hBSckovbwa49.jpg', '2025-07-30 04:58:02', '2025-07-30 04:58:02', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Jsc,Ssc', NULL, 0),
(552, 'Barbers and hairdressers', 'public/upload/subject/lPGgUFn1QfnQWTiv4unSSeB1SqT3JnbC2scKeLU4.jpg', '2025-07-30 04:58:16', '2025-07-30 04:58:16', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Jsc,Ssc', NULL, 1),
(553, 'Diploma in Early Childhood Education and Care (ECEC)', 'public/upload/subject/8bVxQ0mCCvRxEo7jsW2dOuCvPgFSRCojMvC4yV20.webp', '2025-07-31 01:51:45', '2025-07-31 01:51:45', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '30,000 - 35,000', 'Jsc,Ssc,Hsc+', NULL, 0),
(554, 'Diploma in Personal Training', 'public/upload/subject/Uzx5tmTIg3Tj9Ch6koAXyMuy0Oz6ZbgdOvW24pPl.jpg', '2025-07-31 15:27:23', '2025-07-31 15:27:23', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '10500-19500', 'Jsc,Ssc,Hsc+', NULL, 0),
(555, 'Diploma in Mechanical Supervisor', 'public/upload/subject/t561NDosBeYmXwffogcrmJTSZI7PSHZSU5qc0b6L.jpg', '2025-08-01 00:28:49', '2025-08-01 00:28:49', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 0),
(556, 'Management System Internal Auditor', 'public/upload/subject/6oElWmHKhn130Ey7BPGxtdhLBcXqZMLgWnjkFAlN.webp', '2025-08-01 18:24:37', '2025-08-01 18:24:37', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Ssc,Hsc+', NULL, 0),
(557, 'Diploma in Butcher', 'public/upload/subject/K470ZjOKFzY7aBAKOfC1o1KuTZMGct0Vhm3DcApE.jpg', '2025-08-01 18:35:42', '2025-08-01 18:35:42', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', NULL, 0),
(558, 'Diploma in Information Technology (IT)', 'public/upload/subject/gQXR7UH3uHQhVdm10RccWk2tSUQperNHtA5azNLK.jpg', '2025-08-01 19:56:15', '2025-08-01 19:56:15', '2 Years', '25000-35000', 'Jsc, Hsc,', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(559, 'Marine Mechanical Technician', 'public/upload/subject/cMO5ONCnaQ9OuKepE3yos8p0BChOXVGm9OOxf8i3.jpg', '2025-08-02 01:23:50', '2025-08-02 01:25:06', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 1),
(560, 'Diploma In Pruner', 'public/upload/subject/lbhm9L6Ckx90Uesfw61yh7d476X4wqus7r1aP5bi.jpg', '2025-08-02 12:17:47', '2025-08-02 12:17:47', '4 Years', '30,000 - 35,000', 'Hsc', 'Young Technical Training , Mirpur , Dhaka', 2),
(561, 'Welding', 'public/upload/subject/xWxSbfdalUMDdQ4ZZEyA2b8vfDMOjLbVldtXWRH2.webp', '2025-08-03 04:45:29', '2025-08-03 04:45:29', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(562, 'Diploma in Construction Contractor', 'public/upload/subject/yQRJlY6NBQGSCaWqhQzmBm6fFaHG6vf8apljiS6A.jpg', '2025-08-04 05:56:57', '2025-08-04 05:56:57', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', NULL, 0),
(563, 'Diploma in Agriculture and Food Service Division', 'public/upload/subject/Yf2MHktcjm0V1et2bDJxp3zRke96j3m9J2M7lXbZ.webp', '2025-08-04 16:27:06', '2025-08-04 16:27:06', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', NULL, 2),
(564, 'Responsible Service of Alcohol (RSA)', 'public/upload/subject/erAsp0DEKbhRanyG3TDsagSltonFR0PGt1RS1Hwg.jpg', '2025-08-04 23:23:23', '2025-08-04 23:23:23', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', NULL, 1),
(565, 'Factory Worker', 'public/upload/subject/UIvXL5MkCkRs5kWG8n4T7Ty07RO53jNRBUHe62Ui.jpg', '2025-08-05 01:24:16', '2025-08-05 01:24:16', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 1),
(566, 'Certified Industrial and Commercial Electrician', 'public/upload/subject/oXnmXUgV3nk9SpWssaZXQqlS3yaJRSYdpd6l4Bqd.jpg', '2025-08-06 01:04:23', '2025-08-06 01:04:23', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(567, 'Certified Industrial Electrician', 'public/upload/subject/AoElOtTuWND7nnlivJawtIgaHQoDkkJhuA3HO6FX.jpg', '2025-08-06 01:04:54', '2025-08-06 01:04:54', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 0),
(568, 'Diploma In Kitchen Chef', 'public/upload/subject/KG4HcXdxN2tG2IDBjg37v0AmRd5pzFnQudvLzlGc.jpg', '2025-08-06 01:23:22', '2025-08-06 01:23:22', '3 Years', '30,000 - 35,000', 'Hsc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(569, 'Diploma in Marine Engineering', 'public/upload/subject/0yPuZckvuGwCNnsJ8eXF6kCDtX3nFg2L1Ckwt5Y8.jpg', '2025-08-06 01:25:34', '2025-08-06 01:25:34', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Ssc,Hsc+', NULL, 0),
(570, 'Diploma in Ship Hull Fitting', 'public/upload/subject/S4JcyGZ3iHNlnTm3dTHQelImuPyPtjIofTSUtSEm.jpg', '2025-08-06 18:35:41', '2025-08-06 18:35:41', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 2),
(571, 'Diploma in Ship Hull Fitter', 'public/upload/subject/C5wbQLx9auTtCeIj4rbJtBPl8EaEUFNJuGThBbZe.jpg', '2025-08-06 18:44:24', '2025-08-06 18:44:24', '2', NULL, NULL, NULL, 2),
(572, 'Diploma In Cybersecurity', 'public/upload/subject/WwPITHZydgmjGzSqkyxZnyW2ZtUdjtGSh7Zfk4Xc.jpg', '2025-08-07 04:12:14', '2025-08-07 04:12:14', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Hsc', NULL, 0),
(573, 'Gold Testing and Hallmark', 'public/upload/subject/88WI0BUa2EDqg9nrMeMp0dIMLlheWt5oWqEGKsW6.webp', '2025-08-08 18:38:42', '2025-08-08 18:42:37', '6-Month, 1-Year, 2-Year', '25,000 - 38,600', 'Jsc,Ssc', NULL, 1),
(574, 'Administrative Support and Digital Marketing', 'public/upload/subject/f0LBBN11IkgB3RibGnefMt12nbh0fheqkQMbRtme.webp', '2025-08-09 14:56:46', '2025-08-09 14:56:46', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '30,000 - 35,000', 'Jsc,Ssc', NULL, 1),
(575, 'Machine Tool Operation', 'public/upload/subject/weDb3zU2PH1IZ31NEVZOw6BCKA4pBEizmTV7IKMx.jpg', '2025-08-09 17:04:15', '2025-08-09 17:04:15', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 1),
(576, 'General Electrician', 'public/upload/subject/ihzGc9zJhXU4N89nN3i1DyFPX16BtgwnmKfW3aRj.webp', '2025-08-09 23:28:21', '2025-08-09 23:28:21', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 1),
(577, 'Certificate in Electrical Installation & Maintenance', 'public/upload/subject/IUuapEiKkKG9woQRRFbcN2AUQN6F8Y2PZAFRZHgs.jpg', '2025-08-10 00:37:42', '2025-08-10 00:37:42', '6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', NULL, 0),
(578, 'Professional Hair Cutting & Styling', 'public/upload/subject/9Bqe2BKIB8MLlu4AJPHcRYfGfZ2YGdGcpxMU18Jz.webp', '2025-08-10 16:07:44', '2025-08-10 16:07:44', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc', NULL, 1),
(579, 'Electrical Works And Maintenance', 'public/upload/subject/vNB8zBiOvTe78jmTK6CyldO1BeGH0Gf8hlfQHVZp.jpg', '2025-08-10 16:51:38', '2025-08-10 16:51:38', '6 Months', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(580, 'Diploma in Auto Mechanical Engineering', 'public/upload/subject/OKqTZzSnqPt2K5DszcyDq8JgTJZijYEnLr6lognW.jpg', '2025-08-10 20:08:52', '2025-08-10 20:08:52', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 2),
(581, 'Marketing Management', 'public/upload/subject/QRsIwigkT16QR2be626nsxNP8PVXLvQtmz3ljfQP.jpg', '2025-08-11 01:18:46', '2025-08-11 01:18:46', '3-Month, 6-Month, 1-Year, 2-Year', '30,000 - 35,000', 'Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(582, 'General Labor', 'public/upload/subject/P3e4qvJWG8Qjib6UUjXTBJs5gUlqeSUNM2N8QtQH.jpg', '2025-08-11 02:15:35', '2025-08-11 02:15:35', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc', NULL, 1),
(583, 'Automobile Engineering', 'public/upload/subject/iIaHj5JZSDW4g982CFB03x3Qi3xwW4Geh8Jepx0o.jpg', '2025-08-11 17:10:08', '2025-08-11 17:10:08', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Jsc,Ssc,Hsc+', NULL, 2),
(584, 'Diploma in Glass Fabrication', 'public/upload/subject/WCZSelIp6rssZmqw3pwvVPQEPgQORFR6dXRN5Byr.jpg', '2025-08-11 20:41:32', '2025-08-11 20:41:32', '3-Month, 6-Month, 1-Year, 2-Year', '15000 -30000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(585, 'Automobile Engineering', 'public/upload/subject/qfPI4vIBl9VLcqjMmyvSmAHltji4yHFmB6kV6wb2.jpg', '2025-08-11 21:21:51', '2025-08-11 21:21:51', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 1),
(586, 'Diploma in Fruit Picking & Packing', 'public/upload/subject/GUOMwjwBgR2d2duir5b1WHkKRwbog7QOVj5yMGqT.jpg', '2025-08-12 16:19:45', '2025-08-12 16:19:45', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '8,500 - 15,500', 'Jsc,Ssc,Hsc+', NULL, 1),
(587, 'Excavator driver', 'public/upload/subject/21kUIewodcChE1zpsxSZ4HZKNl2cvRvBbJvcozKb.jpg', '2025-08-12 17:23:10', '2025-08-12 17:23:10', '3-Month, 6-Month, 1-Year, 2-Year', '10500-19500', 'Jsc,Ssc,Hsc+', NULL, 0),
(588, 'Cosmetic Manufacturing', 'public/upload/subject/I6bRnTr5UUlZJRkCkPCqj0vrf2euDwsVsoXpaPAw.jpg', '2025-08-12 20:07:34', '2025-08-12 20:07:34', '6-Month, 1-Year, 2-Year', '8,500 - 15,500', 'Jsc,Ssc', NULL, 1),
(589, 'Driving', 'public/upload/subject/94TjzSyDwiVuK1GqcxbDmoKmc883LX7XgpGEeLaf.webp', '2025-08-13 16:38:07', '2025-08-13 16:38:07', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25,000 - 38,600', 'Jsc,Ssc,Hsc+', NULL, 1),
(590, 'Diploma in Metal Fabrication', 'public/upload/subject/9y01jxHYq20Amqd31Q4EUH0osUUSDY7uUKtThclx.jpg', '2025-08-14 01:52:50', '2025-08-14 01:52:50', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', NULL, 0),
(591, 'Institution of Occupational Safety and Health (IOSH)', 'public/upload/subject/3ucb8oFYtCrHHN9PlPQQrXmJwO4aEzW82cDkpuJJ.jpg', '2025-08-14 02:11:44', '2025-08-14 02:11:44', '3-Month, 6-Month, 1-Year, 2-Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(592, 'Occupational Safety & Health Administration (OSHA)', 'public/upload/subject/l7VhxpVj05MXCkx30oXu2LqW1hBWRNTT8pvYzW6o.jpg', '2025-08-14 02:13:51', '2025-08-14 02:13:51', '3-Month, 6-Month, 1-Year, 2-Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(593, 'Mason & Concrete Mixer', 'public/upload/subject/6rmTnTtHdfZJeFL7eyHg2iamBftLZSYOWsOmJ7aw.webp', '2025-08-15 00:21:26', '2025-08-15 00:21:26', '3-Month, 6-Month, 1-Year, 2-Year', '15000-35000', 'Jsc,Ssc,Hsc+', NULL, 0),
(594, '1G 2G 3G 4G 5G 6G Mig & Tig Welding', 'public/upload/subject/wkOLaoeHzZ0ltqJ1S82feIwbJehvOoWqah2BP9xm.jpg', '2025-08-17 16:33:34', '2025-08-17 16:33:34', '3-Month, 6-Month, 1-Year, 2-Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(595, 'Digital Business and E-Commerce Management', 'public/upload/subject/R0BvBdSzJbKglYpAOMWGOWygowEVuxSs7lS6y7QL.jpg', '2025-08-18 15:13:26', '2025-08-18 15:13:26', '3-Month, 6-Month, 1-Year, 2-Year', '15500 _', 'Jsc,Ssc,Hsc+', NULL, 0),
(596, 'Certificate of Completion in Pastry & Bakery', 'public/upload/subject/VIQB4so3U5kBJgXksbMHjxXFKmm8LHkgpqBC1Lam.jpg', '2025-08-18 17:25:54', '2025-08-18 17:25:54', '3-Month, 6-Month, 1-Year, 2-Year', '15500 _', 'Jsc,Ssc,Hsc+', NULL, 0),
(597, 'Safety and security', 'public/upload/subject/sdEY0aAfKwUewiS8g82kKwk7PR8tj7HoDN17lZRA.jpg', '2025-08-18 23:48:37', '2025-08-18 23:48:37', '3-Month, 6-Month, 1-Year, 2-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1),
(598, 'Designation Filter', 'public/upload/subject/nYrl3A9h2mraspk0JhYgCMZazWpvyq7DMXLNCywH.webp', '2025-08-19 18:01:23', '2025-08-19 18:01:23', '3-Month, 6-Month, 1-Year, 2-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1),
(599, 'Pipe Fitter', 'public/upload/subject/dlmUF9P27xWD9W7CGLx6cBpYgfpRRYCugMCHLePa.jpg', '2025-08-20 02:47:50', '2025-08-20 02:47:50', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 1),
(600, 'Logistics & Supply Chain', 'public/upload/subject/aENkIQcps4QS5c0ac0PMijU9i8u99IdHJbdmN7e5.jpg', '2025-08-20 04:03:45', '2025-08-20 04:03:45', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Jsc,Ssc,Hsc+', NULL, 1),
(601, 'Furniture Repair and Restoration Specialist', 'public/upload/subject/1VCfXuZMbGThghUIDtCywLKVnD947HUAlfhWaaLH.jpg', '2025-08-21 17:08:10', '2025-08-21 17:08:10', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Jsc,Ssc,Hsc+', NULL, 1),
(602, 'Diploma in Backyard', 'public/upload/subject/Fj58DDVEqWk8Vht3vuYUJHcf7Xr3wr8NxCoB6Jd6.webp', '2025-08-23 02:54:23', '2025-08-23 02:54:23', '3-Month, 6-Month, 1-Year, 2-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1),
(603, 'Diploma in Pipe  Fitter', 'public/upload/subject/y6NsnSrhkmqRO9Xd1HIpflaxe9uFvfMX8CVVJa7e.jpg', '2025-08-23 03:24:33', '2025-08-23 03:25:51', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 2),
(604, 'Industrial Electrical and Electronic Control', 'public/upload/subject/tnxdkRNKVuXZLKkbuwOzFQJf5g9QWYAzUfPRfRt3.webp', '2025-08-23 18:07:52', '2025-08-23 18:07:52', '3-Month, 6-Month, 1-Year, 2-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1),
(605, 'General Construction Safety', 'public/upload/subject/ZdbsApCz5bYJTKfKBTnO6h0KGtq97s52a45A10ic.jpg', '2025-08-24 05:18:24', '2025-08-24 05:18:24', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '25000-35000', 'Jsc,Ssc,Hsc+', NULL, 1),
(606, 'Diploma in Bakery and Pastry', 'public/upload/subject/dhI9w1TzxBHev8ObVQwy0uhSgsUtZdQJkCxnWNnd.jpg', '2025-08-24 17:06:01', '2025-08-24 17:06:01', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 2),
(607, 'Kitchen Helper and Dishwasher', 'public/upload/subject/vlUmTr2vdqkGiYyHIjmOYjwSeUOvQVCg1vUl9Xln.jpg', '2025-08-24 17:57:24', '2025-08-24 17:57:24', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1),
(608, 'Diploma In Marketing Management', 'public/upload/subject/88B36y2CynK5Sq6ubETEx9znGWhvnzreemcEF1Z4.png', '2025-08-25 19:59:28', '2025-08-25 19:59:28', '3-Month, 6-Month, 1-Year, 2-Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(609, 'Diploma in Thai Aluminum And Fabrication', 'public/upload/subject/xlLt7gpouM2GqHq4cBHaPdQlIaBciIbEzRXohkuv.jpg', '2025-08-27 04:47:10', '2025-08-27 04:47:10', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1),
(610, 'Diploma InTechnology Management', 'public/upload/subject/YHam0sSWAh4foC4FOLySqAabE5BjwEpagaG3zadc.jpg', '2025-08-28 15:32:17', '2025-08-28 15:32:17', '3-Month, 6-Month, 1-Year, 2-Year', '30,000 - 35,000', 'Ssc', 'বিস্তারিত জানতে কল করুন এই নাম্বার এ 09649700002', 2),
(611, 'Entrepreneurship development (ED)', 'public/upload/subject/ZtYAcAslBwgI7RUGxcTCTArJEgwMGGo1WxPKRNXL.jpg', '2025-08-28 16:39:07', '2025-08-28 16:39:07', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1),
(612, 'Excel for Data Analysis', 'public/upload/subject/3NKuEf2gfYFuvUnJwANPMvq1xcDchNZ5yJsySNLk.jpg', '2025-08-29 15:05:44', '2025-08-29 15:05:44', '6-Month, 1-Year, 2-Year, 3-Year, 4-Year', '15000 - 30000', 'Jsc,Ssc,Hsc+', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bn_name` varchar(255) DEFAULT NULL,
  `ar_name` varchar(255) DEFAULT NULL,
  `bn_designation` varchar(255) DEFAULT NULL,
  `ar_designation` varchar(255) DEFAULT NULL,
  `bn_description` longtext DEFAULT NULL,
  `ar_description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `en` text DEFAULT NULL,
  `bn` text DEFAULT NULL,
  `ar` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE `upazilas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`id`, `district_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Debidwar', NULL, NULL),
(2, 1, 'Barura', NULL, NULL),
(3, 1, 'Brahmanpara', NULL, NULL),
(4, 1, 'Chandina', NULL, NULL),
(5, 1, 'Chauddagram', NULL, NULL),
(6, 1, 'Daudkandi', NULL, NULL),
(7, 1, 'Homna', NULL, NULL),
(8, 1, 'Laksam', NULL, NULL),
(9, 1, 'Muradnagar', NULL, NULL),
(10, 1, 'Nangalkot', NULL, NULL),
(11, 1, 'Cumilla Sadar', NULL, NULL),
(12, 1, 'Meghna', NULL, NULL),
(13, 1, 'Monohargonj', NULL, NULL),
(14, 1, 'Cumilla Sadar Dakshin', NULL, NULL),
(15, 1, 'Titas', NULL, NULL),
(16, 1, 'Burichang', NULL, NULL),
(17, 1, 'Lalmai', NULL, NULL),
(18, 2, 'Chhagalnaiya', NULL, NULL),
(19, 2, 'Feni Sadar', NULL, NULL),
(20, 2, 'Sonagazi', NULL, NULL),
(21, 2, 'Fulgazi', NULL, NULL),
(22, 2, 'Parshuram', NULL, NULL),
(23, 2, 'Daganbhuiyan', NULL, NULL),
(24, 3, 'Brahmanbaria Sadar', NULL, NULL),
(25, 3, 'Kasba', NULL, NULL),
(26, 3, 'Nasirnagar', NULL, NULL),
(27, 3, 'Sarail', NULL, NULL),
(28, 3, 'Ashuganj', NULL, NULL),
(29, 3, 'Akhaura', NULL, NULL),
(30, 3, 'Nabinagar', NULL, NULL),
(31, 3, 'Bancharampur', NULL, NULL),
(32, 3, 'Bijoynagar', NULL, NULL),
(33, 4, 'Rangamati Sadar', NULL, NULL),
(34, 4, 'Kaptai', NULL, NULL),
(35, 4, 'Kawkhali', NULL, NULL),
(36, 4, 'Baghaichari', NULL, NULL),
(37, 4, 'Barkal', NULL, NULL),
(38, 4, 'Langadu', NULL, NULL),
(39, 4, 'Rajasthali', NULL, NULL),
(40, 4, 'Belaichari', NULL, NULL),
(41, 4, 'Juraichari', NULL, NULL),
(42, 4, 'Naniarchar', NULL, NULL),
(43, 5, 'Noakhali Sadar', NULL, NULL),
(44, 5, 'Companiganj', NULL, NULL),
(45, 5, 'Begumganj', NULL, NULL),
(46, 5, 'Hatia', NULL, NULL),
(47, 5, 'Subarnachar', NULL, NULL),
(48, 5, 'Kabirhat', NULL, NULL),
(49, 5, 'Senbagh', NULL, NULL),
(50, 5, 'Chatkhil', NULL, NULL),
(51, 5, 'Sonaimuri', NULL, NULL),
(52, 6, 'Haimchar', NULL, NULL),
(53, 6, 'Kachua', NULL, NULL),
(54, 6, 'Shahrasti', NULL, NULL),
(55, 6, 'Chandpur Sadar', NULL, NULL),
(56, 6, 'Matlab South', NULL, NULL),
(57, 6, 'Haziganj', NULL, NULL),
(58, 6, 'Matlab North', NULL, NULL),
(59, 6, 'Faridganj', NULL, NULL),
(60, 7, 'Lakshmipur Sadar', NULL, NULL),
(61, 7, 'Kamalnagar', NULL, NULL),
(62, 7, 'Raipur', NULL, NULL),
(63, 7, 'Ramgati', NULL, NULL),
(64, 7, 'Ramganj', NULL, NULL),
(65, 8, 'Rangunia', NULL, NULL),
(66, 8, 'Sitakunda', NULL, NULL),
(67, 8, 'Mirsharai', NULL, NULL),
(68, 8, 'Patiya', NULL, NULL),
(69, 8, 'Sandwip', NULL, NULL),
(70, 8, 'Banshkhali', NULL, NULL),
(71, 8, 'Boalkhali', NULL, NULL),
(72, 8, 'Anwara', NULL, NULL),
(73, 8, 'Chandanaish', NULL, NULL),
(74, 8, 'Satkania', NULL, NULL),
(75, 8, 'Lohagara', NULL, NULL),
(76, 8, 'Hathazari', NULL, NULL),
(77, 8, 'Fatikchhari', NULL, NULL),
(78, 8, 'Raozan', NULL, NULL),
(79, 8, 'Karnafuli', NULL, NULL),
(80, 9, 'Cox\'s Bazar Sadar', NULL, NULL),
(81, 9, 'Chakaria', NULL, NULL),
(82, 9, 'Kutubdia', NULL, NULL),
(83, 9, 'Ukhiya', NULL, NULL),
(84, 9, 'Moheshkhali', NULL, NULL),
(85, 9, 'Pekua', NULL, NULL),
(86, 9, 'Ramu', NULL, NULL),
(87, 9, 'Teknaf', NULL, NULL),
(88, 10, 'Khagrachari Sadar', NULL, NULL),
(89, 10, 'Dighinala', NULL, NULL),
(90, 10, 'Panchhari', NULL, NULL),
(91, 10, 'Luxmichari', NULL, NULL),
(92, 10, 'Mahalchari', NULL, NULL),
(93, 10, 'Manikchari', NULL, NULL),
(94, 10, 'Ramgarh', NULL, NULL),
(95, 10, 'Matiranga', NULL, NULL),
(96, 10, 'Guimara', NULL, NULL),
(97, 11, 'Bandarban Sadar', NULL, NULL),
(98, 11, 'Alikadam', NULL, NULL),
(99, 11, 'Naikhongchhari', NULL, NULL),
(100, 11, 'Rowangchhari', NULL, NULL),
(101, 11, 'Lama', NULL, NULL),
(102, 11, 'Ruma', NULL, NULL),
(103, 11, 'Thanchi', NULL, NULL),
(104, 12, 'Belkuchi', NULL, NULL),
(105, 12, 'Chauhali', NULL, NULL),
(106, 12, 'Kamarkhanda', NULL, NULL),
(107, 12, 'Kazipur', NULL, NULL),
(108, 12, 'Raiganj', NULL, NULL),
(109, 12, 'Shahjadpur', NULL, NULL),
(110, 12, 'Sirajganj Sadar', NULL, NULL),
(111, 12, 'Tarash', NULL, NULL),
(112, 12, 'Ullapara', NULL, NULL),
(113, 13, 'Sujanagar', NULL, NULL),
(114, 13, 'Ishwardi', NULL, NULL),
(115, 13, 'Bhangura', NULL, NULL),
(116, 13, 'Pabna Sadar', NULL, NULL),
(117, 13, 'Bera', NULL, NULL),
(118, 13, 'Atghoria', NULL, NULL),
(119, 13, 'Chatmohar', NULL, NULL),
(120, 13, 'Santhia', NULL, NULL),
(121, 13, 'Faridpur', NULL, NULL),
(122, 14, 'Kahaloo', NULL, NULL),
(123, 14, 'Bogra Sadar', NULL, NULL),
(124, 14, 'Sariakandi', NULL, NULL),
(125, 14, 'Shajahanpur', NULL, NULL),
(126, 14, 'Dupchanchia', NULL, NULL),
(127, 14, 'Adamdighi', NULL, NULL),
(128, 14, 'Nandigram', NULL, NULL),
(129, 14, 'Sonatala', NULL, NULL),
(130, 14, 'Dhunat', NULL, NULL),
(131, 14, 'Gabtali', NULL, NULL),
(132, 14, 'Sherpur', NULL, NULL),
(133, 14, 'Shibganj', NULL, NULL),
(134, 15, 'Paba', NULL, NULL),
(135, 15, 'Durgapur', NULL, NULL),
(136, 15, 'Mohanpur', NULL, NULL),
(137, 15, 'Charghat', NULL, NULL),
(138, 15, 'Puthia', NULL, NULL),
(139, 15, 'Bagha', NULL, NULL),
(140, 15, 'Godagari', NULL, NULL),
(141, 15, 'Tanore', NULL, NULL),
(142, 15, 'Bagmara', NULL, NULL),
(143, 16, 'Natore Sadar', NULL, NULL),
(144, 16, 'Singra', NULL, NULL),
(145, 16, 'Baraigram', NULL, NULL),
(146, 16, 'Bagatipara', NULL, NULL),
(147, 16, 'Lalpur', NULL, NULL),
(148, 16, 'Gurudaspur', NULL, NULL),
(149, 16, 'Naldanga', NULL, NULL),
(150, 17, 'Akkelpur', NULL, NULL),
(151, 17, 'Kalai', NULL, NULL),
(152, 17, 'Khetlal', NULL, NULL),
(153, 17, 'Panchbibi', NULL, NULL),
(154, 17, 'Joypurhat Sadar', NULL, NULL),
(155, 18, 'Nawabganj Sadar', NULL, NULL),
(156, 18, 'Gomastapur', NULL, NULL),
(157, 18, 'Nachole', NULL, NULL),
(158, 18, 'Bholahat', NULL, NULL),
(159, 18, 'Shibganj', NULL, NULL),
(160, 19, 'Mohadevpur', NULL, NULL),
(161, 19, 'Badalgachi', NULL, NULL),
(162, 19, 'Patnitala', NULL, NULL),
(163, 19, 'Dhamoirhat', NULL, NULL),
(164, 19, 'Niamatpur', NULL, NULL),
(165, 19, 'Manda', NULL, NULL),
(166, 19, 'Atrai', NULL, NULL),
(167, 19, 'Raninagar', NULL, NULL),
(168, 19, 'Naogaon Sadar', NULL, NULL),
(169, 19, 'Porsha', NULL, NULL),
(170, 19, 'Sapahar', NULL, NULL),
(171, 20, 'Manirampur', NULL, NULL),
(172, 20, 'Abhaynagar', NULL, NULL),
(173, 20, 'Bagherpara', NULL, NULL),
(174, 20, 'Chowgacha', NULL, NULL),
(175, 20, 'Jhikargacha', NULL, NULL),
(176, 20, 'Keshabpur', NULL, NULL),
(177, 20, 'Jashore Sadar', NULL, NULL),
(178, 20, 'Sharsha', NULL, NULL),
(179, 21, 'Assasuni', NULL, NULL),
(180, 21, 'Debhata', NULL, NULL),
(181, 21, 'Kalaroa', NULL, NULL),
(182, 21, 'Satkhira Sadar', NULL, NULL),
(183, 21, 'Shyamnagar', NULL, NULL),
(184, 21, 'Tala', NULL, NULL),
(185, 21, 'Kaliganj', NULL, NULL),
(186, 22, 'Mujibnagar', NULL, NULL),
(187, 22, 'Meherpur Sadar', NULL, NULL),
(188, 22, 'Gangni', NULL, NULL),
(189, 23, 'Narail Sadar', NULL, NULL),
(190, 23, 'Lohagara', NULL, NULL),
(191, 23, 'Kalia', NULL, NULL),
(192, 24, 'Chuadanga Sadar', NULL, NULL),
(193, 24, 'Alamdanga', NULL, NULL),
(194, 24, 'Damurhuda', NULL, NULL),
(195, 24, 'Jibannagar', NULL, NULL),
(196, 25, 'Kushtia Sadar', NULL, NULL),
(197, 25, 'Kumarkhali', NULL, NULL),
(198, 25, 'Khoksa', NULL, NULL),
(199, 25, 'Mirpur', NULL, NULL),
(200, 25, 'Daulatpur', NULL, NULL),
(201, 25, 'Bheramara', NULL, NULL),
(202, 26, 'Shalikha', NULL, NULL),
(203, 26, 'Sreepur', NULL, NULL),
(204, 26, 'Magura Sadar', NULL, NULL),
(205, 26, 'Mohammadpur', NULL, NULL),
(206, 27, 'Paikgacha', NULL, NULL),
(207, 27, 'Phultala', NULL, NULL),
(208, 27, 'Dighalia', NULL, NULL),
(209, 27, 'Rupsha', NULL, NULL),
(210, 27, 'Terokhada', NULL, NULL),
(211, 27, 'Dumuria', NULL, NULL),
(212, 27, 'Batiaghata', NULL, NULL),
(213, 27, 'Dakop', NULL, NULL),
(214, 27, 'Koyra', NULL, NULL),
(215, 28, 'Fakirhat', NULL, NULL),
(216, 28, 'Bagerhat Sadar', NULL, NULL),
(217, 28, 'Mollahat', NULL, NULL),
(218, 28, 'Sarankhola', NULL, NULL),
(219, 28, 'Rampal', NULL, NULL),
(220, 28, 'Morrelganj', NULL, NULL),
(221, 28, 'Kachua', NULL, NULL),
(222, 28, 'Mongla', NULL, NULL),
(223, 28, 'Chitalmari', NULL, NULL),
(224, 29, 'Jhenaidah Sadar', NULL, NULL),
(225, 29, 'Shailkupa', NULL, NULL),
(226, 29, 'Harinakundu', NULL, NULL),
(227, 29, 'Kaliganj', NULL, NULL),
(228, 29, 'Kotchandpur', NULL, NULL),
(229, 29, 'Maheshpur', NULL, NULL),
(230, 30, 'Jhalakathi Sadar', NULL, NULL),
(231, 30, 'Kathalia', NULL, NULL),
(232, 30, 'Nalchity', NULL, NULL),
(233, 30, 'Rajapur', NULL, NULL),
(234, 31, 'Bauphal', NULL, NULL),
(235, 31, 'Patuakhali Sadar', NULL, NULL),
(236, 31, 'Dumki', NULL, NULL),
(237, 31, 'Dashmina', NULL, NULL),
(238, 31, 'Kalapara', NULL, NULL),
(239, 31, 'Mirzaganj', NULL, NULL),
(240, 31, 'Galachipa', NULL, NULL),
(241, 31, 'Rangabali', NULL, NULL),
(242, 32, 'Pirojpur Sadar', NULL, NULL),
(243, 32, 'Nazirpur', NULL, NULL),
(244, 32, 'Kawkhali', NULL, NULL),
(245, 32, 'Zianagar', NULL, NULL),
(246, 32, 'Bhandaria', NULL, NULL),
(247, 32, 'Mathbaria', NULL, NULL),
(248, 32, 'Nesarabad(Swarupkati)', NULL, NULL),
(249, 33, 'Barisal Sadar', NULL, NULL),
(250, 33, 'Bakerganj', NULL, NULL),
(251, 33, 'Babuganj', NULL, NULL),
(252, 33, 'Wazirpur', NULL, NULL),
(253, 33, 'Banaripara', NULL, NULL),
(254, 33, 'Gournadi', NULL, NULL),
(255, 33, 'Agailjhara', NULL, NULL),
(256, 33, 'Mehendiganj', NULL, NULL),
(257, 33, 'Muladi', NULL, NULL),
(258, 33, 'Hizla', NULL, NULL),
(259, 34, 'Bhola Sadar', NULL, NULL),
(260, 34, 'Borhanuddin', NULL, NULL),
(261, 34, 'Char Fasson', NULL, NULL),
(262, 34, 'Daulatkhan', NULL, NULL),
(263, 34, 'Manpura', NULL, NULL),
(264, 34, 'Tazumuddin', NULL, NULL),
(265, 34, 'Lalmohan', NULL, NULL),
(266, 35, 'Amtali', NULL, NULL),
(267, 35, 'Barguna Sadar', NULL, NULL),
(268, 35, 'Betagi', NULL, NULL),
(269, 35, 'Bamna', NULL, NULL),
(270, 35, 'Patharghata', NULL, NULL),
(271, 35, 'Taltali', NULL, NULL),
(272, 36, 'Balaganj', NULL, NULL),
(273, 36, 'Beanibazar', NULL, NULL),
(274, 36, 'Bishwanath', NULL, NULL),
(275, 36, 'Companiganj', NULL, NULL),
(276, 36, 'Fenchuganj', NULL, NULL),
(277, 36, 'Golapganj', NULL, NULL),
(278, 36, 'Gowainghat', NULL, NULL),
(279, 36, 'Jaintiapur', NULL, NULL),
(280, 36, 'Kanaighat', NULL, NULL),
(281, 36, 'Sylhet Sadar', NULL, NULL),
(282, 36, 'Zakiganj', NULL, NULL),
(283, 36, 'Dakshin Surma', NULL, NULL),
(284, 36, 'Osmaninagar', NULL, NULL),
(285, 37, 'Barlekha', NULL, NULL),
(286, 37, 'Kamalganj', NULL, NULL),
(287, 37, 'Kulaura', NULL, NULL),
(288, 37, 'Moulvibazar Sadar', NULL, NULL),
(289, 37, 'Rajnagar', NULL, NULL),
(290, 37, 'Sreemangal', NULL, NULL),
(291, 37, 'Juri', NULL, NULL),
(292, 38, 'Nabiganj', NULL, NULL),
(293, 38, 'Bahubal', NULL, NULL),
(294, 38, 'Ajmiriganj', NULL, NULL),
(295, 38, 'Baniachong', NULL, NULL),
(296, 38, 'Lakhai', NULL, NULL),
(297, 38, 'Chunarughat', NULL, NULL),
(298, 38, 'Habiganj Sadar', NULL, NULL),
(299, 38, 'Madhabpur', NULL, NULL),
(300, 39, 'Sunamganj Sadar', NULL, NULL),
(301, 39, 'South Sunamganj', NULL, NULL),
(302, 39, 'Bishwamvarpur', NULL, NULL),
(303, 39, 'Chhatak', NULL, NULL),
(304, 39, 'Jagannathpur', NULL, NULL),
(305, 39, 'Dowarabazar', NULL, NULL),
(306, 39, 'Tahirpur', NULL, NULL),
(307, 39, 'Dharmapasha', NULL, NULL),
(308, 39, 'Jamalganj', NULL, NULL),
(309, 39, 'Sullah', NULL, NULL),
(310, 39, 'Derai', NULL, NULL),
(311, 40, 'Belabo', NULL, NULL),
(312, 40, 'Monohardi', NULL, NULL),
(313, 40, 'Narsingdi Sadar', NULL, NULL),
(314, 40, 'Palash', NULL, NULL),
(315, 40, 'Raipura', NULL, NULL),
(316, 40, 'Shibpur', NULL, NULL),
(317, 41, 'Kaliganj', NULL, NULL),
(318, 41, 'Kaliakair', NULL, NULL),
(319, 41, 'Kapasia', NULL, NULL),
(320, 41, 'Gazipur Sadar', NULL, NULL),
(321, 41, 'Sreepur', NULL, NULL),
(322, 42, 'Shariatpur Sadar', NULL, NULL),
(323, 42, 'Naria', NULL, NULL),
(324, 42, 'Zajira', NULL, NULL),
(325, 42, 'Gosairhat', NULL, NULL),
(326, 42, 'Bhedarganj', NULL, NULL),
(327, 42, 'Damudya', NULL, NULL),
(328, 43, 'Araihazar', NULL, NULL),
(329, 43, 'Bandar', NULL, NULL),
(330, 43, 'Narayanganj Sadar', NULL, NULL),
(331, 43, 'Rupganj', NULL, NULL),
(332, 43, 'Sonargaon', NULL, NULL),
(333, 44, 'Basail', NULL, NULL),
(334, 44, 'Bhuapur', NULL, NULL),
(335, 44, 'Delduar', NULL, NULL),
(336, 44, 'Ghatail', NULL, NULL),
(337, 44, 'Gopalpur', NULL, NULL),
(338, 44, 'Madhupur', NULL, NULL),
(339, 44, 'Mirzapur', NULL, NULL),
(340, 44, 'Nagarpur', NULL, NULL),
(341, 44, 'Sakhipur', NULL, NULL),
(342, 44, 'Tangail Sadar', NULL, NULL),
(343, 44, 'Kalihati', NULL, NULL),
(344, 44, 'Dhanbari', NULL, NULL),
(345, 45, 'Itna', NULL, NULL),
(346, 45, 'Katiadi', NULL, NULL),
(347, 45, 'Bhairab', NULL, NULL),
(348, 45, 'Tarail', NULL, NULL),
(349, 45, 'Hossainpur', NULL, NULL),
(350, 45, 'Pakundia', NULL, NULL),
(351, 45, 'Kuliarchar', NULL, NULL),
(352, 45, 'Kishoreganj Sadar', NULL, NULL),
(353, 45, 'Karimganj', NULL, NULL),
(354, 45, 'Bajitpur', NULL, NULL),
(355, 45, 'Austagram', NULL, NULL),
(356, 45, 'Mithamoin', NULL, NULL),
(357, 45, 'Nikli', NULL, NULL),
(358, 46, 'Harirampur', NULL, NULL),
(359, 46, 'Saturia', NULL, NULL),
(360, 46, 'Manikganj Sadar', NULL, NULL),
(361, 46, 'Ghior', NULL, NULL),
(362, 46, 'Shivalaya', NULL, NULL),
(363, 46, 'Doulatpur', NULL, NULL),
(364, 46, 'Singair', NULL, NULL),
(365, 47, 'Savar', NULL, NULL),
(366, 47, 'Dhamrai', NULL, NULL),
(367, 47, 'Keraniganj', NULL, NULL),
(368, 47, 'Nawabganj', NULL, NULL),
(369, 47, 'Dohar', NULL, NULL),
(370, 48, 'Munshiganj Sadar', NULL, NULL),
(371, 48, 'Sreenagar', NULL, NULL),
(372, 48, 'Sirajdikhan', NULL, NULL),
(373, 48, 'Louhajanj', NULL, NULL),
(374, 48, 'Gazaria', NULL, NULL),
(375, 48, 'Tongibari', NULL, NULL),
(376, 49, 'Rajbari Sadar', NULL, NULL),
(377, 49, 'Goalanda', NULL, NULL),
(378, 49, 'Pangsa', NULL, NULL),
(379, 49, 'Baliakandi', NULL, NULL),
(380, 49, 'Kalukhali', NULL, NULL),
(381, 50, 'Madaripur Sadar', NULL, NULL),
(382, 50, 'Shibchar', NULL, NULL),
(383, 50, 'Kalkini', NULL, NULL),
(384, 50, 'Rajoir', NULL, NULL),
(385, 51, 'Gopalganj Sadar', NULL, NULL),
(386, 51, 'Kashiani', NULL, NULL),
(387, 51, 'Tungipara', NULL, NULL),
(388, 51, 'Kotalipara', NULL, NULL),
(389, 51, 'Muksudpur', NULL, NULL),
(390, 52, 'Faridpur Sadar', NULL, NULL),
(391, 52, 'Alfadanga', NULL, NULL),
(392, 52, 'Boalmari', NULL, NULL),
(393, 52, 'Sadarpur', NULL, NULL),
(394, 52, 'Nagarkanda', NULL, NULL),
(395, 52, 'Bhanga', NULL, NULL),
(396, 52, 'Charbhadrasan', NULL, NULL),
(397, 52, 'Madhukhali', NULL, NULL),
(398, 52, 'Saltha', NULL, NULL),
(399, 53, 'Panchagarh Sadar', NULL, NULL),
(400, 53, 'Debiganj', NULL, NULL),
(401, 53, 'Boda', NULL, NULL),
(402, 53, 'Atwari', NULL, NULL),
(403, 53, 'Tetulia', NULL, NULL),
(404, 54, 'Nawabganj', NULL, NULL),
(405, 54, 'Birganj', NULL, NULL),
(406, 54, 'Ghoraghat', NULL, NULL),
(407, 54, 'Birampur', NULL, NULL),
(408, 54, 'Parbatipur', NULL, NULL),
(409, 54, 'Bochaganj', NULL, NULL),
(410, 54, 'Kaharol', NULL, NULL),
(411, 54, 'Fulbari', NULL, NULL),
(412, 54, 'Dinajpur Sadar', NULL, NULL),
(413, 54, 'Hakimpur', NULL, NULL),
(414, 54, 'Khansama', NULL, NULL),
(415, 54, 'Biral', NULL, NULL),
(416, 54, 'Chirirbandar', NULL, NULL),
(417, 55, 'Lalmonirhat Sadar', NULL, NULL),
(418, 55, 'Kaliganj', NULL, NULL),
(419, 55, 'Hatibandha', NULL, NULL),
(420, 55, 'Patgram', NULL, NULL),
(421, 55, 'Aditmari', NULL, NULL),
(422, 56, 'Saidpur', NULL, NULL),
(423, 56, 'Domar', NULL, NULL),
(424, 56, 'Dimla', NULL, NULL),
(425, 56, 'Jaldhaka', NULL, NULL),
(426, 56, 'Kishoreganj', NULL, NULL),
(427, 56, 'Nilphamari Sadar', NULL, NULL),
(428, 57, 'Sadullapur', NULL, NULL),
(429, 57, 'Gaibandha Sadar', NULL, NULL),
(430, 57, 'Palashbari', NULL, NULL),
(431, 57, 'Saghata', NULL, NULL),
(432, 57, 'Gobindaganj', NULL, NULL),
(433, 57, 'Sundarganj', NULL, NULL),
(434, 57, 'Phulchari', NULL, NULL),
(435, 58, 'Thakurgaon Sadar', NULL, NULL),
(436, 58, 'Pirganj', NULL, NULL),
(437, 58, 'Ranisankail', NULL, NULL),
(438, 58, 'Haripur', NULL, NULL),
(439, 58, 'Baliadangi', NULL, NULL),
(440, 59, 'Rangpur Sadar', NULL, NULL),
(441, 59, 'Gangachara', NULL, NULL),
(442, 59, 'Taraganj', NULL, NULL),
(443, 59, 'Badarganj', NULL, NULL),
(444, 59, 'Mithapukur', NULL, NULL),
(445, 59, 'Pirganj', NULL, NULL),
(446, 59, 'Kaunia', NULL, NULL),
(447, 59, 'Pirgacha', NULL, NULL),
(448, 60, 'Kurigram Sadar', NULL, NULL),
(449, 60, 'Nageshwari', NULL, NULL),
(450, 60, 'Bhurungamari', NULL, NULL),
(451, 60, 'Phulbari', NULL, NULL),
(452, 60, 'Rajarhat', NULL, NULL),
(453, 60, 'Ulipur', NULL, NULL),
(454, 60, 'Chilmari', NULL, NULL),
(455, 60, 'Rowmari', NULL, NULL),
(456, 60, 'Char Rajibpur', NULL, NULL),
(457, 61, 'Sherpur Sadar', NULL, NULL),
(458, 61, 'Nalitabari', NULL, NULL),
(459, 61, 'Sreebardi', NULL, NULL),
(460, 61, 'Nakla', NULL, NULL),
(461, 61, 'Jhenaigati', NULL, NULL),
(462, 62, 'Fulbaria', NULL, NULL),
(463, 62, 'Trishal', NULL, NULL),
(464, 62, 'Bhaluka', NULL, NULL),
(465, 62, 'Muktagacha', NULL, NULL),
(466, 62, 'Mymensingh Sadar', NULL, NULL),
(467, 62, 'Dhobaura', NULL, NULL),
(468, 62, 'Phulpur', NULL, NULL),
(469, 62, 'Haluaghat', NULL, NULL),
(470, 62, 'Gouripur', NULL, NULL),
(471, 62, 'Gafargaon', NULL, NULL),
(472, 62, 'Ishwarganj', NULL, NULL),
(473, 62, 'Nandail', NULL, NULL),
(474, 62, 'Tarakanda', NULL, NULL),
(475, 63, 'Jamalpur Sadar', NULL, NULL),
(476, 63, 'Melandaha', NULL, NULL),
(477, 63, 'Islampur', NULL, NULL),
(478, 63, 'Dewanganj', NULL, NULL),
(479, 63, 'Sarishabari', NULL, NULL),
(480, 63, 'Madarganj', NULL, NULL),
(481, 63, 'Bakshiganj', NULL, NULL),
(482, 64, 'Barhatta', NULL, NULL),
(483, 64, 'Durgapur', NULL, NULL),
(484, 64, 'Kendua', NULL, NULL),
(485, 64, 'Atpara', NULL, NULL),
(486, 64, 'Madan', NULL, NULL),
(487, 64, 'Khaliajuri', NULL, NULL),
(488, 64, 'Kalmakanda', NULL, NULL),
(489, 64, 'Mohanganj', NULL, NULL),
(490, 64, 'Purbadhala', NULL, NULL),
(491, 64, 'Netrokona Sadar', NULL, NULL),
(492, 39, 'Madhyanagar', NULL, NULL),
(493, 38, 'Shayestaganj', NULL, NULL),
(494, 32, 'Indurkani', NULL, NULL),
(495, 50, 'Dasar', NULL, NULL),
(496, 15, 'Motihar', NULL, NULL),
(497, 15, 'Shah Makhdum', NULL, NULL),
(498, 15, 'Boalia', NULL, NULL),
(499, 15, 'Rajpara', NULL, NULL),
(500, 36, 'Shah Paran', NULL, NULL),
(501, 36, 'South Surma', NULL, NULL),
(502, 36, 'Moglabazar', NULL, NULL),
(503, 36, 'Jalalabad', NULL, NULL),
(504, 36, 'Bimanbandar', NULL, NULL),
(505, 27, 'Kotwali', NULL, NULL),
(506, 27, 'Khalishpur', NULL, NULL),
(507, 27, 'Sonadanga', NULL, NULL),
(508, 27, 'Daulatpur', NULL, NULL),
(509, 27, 'Khan Jahan Ali', NULL, NULL),
(510, 59, 'Kawnia', NULL, NULL),
(511, 8, 'Bimanbandar', NULL, NULL),
(512, 8, 'Kazirhat', NULL, NULL),
(513, 8, 'Kotwali', NULL, NULL),
(514, 8, 'Sadarghat', NULL, NULL),
(515, 8, 'Patenga', NULL, NULL),
(516, 8, 'Panchlaish', NULL, NULL),
(517, 8, 'Pahartali', NULL, NULL),
(518, 8, 'Khulshi', NULL, NULL),
(519, 8, 'Halishahar', NULL, NULL),
(520, 8, 'Double Mooring', NULL, NULL),
(521, 8, 'Chittagong Kotwali', NULL, NULL),
(522, 8, 'Chawkbazar', NULL, NULL),
(523, 8, 'Chandgaon', NULL, NULL),
(524, 8, 'Bhujpur', NULL, NULL),
(525, 8, 'Bandar', NULL, NULL),
(526, 8, 'Bakolia', NULL, NULL),
(527, 8, 'Bayezid', NULL, NULL),
(528, 8, 'Akbar Shah', NULL, NULL),
(529, 47, 'Wari', NULL, NULL),
(530, 47, 'Vatara', NULL, NULL),
(531, 47, 'Bhashantek', NULL, NULL),
(532, 47, 'Uttar Khan', NULL, NULL),
(533, 47, 'Uttara West', NULL, NULL),
(534, 47, 'Uttara East', NULL, NULL),
(535, 47, 'Turag', NULL, NULL),
(536, 47, 'Tejgaon', NULL, NULL),
(537, 47, 'Tejgaon Industrial', NULL, NULL),
(538, 47, 'Sher-e-Bangla Nagar', NULL, NULL),
(539, 47, 'Shyampur', NULL, NULL),
(540, 47, 'Sutrapur', NULL, NULL),
(541, 47, 'Shahjahanpur', NULL, NULL),
(542, 47, 'Shahbagh', NULL, NULL),
(543, 47, 'Shah Ali', NULL, NULL),
(544, 47, 'Sabujbagh', NULL, NULL),
(545, 47, 'Rupnagar', NULL, NULL),
(546, 47, 'Rampura', NULL, NULL),
(547, 47, 'Ramna', NULL, NULL),
(548, 47, 'Paltan', NULL, NULL),
(549, 47, 'Pallabi', NULL, NULL),
(550, 47, 'New Market', NULL, NULL),
(551, 47, 'Mugda', NULL, NULL),
(552, 47, 'Motijheel', NULL, NULL),
(553, 47, 'Mohammadpur', NULL, NULL),
(554, 47, 'Mirpur Model', NULL, NULL),
(555, 47, 'Lalbagh', NULL, NULL),
(556, 47, 'Kotwali', NULL, NULL),
(557, 47, 'Kadamtali', NULL, NULL),
(558, 47, 'Khilkhet', NULL, NULL),
(559, 47, 'Khilgaon', NULL, NULL),
(560, 47, 'Kamrangirchar', NULL, NULL),
(561, 47, 'Kalabagan', NULL, NULL),
(562, 47, 'Kafrul', NULL, NULL),
(563, 47, 'Jatrabari', NULL, NULL),
(564, 47, 'Hazaribagh', NULL, NULL),
(565, 47, 'Gulshan', NULL, NULL),
(566, 47, 'Gandaria', NULL, NULL),
(567, 47, 'Dhanmondi', NULL, NULL),
(568, 47, 'Demra', NULL, NULL),
(569, 47, 'Darus Salam', NULL, NULL),
(570, 47, 'Dakshin Khan', NULL, NULL),
(571, 47, 'Chawkbazar', NULL, NULL),
(572, 47, 'Cantonment', NULL, NULL),
(573, 47, 'Bimanbandar', NULL, NULL),
(574, 47, 'Bangshal', NULL, NULL),
(575, 47, 'Banani', NULL, NULL),
(576, 47, 'Badda', NULL, NULL),
(577, 47, 'Adabor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `center_id` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `text_password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whatapp_links`
--

CREATE TABLE `whatapp_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `youtube_videos`
--

CREATE TABLE `youtube_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `link` text NOT NULL,
  `video_id` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `youtube_videos`
--

INSERT INTO `youtube_videos` (`id`, `title`, `image`, `description`, `link`, `video_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electrical Installation And Maintenance Course', NULL, '<p>dg</p>', 'https://youtu.be/ZTRKqvsoopI?si=uHqq1AJUoxt0CX15', 'ZTRKqvsoopI', 1, '2025-08-28 05:33:48', '2025-08-28 05:33:48'),
(2, 'What Is Electricity', NULL, '<h1>What is Electricity</h1>', 'https://youtu.be/hVK3VkmXcjE?si=5VYyHMOeldXL2M7U', 'hVK3VkmXcjE', 1, '2025-08-28 05:34:16', '2025-08-28 05:34:16'),
(3, 'What Is Current', NULL, '<h1>What is current</h1>', 'https://youtu.be/XJ4e_2zoEJI?si=SwCKx9tjgHPLyQJ8', 'XJ4e_2zoEJI', 1, '2025-08-28 05:34:38', '2025-08-28 05:34:38'),
(4, 'What Is Phase Line', NULL, '<h1>What is Phase line&nbsp;</h1>', 'https://youtu.be/U2JA27gj6SE?si=N3FzOvB6WokP2KZq', 'U2JA27gj6SE', 1, '2025-08-28 05:34:59', '2025-08-28 05:34:59'),
(5, 'What Is Neutral', NULL, '<h1>What is neutral</h1>', 'https://youtu.be/9p_YwhOZxB4?si=FBXAZGMV36YxEWKP', '9p_YwhOZxB4', 1, '2025-08-28 05:37:04', '2025-08-28 05:37:04'),
(6, 'What Is Earthing |', NULL, '<h1>What is earthing |</h1>', 'https://youtu.be/h0CAOq4t6C8?si=4o-SRtqZ6lMur9Ym', 'h0CAOq4t6C8', 1, '2025-08-28 05:37:27', '2025-08-28 05:37:27'),
(7, 'Difference Between Neutral Earthing And Grounding', NULL, '<h1>Difference between neutral earthing and grounding</h1>', 'https://youtu.be/zTzC8V4WQus?si=Ti6l5NBo4Y6Y1Mly', 'zTzC8V4WQus', 1, '2025-08-28 05:37:51', '2025-08-28 05:37:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `centers_code_unique` (`code`);

--
-- Indexes for table `config_dictionaries`
--
ALTER TABLE `config_dictionaries`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_division_id_foreign` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `divisions_name_unique` (`name`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `licenses_license_number_unique` (`license_number`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `quations`
--
ALTER TABLE `quations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quations_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_student_id_foreign` (`student_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_center_id_foreign` (`center_id`),
  ADD KEY `students_session_id_foreign` (`session_id`),
  ADD KEY `students_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_key_unique` (`key`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upazilas_district_id_foreign` (`district_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_center_id_foreign` (`center_id`);

--
-- Indexes for table `whatapp_links`
--
ALTER TABLE `whatapp_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_videos`
--
ALTER TABLE `youtube_videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `centers`
--
ALTER TABLE `centers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `quations`
--
ALTER TABLE `quations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatapp_links`
--
ALTER TABLE `whatapp_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youtube_videos`
--
ALTER TABLE `youtube_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quations`
--
ALTER TABLE `quations`
  ADD CONSTRAINT `quations_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_center_id_foreign` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`),
  ADD CONSTRAINT `students_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`),
  ADD CONSTRAINT `students_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD CONSTRAINT `upazilas_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_center_id_foreign` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
