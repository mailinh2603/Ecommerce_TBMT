-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 25, 2024 lúc 05:31 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlymt2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'REDMI', 'redmi', '/storage/photos/3/banner-pc.jpg', NULL, 'active', '2024-11-10 02:41:21', '2024-12-03 23:51:02'),
(2, 'Banner 2', 'banner-2', '/storage/photos/3/banner-02.jpg', NULL, 'active', '2024-11-10 02:43:31', '2024-12-03 23:31:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`, `description`) VALUES
(1, 'Macbook', 'macbook', 'active', '2024-11-10 21:08:51', '2024-11-10 21:08:51', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(5, 4, 5, 2, 12000000.00, 'new', 1, 15000000.00, '2024-11-24 09:08:17', '2024-11-24 12:05:58'),
(7, 3, 5, 2, 16800000.00, 'new', 1, 16800000.00, '2024-11-24 11:52:44', '2024-11-24 12:05:58'),
(8, 3, 4, 1, 19950000.00, 'new', 1, 19950000.00, '2024-11-24 12:01:13', '2024-11-24 12:01:41'),
(9, 5, 5, 2, 18000000.00, 'new', 1, 20000000.00, '2024-11-24 12:05:03', '2024-11-24 12:05:58'),
(10, 6, 6, 2, 12350000.00, 'new', 1, 13000000.00, '2024-11-24 12:06:14', '2024-11-24 12:06:35'),
(11, 5, 14, 2, 18000000.00, 'new', 1, 18000000.00, '2024-11-24 21:45:18', '2024-12-03 04:11:17'),
(12, 6, 8, 2, 12350000.00, 'new', 1, 13000000.00, '2024-11-25 00:28:39', '2024-11-25 00:29:20'),
(13, 6, 9, 2, 12350000.00, 'new', 1, 12350000.00, '2024-11-26 09:08:31', '2024-12-02 08:05:08'),
(14, 5, 10, 2, 18000000.00, 'new', 1, 18000000.00, '2024-12-02 08:05:22', '2024-12-02 10:26:41'),
(15, 6, 10, 2, 12350000.00, 'new', 2, 24700000.00, '2024-12-02 08:05:26', '2024-12-02 10:26:41'),
(16, 6, 14, 2, 12350000.00, 'new', 1, 12350000.00, '2024-12-02 10:41:18', '2024-12-03 04:11:17'),
(17, 6, 12, 2, 12350000.00, 'new', 1, 13000000.00, '2024-12-02 12:34:09', '2024-12-02 13:21:29'),
(18, 5, 14, 2, 18000000.00, 'new', 1, 18000000.00, '2024-12-03 02:47:03', '2024-12-03 04:11:17'),
(20, 4, NULL, 4, 12000000.00, 'new', 2, 30000000.00, '2024-12-03 09:35:58', '2024-12-03 09:35:58'),
(24, 4, NULL, 3, 12000000.00, 'new', 2, 24000000.00, '2024-12-03 10:07:29', '2024-12-03 10:18:55'),
(25, 6, 16, 2, 12350000.00, 'new', 1, 12350000.00, '2024-12-03 11:06:14', '2024-12-03 11:07:01'),
(26, 5, 17, 2, 27000000.00, 'new', 2, 54000000.00, '2024-12-03 11:09:44', '2024-12-03 11:11:18'),
(27, 6, 18, 2, 12350000.00, 'new', 2, 24700000.00, '2024-12-03 11:12:32', '2024-12-03 11:13:37'),
(28, 5, 19, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 12:58:08', '2024-12-03 12:58:45'),
(29, 5, 20, 2, 27000000.00, 'new', 1, 27000000.00, '2024-12-03 13:01:05', '2024-12-03 13:01:42'),
(30, 5, 21, 2, 27000000.00, 'new', 1, 27000000.00, '2024-12-03 13:20:55', '2024-12-03 13:22:08'),
(31, 5, 22, 2, 27000000.00, 'new', 1, 27000000.00, '2024-12-03 13:27:38', '2024-12-03 13:28:59'),
(32, 6, 23, 2, 12350000.00, 'new', 1, 13000000.00, '2024-12-03 13:49:47', '2024-12-03 13:50:23'),
(33, 5, 24, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 13:54:03', '2024-12-03 13:55:35'),
(34, 6, 25, 2, 12350000.00, 'new', 1, 13000000.00, '2024-12-03 13:56:51', '2024-12-03 13:57:33'),
(35, 6, 26, 2, 12350000.00, 'new', 1, 13000000.00, '2024-12-03 14:06:31', '2024-12-03 14:07:03'),
(36, 6, 27, 2, 12350000.00, 'new', 1, 13000000.00, '2024-12-03 14:09:28', '2024-12-03 14:10:11'),
(37, 6, 28, 2, 12350000.00, 'new', 1, 13000000.00, '2024-12-03 14:12:08', '2024-12-03 14:13:22'),
(38, 5, 29, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 14:15:36', '2024-12-03 14:16:28'),
(39, 5, 30, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 14:18:12', '2024-12-03 14:19:01'),
(40, 5, 31, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 14:22:37', '2024-12-03 14:23:47'),
(41, 5, 32, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 14:30:24', '2024-12-03 14:31:06'),
(42, 5, 33, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 14:34:48', '2024-12-03 14:35:51'),
(43, 5, 34, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-03 14:44:29', '2024-12-03 14:44:56'),
(44, 5, 35, 2, 27000000.00, 'new', 1, 27000000.00, '2024-12-03 23:34:49', '2024-12-03 23:55:08'),
(45, 6, 36, 2, 12350000.00, 'new', 1, 12350000.00, '2024-12-04 00:19:01', '2024-12-04 00:19:57'),
(46, 10, 37, 9, 3591000.00, 'new', 1, 3990000.00, '2024-12-18 10:26:28', '2024-12-18 10:27:38'),
(47, 10, NULL, 9, 3591000.00, 'new', 1, 3990000.00, '2024-12-18 10:41:36', '2024-12-18 10:41:36'),
(48, 10, 38, 2, 3591000.00, 'new', 1, 3591000.00, '2024-12-18 10:50:53', '2024-12-18 10:52:31'),
(49, 9, 39, 2, 405000.00, 'new', 1, 450000.00, '2024-12-18 10:54:30', '2024-12-18 14:34:45'),
(50, 10, 40, 2, 3591000.00, 'new', 1, 3990000.00, '2024-12-18 15:58:09', '2024-12-18 15:58:36'),
(51, 6, 41, 2, 2000.00, 'new', 1, 2000.00, '2024-12-18 16:12:21', '2024-12-18 16:12:49'),
(52, 5, 42, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-18 16:55:46', '2024-12-18 16:56:18'),
(53, 5, 43, 2, 27000000.00, 'new', 1, 30000000.00, '2024-12-18 16:59:38', '2024-12-18 17:00:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Laptop sinh viên', 'laptop-danh-cho-sinh-vien', '<p>Laptop dành cho sinh viên</p>', '/storage/photos/1/Loại sản phẩm/laptop2.png', 1, NULL, NULL, 'active', '2024-11-10 21:00:13', '2024-11-11 02:19:47'),
(2, 'PC', 'pc', '<p>PC</p>', '/storage/photos/1/Loại sản phẩm/pc.png', 1, NULL, NULL, 'active', '2024-11-10 21:27:53', '2024-11-10 21:27:53'),
(3, 'Phụ kiện', 'phu-kien', '<p>Phụ kiện</p>', '/storage/photos/1/Loại sản phẩm/phukien.png', 1, NULL, NULL, 'active', '2024-11-10 21:31:11', '2024-11-11 02:20:24'),
(4, 'Ipad', 'ipad', '<p>Ipad</p>', '/storage/photos/3/iPad.jpg', 0, NULL, NULL, 'active', '2024-12-03 23:55:50', '2024-12-03 23:55:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
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
(21, '2024_11_10_083754_remove_notifiable_columns_from_notifications_table', 2),
(22, '2024_12_03_170158_create_sepay_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal','qrpay') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `fullname` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `fullname`, `email`, `address`, `created_at`, `updated_at`, `phone`) VALUES
(4, 'ORD-OQ3CJ2QMZJ', 1, 19950000.00, 19950000.00, 1, 'cod', 'unpaid', 'delivered', 'Linh Doan', 'mailinh10a7263@gmail.com', 'Lê Đức Thọ', '2024-11-24 12:01:41', '2024-11-24 12:07:11', '0912031106'),
(5, 'ORD-ZDU5CZVJMN', 2, 46800000.00, 46800000.00, 3, 'cod', 'unpaid', 'delivered', 'Linh Doan', 'mailinh10a7263@gmail.com', 'Lê Đức Thọ', '2024-11-24 12:05:58', '2024-11-24 12:55:48', '0912031106'),
(6, 'ORD-15EAYYDR1A', 2, 12350000.00, 12350000.00, 1, 'cod', 'unpaid', 'delivered', 'Linh Doan', 'mailinh10a7263@gmail.com', 'Lê Đức Thọ', '2024-11-24 12:06:35', '2024-11-24 12:07:24', '0912031106'),
(8, 'ORD-QLOZZXH7KI', 2, 13000000.00, 13000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-11-25 00:29:20', '2024-11-25 00:29:20', '0385894233'),
(9, 'ORD-WUDHBIAEZD', 2, 12350000.00, 12350000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-02 08:05:08', '2024-12-02 08:05:08', '0385894233'),
(10, 'ORD-AFHAL0IZC5', 2, 42700000.00, 42700000.00, 3, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-02 10:26:41', '2024-12-02 10:26:41', '0385894233'),
(12, 'ORD-SQNB8DTGPG', 2, 13000000.00, 13000000.00, 1, 'cod', 'unpaid', 'new', 'kjhsd', 'sdj@Gmail.com', 'đcc', '2024-12-02 13:21:29', '2024-12-02 13:21:29', '0385894233'),
(14, 'ORD-XESP9OEBTV', 2, 48350000.00, 48350000.00, 3, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 04:11:17', '2024-12-03 04:11:17', '0385894233'),
(16, 'ORD-WTQXK6KCZR', 2, 12350000.00, 12350000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 11:07:01', '2024-12-03 11:07:01', '0385894233'),
(17, 'ORD-SIDEGYCSC2', 2, 54000000.00, 54000000.00, 2, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 11:11:18', '2024-12-03 11:11:18', '0385894233'),
(18, 'ORD-HHIGQ7WMVM', 2, 24700000.00, 24700000.00, 2, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 11:13:37', '2024-12-03 11:13:37', '0385894233'),
(19, 'ORD-XIUX3I6PDK', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 12:58:45', '2024-12-03 12:58:45', '0385894233'),
(20, 'ORD-42TCSCLLLA', 2, 27000000.00, 27000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 13:01:42', '2024-12-03 13:01:42', '0385894233'),
(21, 'ORD-R7XMSABUSV', 2, 27000000.00, 27000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 13:22:08', '2024-12-03 13:22:08', '0385894233'),
(22, 'ORD-2KLOFKRBI6', 2, 27000000.00, 27000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 13:28:59', '2024-12-03 13:28:59', '0385894233'),
(23, 'ORD-1BBWRIRPFV', 2, 13000000.00, 13000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 13:50:23', '2024-12-03 13:50:23', '0385894233'),
(24, 'ORD-8AMTZXXN5U', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 13:55:35', '2024-12-03 13:55:35', '0385894233'),
(25, 'ORD-QS6GOVPZVK', 2, 13000000.00, 13000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 13:57:33', '2024-12-03 13:57:33', '0385894233'),
(26, 'ORD-LI502QZ9RM', 2, 13000000.00, 13000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:07:03', '2024-12-03 14:07:03', '0385894233'),
(27, 'ORD-OV1KBS7UJH', 2, 13000000.00, 13000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:10:11', '2024-12-03 14:10:11', '0385894233'),
(28, 'ORD-IQDKFZXDXI', 2, 13000000.00, 13000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:13:22', '2024-12-03 14:13:22', '0385894233'),
(29, 'ORD-S3M4YMM5ZA', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:16:28', '2024-12-03 14:16:28', '0385894233'),
(30, 'ORD-0IKP76QG0F', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:19:01', '2024-12-03 14:19:01', '0385894233'),
(31, 'ORD-QYWUWBRGMJ', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:23:47', '2024-12-03 14:23:47', '0385894233'),
(32, 'ORD-ACROU6X8VL', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:31:06', '2024-12-03 14:31:06', '0385894233'),
(33, 'ORD-LIIDOMHDDM', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:35:51', '2024-12-03 14:35:51', '0385894233'),
(34, 'ORD-FNW5PZOBMJ', 2, 30000000.00, 30000000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-03 14:44:56', '2024-12-03 14:44:56', '0385894233'),
(35, 'ORD-AMSSDNPV9L', 2, 27000000.00, 27000000.00, 1, 'cod', 'unpaid', 'new', 'công', 'admin@mail.com', 'phuong canh', '2024-12-03 23:55:08', '2024-12-03 23:55:08', '0385894777'),
(36, 'ORD-ALUNVGUMKC', 2, 12350000.00, 12350000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-04 00:19:57', '2024-12-04 00:19:57', '0385894233'),
(37, 'ORD-P9RM8U1BUJ', 9, 3990000.00, 3990000.00, 1, 'cod', 'unpaid', 'new', 'Linh Doan', 'mailinh10a7263@gmail.com', 'Lê Đức Thọ', '2024-12-18 10:27:38', '2024-12-18 10:27:38', '0912031106'),
(38, 'ORD-DAOK70RGXF', 2, 3591000.00, 3591000.00, 1, 'cod', 'unpaid', 'new', 'công', 'admin@mail.com', 'ha dong', '2024-12-18 10:52:31', '2024-12-18 10:52:31', '0385894233'),
(39, 'ORD-HIC1QL3WWS', 2, 450000.00, 450000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-18 14:34:45', '2024-12-18 14:34:45', '0385894233'),
(40, 'ORD-MRYVGOF3SN', 2, 3990000.00, 3990000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-18 15:58:36', '2024-12-18 15:58:36', '0385894233'),
(41, 'ORD-6HGNMRT1GU', 2, 2000.00, 2000.00, 1, 'cod', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-18 16:12:49', '2024-12-18 16:12:49', '0385894233'),
(42, 'ORD-WTH7OQBB89', 2, 30000000.00, 30000000.00, 1, 'qrpay', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-18 16:56:18', '2024-12-18 16:56:18', '0385894233'),
(43, 'ORD-WDW15OEFBS', 2, 30000000.00, 30000000.00, 1, 'qrpay', 'unpaid', 'new', 'Nguyen', 'hau0607203@gmail.com', 'Doc Lap', '2024-12-18 17:00:04', '2024-12-18 17:00:04', '0385894233');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Cách chọn laptop phù hợp với nhu cầu học tập', 'cach-chon-laptop-phu-hop-voi-nhu-cau-hoc-tap', 'Tìm hiểu các yếu tố cần lưu ý khi chọn laptop cho từng nhu cầu khác nhau như học tập, làm việc, và chơi game', 'Cách Lựa Chọn Laptop Phù Hợp Với Nhu Cầu Công Việc Của Bạn\r\nLaptop là công cụ không thể thiếu trong công việc hàng ngày của nhiều người, từ dân văn phòng, kỹ thuật viên đến các nhà thiết kế sáng tạo. Tuy nhiên, việc lựa chọn một chiếc laptop phù hợp với nhu cầu công việc không phải là điều dễ dàng, bởi thị trường hiện nay có vô vàn mẫu mã, tính năng và giá cả khác nhau. Để giúp bạn chọn được chiếc laptop tối ưu cho công việc của mình, dưới đây là những tiêu chí quan trọng cần lưu ý.\r\n\r\n1. Xác Định Nhu Cầu Sử Dụng Cụ Thể\r\nTrước khi quyết định mua laptop, bạn cần xác định rõ nhu cầu sử dụng. Mỗi công việc có yêu cầu khác nhau về cấu hình và tính năng của máy. Dưới đây là một số ví dụ về các loại công việc và những đặc điểm laptop tương ứng:\r\n\r\nCông việc văn phòng: Word, Excel, PowerPoint và email là những công cụ chính mà bạn sử dụng. Một chiếc laptop với cấu hình vừa phải, màn hình tốt và thời lượng pin dài sẽ là lựa chọn lý tưởng.\r\nLập trình viên: Yêu cầu laptop có CPU mạnh, RAM lớn và ổ SSD để có tốc độ xử lý nhanh, đảm bảo sự mượt mà khi chạy các ứng dụng lập trình hoặc ảo hóa hệ thống.\r\nThiết kế đồ họa và dựng video: Bạn cần một laptop có card đồ họa rời (GPU), màn hình độ phân giải cao (ít nhất là Full HD) và vi xử lý mạnh để xử lý các phần mềm như Adobe Photoshop, Premiere Pro hay AutoCAD.\r\nCông việc di chuyển nhiều: Nếu thường xuyên phải di chuyển, bạn cần một laptop mỏng nhẹ, bền bỉ và có thời lượng pin lâu.\r\n2. Hiệu Năng: CPU và RAM\r\nCPU (Vi xử lý):\r\nCPU là bộ phận trung tâm quyết định tốc độ và hiệu năng của laptop. Mỗi công việc có yêu cầu khác nhau về CPU:\r\n\r\nIntel Core i3 hoặc AMD Ryzen 3: Phù hợp với các tác vụ nhẹ như soạn thảo văn bản, duyệt web, kiểm tra email.\r\nIntel Core i5 hoặc AMD Ryzen 5: Lý tưởng cho công việc văn phòng nặng hơn hoặc tác vụ đa nhiệm.\r\nIntel Core i7 hoặc AMD Ryzen 7: Phù hợp với công việc đòi hỏi xử lý mạnh như lập trình, thiết kế đồ họa, biên tập video.\r\nIntel Core i9 hoặc AMD Ryzen 9: Dành cho các công việc chuyên sâu, cần hiệu suất tối đa như game thủ hoặc các chuyên gia dựng phim.\r\nRAM:\r\n8GB: Đủ cho các công việc văn phòng và duyệt web đa tác vụ.\r\n16GB: Lý tưởng cho những người cần làm việc với nhiều ứng dụng đồng thời, lập trình hoặc thiết kế đồ họa.\r\n32GB trở lên: Phù hợp cho các công việc chuyên sâu như biên tập video 4K, render 3D hoặc mô phỏng phức tạp.\r\n3. Dung Lượng Lưu Trữ: SSD và HDD\r\nSSD (Solid State Drive):\r\nSSD có tốc độ đọc/ghi nhanh hơn nhiều so với ổ cứng HDD truyền thống, giúp máy khởi động nhanh và phản hồi tốt hơn. Một số dung lượng bạn cần cân nhắc:\r\n\r\n256GB SSD: Đủ cho công việc văn phòng và lưu trữ dữ liệu cơ bản.\r\n512GB SSD: Lý tưởng cho người làm việc đa nhiệm hoặc cần lưu trữ nhiều tài liệu.\r\n1TB SSD trở lên: Phù hợp cho các chuyên gia dựng phim, thiết kế đồ họa, lập trình viên có nhu cầu lưu trữ lớn.\r\nHDD (Hard Disk Drive):\r\nHDD có dung lượng lớn với giá thành rẻ hơn SSD, nhưng tốc độ chậm hơn. Một số laptop kết hợp cả SSD và HDD, giúp bạn có dung lượng lớn với tốc độ nhanh.\r\n\r\n4. Kích Thước và Độ Phân Giải Màn Hình\r\nKích thước màn hình:\r\n13 – 14 inch: Laptop gọn nhẹ, dễ mang theo, phù hợp với người làm việc di động hoặc văn phòng.\r\n15 – 16 inch: Màn hình rộng hơn, dễ làm việc với các bảng tính lớn, nhưng máy nặng và kém linh hoạt hơn.\r\n17 inch: Thích hợp cho các công việc yêu cầu màn hình lớn như thiết kế đồ họa, chỉnh sửa video, hoặc lập trình viên thường xuyên cần nhiều không gian làm việc.\r\nĐộ phân giải:\r\nFull HD (1920x1080): Độ phân giải tiêu chuẩn, phù hợp với hầu hết nhu cầu.\r\n2K hoặc 4K: Độ phân giải cao hơn, phù hợp với công việc đồ họa, video hoặc khi cần độ chi tiết cao.\r\n5. Card Đồ Họa (GPU)\r\nNếu bạn không làm việc với đồ họa nặng hoặc game, card đồ họa tích hợp (integrated GPU) như Intel Iris Xe hoặc AMD Radeon Vega đủ để đáp ứng nhu cầu cơ bản. Tuy nhiên, nếu bạn làm việc với các ứng dụng đồ họa 3D, dựng phim hoặc chơi game, hãy lựa chọn laptop có card đồ họa rời (dedicated GPU) như NVIDIA GeForce GTX/RTX hoặc AMD Radeon RX để có hiệu suất tốt hơn.\r\n\r\n6. Thời Lượng Pin\r\nNếu bạn thường xuyên di chuyển và không luôn có sẵn ổ điện, thời lượng pin là yếu tố cực kỳ quan trọng. Laptop cho công việc di động nên có pin kéo dài ít nhất 8-10 giờ. Các dòng laptop ultrabook thường có thời lượng pin tốt hơn, trong khi các laptop mạnh mẽ như laptop gaming hoặc máy trạm thường tiêu tốn nhiều năng lượng hơn.\r\n\r\n7. Cổng Kết Nối và Tính Năng Bổ Sung\r\nCổng kết nối:\r\nĐảm bảo laptop của bạn có đủ các cổng cần thiết cho công việc, chẳng hạn như:\r\n\r\nUSB-C: Đa năng, có thể dùng để sạc và kết nối nhiều thiết bị.\r\nHDMI: Kết nối với màn hình ngoài hoặc máy chiếu.\r\nEthernet: Nếu bạn cần kết nối mạng ổn định qua cáp LAN.\r\nJack tai nghe, thẻ SD: Quan trọng nếu bạn cần sử dụng tai nghe hoặc đọc thẻ nhớ.\r\nTính năng bảo mật:\r\nCác tính năng như cảm biến vân tay hoặc bảo mật nhận diện khuôn mặt (Windows Hello) rất hữu ích để bảo vệ dữ liệu của bạn.\r\n\r\n8. Thương Hiệu và Chế Độ Bảo Hành\r\nThương hiệu và chế độ bảo hành là yếu tố bạn nên cân nhắc khi chọn laptop. Những thương hiệu nổi tiếng như Dell, HP, Lenovo, Apple hay ASUS thường có sản phẩm chất lượng và chế độ bảo hành tốt. Ngoài ra, hãy kiểm tra thời gian và điều kiện bảo hành của nhà sản xuất để đảm bảo bạn được hỗ trợ khi cần thiết.\r\n\r\nKết Luận\r\nViệc lựa chọn laptop phù hợp với nhu cầu công việc không chỉ phụ thuộc vào giá cả mà còn liên quan đến nhiều yếu tố khác như CPU, RAM, màn hình, và thời lượng pin. Hiểu rõ nhu cầu công việc của mình là bước đầu tiên quan trọng để chọn được thiết bị phù hợp. Hãy cân nhắc kỹ trước khi quyết định, để chiếc laptop trở thành công cụ hỗ trợ tốt nhất cho công việc của bạn.', 'cach-chon-laptop-phu-hop-voi-nhu-cau-hoc-tap', '/imgpost/top-8-maujpg.jpg', '', 1, NULL, 'active', '2024-11-22 13:26:57', '2024-11-22 13:53:13'),
(5, 'Những lưu ý khi mua laptop: Cấu hình, thương hiệu và giá cả', 'nhung-luu-y-khi-mua-laptop-cau-hinh-thuong-hieu-va-gia-ca', 'Hướng dẫn cách chọn laptop dựa trên cấu hình, thương hiệu nổi tiếng và mức giá phù hợp với túi tiền', 'Laptop văn phòng giá rẻ mang lại nhiều ưu điểm vượt trội, từ giá cả phải chăng, đáp ứng nhu cầu sử dụng cơ bản, tính di động cao, sự đa dạng về lựa chọn, đến việc dễ dàng sử dụng và bảo trì. Những lợi ích này làm cho laptop giá rẻ trở thành một lựa chọn hấp dẫn cho nhiều người dùng, đặc biệt là những ai có ngân sách hạn chế nhưng vẫn cần một công cụ làm việc hiệu quả.\r\n\r\nƯu điểm của laptop văn phòng giá rẻ\r\nLaptop văn phòng giá rẻ là lựa chọn phổ biến cho nhiều người dùng, từ sinh viên đến nhân viên văn phòng, nhờ vào nhiều ưu điểm nổi bật. Dưới đây là những lợi ích chính của việc sở hữu một chiếc laptop văn phòng giá rẻ:\r\n\r\nGiá cả phải chăng\r\nMột trong những ưu điểm lớn nhất của laptop giá rẻ cho dân văn phòng là giá cả phải chăng. Với ngân sách hạn chế, bạn vẫn có thể sở hữu một chiếc laptop đáp ứng đủ nhu cầu công việc hàng ngày mà không phải chi tiêu quá nhiều.\r\n\r\nDo giá thành không quá cao, bạn có thể dễ dàng nâng cấp hoặc thay thế laptop mới khi cần thiết mà không phải lo lắng về việc đầu tư quá nhiều.\r\n\r\nGiá cả phải chăng\r\n\r\nGiá cả phải chăng\r\n\r\nĐáp ứng nhu cầu sử dụng cơ bản\r\nLaptop văn phòng giá tốt thường được trang bị đủ cấu hình để xử lý các tác vụ văn phòng cơ bản như soạn thảo văn bản, xử lý bảng tính, gửi email và duyệt web. Các công việc này không đòi hỏi phần cứng quá mạnh mẽ, nên các dòng laptop giá rẻ hoàn toàn có thể đáp ứng tốt.\r\n\r\nNgoài công việc, các laptop văn phòng giá rẻ cũng có thể đáp ứng nhu cầu giải trí cơ bản như xem phim, nghe nhạc và chơi các trò chơi nhẹ nhàng.\r\n\r\nTính di động cao\r\nNhiều laptop văn phòng giá rẻ được thiết kế với trọng lượng nhẹ và kích thước nhỏ gọn, dễ dàng mang theo khi di chuyển. Điều này đặc biệt hữu ích cho những người thường xuyên di chuyển giữa nhà, trường học và văn phòng.\r\n\r\nMột số dòng laptop giá rẻ được tối ưu hóa về thời lượng pin, giúp người dùng có thể làm việc liên tục trong nhiều giờ mà không cần phải sạc pin thường xuyên.\r\n\r\nSự đa dạng về lựa chọn\r\nThị trường laptop văn phòng mỏng nhẹ giá rẻ rất đa dạng với nhiều lựa chọn từ các thương hiệu nổi tiếng như Dell, HP, Lenovo, Asus và Acer. Người dùng có thể dễ dàng tìm thấy sản phẩm phù hợp với phong cách và nhu cầu cá nhân.\r\n\r\nDù là laptop giá rẻ, nhiều sản phẩm vẫn được trang bị các tính năng tiện ích như cổng USB Type-C, HDMI, đầu đọc thẻ SD, và các tính năng bảo mật như cảm biến vân tay hoặc nhận diện khuôn mặt.\r\n\r\nSản phẩm Laptop tiêu biểu tại VTech\r\nMáy tính xách tay Dell Inspiron 3520 Core i7-1255U / Vga MX 550 2GB/ Màn 15.6 inch Full HD\r\nMáy tính xách tay Dell Inspiron 3520 Core i7-1255U / Vga MX 550 2GB/ Màn 15.6 inch Full HD\r\n\r\n17,590,000đ\r\n\r\n\r\nMáy tính xách tay Dell Inspiron 5630 Core i5 1340P - Màn 16 inch FHD+ \r\nMáy tính xách tay Dell Inspiron 5630 Core i5 1340P - Màn 16 inch FHD+ \r\n\r\n16,500,000đ\r\n\r\n\r\nLaptop HP ProBook 450 G10 i5-1335U/16G/512GSSD/Win11/15”6FHD\r\nLaptop HP ProBook 450 G10 i5-1335U/16G/512GSSD/Win11/15”6FHD\r\n\r\n20,990,000đ\r\n\r\n\r\nLaptop HP ProBook 440 G10 i5-1335U/16GB/512GB SSD/Win11/14\r\nLaptop HP ProBook 440 G10 i5-1335U/16GB/512GB SSD/Win11/14\"FHD\r\n\r\n20,390,000đ\r\n\r\n\r\nLaptop HP ProBook 440 G10 i5-1335U/8GB/512GB SSD/Win11/14\r\nLaptop HP ProBook 440 G10 i5-1335U/8GB/512GB SSD/Win11/14\"FHD\r\n\r\n19,190,000đ\r\n\r\n\r\nLaptop HP EliteBook 630 G9 6M145PA (Core i7 1255U/ 8GB/ 512GB SSD/ Intel UHD Graphics/ 13.3inch Full HD/ Windows 11 Home/ Silver/ Vỏ nhôm)\r\nLaptop HP EliteBook 630 G9 6M145PA (Core i7 1255U/ 8GB/ 512GB SSD/ Intel UHD Graphics/ 13.3inch Full HD/ Windows 11 Home/ Silver/ Vỏ nhôm)\r\n\r\n22,190,000đ\r\n\r\n\r\nDễ dàng sử dụng và bảo trì\r\nLaptop văn phòng giá rẻ thường đi kèm với các hệ điều hành thân thiện như Windows 10 hoặc Windows 11, giúp người dùng dễ dàng làm quen và sử dụng. Các hệ điều hành này cũng hỗ trợ nhiều phần mềm phổ biến trong công việc văn phòng.\r\n\r\nViệc bảo trì và sửa chữa laptop văn phòng giá rẻ thường không quá phức tạp và chi phí thấp, do các linh kiện phổ biến và dễ tìm.\r\n\r\nDễ dàng sử dụng và bảo trì\r\n\r\nDễ dàng sử dụng và bảo trì\r\n\r\n5 lưu ý khi mua laptop văn phòng giá rẻ\r\nMua laptop văn phòng giá rẻ là một quyết định quan trọng, đặc biệt đối với những người làm việc văn phòng, sinh viên hoặc những ai có ngân sách hạn chế. Một chiếc laptop phù hợp không chỉ giúp bạn hoàn thành công việc hiệu quả mà còn mang lại trải nghiệm sử dụng thoải mái và bền bỉ. Dưới đây là 5 lưu ý quan trọng mà bạn cần xem xét khi mua laptop văn phòng giá rẻ.\r\n\r\nXác định nhu cầu sử dụng\r\nNếu công việc của bạn chủ yếu liên quan đến các tác vụ văn phòng cơ bản như soạn thảo văn bản, xử lý bảng tính, gửi email và duyệt web, bạn không cần một chiếc laptop quá mạnh mẽ. Một laptop với vi xử lý Intel Celeron hoặc Pentium cùng với RAM 4GB có thể đủ để đáp ứng nhu cầu này.\r\n\r\nNếu công việc của bạn yêu cầu xử lý đồ họa, chỉnh sửa video hoặc chạy các phần mềm phức tạp, bạn cần một laptop có cấu hình mạnh hơn. Hãy tìm kiếm laptop có vi xử lý Intel Core i5 hoặc AMD Ryzen 5 trở lên, RAM ít nhất 8GB và ổ cứng SSD để đảm bảo hiệu suất tốt.\r\n\r\nKiểm tra cấu hình\r\nVi xử lý là \"bộ não\" của laptop, quyết định phần lớn hiệu suất của máy. Đối với laptop văn phòng giá rẻ, bạn nên chọn các dòng vi xử lý như Intel Core i3, i5 hoặc AMD Ryzen 3, Ryzen 5. Tránh các vi xử lý quá cũ hoặc quá yếu như Intel Atom hay AMD A-series.\r\n\r\nRAM là yếu tố quan trọng giúp máy chạy mượt mà khi mở nhiều ứng dụng cùng lúc. Đối với công việc văn phòng cơ bản, RAM 4GB có thể đủ, nhưng để đảm bảo hiệu suất tốt hơn, bạn nên chọn laptop có ít nhất 8GB RAM.\r\n\r\nỔ cứng SSD (Solid State Drive) có tốc độ truy xuất dữ liệu nhanh hơn nhiều so với ổ cứng HDD (Hard Disk Drive). Laptop có ổ cứng SSD giúp khởi động máy nhanh, mở ứng dụng mượt mà và giảm thời gian chờ đợi. Hãy chọn laptop có ít nhất 256GB SSD để đảm bảo không gian lưu trữ đủ cho công việc.\r\n\r\nMàn hình laptop văn phòng nên có kích thước từ 14 đến 15.6 inch để đảm bảo đủ không gian làm việc mà vẫn giữ được tính di động. Độ phân giải Full HD (1920x1080) là lý tưởng để đảm bảo hình ảnh sắc nét và chi tiết.\r\n\r\nKiểm tra cấu hình\r\n\r\nKiểm tra cấu hình\r\n\r\nKiểm tra các cổng kết nối và tính năng\r\nMột chiếc laptop văn phòng giá rẻ cần có đủ các cổng kết nối để tiện lợi trong công việc. Các cổng phổ biến bao gồm USB Type-A, USB Type-C, HDMI, đầu đọc thẻ SD và cổng âm thanh 3.5mm. Đảm bảo laptop của bạn có ít nhất 2 cổng USB và một cổng HDMI để kết nối với các thiết bị ngoại vi và màn hình ngoài.\r\n\r\nBàn phím và touchpad là hai yếu tố quan trọng quyết định trải nghiệm sử dụng hàng ngày. Hãy chọn laptop có bàn phím thoải mái, hành trình phím vừa phải và touchpad nhạy. Nếu có thể, hãy thử sử dụng trực tiếp trước khi mua để đảm bảo cảm giác gõ phím và di chuột tốt.\r\n\r\nMột số laptop văn phòng giá rẻ cũng được trang bị các tính năng bảo mật như cảm biến vân tay hoặc nhận diện khuôn mặt. Những tính năng này giúp bảo vệ dữ liệu của bạn tốt hơn và tiện lợi hơn trong việc đăng nhập.\r\n\r\nKiểm tra các cổng kết nối và tính năng\r\n\r\nKiểm tra các cổng kết nối và tính năng\r\n\r\nThương hiệu và chính sách bảo hành\r\nChọn laptop từ các thương hiệu uy tín như Dell, HP, Lenovo, Asus và Acer để đảm bảo chất lượng và dịch vụ hỗ trợ tốt. Các thương hiệu này thường có các dòng sản phẩm đa dạng, đáp ứng được nhiều nhu cầu và ngân sách khác nhau.\r\n\r\nKiểm tra kỹ chính sách bảo hành của laptop trước khi mua. Một chiếc laptop văn phòng nên có thời gian bảo hành ít nhất 1 năm. Một số cửa hàng hoặc nhà sản xuất cũng cung cấp các gói bảo hành mở rộng, bạn nên cân nhắc để tăng thêm sự an tâm trong quá trình sử dụng.\r\n\r\nĐọc đánh giá và so sánh giá\r\nTrước khi quyết định mua, hãy dành thời gian đọc các đánh giá từ người dùng và các chuyên gia công nghệ. Những đánh giá này giúp bạn hiểu rõ hơn về ưu và nhược điểm của từng mẫu laptop, từ đó đưa ra quyết định thông minh hơn.\r\n\r\nGiá cả là yếu tố quan trọng khi mua laptop văn phòng giá rẻ. Hãy so sánh giá từ nhiều nguồn khác nhau như cửa hàng điện tử, trang web thương mại điện tử, và các chương trình khuyến mãi để tìm được giá tốt nhất. Đừng quên kiểm tra các điều khoản về vận chuyển và đổi trả hàng để tránh rắc rối không đáng có.\r\n\r\nMua laptop văn phòng giá rẻ đòi hỏi sự cân nhắc kỹ lưỡng để đảm bảo bạn có được sản phẩm phù hợp với nhu cầu và ngân sách của mình. Bằng cách xác định rõ nhu cầu sử dụng, kiểm tra cấu hình, xem xét các cổng kết nối và tính năng, chọn thương hiệu uy tín và chính sách bảo hành tốt, cùng với việc đọc đánh giá và so sánh giá, bạn sẽ dễ dàng tìm được chiếc laptop ưng ý.\r\n\r\nĐọc đánh giá và so sánh giá\r\n\r\nĐọc đánh giá và so sánh giá\r\n\r\nVtech Kỹ Thuật Việt – Địa chỉ cung cấp laptop văn phòng giá rẻ uy tín\r\nVtech Kỹ Thuật Việt là đơn vị hàng đầu trong lĩnh vực cung cấp các giải pháp công nghệ thông tin với những sản phẩm laptop văn phòng giá rẻ, chất lượng cao. Chúng tôi hiểu rằng một chiếc laptop hiệu quả và bền bỉ là công cụ không thể thiếu cho công việc hàng ngày của bạn. Tại Vtech Kỹ Thuật Việt, chúng tôi cam kết mang đến những dòng sản phẩm tốt nhất với giá cả phải chăng, phục vụ nhu cầu đa dạng của khách hàng.\r\n\r\nVtech cung cấp một loạt các mẫu laptop văn phòng từ các thương hiệu uy tín như Dell, HP, Lenovo, Asus và Acer. Dù bạn cần một chiếc laptop cơ bản cho các tác vụ văn phòng đơn giản hay một chiếc máy mạnh mẽ để xử lý đồ họa và phần mềm phức tạp, chúng tôi đều có sản phẩm phù hợp với nhu cầu của bạn.\r\n\r\nTất cả các sản phẩm laptop tại Vtech Kỹ Thuật Việt đều được kiểm tra kỹ lưỡng trước khi đưa đến tay khách hàng. Chúng tôi cam kết cung cấp những sản phẩm chất lượng, bền bỉ và đáng tin cậy, giúp bạn yên tâm sử dụng trong công việc hàng ngày.\r\n\r\nChúng tôi hiểu rằng giá cả là một yếu tố quan trọng khi mua sắm công nghệ. VTech Kỹ Thuật Việt luôn nỗ lực để mang đến những sản phẩm laptop văn phòng với mức giá cạnh tranh nhất trên thị trường. Chúng tôi thường xuyên có các chương trình khuyến mãi và ưu đãi đặc biệt để giúp bạn tiết kiệm chi phí mà vẫn sở hữu được chiếc laptop ưng ý.\r\n\r\nVtech Kỹ Thuật Việt không chỉ bán sản phẩm mà còn chú trọng đến dịch vụ khách hàng. Đội ngũ nhân viên tư vấn chuyên nghiệp của chúng tôi sẽ giúp bạn chọn lựa sản phẩm phù hợp với nhu cầu và ngân sách. Chúng tôi cũng cung cấp dịch vụ hỗ trợ kỹ thuật và bảo hành chu đáo, giúp bạn yên tâm sử dụng sản phẩm mà không lo lắng về các vấn đề kỹ thuật.\r\n\r\nChúng tôi cung cấp chính sách bảo hành uy tín, đảm bảo quyền lợi của khách hàng khi mua sản phẩm tại Vtech Kỹ Thuật Việt. Thời gian bảo hành tối thiểu là 12 tháng và có thể mở rộng tùy theo từng dòng sản phẩm. Chúng tôi cam kết xử lý các vấn đề bảo hành một cách nhanh chóng và hiệu quả.', 'nhung-luu-y-khi-mua-laptop-cau-hinh-thuong-hieu-va-gia-ca', '/imgpost/nhung_luu_y.png', '', 1, NULL, 'active', '2024-11-22 13:34:00', '2024-11-22 13:54:18'),
(6, 'Cách chọn phụ kiện laptop: Chuột, bàn phím, tai nghe và túi đựng', 'cach-chon-phu-kien-laptop-chuot-ban-phim-tai-nghe-va-tui-dung', 'Khám phá các phụ kiện cần thiết cho laptop như chuột, bàn phím, tai nghe, và túi đựng. Bài viết cũng cung cấp mẹo chọn phụ kiện phù hợp', 'Làm việc siêng năng, chơi game thoải mái tại nhà, rồi cũng có lúc bạn muốn đi đâu đó, du lịch chẳng hạn. Hoặc có người chọn mang theo những món thiết bị yêu thích ngày ngày đi đi về về giữa chỗ làm và nhà riêng.\r\n\r\nVà đó là lúc bạn nhận ra mình cần tìm một món phụ kiện chân ái: túi đựng bàn phím cơ, chuôt, dây cáp, cao hơn là một chiếc túi đựng laptop chuyên dụng.\r\n\r\nĐây không phải các món phụ kiện khó tìm. Hầu như ở bất kỳ nguồn mua hàng nào, online hay offline, bạn đều có thể tìm thấy một chiếc túi ưng ý cho mình. Nên ở đây mình không muốn nhắc đến việc nên mua túi ở đây (dù bài này cũng có tí quảng bá nhẹ). Mà chỉ muốn nhấn mạnh vào các yếu tố cần quâm khi chọn mua túi phụ kiện đựng thiết bị máy tính.\r\n\r\nChọn mua túi đựng chuột, bàn phím hoặc túi đựng laptop cần quan tâm đến các yếu tố nào?\r\nKhông phải bàn phím công ty cấp sẵn nào cũng khiến bạn làm việc thoải mái. Chuột cũng vậy. Bởi thế nhiều người đã chọn cách đầu tư hẳn cho mình một bộ chuột + bàn phím cơ xịn sò, vừa dùng ở nhà, vừa mang theo đi làm mỗi ngày, để đảm bảo năng suất làm việc và cảm giác hào hứng cao nhất.\r\n\r\nVấn đề là làm sao để mang chúng theo mình một cách tiện lợi, gọn nhẹ và an toàn nhất. Đó là khi bạn sẽ cần đến chiếc túi chuyên dụng.\r\n\r\nDù chọn thương hiệu nào, mua túi đựng bàn phím và chuột ở đâu, bạn cũng cần xem xe13t môt số yếu tố sau:\r\n\r\n1/ Kích cỡ túi\r\nDựa vào kích cỡ bàn phím đang dùng (100%, 75% hay 60% hoặc nhỏ hơn), trừ hao thêm một chút xíu cho để vừa luôn con chuột. Bạn cần nằm rõ kích cỡ bàn phím của mình để chọn đúng cỡ túi. Rộng quá sẽ dẫn đến xộc xệch, thiết bị chạy lung tung không an toàn. Chật quá thì không để vừa. Đúng cỡ nhưng thiết kế rộng rãi, thoáng đãng, có nhiều ngăn, nhiều không gian để các phụ kiện lớn bé đi kèm là tốt nhất.\r\n\r\n\r\ntúi PCX_GAMING_KIT này có thể đựng 1 bàn phím + 5 chuột hoặc 2 bàn phím + 1 chuột\r\n2/ Chất liệu\r\nChất liệu làm túi là một trong các yếu tố cực kỳ quan trọng. Có 2 dòng túi thường gặp: túi mềm và túi cứng. Dù được làm bằng chất liệu nào, túi cũng cần đạt các tiêu chí sau:\r\n\r\nChất liệu chọn lọc với độ bền bỉ cao\r\nCó khả năng chống thấm hoặc ít thấm, có khả năng ngăn bụi\r\nBên trong êm ái bảo vệ máy\r\n\r\n\r\n3/ Thiết kế chia ngăn thông minh\r\nTúi đựng laptop hoặc bàn phím chuột cần có ngăn lớn đựng các thiết bị chính (như laptop, bàn phím, chuột) và ngăn nhỏ cho phụ kiện nhỏ như tai nghe, cáp sạc, dây kết nối. Các ngăn được cách nhau bởi lớp chất liệu tương tự như chất liệu túi hoặc lớp lưới, hay nhựa kaki đảm bảo các vật dụng không va vào nhau bị trầy xước.\r\n\r\nVới ngăn đựng thiết bị chính ó thể có thêm dây ràng đảm bảo không bị chạy, xộc xệch khi di chuyển hay bị rơi ra khi mở túi bất ngờ.\r\n\r\n\r\n\r\n4/ Thiết kế quai xách, dây đeo chắc chắn, hợp lý\r\nDù kích nhỏ hay lớn, một khi đã dùng tới túi đựng laptop hoặc phụ kiện, nhất định bạn đang có nhu cầu di chuyển và mang xách. Để đảm bảo an toàn cho các thiết bị bên trong, ngoài chất liệu làm túi và thiết kế các ngăn, phần quai xách và dây đeo cũng là yếu tố quan trọng.\r\n\r\nQuai hay dây đeo cần làm từ chất liệu không dãn, chắc chắn, bản dày, một số chi tiết cần có tăng-đơ nới ra thắt chặt thu gọn khi cần thiết. Đi kèm là phần khóa kéo chất lượng cao, chống kẹt, dễ cầm nắm khi muốn mở túi. Với túi đựng laptop có thể có thêm miếng đệm vai chống mỏi khi mang trên vai nhiều giờ.\r\n\r\n\r\nTúi đựng laptop Formo là lựa chọn của nhiều bạn trẻ thích năng động\r\n6/ Lớp chống sốc bên trong\r\nĐã là túi đựng đồ công nghệ chất lượng, nhất thiết phải có chi tiết này – lớp chống sốc. Với một lớp chống sốc dày bên trong, các món đồ yêu quý của bạn được đảm bảo an toàn thêm một lần nữa, hạn chế tối đa va chạm trong nhiều tình huống bất khả kháng.\r\n\r\n7/ Đường may tỉ mỉ, chắc chắn\r\nĐường may quanh và bên trong túi vừa thể hiện sự tỉ mỉ, tinh xảo của nhà sản xuất, vừa bộc lộ phần nào tính thẩm mỹ của chiếc túi. Nên chọn các túi đựng thiết bị công nghệ có đường may tinh xảo, chắc nịch với phần chỉ dày, xem xét kỹ nhất ở các góc và đường bo.\r\n\r\nĐường may không chắc chắn làm túi dễ bung xúc khi đựng đồ nặng, vừa không an toàn vừa mất thẩm mỹ.\r\n\r\n\r\n\r\n8/ Thiết kế gọn gàng tinh giản\r\nTổng quan, một chiếc túi đựng laptop hoặc thiết bị máy tính cần có thiết bị chung gọn gàng, tinh giản. Gọn gàng để tập trung vào chức năng chia ngăn, bảo vệ và mang xách. Tinh giản để dễ dàng lấy thiết bị ra vào, đồng thời tạo cảm giác thẩm mỹ hiện đại, trung hòa, dễ nhìn trong mọi hoàn cảnh.\r\nChúc bạn sớm tìm được món phụ kiện túi đựng laptop/ bàn phím cơ chuột đúng ý mình.', 'cach-chon-phu-kien-laptop-chuot-ban-phim-tai-nghe-va-tui-dung', '/imgpost/phukien.jpg', '', 3, NULL, 'active', '2024-11-22 13:36:59', '2024-11-22 13:55:10'),
(7, 'Đánh giá chi tiết dòng laptop X: Hiệu năng, thiết kế và giá trị', 'danh-gia-chi-tiet-dong-laptop-x-hieu-nang-thiet-ke-va-gia-tri', 'Khám phá dòng laptop X với đánh giá chi tiết về hiệu năng, thiết kế và giá trị sử dụng. Bài viết này sẽ giúp bạn hiểu rõ hơn về laptop trước khi mua', 'Có nên mua Laptop Lenovo không? Đánh giá chi tiết về Laptop Lenovo\r\nLaptop Lenovo, chính thức được gọi là Lenovo Group Ltd., là một tập đoàn công nghệ thông tin toàn cầu, được thành lập vào năm 1984 tại Bắc Kinh, Trung Quốc dưới tên gọi Legend. Hiện tại, Lenovo có các trụ sở chính ở Bắc Kinh (Trung Quốc) và Morrisville (North Carolina, Mỹ). Lenovo nổi bật với danh mục sản phẩm đa dạng, bao gồm máy tính để bàn, laptop, máy trạm, máy chủ, smartphone và nhiều thiết bị công nghệ khác.\r\n\r\nco-nen-mua-laptop-lenovo-khong-djanh-gia-chi-tiet-ve-laptop-lenovo\r\n\r\nLựa chọn laptop Lenovo là một quyết định thông minh nhờ vào sự kết hợp hoàn hảo giữa uy tín thương hiệu, đa dạng sản phẩm và mức giá hợp lý. Dưới đây là những lý do nổi bật khiến bạn nên cân nhắc mua laptop Lenovo:\r\n\r\nThiết kế mỏng nhẹ, hiện đại:\r\nLaptop Lenovo ghi điểm với thiết kế mỏng nhẹ và thời thượng. Các linh kiện như card đồ họa, CPU và ổ cứng được tích hợp tinh tế trong màn hình, giúp máy trở nên gọn nhẹ hơn. Mặc dù nhỏ gọn, các mẫu laptop như Lenovo Yoga Duet 7 vẫn mang đến vẻ ngoài sang trọng và đẳng cấp.\r\n\r\nCấu hình đa dạng và mạnh mẽ:\r\nLenovo cung cấp nhiều tùy chọn cấu hình, từ Core i3, Core i5 đến Core i7, cùng với các card đồ họa rời để đáp ứng nhu cầu sử dụng của bạn. Hiệu suất của laptop Lenovo ấn tượng với khả năng xử lý video, thiết kế đồ họa và các ứng dụng yêu cầu dung lượng cao một cách nhanh chóng và hiệu quả.\r\n\r\nco-nen-mua-laptop-lenovo-khong-djanh-gia-chi-tiet-ve-laptop-lenovo-h2\r\n\r\nCông nghệ tiên tiến:\r\nCác laptop Lenovo được trang bị công nghệ tiên tiến và bộ xử lý Qualcomm, hỗ trợ tốt cho các phần mềm sáng tạo như Adobe Photoshop và Illustrator. Điều này giúp bạn làm việc hiệu quả và sáng tạo hơn trong các dự án thiết kế.\r\n\r\nDung lượng Pin ấn tượng:\r\nDù có thiết kế mỏng nhẹ, laptop Lenovo không làm bạn thất vọng với dung lượng pin lớn. Thời gian sử dụng pin tối thiểu lên đến 8 giờ liên tục với các tác vụ cơ bản, cùng với tuổi thọ pin vượt trội, giúp bạn yên tâm khi di chuyển hoặc làm việc lâu dài mà không phải lo lắng về việc hết pin nhanh chóng.\r\n\r\nTOP 6 dòng laptop Lenovo tốt nhất nên đầu tư ngay\r\nDòng Lenovo Thinkpad\r\nDòng laptop Lenovo ThinkPad nổi bật với thiết kế chắc chắn và hiệu năng vượt trội, đủ sức xử lý các tựa game phổ biến hiện nay. Một điểm cộng lớn là thời lượng pin ấn tượng, lý tưởng cho những ai thường xuyên làm việc hoặc di chuyển xa.\r\n\r\ntop-6-dong-laptop-lenovo-tot-nhat-nen-djau-tu-ngay\r\n\r\nLenovo ThinkPad là lựa chọn tuyệt vời cho các chuyên gia trong lĩnh vực IT, thiết kế đồ họa, và dựng phim nhờ vào khả năng xử lý mạnh mẽ và độ bền cao.\r\n\r\nDòng Lenovo Ideapad\r\nDòng laptop Lenovo Ideapad nổi bật với mức giá phải chăng, khiến nó trở thành lựa chọn hấp dẫn cho những ai tìm kiếm hiệu suất cao mà không cần bỏ ra quá nhiều chi phí. Đặc biệt, dòng Ideapad V series được thiết kế dành riêng cho doanh nghiệp nhỏ, với hệ thống bảo mật nâng cao và cấu hình mạnh mẽ, dẫn đến giá thành nhỉnh hơn.\r\n\r\ntop-6-dong-laptop-lenovo-tot-nhat-nen-djau-tu-ngay-h2\r\n\r\nNếu bạn đang tìm một chiếc laptop với hiệu suất vượt trội, thiết kế mỏng nhẹ và dễ sử dụng, thì dòng Ideapad là sự lựa chọn lý tưởng. Các mẫu laptop trong dòng này được trang bị vi xử lý hiện đại và màn hình chất lượng cao, đáp ứng tốt mọi nhu cầu học tập, làm việc và giải trí của bạn.\r\n\r\nDòng Lenovo Yoga\r\nDòng laptop Lenovo Yoga mang đến sự cân bằng tuyệt vời giữa hiệu suất và giá cả, nằm trong phân khúc tầm trung. Với cấu hình đủ mạnh để đáp ứng các nhu cầu cơ bản, dòng máy này rất phù hợp cho học sinh và sinh viên tìm kiếm một thiết bị hỗ trợ học tập hiệu quả.\r\n\r\ntop-6-dong-laptop-lenovo-tot-nhat-nen-djau-tu-ngay-h3\r\n\r\nMột điểm nổi bật của Lenovo Yoga là khả năng chuyển đổi linh hoạt. Nhiều mẫu trong dòng này không chỉ hoạt động như một laptop thông thường mà còn có thể chuyển đổi thành máy tính bảng, mang lại sự tiện lợi và linh hoạt cao trong quá trình sử dụng.\r\n\r\nDòng Lenovo V Series\r\nLenovo cũng cung cấp một dòng laptop đặc biệt dành cho các nhu cầu công việc, đó là Lenovo V Series.\r\n\r\ntop-6-dong-laptop-lenovo-tot-nhat-nen-djau-tu-ngay-h4\r\n\r\nDòng máy này nổi bật với thiết kế tối giản và thanh lịch, cùng với cấu hình mạnh mẽ, bảo mật cao, đảm bảo an toàn cho người dùng. Thời lượng pin ấn tượng của Lenovo V Series cũng là một điểm cộng lớn, làm cho nó trở thành sự lựa chọn lý tưởng cho những ai cần một chiếc laptop bền bỉ và đáng tin cậy cho công việc dài hạn.\r\n\r\nDòng Lenovo ThinkBook\r\nDòng Lenovo ThinkBook hướng đến đối tượng doanh nhân với thiết kế mỏng nhẹ và tinh tế. Được kế thừa phong cách thanh lịch từ dòng ThinkPad X và hiệu năng mạnh mẽ của dòng ThinkPad T, ThinkBook mang đến khả năng xử lý mượt mà cho mọi nhu cầu từ cơ bản đến nâng cao.\r\n\r\ntop-6-dong-laptop-lenovo-tot-nhat-nen-djau-tu-ngay-h5\r\n\r\nNgoài những tính năng nổi bật như bảo mật cao cấp, Lenovo ThinkBook còn trang bị màn hình cảm ứng đa điểm có thể biến thành một chiếc tablet nhỏ gọn, làm tăng tính linh hoạt và tiện dụng. Đây chính là lựa chọn lý tưởng cho các chuyên gia và doanh nhân cần một chiếc laptop vừa hiệu quả vừa thời trang.\r\n\r\nDòng Lenovo IdeaPad Gaming\r\nDòng laptop Lenovo IdeaPad Gaming kết hợp hoàn hảo giữa thiết kế cá tính và sang trọng với lớp vỏ nguyên khối chắc chắn. Cụ thể, Lenovo IdeaPad Gaming 3 nổi bật với thiết kế tối giản và đầy quyền lực, tạo nên một chiếc laptop gaming vừa mạnh mẽ vừa thời thượng. Mặc dù sở hữu cấu hình ấn tượng, giá cả của dòng sản phẩm này vẫn rất phải chăng, phù hợp với nhiều đối tượng khách hàng.\r\n\r\ntop-6-dong-laptop-lenovo-tot-nhat-nen-djau-tu-ngay-h6\r\n\r\nVề hiệu năng, Lenovo IdeaPad Gaming không chỉ xử lý mượt mà các tác vụ mà còn tiết kiệm năng lượng lên đến 50% nhờ vào sự kết hợp giữa nhân hiệu năng P-core và nhân tiết kiệm E-core. Các tính năng bổ sung như âm thanh chất lượng cao và đèn bàn phím RGB chuyển màu càng làm tăng giá trị của sản phẩm này.\r\n\r\nTrên đây là cái nhìn tổng quan về các dòng laptop Lenovo, cùng với những ưu điểm và nhược điểm của từng model. Hy vọng rằng thông tin này sẽ giúp bạn chọn lựa được chiếc laptop phù hợp. Cảm ơn bạn đã theo dõi bài viết và hẹn gặp lại bạn trong những chủ đề tiếp theo!', 'danh-gia-chi-tiet-dong-laptop-x-hieu-nang-thiet-ke-va-gia-tri', '/imgpost/danhgia.jpg', '', 4, NULL, 'active', '2024-11-22 13:38:50', '2024-11-22 13:55:49'),
(8, 'Top 5 laptop tốt nhất cho sinh viên năm 2024', 'top-5-laptop-tot-nhat-cho-sinh-vien-nam-2024', 'Tìm hiểu danh sách các laptop tốt nhất cho sinh viên năm 2024. Bài viết cung cấp các lựa chọn dựa trên hiệu năng, giá cả và tính di động', 'Tiêu chí lựa chọn laptop cho sinh viên:\r\nHiệu năng ổn định: Laptop phải đủ mạnh để xử lý mượt mà các tác vụ học tập như soạn thảo văn bản, làm bài thuyết trình, nghiên cứu tài liệu, lướt web, xem phim,...\r\n\r\nThiết kế gọn nhẹ: Dễ dàng mang theo đến trường, thư viện, quán cà phê,...\r\n\r\nThời lượng pin tốt: Đủ dùng cho cả ngày học tập mà không cần sạc nhiều lần.\r\n\r\nGiá cả hợp lý: Phù hợp với túi tiền của sinh viên.\r\n\r\nDưới đây là Top 5 laptop đáp ứng đầy đủ các tiêu chí trên:\r\n\r\n1. Laptop HP 255 G7 R3-3200U:\r\n\r\n\r\n \r\n\r\nGiá bán: 6,990,000 VNĐ\r\n\r\nCấu hình:\r\n\r\nCPU: AMD Ryzen 3 3200U - xử lý tốt các tác vụ văn phòng cơ bản.\r\n\r\nRAM: 8GB - Đủ dùng cho đa nhiệm mượt mà.\r\n\r\nỔ cứng: SSD 128GB + HDD 1TB - Khởi động nhanh, dung lượng lưu trữ lớn.\r\n\r\nMàn hình: 15.6 inch HD - Hình ảnh sắc nét, kích thước thoải mái để làm việc và giải trí.\r\n\r\nƯu điểm:\r\n\r\nGiá cả phải chăng.\r\n\r\nDung lượng lưu trữ lớn.\r\n\r\nMàn hình lớn, phù hợp cho cả học tập và giải trí.\r\n\r\nNhược điểm:\r\n\r\nHiệu năng chỉ ở mức cơ bản.\r\n\r\nSSD dung lượng hơi thấp.\r\n\r\nKết luận: HP 255 G7 là lựa chọn tiết kiệm cho sinh viên cần một chiếc laptop đa năng, xử lý tốt các tác vụ học tập cơ bản và có dung lượng lưu trữ lớn.\r\n\r\n2. Laptop Lenovo IdeaPad 5G 14Q8X05:\r\n\r\n\r\n \r\n\r\nGiá bán: 8,490,000 VNĐ\r\n\r\nCấu hình:\r\n\r\nCPU: Snapdragon 8cx - Hiệu năng mạnh mẽ, tiết kiệm pin.\r\n\r\nGPU: Adreno 680 - Đồ họa mượt mà, chơi game nhẹ nhàng.\r\n\r\nRAM: 8GB - Đa nhiệm mượt mà.\r\n\r\nỔ cứng: 512GB SSD - Khởi động nhanh, dung lượng lưu trữ lớn.\r\n\r\nMàn hình: 14 inch FHD IPS - Hình ảnh sắc nét, màu sắc sống động.\r\n\r\nƯu điểm:\r\n\r\nHiệu năng mạnh mẽ, tiết kiệm pin.\r\n\r\nThiết kế mỏng nhẹ, dễ dàng mang theo.\r\n\r\nMàn hình đẹp, chất lượng hiển thị tốt.\r\n\r\nNhược điểm:\r\n\r\nGiá thành cao hơn HP 255 G7.\r\n\r\nKhả năng tương thích phần mềm có thể hạn chế do sử dụng CPU ARM.\r\n\r\nKết luận: Lenovo IdeaPad 5G 14Q8X05 phù hợp cho sinh viên yêu thích thiết kế mỏng nhẹ, hiệu năng cao và thời lượng pin dài.\r\n\r\n3. Laptop HP Pavilion 15-eg3095TU:\r\n\r\n\r\n \r\n\r\nGiá bán: 18,590,000 VNĐ\r\n\r\nCấu hình:\r\n\r\nCPU: Intel Core i5-1335U - Hiệu năng mạnh mẽ, xử lý tốt các tác vụ học tập và giải trí.\r\n\r\nRAM: 8GB - Đa nhiệm mượt mà.\r\n\r\nỔ cứng: 512GB SSD - Khởi động nhanh, dung lượng lưu trữ lớn.\r\n\r\nMàn hình: 15.6 inch FHD - Hình ảnh sắc nét, kích thước thoải mái để làm việc và giải trí.\r\n\r\nƯu điểm:\r\n\r\nHiệu năng mạnh mẽ, đáp ứng tốt nhu cầu học tập và giải trí.\r\n\r\nThiết kế đẹp, sang trọng.\r\n\r\nMàn hình lớn, trải nghiệm hình ảnh tốt.\r\n\r\nNhược điểm:\r\n\r\nGiá thành cao hơn 2 lựa chọn trên.\r\n\r\nKết luận: HP Pavilion 15-eg3095TU là lựa chọn hoàn hảo cho sinh viên muốn sở hữu một chiếc laptop hiệu năng cao, thiết kế đẹp, phục vụ tốt cho cả học tập và giải trí.\r\n\r\n4. Laptop Dell Vostro 3420 i5-1235U:\r\n\r\n\r\n \r\n\r\nGiá bán: 13,400,000 VNĐ\r\n\r\nCấu hình:\r\n\r\nCPU: Intel Core i5-1235U - Hiệu năng mạnh mẽ, xử lý mượt mà các ứng dụng văn phòng.\r\n\r\nRAM: 8GB - Đa nhiệm mượt mà.\r\n\r\nỔ cứng: 512GB SSD - Khởi động nhanh, dung lượng lưu trữ lớn.\r\n\r\nMàn hình: 14.0\" FHD - Hình ảnh sắc nét, kích thước gọn gàng, phù hợp di chuyển.\r\n\r\nƯu điểm:\r\n\r\nCân bằng tốt giữa hiệu năng và giá cả.\r\n\r\nThiết kế bền bỉ, hướng đến người dùng doanh nghiệp.\r\n\r\nMàn hình 14 inch gọn nhẹ, dễ dàng mang theo.\r\n\r\nNhược điểm:\r\n\r\nKhông có card đồ họa rời, hạn chế khả năng chơi game.\r\n\r\nKết luận: Dell Vostro 3420 i5-1235U là sự lựa chọn lý tưởng cho sinh viên ưu tiên sự ổn định, bền bỉ và hiệu năng đủ dùng với mức giá hợp lý.\r\n\r\n5. Laptop Asus Zenbook 14 OLED Q415 Ultra 5-125H:\r\n\r\n\r\n \r\n\r\n \r\n\r\nGiá bán: 16,900,000 VNĐ\r\n\r\nCấu hình:\r\n\r\nCPU: Intel Core i5-125H - Hiệu năng mạnh mẽ.\r\n\r\nRAM: 8GB - Đa nhiệm mượt mà.\r\n\r\nỔ cứng: 512GB SSD - Khởi động nhanh, dung lượng lưu trữ lớn.\r\n\r\nMàn hình: FHD+ OLED Touch - Hình ảnh cực kỳ sắc nét, màu sắc sống động, hỗ trợ cảm ứng.\r\n\r\nƯu điểm:\r\n\r\nHiệu năng mạnh mẽ.\r\n\r\nMàn hình OLED tuyệt đẹp, hỗ trợ cảm ứng.\r\n\r\nThiết kế sang trọng, mỏng nhẹ.\r\n\r\nNhược điểm:\r\n\r\nGiá thành cao.\r\n\r\nKết luận: Asus Zenbook 14 OLED Q415 Ultra 5-125H là lựa chọn cao cấp cho sinh viên muốn sở hữu một chiếc laptop màn hình đẹp, hiệu năng cao, phục vụ tốt cho cả học tập và giải trí.\r\n\r\nLời kết:\r\n\r\nTrên đây là Top 5 laptop tuyệt vời nhất dành cho sinh viên năm 2024 tại Mai Phương Computer. Hy vọng bài viết này đã giúp bạn có thêm thông tin để lựa chọn được chiếc laptop phù hợp nhất với nhu cầu của mình. Hãy ghé thăm cửa hàng của chúng tôi hoặc liên hệ hotline để được tư vấn chi tiết và nhận được nhiều ưu đãi hấp dẫn!', 'top-5-laptop-tot-nhat-cho-sinh-vien-nam-2024', '/imgpost/top5.jpg', '', 5, NULL, 'active', '2024-11-22 13:40:36', '2024-11-22 13:56:22'),
(9, 'Cách bảo dưỡng và vệ sinh laptop đúng cách', 'cach-bao-duong-va-ve-sinh-laptop-dung-cach', 'Cách bảo dưỡng và vệ sinh laptop đúng cách để duy trì hiệu suất và tuổi thọ của thiết bị. Bài viết cung cấp các bước đơn giản để làm sạch và bảo vệ laptop', 'Hầu hết người dùng đều nhận ra tiếng ồn từ quạt tản nhiệt máy tính xách tay nguyên nhân vận hành quá công suất, để giữ laptop luôn ở nhiệt độ giới hạn. Thường thì laptop sau 1 năm hoạt động sẽ có nhiều bụi bẩn tích tụ. Và số lượng thì ngày càng nhiều. Cuối cùng có thể laptop sẽ trở nên nóng, hoạt động không còn tốt rất có thể ngừng hoạt động đột ngột.\r\n\r\ncách vệ sinh laptop\r\nHướng dẫn cách vệ sinh laptop tại nhà đúng cách\r\nĐiều đó không phải là trường hợp riêng lẻ của người dùng laptop. Khi laptop của bạn đang bắt đầu có hiện tượng quá nóng và hay tắt máy. Việc nên làm bây giờ là bảo dưỡng, vệ sinh laptop đúng cách. Bạn có thể tự làm hoặc nhờ bên thứ 3 tại các trung tâm laptop uy tín.\r\n\r\nTuy nhiên nếu bạn có thể ngăn chặn được trình trạng này từ ban đầu từ khi mua máy. Như luôn giữ sạch bên ngoài của máy tính xách tay của bạn, chắc chắn sử dụng laptop trong môi trường làm việc không bụi bẩn. Và tránh mảnh vụn bánh rơi vào bàn phím và lông động vật vào lỗ thông hơi.\r\n\r\nVệ sinh laptop ở đâu quang trọng nhất:\r\nVệ sinh quạt laptop\r\nVệ sinh lỗ thông hơi laptop\r\nVệ sinh loa laptop\r\nVệ sinh bàn phím laptop\r\nVệ sinh màn hình laptop\r\nVệ sinh các kết nối laptop\r\nVệ sinh laptop ở đâu quan trọng\r\nThiết kế vỏ và cấu trúc khung laptop khác nhau đáng kể so với các hãng. Trong một số trường hợp, bạn có thể quan sát vào các bộ phận bên trong bạn cần để làm sạch thông qua các tấm nhựa. Ví dụ, nếu bạn có thể thấy được CPU, tản nhiệt và quạt. Thì không cần phải tháo rời laptop của bạn ra từng phần, Do đó quá trình làm bảo dưỡng, vệ sinh laptop sẽ ngắn hơn, dễ dàng hơn và ít có khả năng kết thúc trong nước mắt.\r\n\r\nLật máy tính xách tay của bạn lên và có một cái nhìn tổng quan ngay bây giờ. Bạn có thể xác định các miếng nhựa cứng bảo vệ. Thường thì có 4 miếng nhựa: tấm bảo vệ bộ nhớ RAM, ổ cứng, ổ đĩa quang, và bảo vệ chip xử lý.\r\nNếu quan sát không thấy chíp xử lý, bạn có thể cần phải mất một thời gian để tháo dỡ các khung liên kết trong laptop.\r\nNhư chúng tôi đã nói, khác nhau về cách tháo máy giữa các thương hiệu và các dòng sản phẩm, nhưng có hai cách chính để có tháo được hầu hết các máy tính xách tay – thông qua phía trên hoặc qua phía dưới.\r\nNếu laptop được tháo từ phía dưới.  Những máy này thường dễ dàng hơn để tháo rời – ít nhất là đủ để vệ sinh tất cả linh kiện cần thiết. Nếu laptop của bạn mở từ phía trên xuống, bạn sẽ thường phải bắt đầu bằng cách tháo rời bàn phím.\r\nLời khuyên của chúng tôi là không bao giờ tự mò mẫn, Hãy tìm nguồn cung ứng và đọc hướng dẫn cẩn thận. Các tài liệu chúng ta đang nói đến ở đây sách hướng dẫn sử dụng đi kèm trong hộp máy tính xách tay của bạn.\r\n\r\nNếu bạn quên hay lạc mất. Làm thế nào để có tài liệu đó? Hãy thử truy cập trang web của nhà sản xuất máy tính xách tay của bạn đầu tiên, và nhìn vào ‘hỗ trợ’ cho các tài liệu bảo trì. Nếu thất bại, hãy thử liên hệ với Capcuulaptop.com , Chúng tôi có sẵn tài liệu bạn cần. Dữ liệu miễn phí. Nếu không rành về kỹ thuật. Việc hướng dẫn vệ sinh laptop tại trung tâm luôn chu toàn\r\n\r\nDụng cụ chuyên dụng để vệ sinh máy laptop\r\nMọi việc đều làm bằng thủ công. Bây giờ những gì bạn cần là những công cụ thích hợp để bắt đầu công việc. Chúng tôi sẽ phân chia các trường hợp thành công cụ mở và các công cụ làm vệ sinh laptop cho thuận tiện. Bạn sẽ cần một bộ tua vít điện để xử lý ốc nhỏ và ốc vít phẳng đầu được tìm thấy trong khung máy tính xách tay.\r\n\r\nNếu bạn có một máy tính xách tay Dell hay Apple, bạn cũng cần phải tìm một bộ tua vít chuyên dụng. Một tìm kiếm trên trang web hay ra các quầy điện dân dụng. thường gì giá khoảng 80.000 – 500.000 VND tùy theo loại\r\n\r\nDụng cụ vệ sinh laptop\r\nMột thanh nhựa chuyên dụng hoặc miếng gảy guitar là một dụng cụ hữu ích để mở laptop. Bạn có thể sử dụng nó để nâng lên vỉa mở liên kết với nhau bởi các đoạn nhựa.\r\n\r\ndịch vụ vệ sinh laptop\r\nBạn sẽ cần các công cụ tương tự như bạn muốn sử dụng khi làm sạch một máy tính để bàn. Một phần mềm lông bàn chải và một máy hút bụi nhỏ tất cả có thể có ích. Bạn sẽ sử dụng máy hút bụi ít hơn so với bạn khi làm sạch một máy tính để bàn.\r\n\r\nCó ít không gian bên trong laptop cho bụi bám xung quanh, vì vậy nó có xu hướng tập trung ở chỗ thông gió. Đây là dễ dàng hơn nhiều để loại bỏ với một cặp nhíp.\r\n\r\nVới bộ dụng cụ vệ sinh laptop của bạn đã sẵn sàng, đó là thời gian để loại bỏ một số bụi bẩn thực. Tắt điện máy tính xách tay của bạn, rút ​​phích cắm điện từ nguồn điện và sau đó tháo pin ra. Chúng tôi sẽ nhắm mục tiêu khu vực cụ thể mà thường cần phải được làm sạch.\r\n\r\nVệ sinh laptop hcm\r\nBàn phím máy tính của bạn có khả năng là một phần ô nhiễm nhất của máy, với vụn, bụi và gàu rơi vào nó cả ngày. Bây giờ tưởng tượng những gì tại trung tâm Capcuulaptop.com làm vệ sinh laptop và bạn thực hiện theo quy trình như bên dưới.\r\n\r\nĐể rời bàn phím và vệ sinh laptop bên dưới nó. Thường bàn phím sẽ được gắn kết bởi hai hoặc ba ốc vít, giấu bên dưới một lớp nhựa bảo vệ. Tất cả vị trí ốc vít sẽ khác nhau trên từng loại máy.\r\n\r\n===>Trong hầu hết laptop, Đa Phần bàn phím của bạn sẽ cố định tại chỗ với các ngàm. Ở đây sẽ có một số quai nhựa có thể trượt vào các khe, vì vậy một khi bạn đã loại bỏ các ốc vít ở phía trên bạn thường có thể kéo các đơn vị bàn phím về phía bạn. Không nên giật mạnh nó. Vì bạn sẽ làm hỏng kết nối của nó.\r\n\r\nĐể nó ở một góc khoảng 45 độ, bạn sẽ thấy các kết nối dưới nó. Ngắt kết nối từ bo mạch chủ.\r\n\r\nNếu, ở giai đoạn này, bạn có thể vệ sinh laptop ngay, Nên làm trước để nhẹ công. Tháo rời lá chắn bảo vệ, bạn sẽ tìm thấy các bo mạch chủ. Dù bằng cách nào, Bạn cũng phải cận thận và tỉ mĩ trong quá trình làm vệ sinh, bảo dưỡng laptop.\r\n\r\nNêu dùng một bàn chải lông mềm để giúp loại bỏ bất kỳ lớp bụi trên các phần cứng của laptop. Hãy chắc chắn rằng bạn làm kỹ càng.\r\n\r\nhướng dẫn vệ sinh laptop dẫn khí\r\nViệc chính vệ sinh laptop ở đây là lớp tản nhiệt và quạt của laptop nơi bụi có xu hướng tập hợp và có thể có tác động lớn nhất đến hiệu suất. Bạn nên tháo ốc từ từ và luôn nhớ vị trí để lúc sau gắn vào lại.\r\n\r\nTrước khi bạn tiến hành thêm nữa, điều quan trọng là phải nhớ rằng bạn sẽ cần phải lau chip sạch sẽ và thêm lại một lớp mỏng mỡ tản nhiệt chuyên dụng cho laptop  trước khi lắp lại laptop. (Sử dụng tăm bông và một chút chất tẩy để làm điều này. Lau sạch mỡ cũ bằng một miếng vải mềm).\r\n\r\nVệ sinh Quạt Tản nhiệt laptop:\r\nBước tiếp theo cần loại bỏ bụi trên quạt laptop, thêm ít mỡ trơn để quạt hoạt động êm.\r\n\r\ncách vệ sinh laptop tản nhiệt\r\nVệ sinh laptop các lỗ thông hơi\r\n\r\nBụi bẩn có thể bấm chặt các lỗ thông hơi. Việc cần làm là lau sạch chúng đi.\r\n\r\nvệ sinh laptop các lỗ thông hơi\r\nCuối cùng, Bạn hãy nhìn tổng quan thành quả (có khi 10% là hậu quả) xem xét từng chi tiếp còn bỏ quên.\r\n\r\nLắp ráp lại máy tính của bạn một cách cẩn thận. Thanks bạn đã đọc bài viết. chúc bạn 1 ngày năng động.', '\'cach-bao-duong-va-ve-sinh-laptop-dung-cach\'', '/imgpost/cach-ve-sinh-laptop.jpg', '', 3, NULL, 'active', '2024-11-22 13:43:42', '2024-11-22 13:56:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'laptop', 'active', '2024-11-10 20:54:27', '2024-11-10 20:54:27'),
(3, 'Phụ kiện laptop', 'phu-kien-laptop', 'active', NULL, NULL),
(4, 'Tin tức công nghệ', 'tin-tuc-cong-nghe', 'active', NULL, NULL),
(5, 'Đánh giá sản phẩm', 'danh-gia-san-pham', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(3, 'MacBook Pro 14', 'macbook-pro-14', '<p>MacBook Pro 14</p>', '<p>MacBook Pro 14</p>', '/storage/photos/3/Product/MacBook Pro 14.png', 5, '', 'new', 'active', 21000000.00, 5.00, 0, 1, NULL, 1, '2024-11-10 21:19:39', '2024-12-18 10:10:31'),
(4, 'Macbook Air M3 13 inch 2024 8CPU 10GPU 24GB - 1TB sạc 70W', 'macbook-air-m3-13-inch-2024-8cpu-10gpu-24gb-1tb-sac-70w', '<div class=\"col-info\" style=\"box-sizing: inherit; display: flex; flex-wrap: wrap; width: 148.2px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/cpu.png\" data-src=\"https://www.techone.vn/assets5/icons/cpu.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">Apple - M3</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/ram.png\" data-src=\"https://www.techone.vn/assets5/icons/ram.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">16GB</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/hard-drive.png\" data-src=\"https://www.techone.vn/assets5/icons/hard-drive.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">512GB</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/gpu-mining.png\" data-src=\"https://www.techone.vn/assets5/icons/gpu-mining.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">GPU tích hợp</div></div></div><div class=\"col-info\" style=\"box-sizing: inherit; display: flex; flex-wrap: wrap; width: 148.2px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/display-size.png\" data-src=\"https://www.techone.vn/assets5/icons/display-size.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">13.6 inch</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/resolution.png\" data-src=\"https://www.techone.vn/assets5/icons/resolution.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">2560x1664</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/speed.png\" data-src=\"https://www.techone.vn/assets5/icons/speed.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">60Hz</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/weight.png\" data-src=\"https://www.techone.vn/assets5/icons/weight.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">1.24kg</div></div></div>', '<div class=\"col-info\" style=\"box-sizing: inherit; display: flex; flex-wrap: wrap; width: 148.2px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/cpu.png\" data-src=\"https://www.techone.vn/assets5/icons/cpu.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">Apple - M3</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/ram.png\" data-src=\"https://www.techone.vn/assets5/icons/ram.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">16GB</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/hard-drive.png\" data-src=\"https://www.techone.vn/assets5/icons/hard-drive.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">512GB</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/gpu-mining.png\" data-src=\"https://www.techone.vn/assets5/icons/gpu-mining.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">GPU tích hợp</div></div></div><div class=\"col-info\" style=\"box-sizing: inherit; display: flex; flex-wrap: wrap; width: 148.2px; color: rgb(74, 74, 74); font-family: sans-serif;\"><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/display-size.png\" data-src=\"https://www.techone.vn/assets5/icons/display-size.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">13.6 inch</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/resolution.png\" data-src=\"https://www.techone.vn/assets5/icons/resolution.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">2560x1664</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/speed.png\" data-src=\"https://www.techone.vn/assets5/icons/speed.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">60Hz</div></div><div class=\"item\" style=\"box-sizing: inherit; width: 148.2px; flex-wrap: nowrap; color: rgb(25, 25, 25); font-size: 12px; display: flex; align-items: center; padding-bottom: 6px;\"><div class=\"icon\" style=\"box-sizing: inherit; align-items: center; display: inline-flex; justify-content: center; height: 14px; width: 14px; margin-right: 10px;\"><img data-lazyloaded=\"1\" src=\"https://www.techone.vn/assets5/icons/weight.png\" data-src=\"https://www.techone.vn/assets5/icons/weight.png\" data-ll-status=\"loaded\" class=\"entered litespeed-loaded\" style=\"box-sizing: inherit; height: auto; max-width: 100%;\"></div><div class=\"content\" style=\"box-sizing: inherit;\">1.24kg</div></div></div>', '/storage/photos/3/Product/Macbook Air M3 13 inch 2024.png', 9, '', 'hot', 'active', 15000000.00, 20.00, 0, 2, NULL, 1, '2024-11-11 00:05:56', '2024-12-18 10:05:46'),
(5, 'MacBook Air M1 256GB 2020', 'macbook-air-m1-256gb-2020', '<ul class=\"technical-content-modal\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 10px; list-style: none; width: 463.2px;\"><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-right: 0px; margin-left: 0px; padding: 0px; margin-top: 0.75rem !important; margin-bottom: 0.75rem !important;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; line-height: 1.125;\"><font color=\"#363636\" face=\"Roboto, sans-serif\"><b>MacBook Air M1 256GB 2020</b></font></p></li></ul>', '<ul class=\"technical-content-modal\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 10px; list-style: none; width: 463.2px; color: rgb(74, 74, 74); font-family: Roboto, sans-serif;\"><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Bộ xử lý &amp; Đồ họa</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Loại card đồ họa</p><div style=\"box-sizing: inherit; width: 252.95px;\">GPU 7 nhân, 16 nhân Neural Engine</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Loại CPU</p><div style=\"box-sizing: inherit; width: 252.95px;\">8 nhân với 4 nhân hiệu năng cao và 4 nhân tiết kiệm điện</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Bộ nhớ RAM, Ổ cứng</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Dung lượng RAM</p><div style=\"box-sizing: inherit; width: 252.95px;\">8GB</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Loại RAM</p><div style=\"box-sizing: inherit; width: 252.95px;\">LPDDR4</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Ổ cứng</p><div style=\"box-sizing: inherit; width: 252.95px;\">256GB SSD</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Màn hình</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Chất liệu tấm nền</p><div style=\"box-sizing: inherit; width: 252.95px;\">Tấm nền IPS</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Công nghệ màn hình</p><div style=\"box-sizing: inherit; width: 252.95px;\">Độ sáng 400 nits<br style=\"box-sizing: inherit;\">Hỗ trợ dải màu P3<br style=\"box-sizing: inherit;\">True-Tone</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\"><a target=\"_blank\" rel=\"nofollow\" href=\"https://cellphones.com.vn/sforum/kich-thuoc-man-hinh-dien-thoai\" style=\"box-sizing: inherit; color: rgb(72, 95, 199); cursor: pointer;\">Kích thước màn hình</a></p><div style=\"box-sizing: inherit; width: 252.95px;\">13.3 inches</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\"><a target=\"_blank\" rel=\"nofollow\" href=\"https://cellphones.com.vn/sforum/do-phan-giai-man-hinh\" style=\"box-sizing: inherit; color: rgb(72, 95, 199); cursor: pointer;\">Độ phân giải màn hình</a></p><div style=\"box-sizing: inherit; width: 252.95px;\">2560 x 1600 pixels (2K)</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Âm thanh</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Công nghệ âm thanh</p><div style=\"box-sizing: inherit; width: 252.95px;\">3 microphones, headphones, loa kép (2 kênh)</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Cổng kết nối</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Cổng giao tiếp</p><div style=\"box-sizing: inherit; width: 252.95px;\">2 cổng Thunderbolt / USB 4</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Khe đọc thẻ nhớ</p><div style=\"box-sizing: inherit; width: 252.95px;\">Không</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\"><a target=\"_blank\" rel=\"nofollow\" href=\"https://cellphones.com.vn/sforum/wifi-la-gi-song-wi-fi-hoat-dong-va-co-chuc-nang-nhu-the-nao\" style=\"box-sizing: inherit; color: rgb(72, 95, 199); cursor: pointer;\">Wi-Fi</a></p><div style=\"box-sizing: inherit; width: 252.95px;\">802.11ax Wi-Fi 6 wireless networking</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\"><a target=\"_blank\" rel=\"nofollow\" href=\"https://cellphones.com.vn/sforum/ket-noi-bluetooth-khai-niem-va-nhung-cong-dung-co-ban\" style=\"box-sizing: inherit; color: rgb(72, 95, 199); cursor: pointer;\">Bluetooth</a></p><div style=\"box-sizing: inherit; width: 252.95px;\">Bluetooth 5.0</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Kích thước &amp; Trọng lượng</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Chất liệu</p><div style=\"box-sizing: inherit; width: 252.95px;\">Vỏ kim loại</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Kích thước</p><div style=\"box-sizing: inherit; width: 252.95px;\">1.61 cm x 30.41 cm x 21.24 cm</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Trọng lượng</p><div style=\"box-sizing: inherit; width: 252.95px;\">1.29 kg</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Tiện ích khác</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Tính năng đặc biệt</p><div style=\"box-sizing: inherit; width: 252.95px;\">Viền màn hình siêu mỏng, Wi-Fi 6, Bảo mật vân tay</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Pin &amp; công nghệ sạc</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\"><a target=\"_blank\" rel=\"nofollow\" href=\"https://cellphones.com.vn/sforum/mah-la-gi-don-vi-mah-la-gi\" style=\"box-sizing: inherit; color: rgb(72, 95, 199); cursor: pointer;\">Pin</a></p><div style=\"box-sizing: inherit; width: 252.95px;\">49.9-watt lithium-polymer, củ sạc công suất 30W</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Tính năng khác</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\"><a target=\"_blank\" rel=\"nofollow\" href=\"https://cellphones.com.vn/sforum/he-dieu-hanh-la-gi-nhung-he-dieu-hanh-pho-bien-tren-may-tinh-dien-thoai\" style=\"box-sizing: inherit; color: rgb(72, 95, 199); cursor: pointer;\">Hệ điều hành</a></p><div style=\"box-sizing: inherit; width: 252.95px;\">macOS Big Sur</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Tiện ích</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Tính năng khác</p><div style=\"box-sizing: inherit; width: 252.95px;\">Cảm biến vân tay Touch ID, 720p FaceTime HD camera</div></div></div></li></ul>', '/storage/photos/3/Product/MacBook Air M1 256GB.png', 9, '', 'default', 'active', 30000000.00, 10.00, 0, 2, NULL, 1, '2024-11-11 00:09:42', '2024-12-18 10:09:03'),
(6, 'Tai nghe chụp tai chống ồn Apple AirPods Max 2024', 'tai-nghe-chup-tai-chong-on-apple-airpods-max-2024', '<p>Tai nghe chụp tai chống ồn Apple AirPods Max 2024</p>', '<ul class=\"technical-content-modal\" style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 10px; list-style: none; width: 463.2px; color: rgb(74, 74, 74); font-family: Roboto, sans-serif;\"><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Pin &amp; Sạc</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Thời lượng pin</p><div style=\"box-sizing: inherit; width: 252.95px;\">20 giờ</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Thời gian sạc</p><div style=\"box-sizing: inherit; width: 252.95px;\">2 giờ</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Cổng sạc</p><div style=\"box-sizing: inherit; width: 252.95px;\">Cáp Sạc USB-C</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Thông tin chung</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Công nghệ âm thanh</p><div style=\"box-sizing: inherit; width: 252.95px;\">Trình điều khiển động do Apple thiết kế<br style=\"box-sizing: inherit;\">Tính năng Chủ Động Khử Tiếng Ồn đẳng cấp Pro<br style=\"box-sizing: inherit;\">Chế độ Xuyên Âm<br style=\"box-sizing: inherit;\">Chế độ Âm Thanh Không Gian Cá Nhân Hóa với tính năng theo dõi chuyển động đầu chủ động<br style=\"box-sizing: inherit;\">EQ Thích Ứng</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Micro</p><div style=\"box-sizing: inherit; width: 252.95px;\">Tám micrô dành cho tính năng Chủ Động Khử Tiếng Ồn<br style=\"box-sizing: inherit;\">Ba micrô dành cho tính năng nhận diện giọng nói&nbsp;<b style=\"box-sizing: inherit;\">(hai micrô dùng chung với tính năng Chủ Động Khử Tiếng Ồn và một micrô bổ sung)</b></div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Tương thích</p><div style=\"box-sizing: inherit; width: 252.95px;\">Các thiết bị có hỗ trợ Bluetooth</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Tiện ích</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Tính năng khác</p><div style=\"box-sizing: inherit; width: 252.95px;\">Sạc nhanh</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Kết nối &amp; Điều khiển</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Bluetooth</p><div style=\"box-sizing: inherit; width: 252.95px;\">5.0</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Vi xử lý &amp; đồ họa</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\"><a target=\"_blank\" rel=\"nofollow\" href=\"https://cellphones.com.vn/sforum/chipset-la-gi\" style=\"box-sizing: inherit; color: rgb(72, 95, 199); cursor: pointer;\">Chipset</a></p><div style=\"box-sizing: inherit; width: 252.95px;\">Chip tai nghe Apple H1</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Kích thước &amp; Trọng lượng</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Kích thước</p><div style=\"box-sizing: inherit; width: 252.95px;\">168.6 x 187.3 x 83.4 mm</div></div><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Trọng lượng</p><div style=\"box-sizing: inherit; width: 252.95px;\">386,2 gram</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Cấu hình</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Cảm biến</p><div style=\"box-sizing: inherit; width: 252.95px;\">Cảm biến quang học (mỗi bên củ tai)<br style=\"box-sizing: inherit;\">Cảm biến vị trí (mỗi bên củ tai)<br style=\"box-sizing: inherit;\">Cảm biến phát hiện hộp (mỗi bên củ tai)<br style=\"box-sizing: inherit;\">Gia tốc kế (mỗi bên củ tai)<br style=\"box-sizing: inherit;\">Con quay hồi chuyển (củ tai bên trái)</div></div></div></li><li class=\"technical-content-modal-item my-3\" style=\"box-sizing: inherit; margin-top: 0.75rem !important; margin-right: 0px; margin-bottom: 0.75rem !important; margin-left: 0px; padding: 0px;\"><p class=\"title is-6 m-2\" style=\"box-sizing: inherit; margin-bottom: 1.5rem; padding: 0px; word-break: break-word; color: rgb(54, 54, 54); font-size: 1rem; font-weight: 600; line-height: 1.125;\">Thông tin hãng</p><div class=\"modal-item-description mx-2\" style=\"box-sizing: inherit; border: 1px solid rgb(239, 239, 239); border-radius: 10px; font-size: 14px; overflow: hidden;\"><div class=\"px-3 py-2 is-flex is-align-items-center is-justify-content-space-between\" style=\"box-sizing: inherit; background-color: rgb(239, 239, 239); justify-content: space-between !important; align-items: center !important; padding-right: 0.75rem !important; padding-left: 0.75rem !important; display: flex !important;\"><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 126.475px;\">Hãng sản xuất</p><div style=\"box-sizing: inherit; width: 252.95px;\">Apple Chính hãng</div></div></div></li></ul>', '/storage/photos/3/Product/Tai nghe chụp tai chống ồn Apple.png', 9, '', 'default', 'active', 2000.00, 0.00, 0, 3, NULL, 1, '2024-11-11 00:13:14', '2024-12-18 16:10:51'),
(7, 'iPad Pro M4 11 inch Wifi 256GB |', 'ipad-pro-m4-11-inch-wifi-256gb', '<h1 style=\"box-sizing: inherit; margin-right: 10px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 18px; font-weight: 700; -webkit-line-clamp: 3; -webkit-box-orient: vertical; color: rgb(10, 38, 60); display: -webkit-box; line-height: 2; overflow: hidden; font-family: Roboto, sans-serif;\">iPad Pro M4 11 inch Wifi 256GB |&nbsp;</h1>', '<h1 style=\"box-sizing: inherit; margin-right: 10px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 18px; font-weight: 700; -webkit-line-clamp: 3; -webkit-box-orient: vertical; color: rgb(10, 38, 60); display: -webkit-box; line-height: 2; overflow: hidden; font-family: Roboto, sans-serif;\">iPad Pro M4 11 inch Wifi 256GB |&nbsp;</h1>', '/storage/photos/3/iPad Pro M4 11.png', 5, '', 'new', 'active', 20000000.00, 5.00, 0, 2, NULL, 1, '2024-12-04 00:22:00', '2024-12-18 08:06:19'),
(8, 'Tai nghe Bluetooth Apple AirPods 4', 'tai-nghe-bluetooth-apple-airpods-4', '<p>Tai nghe AirPod 4 - Giải trí sống động với âm thanh không gian cá nhân hóa</p><p>AirPods 4 là thế hệ AirPods mới được ra mắt cùng iPhone 16 series với nhiều cải tiến về công nghệ</p>', '<p style=\"text-align: center; \"><b>Đặc điểm nổi bật</b></p><p>Chip H2 nổi bật, mạnh mẽ được tích hợp trong Airpod 4 giúp trải nghiệm âm thanh của bạn mượt mà hơn.</p><p>Công nghệ Bluetooth 5.3 mang đến kết nối ổn định, mượt mà, tiêu thụ năng lượng thấp, giúp bạn tiết kiệm pin đáng kể.</p><p>Khả năng chống nước đạt chuẩn IP54 mang lại cảm giác thoải mái khi sử dụng tai nghe ngoài trời mà không lo bụi bẩn, hoặc mồ hôi.</p><p>Thời gian sử dụng ấn tượng với dung lượng pin cao, hộp sạc dùng được 30h và tại nghe dùng được 5h</p><p>Apple AirPods 4 là tai nghe không dây với chip H2 cùng EQ thích ứng và âm thanh không gian cá nhân hóa mang lại trải nghiệm âm thanh ấn tượng. Tai nghe được trang bị Micrô kép với cảm biến quang học cùng micro hướng vào trong giúp thu âm tốt hơn. Cùng với điều khiển chạm cho phép người dùng điều khiển qua các thao tác nhấn tiện lợi.</p><p>Âm thanh không gian các nhân, trải nghiệm âm thanh ba chiều</p><p>AirPods 4 với con chip H2 hỗ trợ các trải nghiệm cuộc gọi và âm thanh rõ nét. Cùng với chế độ âm thanh không gian cá nhân hóa nhờ đó mang lại trải nghiệm âm thanh ba chiều. Chế độ giúp người dùng có những trải nghiệm nghe nhạc, xem phim và chơi game như trong nhà hát.</p>', '/storage/photos/3/PhuKien/Tai nghe Bluetooth Apple AirPods 4.png', 5, '', 'default', 'active', 3488999.00, 5.00, 0, 3, NULL, 1, '2024-12-18 08:13:44', '2024-12-18 08:14:27'),
(9, 'Chuột không dây Genius Ergo 8100S', 'chuot-khong-day-genius-ergo-8100s', '<p>Độ phân giải: 1600 DPI</p><p>Cảm biến: Quang học</p><p>Nút nhấn: 6 nút</p><p>Tương thích: MacOS, Windows</p><p>Kết nối: USB Receiver</p>', '<p style=\"text-align: center; \"><b>Đặc điểm nổi bật</b></p><p>Chuột không dây Genius với cảm biến quang học 1600 DPI chính xác.</p><p>Thiết kế nhẹ 60g cho khả năng di chuyển mượt mà..</p><p>Tích hợp pin AA sử dụng lâu dài mà không cần thay pin nhiều lần..</p>', '/storage/photos/3/PhuKien/Chuột không dây Genius Ergo 8100S.png', 5, '', 'new', 'active', 450000.00, 10.00, 0, 3, NULL, 1, '2024-12-18 08:20:59', '2024-12-18 10:19:01'),
(10, 'Bàn phím Apple Magic Keyboard 2021 MK2A3', 'ban-phim-apple-magic-keyboard-2021-mk2a3', '<p>Bàn phím Apple Magic Keyboard 2021 – Thiết kế gọn nhẹ, tinh tế</p><p>Sản phẩm bàn phím Apple Magic Keyboard 2021 MK2A3 đến từ thương hiệu chính hãng Apple, sở hữu thiết kế hiện đại, nhỏ gọn nhưng vẫn được cung cấp đầy đủ các phím chức năng phổ biến. Hãy cùng CellphoneS tìm hiểu rõ hơn về chất lượng của bàn phím này nhé!</p>', '<p>Bàn phím Apple Magic Keyboard 2021 – Thiết kế gọn nhẹ, tinh tế</p><p>Sản phẩm bàn phím Apple Magic Keyboard 2021 MK2A3 đến từ thương hiệu chính hãng Apple, sở hữu thiết kế hiện đại, nhỏ gọn nhưng vẫn được cung cấp đầy đủ các phím chức năng phổ biến. Hãy cùng CellphoneS tìm hiểu rõ hơn về chất lượng của bàn phím này nhé!</p>', '/storage/photos/3/Product/Bàn phím Apple Magic Keyboard 2021 MK2A3.png', 5, '', 'new', 'active', 3990000.00, 10.00, 0, 3, NULL, 1, '2024-12-18 10:17:35', '2024-12-18 10:18:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`, `response`) VALUES
(1, 2, 5, 5, 'sản phẩm tốt, chất lượng', 'active', '2024-11-24 21:48:06', '2024-11-24 21:48:06', NULL),
(2, 9, 10, 5, 'Sản phẩm chất lượng', 'active', '2024-12-18 10:45:44', '2024-12-18 10:45:44', NULL),
(3, 9, 10, 5, 'Sản phẩm chất lượng', 'active', '2024-12-18 10:45:44', '2024-12-18 10:45:44', NULL),
(4, 9, 10, 5, 'Sản phẩm chất lượng', 'active', '2024-12-18 10:45:45', '2024-12-18 10:45:45', NULL),
(5, 9, 10, 5, 'Sản phẩm chất lượng', 'active', '2024-12-18 10:45:45', '2024-12-18 10:45:45', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `responses`
--

CREATE TABLE `responses` (
  `id` int(11) UNSIGNED NOT NULL,
  `review_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sepay_transactions`
--

CREATE TABLE `sepay_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gateway` varchar(191) NOT NULL,
  `transactionDate` varchar(191) NOT NULL,
  `accountNumber` varchar(191) NOT NULL,
  `subAccount` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `content` varchar(191) NOT NULL,
  `transferType` varchar(191) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `transferAmount` bigint(20) NOT NULL,
  `referenceCode` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Cửa hàng máy tính Diệp Anh bán máy tính', 'Cửa hàng máy tính Diệp Anh', '/storage/photos/1/logo-2024.png', '/storage/photos/1/Logo (64 x 64 px).png', '123,đường Phan Châu Trinh, Quận Hai Bà Trưng, Hà Nội', '0912031107', 'nhom5@gmail.com', NULL, '2024-12-03 10:25:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_transactions`
--

CREATE TABLE `tb_transactions` (
  `id` int(11) NOT NULL,
  `gateway` varchar(100) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `account_number` varchar(100) DEFAULT NULL,
  `sub_account` varchar(250) DEFAULT NULL,
  `amount_in` decimal(20,2) NOT NULL DEFAULT 0.00,
  `amount_out` decimal(20,2) NOT NULL DEFAULT 0.00,
  `accumulated` decimal(20,2) NOT NULL DEFAULT 0.00,
  `code` varchar(250) DEFAULT NULL,
  `transaction_content` text DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@mail.com', NULL, '$2y$10$FCmQPkT6TMc9JoU.DOw5Yux0fSd9X59.yrmV2VhaakQz30arpPiUG', '/storage/photos/1/admin-icn.png', 'admin', 'active', 'aMaKHFWAuJGR2lfov4WEZ41jC6SGaiFV3r1AshaT7YYQVe7NYYSDwCN7zzhY', NULL, NULL),
(2, 'Đoàn Linh', 'linh@gmail.com', NULL, '$2y$10$Vv6e2CIDumuc3YjGH57DjuL9OwqzodrYQgG2nphKgmVeIvouPgNUW', NULL, 'user', 'active', NULL, '2024-11-10 22:22:43', '2024-11-10 22:22:43'),
(3, 'admin2', 'admin2@mail.com', NULL, '$2y$10$Jj5J5e2u2qMx7OjrdSzWf.P4g77PAudLvUcoPFlDfdECUKiA305Si', NULL, 'admin', 'active', NULL, '2024-11-10 23:36:53', '2024-11-10 23:36:53'),
(4, 'Đặng Thị Thu Phương', 'thuphuong5112k3@gmail.com', NULL, '$2y$10$0jGWuRF6YBSs8tB4pWCh2eYcBe7FWnf/VYwCUbYNmPkFxuCK/kFSG', NULL, 'user', 'active', NULL, '2024-12-03 08:53:47', '2024-12-03 08:53:47'),
(5, 'Đặng Thị Thu Phương', 'thuphuong5112k3gmail.com', NULL, '$2y$10$c3XQXUkQdDw6jQDK4PAYM.9rRbDG2Ho/SJa7b1hKUS4E1SYdh98DO', NULL, 'user', 'active', NULL, '2024-12-03 09:04:56', '2024-12-03 09:04:56'),
(6, 'Đặng Thị Thu Phương', 'thuphuong5112k3@gmailcom', NULL, '$2y$10$/CIqDF6614HJ97iCma.Eje8rmraDvXLHbU4G6awAAZ1vraIaFnH/.', NULL, 'user', 'active', NULL, '2024-12-03 09:16:56', '2024-12-03 09:16:56'),
(7, 'linh doan', 'linhgmail.com', NULL, '$2y$10$/UkAr1izvmOtvyDEBuqwu.EokxUQsf/KS.kIiGTZpbNxZ83FzR6Fa', NULL, 'user', 'active', NULL, '2024-12-03 10:32:14', '2024-12-03 10:32:14'),
(8, 'linh doan', 'linh@gmailcom', NULL, '$2y$10$DIg2RKffrZAqFElwiD8KdOo7YIaeeaASNhDmxNsDMNIE131LTxt/W', NULL, 'user', 'active', NULL, '2024-12-03 10:34:33', '2024-12-03 10:34:33'),
(9, 'Nguyễn Nam', 'Nam@gmail.com', NULL, '$2y$10$dcQPVUYYrtgVZRoUS0h9/OZQRrZ9SzYTGme9lcX54K.V47O3DTcDC', NULL, 'user', 'active', NULL, '2024-12-18 10:24:47', '2024-12-18 10:24:47');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_review_id` (`review_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `sepay_transactions`
--
ALTER TABLE `sepay_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tb_transactions`
--
ALTER TABLE `tb_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sepay_transactions`
--
ALTER TABLE `sepay_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tb_transactions`
--
ALTER TABLE `tb_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `fk_review_id` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
