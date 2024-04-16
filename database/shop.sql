-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2024 at 07:53 AM
-- Server version: 8.0.33
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Giày Bóng Rổ', 'giay-bong-ro', '/storage/photos/1/Banner/banner giày.jfif', NULL, 'active', '2024-03-03 19:54:26', '2024-03-03 19:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(7, 'ANTA', 'anta', 'active', '2024-02-18 03:04:39', '2024-02-18 03:04:39'),
(8, 'Peak', 'peak', 'active', '2024-02-18 03:04:48', '2024-02-18 03:04:48'),
(9, 'Crossover', 'crossover', 'active', '2024-02-18 03:05:02', '2024-02-18 03:05:02'),
(10, 'Lining', 'lining', 'active', '2024-02-18 03:05:13', '2024-02-18 03:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(15, 11, 6, 30, 2655000.00, 'new', 1, 2950000.00, '2024-03-04 20:42:03', '2024-03-04 20:43:55'),
(16, 11, 7, 30, 2655000.00, 'new', 5, 13275000.00, '2024-03-04 20:44:26', '2024-03-04 20:45:26'),
(17, 12, 8, 30, 2400000.00, 'new', 1, 2400000.00, '2024-03-05 00:11:41', '2024-03-05 00:12:32'),
(18, 13, 9, 30, 2475000.00, 'new', 1, 2475000.00, '2024-04-04 00:12:24', '2024-04-04 00:13:13'),
(19, 12, NULL, 30, 2400000.00, 'new', 3, 7800000.00, '2024-04-04 00:18:06', '2024-04-04 00:53:46'),
(20, 13, NULL, 30, 2475000.00, 'new', 2, 4950000.00, '2024-04-04 00:18:30', '2024-04-04 00:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Giày bóng rổ', 'giay-bong-ro', '<p>Giày bóng rổ chính hãng</p>', '/storage/photos/1/Banner/banner giày.jfif', 1, NULL, NULL, 'active', '2024-02-18 03:06:52', '2024-03-03 19:52:59'),
(13, 'Giày Nike', 'giay-nike', '<p>Giày Nike chính hãng</p>', NULL, 0, 12, NULL, 'active', '2024-02-18 03:07:56', '2024-02-18 03:08:07'),
(14, 'Giày Adidas', 'giay-adidas', '<p>Giày Adidas chính hãng</p>', NULL, 0, 12, NULL, 'active', '2024-02-18 03:08:35', '2024-02-18 03:08:35'),
(15, 'Giày ANTA', 'giay-anta', '<p>Giày ANTA chính hãng</p>', NULL, 0, 12, NULL, 'active', '2024-02-18 03:09:06', '2024-02-18 03:09:06'),
(16, 'Giày PEAK', 'giay-peak', '<p>Giày PEAK chính hãng</p>', NULL, 0, 12, NULL, 'active', '2024-02-21 19:07:51', '2024-02-21 19:07:51'),
(17, 'Giày Crossover', 'giay-crossover', '<p>Giày Crossover chính hãng</p>', NULL, 0, 12, NULL, 'active', '2024-02-21 19:08:29', '2024-02-21 19:08:29'),
(18, 'Giày Lining', 'giay-lining', '<p>Giày Lining chính hãng</p>', NULL, 0, 12, NULL, 'active', '2024-02-21 19:08:49', '2024-02-21 19:08:49'),
(19, 'Giày bóng rổ Nữ', 'giay-bong-ro-nu', '<p>Giày bóng rổ Nữ</p>', NULL, 0, 12, NULL, 'active', '2024-02-21 19:09:11', '2024-02-21 19:09:11'),
(20, 'Quần áo', 'quan-ao', NULL, NULL, 1, NULL, NULL, 'active', '2024-02-21 19:10:21', '2024-02-21 19:10:21'),
(21, 'Phụ kiện', 'phu-kien', NULL, NULL, 1, NULL, NULL, 'active', '2024-02-21 19:10:29', '2024-02-21 19:10:29'),
(22, 'Quần áo Jersey NBA', 'quan-ao-jersey-nba', NULL, NULL, 0, 20, NULL, 'active', '2024-02-21 19:10:48', '2024-02-21 19:10:58'),
(23, 'Quần bóng rổ', 'quan-bong-ro', NULL, NULL, 0, 20, NULL, 'active', '2024-02-21 19:11:20', '2024-02-21 19:11:20'),
(24, 'Áo phông', 'ao-phong', NULL, NULL, 0, 20, NULL, 'active', '2024-02-21 19:11:34', '2024-02-21 19:11:34'),
(25, 'Áo tập bóng rổ', 'ao-tap-bong-ro', NULL, NULL, 0, 20, NULL, 'active', '2024-02-21 19:11:48', '2024-02-21 19:11:48'),
(26, 'Đồng phục bóng rổ', 'dong-phuc-bong-ro', NULL, NULL, 0, 20, NULL, 'active', '2024-02-21 19:12:08', '2024-02-21 19:12:08'),
(27, 'Quả bóng rổ', 'qua-bong-ro', NULL, NULL, 0, 21, NULL, 'active', '2024-02-21 19:12:23', '2024-02-21 19:12:23'),
(28, 'Balo, cặp, túi bóng rổ', 'balo-cap-tui-bong-ro', NULL, NULL, 0, 21, NULL, 'active', '2024-02-21 19:12:37', '2024-02-21 19:12:37'),
(29, 'Tất bóng rổ', 'tat-bong-ro', NULL, NULL, 0, 21, NULL, 'active', '2024-02-21 19:12:48', '2024-02-21 19:12:48'),
(30, 'Băng tay, chân', 'bang-tay-chan', NULL, NULL, 0, 21, NULL, 'active', '2024-02-21 19:13:15', '2024-02-21 19:13:15');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL),
(5, 'abcd', 'fixed', '250.00', 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2024-03-26 20:25:25', '2020-08-14 08:00:01', '2024-03-26 20:25:25'),
(2, 'Prajwal Rai', 'About Price', 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', NULL, '2020-08-17 21:15:12', '2020-08-17 21:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2023_06_21_164432_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('2bb6f22d-5886-4ca5-bbc9-06ed7ae31b6e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.test\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2024-03-05 00:12:31', '2024-03-05 00:12:31'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('62ae390c-ca24-4bb2-b691-337832f6a28f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.test\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2024-03-04 20:43:55', '2024-03-04 20:43:55'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('9f1c8547-4410-494b-912c-53f7e685520c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/e-shop.test\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2024-02-18 00:37:41', '2024-02-18 00:37:41'),
('a0147dfe-0804-4a76-b6da-12a162d2db37', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.test\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2024-03-04 20:45:26', '2024-03-04 20:45:26'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('d969d003-689d-4976-aa3e-dff433d5f5b8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.test\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2024-04-04 00:13:13', '2024-04-04 00:13:13'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(10,2) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `coupon` double(10,2) DEFAULT NULL,
  `total_amount` double(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` enum('cod','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(6, 'ORD-BWRXRIOVZG', 30, 2950000.00, 4, NULL, 2965000.00, 1, 'cod', 'unpaid', 'delivered', 'Duc', 'Nguyen Anh', 'anhduccsp2002@gmail.com', '0333962555', 'VN', NULL, 'Ha noi', NULL, '2024-03-04 20:43:54', '2024-03-04 22:56:56'),
(7, 'ORD-1MLUEZESDI', 30, 13275000.00, 4, NULL, 13290000.00, 5, 'cod', 'unpaid', 'new', 'Duc', 'Nguyen Anh', 'anhduccsp2002@gmail.com', '0333962555', 'VN', NULL, 'Ha noi', NULL, '2024-03-04 20:45:26', '2024-03-04 20:45:26'),
(8, 'ORD-YGTUOIKQY4', 30, 2400000.00, 4, NULL, 2415000.00, 1, 'cod', 'unpaid', 'new', 'Duc', 'Nguyen Anh', 'anhduccsp2002@gmail.com', '0988888888', 'VN', NULL, 'Ha noi', NULL, '2024-03-05 00:12:29', '2024-03-05 00:12:29'),
(9, 'ORD-WNWGJ5OOEF', 30, 2475000.00, 4, NULL, 2490000.00, 1, 'cod', 'unpaid', 'new', 'Duc', 'Nguyen Anh', 'anhduccsp2002@gmail.com', '988888888', 'VN', NULL, 'Ha noi', NULL, '2024-04-04 00:13:12', '2024-04-04 00:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Luka Doncic tạo nên mùa giải lịch sử nhưng vì sao vẫn bị gạch tên trong cuộc đua MVP?', 'luka-doncic-tao-nen-mua-giai-lich-su-nhung-vi-sao-van-bi-gach-ten-trong-cuoc-dua-mvp', '<p>Luka Doncic tạo nên mùa giải lịch sử nhưng vì sao vẫn bị gạch tên trong cuộc đua MVP?<br></p>', '<p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Mới 25 tuổi nhưng Luka Doncic đang có mùa giải lịch sử. Với 34,4 điểm mỗi trận của anh xếp thứ hai NBA, chỉ sau 35,3 của Joel Embiid. Nhưng với chấn thương của trung phong gốc Cameroon, Doncic nhiều khả năng sẽ giành danh hiệu \"Vua ghi điểm\" do&nbsp;yêu cầu chơi tối thiểu 58 trận để nhận giải thưởng của NBA.&nbsp;</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Doncic có thống kê trung bình gần đạt triple-double, với 9,7 kiến ​​tạo và 8,8 rebound mỗi trận.&nbsp;Doncic là cầu thủ đầu tiên trong lịch sử NBA từng đạt mức trung bình 34/10/9 trong một mùa giải,&nbsp;<a href=\"https://stathead.com/basketball/player-season-finder.cgi?request=1&amp;year_min=1947&amp;ccomp%5B1%5D=gt&amp;cval%5B1%5D=34&amp;cstat%5B1%5D=pts_per_g&amp;ccomp%5B2%5D=gt&amp;cval%5B2%5D=9.5&amp;cstat%5B2%5D=ast_per_g&amp;ccomp%5B3%5D=gt&amp;cval%5B3%5D=8.5&amp;cstat%5B3%5D=trb_per_g\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">theo Stathead</a>.&nbsp;Tuy nhiên các con số trung bình đó chỉ là phần nổi của tảng băng chìm khi nói đến những điều điên rồ mà Doncic làm được mùa này.</p><div class=\"zephr-feature_video-player\" style=\"color: rgb(67, 68, 68); font-family: Roboto, sans-serif; font-size: medium;\"><div class=\"latest-news-videos\" style=\"position: relative; width: 760px; border-top: unset; margin-top: unset;\"></div></div><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Tuy nhiên, Doncic chỉ có tỷ&nbsp; lệ cược là +450 (tỷ lệ khoảng 18%) để giành được MVP&nbsp;<a href=\"https://sports.az.betmgm.com/en/sports/basketball-7/betting/usa-9?tab=outrights\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">thông qua BetMGM</a>, hiện đang xếp sau Nikola Jokic và Shai Gilgeous-Alexander.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Dù có mùa giải lịch sử, nhưng cơ hội để Doncic đạt MVP là rất thấp.</p><h2 style=\"color: rgb(31, 31, 31); font-family: Roboto, sans-serif;\">Tại sao Luka Doncic xứng đáng với MVP</h2><h3 style=\"color: rgb(31, 31, 31); font-family: Roboto, sans-serif;\">Luka Doncic đã có trận đấu hay nhất mùa giải NBA</h3><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Luka đã có một số màn trình diễn thực sự đặc biệt trong mùa giải này. Trong đó, trận đấu 73 điểm của anh trước Atlanta Hawks xứng đáng là trận đấu hay nhất mùa giải.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Không cần những thống kê phức tạp, chỉ cần nhìn vào màn trình diễn của Doncic, tất cả đều phải công nhận.&nbsp;73 điểm sau 33 lần dứt điểm, 10 rebound và 7 kiến ​​​​tạo, những đóng góp toàn diện của Doncic trong trận này là điều&nbsp;<a href=\"https://stathead.com/basketball/player-game-finder.cgi?request=1&amp;timeframe=seasons&amp;player_game_min=1&amp;player_game_max=9999&amp;ccomp%5B1%5D=gt&amp;cval%5B1%5D=70&amp;cstat%5B1%5D=pts&amp;ccomp%5B2%5D=gt&amp;cval%5B2%5D=10&amp;cstat%5B2%5D=trb&amp;ccomp%5B3%5D=gt&amp;cval%5B3%5D=7&amp;cstat%5B3%5D=ast\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">chưa ai làm được trước đây</a>&nbsp;Nếu điều đó vẫn chưa đủ thuyết phục, Doncic đã có một trận đấu ghi 50 điểm, 15 kiến tạo, 4 steals, 3 blocks vào dịp Giáng sinh trước Phoenix Suns.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Mùa này có 5 trận đấu xuất hiện cầu thủ ghi 50 điểm trở lên, 2 trong số đó thuộc về Doncic. Cả 2 trận đấu đều thể hiện sự toàn diện khó tin của Doncic, bởi không chỉ ghi điểm nhiều anh mà còn tham gia thu hồi bóng và kiến tạo cho các đồng đội xung quanh.&nbsp;</p><h3 style=\"color: rgb(31, 31, 31); font-family: Roboto, sans-serif;\">Luka Doncic đang làm quá tốt trong tập thể thiếu ấn tượng</h3><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Bất chấp phong độ khủng khiếp của Doncic, Dallas Mavericks vẫn chưa phải đội bóng cạnh tranh ngôi đầu miền Tây. Họ đang vật lộn trong cuộc chiến giành vé dự playoffs, và hoàn toàn có thể bị loại nếu mất tập trung. Rõ ràng vị trí của Mavericks sẽ tồi tệ hơn nhiều nếu họ thiếu Doncic.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Kyrie Irving hòa nhập tốt với đội, nhưng anh đã bỏ lỡ 32 trận đấu.&nbsp;Việc ký hợp đồng với Grant Williams không mang lại hiệu quả như kỳ vọng.&nbsp;Mavs không có bất kỳ sự nhất quán nào trong năm nay, họ bổ sung một cách nhanh chóng và buộc phải thử đủ kiểu kết hợp kỳ lạ.&nbsp;<a href=\"https://www.nba.com/stats/lineups/traditional?PerMode=Totals&amp;TeamID=1610612742&amp;dir=D&amp;slug=traditional&amp;sort=MIN\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">Không có đội hình nào của họ chơi trên 100 phút</a>&nbsp;mùa này.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Vượt qua tất cả, Doncic vẫn giúp đội của mình giành chiến thắng.&nbsp;Mavericks từng sử dụng tân binh Dereck Lively II, và Derrick Jones Jr. - một cầu thủ không ai quan tâm và đến theo dạng tự do.&nbsp;Doncic đã hồi sinh sự nghiệp của Jones và khiến Lively trông như một vụ cướp ở NBA Draft.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Để so sánh với 2 đối thủ xếp trên Doncic, họ ở trong những đội bóng tốt hơn nhiều. Nikola Jokic được xoay quanh những cầu thủ vừa vô địch NBA. Trong khi Shai Gilgeous-Alexander có Jalen Williams, Chet Holmgren và nhiều tài năng được đánh giá cao.&nbsp;Giannis có Damian Lillard.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Còn với Doncic, anh vẫn gồng gánh Mavericks với tập thể của nhiều cầu thủ trẻ, những cựu binh không ai cần và một Kyrie thường xuyên nghỉ thi đấu.&nbsp;Khi nói đến giá trị, Doncic là thứ duy nhất tách biệt Mavericks khỏi nhóm tanker.</p><h3 style=\"color: rgb(31, 31, 31); font-family: Roboto, sans-serif;\">Luka Doncic đã khắc phục được điểm yếu lớn nhất của mình</h3><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Doncic đã lọt vào top 8 trong cuộc bình chọn MVP trong 4 năm qua, với thành tích tốt nhất là ở hạng 4 trong mùa giải thứ hai.&nbsp;</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Những lập luận cho rằng Doncic chưa thể trở thành MVP có 2 ý kiến chính. Một là thói lười phòng thủ, hai là có thống kê nâng cao không tốt.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Doncic sẽ không bao giờ trở thành một chốt chặn phòng ngự.&nbsp;Nhưng anh đã có nhiều khoảnh khắc phòng ngự xuất sắc hơn trong năm nay.&nbsp;Chẳng hạn, ngôi sao người Slovenia đã liên tục chặn đứng Karl-Anthony Towns ở những phút cuối trong trận thắng sít sao trước Timberwolves năm nay, và nhìn chung là giữ vị trí tốt.&nbsp;Mavericks đã cố gắng giữ Doncic ở vị trí thấp hơn trên sàn để hạn chế điểm yếu tốc độ và điều đó đã phát huy hiệu quả.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Doncic cũng đã có các thống kê nâng cao ấn tượng trong năm nay.&nbsp;<a href=\"https://www.dunksandthrees.com/player/1629029\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">Điểm plus/minus ước tính của anh là +7,6</a>, cao nhất trong sự nghiệp và cao thứ ba toàn giải.&nbsp;Doncic xếp hạng 5 trong&nbsp;<a href=\"https://neilpaine.substack.com/p/nba-estimated-raptor-player-ratings\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">RAPTOR</a>, hạng 3 ở&nbsp;<a href=\"https://www.bball-index.com/lebron-application/\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">LEBRON</a>&nbsp;và hạng 3 ở&nbsp;&nbsp;<a href=\"https://www.basketball-reference.com/leagues/NBA_2024_advanced.html\" target=\"_blank\" style=\"color: rgb(239, 51, 64);\">Box Plus/minus</a>.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Doncic đã cải thiện khả năng ném của mình, kéo theo các thống kê nâng cao được nâng lên. Tỷ lệ 38% từ vạch 3 điểm mùa này là mức cao nhất trong sự nghiệp Doncic và cao hơn nhiều so với mức trung bình 33,8% trong sự nghiệp.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Nếu số liệu thống kê nâng cao không phải là sở thích của bạn, thì hãy xem những chỉ số cơ bản. Đây là những chỉ số mà Doncic tỏ ra vượt trội so với các đối thủ cạnh tranh MVP.</p><div class=\"table-container\" style=\"overflow: auto; width: 760px; margin-bottom: 17px; color: rgb(67, 68, 68); font-family: Roboto, sans-serif; font-size: medium;\"><table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"border-spacing: 0px; width: 500px; max-width: 100%; border: 0px !important;\"><thead><tr><th scope=\"col\" style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; text-align: left; border: 1px solid rgb(255, 255, 255);\">Cầu thủ</th><th scope=\"col\" style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; text-align: left; border: 1px solid rgb(255, 255, 255);\">Điểm</th><th scope=\"col\" style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; text-align: left; border: 1px solid rgb(255, 255, 255);\">Rebounds</th><th scope=\"col\" style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; text-align: left; border: 1px solid rgb(255, 255, 255);\">Kiến tạo</th></tr></thead><tbody style=\"overflow-x: auto;\"><tr><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">Luka Doncic</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\"><strong style=\"font-weight: bold;\">34.4</strong></td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">8.8</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\"><strong style=\"font-weight: bold;\">9.7</strong></td></tr><tr style=\"background-color: rgb(247, 247, 247);\"><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">Shai Gilgeous-Alexander</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">31.2</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">5.6</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">6.5</td></tr><tr><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">Giannis Antetokounmpo</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">30.6</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">11.2</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">6.3</td></tr><tr style=\"background-color: rgb(247, 247, 247);\"><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">Jayson Tatum</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">27.0</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">8.5</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(247, 247, 247);\">4.9</td></tr><tr><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">Nikola Jokic</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">25.8</td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\"><strong style=\"font-weight: bold;\">12.3</strong></td><td style=\"padding: 0.625rem 1.875rem 0.625rem 0.625rem; border: 1px solid rgb(255, 255, 255);\">9.3</td></tr></tbody></table></div><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Một điều mà những cái tên trên hơn Doncic, đó là họ ở những đội tốt hơn. Doncic đang chơi rất hay nhưng không thể một mình gồng gánh cả Dallas Mavericks.</p><p style=\"font-size: 1.0625rem; line-height: 1.76; color: rgb(31, 31, 31); overflow-wrap: break-word; font-family: Roboto, sans-serif;\">Jokic có lẽ sẽ giành được giải thưởng và đó là lựa chọn rất xứng đáng.&nbsp;Nhưng Doncic đang làm những việc chưa từng làm trước đây.&nbsp;Anh đang chơi ở đẳng cấp MVP và màn trình diễn đó xứng đáng được ca ngợi.</p>', NULL, '/storage/photos/1/Blog/Luka Doncic.jpg', 'Luka Doncic,NBA', 7, NULL, 1, 'active', '2024-03-04 09:07:37', '2024-03-04 22:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(6, 'NBA', 'nba', 'active', '2024-03-04 22:27:50', '2024-03-04 22:27:50'),
(7, 'NBA Discuss', 'nba-discuss', 'active', '2024-03-04 22:28:05', '2024-03-04 22:28:05'),
(8, 'Star', 'star', 'active', '2024-03-04 22:28:14', '2024-03-04 22:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Luka Doncic', 'luka-doncic', 'active', '2024-03-04 22:28:31', '2024-03-04 22:28:31'),
(6, 'Lebron James', 'lebron-james', 'active', '2024-03-04 22:28:39', '2024-03-04 22:28:39'),
(7, 'NBA', 'nba', 'active', '2024-03-04 22:28:46', '2024-03-04 22:28:46'),
(8, 'Stephen Curry', 'stephen-curry', 'active', '2024-03-04 22:28:55', '2024-03-04 22:28:55'),
(9, 'Joel Embiid', 'joel-embiid', 'active', '2024-03-04 22:29:04', '2024-03-04 22:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(10,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'D.O.N Issue 4 Utah Jazz', 'don-issue-3-gca-xbox-360', '<p>Giày bóng rổ NIKE&nbsp;D.O.N Issue 4 Utah Jazz</p>', '<div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><strong style=\"font-weight: bold;\">Giày bóng rổ chính hãng NIKE&nbsp;Là thương hiệu số 1 trong thế giới giày bóng rổ, chiếm thị phần lớn nhất hiện nay, với thương hiệu đẳng cấp, chất lượng hàng đầu thế giới.</strong><br>&nbsp;</div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\">&nbsp;</div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\"><em>Bảng size giày :</em></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><table class=\"table table-bordered table-striped\" style=\"border-spacing: 0px; max-width: 100%; background-color: transparent; width: 853.453px; margin-bottom: 20px; border-color: rgb(221, 221, 221);\"><tbody><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">US (Mỹ)</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">7</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">8</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">8</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">9</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">9.5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">10</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">Việt Nam</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">40</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">41</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">42</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">42,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">43</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">44</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">Chiều dài chân (CM)</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">25</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">26</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">26,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">27</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">27.5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">28<br><br></td></tr></tbody></table></div>', '/storage/photos/1/Products/shoes/adidas/D.O.N Issue 4 Utah Jazz.jpg', 8, '', 'default', 'active', 2950000.00, 10.00, 1, 12, 13, 2, '2024-03-04 09:23:44', '2024-03-26 20:01:01'),
(12, 'Dame 7 Extply Say Cheese', 'dame-7-extply-say-cheese', '<p>Nike&nbsp;Dame 7 Extply Say Cheese.<br></p>', '<div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: inherit; padding: 0px; margin: 0px; font-weight: bold;\">Giày bóng rổ chính hãng NIKE&nbsp;Là thương hiệu số 1 trong thế giới giày bóng rổ, chiếm thị phần lớn nhất hiện nay, với thương hiệu đẳng cấp, chất lượng hàng đầu thế giới.</strong><br style=\"box-sizing: inherit; padding: 0px; margin: 0px;\">&nbsp;</div><div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\">&nbsp;</div><div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\"><em style=\"box-sizing: inherit; padding: 0px; margin: 0px;\">Bảng size giày :</em></div><div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><table class=\"table table-bordered table-striped\" style=\"box-sizing: inherit; padding: 0px; margin: 0px 0px 20px; border-spacing: 0px; width: 853.453px; max-width: 100%; background-color: transparent; border-color: rgb(221, 221, 221); height: 137.688px;\"><tbody style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><tr style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">US (Mỹ)</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">7</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">8</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">8</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">9</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">9.5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">10</td></tr><tr style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">Việt Nam</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">40</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">41</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">42</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">42,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">43</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">44</td></tr><tr style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">Chiều dài chân (CM)</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">25</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">26</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">26,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">27</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">27.5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">28<br style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"></td></tr></tbody></table></div>', '/storage/photos/1/Products/shoes/adidas/Dame 7 Extply Say Cheese.jpg', 10, '40,41,42,43,44', 'new', 'active', 3000000.00, 20.00, 1, 12, 13, 2, '2024-03-04 21:25:24', '2024-03-04 21:25:24'),
(13, 'Harden Vol.6 Clear Pink', 'harden-vol6-clear-pink', '<p>Adidas&nbsp;Harden Vol.6 Clear Pink</p>', '<div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><strong style=\"font-weight: bold;\">Giày bóng rổ chính hãng ADIDAS luôn hội tụ những tinh túy công nghệ nhất, giá trị thương hiệu đẳng cấp, chất lượng cao cấp nhất hiện nay, là lựa chọn số 1 cho những vận đông viên chuyên nghiệp, đam mê với trái bóng cam</strong></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\">&nbsp;</div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\"><em><span style=\"font-size: 12px;\">Bảng size giày :</span></em></div><div style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><table class=\"table table-bordered table-striped\" style=\"border-spacing: 0px; max-width: 100%; background-color: transparent; width: 853.453px; margin-bottom: 20px; border-color: rgb(221, 221, 221);\"><tbody><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">US</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">7</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">7,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">8</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">8,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">9</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">9,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">10</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">10,5</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">UK</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">6,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">7</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">7,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">8</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">8,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">9</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">9,5</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">10</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">EU</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">40</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">40&nbsp;<span style=\"position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">2/3</span></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">41&nbsp;<span style=\"position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">1/3</span></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">42</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">42&nbsp;<span style=\"position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">2/3</span></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">43&nbsp;<span style=\"position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">1/3</span></td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">44</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); background-color: rgb(249, 249, 249); text-align: center;\">44&nbsp;<span style=\"position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">2/3</span></td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">JP</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">250</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">255</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">260</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">265</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">270</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">275</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">280</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(221, 221, 221); text-align: center;\">285</td></tr></tbody></table></div>', '/storage/photos/1/Products/shoes/adidas/Harden Vol.6 Clear Pink.jpg', 10, '40,41,42,43', 'hot', 'active', 2750000.00, 10.00, 1, 12, 14, 1, '2024-03-04 21:35:45', '2024-03-04 21:35:45'),
(14, 'Pro Bounce Cloud White Low', 'pro-bounce-cloud-white-low', '<p>Adidas&nbsp;Pro Bounce Cloud White Low</p>', '<div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><strong style=\"box-sizing: inherit; padding: 0px; margin: 0px; font-weight: bold;\">Giày bóng rổ chính hãng ADIDAS luôn hội tụ những tinh túy công nghệ nhất, giá trị thương hiệu đẳng cấp, chất lượng cao cấp nhất hiện nay, là lựa chọn số 1 cho những vận đông viên chuyên nghiệp, đam mê với trái bóng cam</strong></div><div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\">&nbsp;</div><div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245); text-align: center;\"><em style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><span style=\"box-sizing: inherit; padding: 0px; margin: 0px; font-size: 12px;\">Bảng size giày :</span></em></div><div style=\"box-sizing: inherit; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(245, 245, 245);\"><table class=\"table table-bordered table-striped\" style=\"box-sizing: inherit; padding: 0px; margin: 0px 0px 20px; border-spacing: 0px; width: 853.453px; max-width: 100%; background-color: transparent; border-color: rgb(221, 221, 221); height: 154.688px;\"><tbody style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><tr style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">US</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">7</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">7,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">8</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">8,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">9</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">9,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">10</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">10,5</td></tr><tr style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">UK</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">6,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">7</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">7,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">8</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">8,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">9</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">9,5</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">10</td></tr><tr style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">EU</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">40</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">40&nbsp;<span style=\"box-sizing: inherit; padding: 0px; margin: 0px; position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">2/3</span></td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">41&nbsp;<span style=\"box-sizing: inherit; padding: 0px; margin: 0px; position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">1/3</span></td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">42</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">42&nbsp;<span style=\"box-sizing: inherit; padding: 0px; margin: 0px; position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">2/3</span></td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">43&nbsp;<span style=\"box-sizing: inherit; padding: 0px; margin: 0px; position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">1/3</span></td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">44</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; background-color: rgb(249, 249, 249); text-align: center;\">44&nbsp;<span style=\"box-sizing: inherit; padding: 0px; margin: 0px; position: relative; font-size: 11.25px; line-height: 0; vertical-align: baseline; bottom: -0.25em;\">2/3</span></td></tr><tr style=\"box-sizing: inherit; padding: 0px; margin: 0px;\"><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">JP</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">250</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">255</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">260</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">265</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">270</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">275</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">280</td><td style=\"box-sizing: inherit; padding: 8px; margin: 0px; border-color: rgb(221, 221, 221); line-height: 1.42857; text-align: center;\">285</td></tr></tbody></table></div>', '/storage/photos/1/Products/shoes/adidas/Pro Bounce Cloud White Low.jpg', 0, '40,41,42,43', 'default', 'active', 2750000.00, 20.00, 1, 12, 14, 1, '2024-03-04 22:21:09', '2024-03-04 22:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', '', '', 'eshop@gmail.com', NULL, '2020-08-14 01:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giao hàng tiết kiệm', '15000.00', 'active', '2020-08-14 04:22:17', '2024-03-04 20:37:33'),
(2, 'Giao hàng nhanh', '25000.00', 'active', '2020-08-14 04:22:41', '2024-03-04 20:37:41'),
(3, 'SPExpress', '30000.00', 'active', '2020-08-15 06:54:04', '2024-03-04 20:38:13'),
(4, 'Viettel Post', '15000.00', 'active', '2020-08-17 20:50:48', '2024-03-04 20:38:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Anh Duc', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/users/Nguyễn Anh Đức.JPG', 'admin', NULL, NULL, 'active', '4KDJzYvjSRussOK76iBw5SMpMIkZfz7iLSZgstkDlSU017YuvnFlSOMVLrgt', NULL, '2024-02-17 22:36:08'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2020-08-15 07:30:07'),
(3, 'Prajwal Rai', 'prajwal.iar@gmail.com', NULL, '$2y$10$15ZVMgH040v4Ukf9KSAFiucPJcfDwmeRKCaguVJBXplTs93m48F1G', '/storage/photos/1/users/user3.jpg', 'user', NULL, NULL, 'active', NULL, '2020-08-11 04:20:58', '2020-08-15 07:56:58'),
(4, 'Cynthia Beier', 'ernestina.wehner@example.net', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'fzmQDfEoaP', '2020-08-14 21:18:52', '2020-08-14 21:18:52'),
(5, 'Prof. Maybell Zulauf', 'wolf.harvey@example.org', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'B8cYq4huyT', '2020-08-14 21:18:54', '2020-08-14 21:18:54'),
(6, 'Diego Lind II', 'schroeder.emile@example.net', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'xLUaF26dE1', '2020-08-14 21:18:54', '2020-08-14 21:18:54'),
(7, 'Ian Macejkovic', 'ashlee16@example.com', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'i2ZIKbiM9O', '2020-08-12 21:18:54', '2020-08-14 21:18:54'),
(8, 'Perry McClure DDS', 'mayer.ashlynn@example.org', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'VD1MlsvW3I', '2020-08-14 21:18:55', '2020-08-14 21:18:55'),
(9, 'Juana Yost', 'carter47@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'kARxoay0FT', '2020-08-11 21:19:50', '2020-08-14 21:19:50'),
(10, 'Louvenia Will DDS', 'lowell06@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'QkbNNnO7ZG', '2020-08-10 21:19:50', '2020-08-14 21:19:50'),
(11, 'Miss Layla McClure', 'dcummings@example.com', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'DFnCS0bKFa', '2020-08-08 21:19:51', '2020-08-14 21:19:51'),
(12, 'Mrs. Taya Ziemann', 'anderson.luz@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', '4Xgvb1HnFT', '2020-08-09 21:19:51', '2020-08-14 21:19:51'),
(13, 'Porter Olson', 'jaden24@example.com', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'gFX2w4WaMj', '2020-08-14 21:19:51', '2020-08-14 21:19:51'),
(29, 'Prajwal Rai', 'rae.prajwal@gmail.com', NULL, NULL, NULL, 'user', 'google', '110717103019405487938', 'active', NULL, '2020-08-15 07:36:29', '2020-08-15 07:36:29'),
(30, 'Anh Duc Nguyen', 'anhduccsp2002@gmail.com', NULL, '$2y$10$acmt6nycES86WJWwQb3d5.OYsp59JPoBx9wI7qLwBk3X4.Vk9UGxK', NULL, 'user', NULL, NULL, 'active', NULL, '2024-03-03 20:02:21', '2024-03-03 20:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(6, 13, 18, 30, 2475000.00, 1, 2475000.00, '2024-03-26 18:15:56', '2024-04-04 00:12:24'),
(7, 12, NULL, 30, 2400000.00, 1, 2400000.00, '2024-04-04 00:53:29', '2024-04-04 00:53:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
