-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 12:01 AM
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
-- Database: `catt`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountants`
--

CREATE TABLE `accountants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `Cnic` text DEFAULT NULL,
  `Number` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `usertype` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accountants`
--

INSERT INTO `accountants` (`id`, `admin_id`, `name`, `Cnic`, `Number`, `Address`, `email`, `password`, `usertype`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Muneeb', '4130236550551', '03173859647', 'hyd', 'muneeb12@gmail.com', '12345678', 'Accountant', '2025-04-18 22:31:47', '2025-04-18 22:31:47', NULL),
(2, '1', 'Waleed', '4130236550551', '03173859647', 'hyd', 'waleed12@gmail.com', '12345678', 'Accountant', '2025-04-18 22:48:19', '2025-04-18 22:48:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accountant_expenses`
--

CREATE TABLE `accountant_expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accountant_id` text DEFAULT NULL,
  `expense_category` text DEFAULT NULL,
  `expense_date` text DEFAULT NULL,
  `expense_amount` text DEFAULT NULL,
  `expense_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accountant_expenses`
--

INSERT INTO `accountant_expenses` (`id`, `accountant_id`, `expense_category`, `expense_date`, `expense_amount`, `expense_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Cooking Gas', '2025-04-19', '500', 'Cooking gas fil karwai hai', '2025-04-18 22:46:25', '2025-04-18 22:46:25', NULL),
(2, '1', 'Fuel & Transportation', '2025-04-19', '500', 'fuel FIll today date', '2025-04-18 22:52:02', '2025-04-18 22:52:02', NULL),
(3, '2', 'Groceries', '2025-04-19', '1000', 'Purchasing local market se', '2025-04-18 22:52:58', '2025-04-18 22:52:58', NULL),
(4, '2', 'Kitchen Equipment', '2025-04-19', '1000', 'kitchen item purcahsed', '2025-04-18 22:53:53', '2025-04-18 22:53:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accountant_ledgers`
--

CREATE TABLE `accountant_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accountant_id` text DEFAULT NULL,
  `last_payment_date` text DEFAULT NULL,
  `cash_in_hand` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accountant_ledgers`
--

INSERT INTO `accountant_ledgers` (`id`, `accountant_id`, `last_payment_date`, `cash_in_hand`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '2025-04-19', '23000', '2025-04-18 22:32:40', '2025-04-18 22:55:10', NULL),
(2, '2', '2025-04-19', '20000', '2025-04-18 22:48:36', '2025-04-18 22:54:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `admin_or_user_id`, `brand`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'National', '2025-04-20 22:02:26', '2025-04-20 22:02:26', NULL),
(2, '1', 'Shan', '2025-04-20 22:02:30', '2025-04-20 22:02:30', NULL),
(3, '1', 'Mehran', '2025-04-20 22:02:35', '2025-04-20 22:02:45', NULL),
(4, '1', 'Mutton', '2025-05-03 16:06:11', '2025-05-03 16:06:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `admin_or_user_id`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Pakistani', '2025-03-05 21:15:24', '2025-03-05 21:15:24', NULL),
(2, '1', 'Chinese', '2025-03-05 21:15:32', '2025-03-05 21:15:32', NULL),
(3, '1', 'Live', '2025-03-05 21:15:43', '2025-03-05 21:15:43', NULL),
(4, '1', 'Meat', '2025-03-05 21:15:49', '2025-03-05 21:15:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `claim_returns`
--

CREATE TABLE `claim_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` text DEFAULT NULL,
  `return_date` text DEFAULT NULL,
  `supplier` text DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `return_quantity` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `subtotal` text DEFAULT NULL,
  `total_price` text DEFAULT NULL,
  `payable_amount` text DEFAULT NULL,
  `paid_amount` text DEFAULT NULL,
  `due_amount` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `claim_returns`
--

INSERT INTO `claim_returns` (`id`, `purchase_id`, `return_date`, `supplier`, `warehouse_id`, `item_name`, `return_quantity`, `price`, `total`, `note`, `discount`, `subtotal`, `total_price`, `payable_amount`, `paid_amount`, `due_amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '2025-04-25', 'Waleed bhai', NULL, '[\"Pesi wi mirchi\"]', '[\"2\"]', '[\"100\"]', '[\"200\"]', 'Claim', '0', '200', '200', '200.00', NULL, NULL, NULL, '2025-04-24 20:12:32', '2025-04-24 20:12:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `identity` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `identity`, `created_at`, `updated_at`) VALUES
(1, 'soban', '098908908', 'unit no: 10 bismillah city. house no: 45, block a.', 'CUST-0001', '2025-03-01 19:08:15', '2025-03-01 19:08:15'),
(2, 'waleed', '023123', 'unit no: 9, block A, House no: 45, Near medical store', 'CUST-0002', '2025-03-01 19:11:15', '2025-03-01 19:11:15'),
(3, 'Arsalan', '0123123', 'city near,  near hali road', 'CUST-0003', '2025-03-01 20:28:25', '2025-03-01 20:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `customer_credits`
--

CREATE TABLE `customer_credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customerId` text DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `previous_balance` text DEFAULT NULL,
  `net_total` text DEFAULT NULL,
  `closing_balance` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_credits`
--

INSERT INTO `customer_credits` (`id`, `customerId`, `customer_name`, `previous_balance`, `net_total`, `closing_balance`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Darryl Washington', '3200', '1600', '3200', '2025-02-05 20:43:37', '2025-02-05 20:44:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_recoveries`
--

CREATE TABLE `customer_recoveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` text DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `recovery_date` text DEFAULT NULL,
  `recovery_amount` text DEFAULT NULL,
  `closing_balance` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `gate_passes`
--

CREATE TABLE `gate_passes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gate_passes`
--

INSERT INTO `gate_passes` (`id`, `order_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2', 'returned', '2025-03-12 12:51:39', '2025-03-12 13:25:06', NULL),
(2, '2', 'returned', '2025-03-15 15:12:00', '2025-03-15 15:18:10', NULL),
(3, '4', 'pending', '2025-05-03 15:02:49', '2025-05-03 15:02:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gate_pass_items`
--

CREATE TABLE `gate_pass_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gate_pass_id` text DEFAULT NULL,
  `item_id` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gate_pass_items`
--

INSERT INTO `gate_pass_items` (`id`, `gate_pass_id`, `item_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '1', '2025-03-12 12:51:39', '2025-03-12 12:51:39', NULL),
(2, '1', '2', '12', '2025-03-12 12:51:39', '2025-03-12 12:51:39', NULL),
(3, '2', '1', '2', '2025-03-15 15:12:01', '2025-03-15 15:12:01', NULL),
(4, '2', '2', '20', '2025-03-15 15:12:01', '2025-03-15 15:12:01', NULL),
(5, '2', '4', '10', '2025-03-15 15:12:01', '2025-03-15 15:12:01', NULL),
(6, '3', '1', '1', '2025-05-03 15:02:49', '2025-05-03 15:02:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `admin_or_user_id`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Mirch Maslay', '2025-04-20 21:52:39', '2025-04-20 21:52:39', NULL),
(2, '1', 'Kitchen Crockery', '2025-04-20 21:54:19', '2025-04-20 21:54:19', NULL),
(3, '1', 'Mutton', '2025-05-03 16:06:02', '2025-05-03 16:06:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_products`
--

CREATE TABLE `item_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `retail_price` text DEFAULT NULL,
  `alert_quantity` text DEFAULT NULL,
  `stock` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_products`
--

INSERT INTO `item_products` (`id`, `admin_or_user_id`, `product_name`, `category`, `brand`, `retail_price`, `alert_quantity`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Pesi wi mirchi', 'Mirch Maslay', 'Shan', '4500', '1', '61', '2025-04-20 22:31:58', '2025-05-10 18:25:44', NULL),
(2, '1', 'Mutton', 'Mutton', 'Mutton', '2300', '2', '10', '2025-05-03 16:07:15', '2025-05-03 16:07:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_inventories`
--

CREATE TABLE `kitchen_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kitchen_inventories`
--

INSERT INTO `kitchen_inventories` (`id`, `item_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '2025-05-02 21:43:25', '2025-05-03 15:02:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_items`
--

CREATE TABLE `kitchen_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` text DEFAULT NULL,
  `unit_price` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kitchen_items`
--

INSERT INTO `kitchen_items` (`id`, `unit`, `unit_price`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '12 Kg', '75000', 'Deg', '2025-05-02 21:43:03', '2025-05-02 21:43:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_estimates`
--

CREATE TABLE `menu_estimates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` text DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `sale_date` text DEFAULT NULL,
  `delivery_date` text DEFAULT NULL,
  `event_type` text DEFAULT NULL,
  `food_type` text DEFAULT NULL,
  `Venue` text DEFAULT NULL,
  `mobile_number` text DEFAULT NULL,
  `reference_name` text DEFAULT NULL,
  `person_program` text DEFAULT NULL,
  `item_category` text DEFAULT NULL,
  `item_subcategory` text DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `total_price` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_estimates`
--

INSERT INTO `menu_estimates` (`id`, `user_id`, `customer_name`, `sale_date`, `delivery_date`, `event_type`, `food_type`, `Venue`, `mobile_number`, `reference_name`, `person_program`, `item_category`, `item_subcategory`, `item_name`, `unit`, `quantity`, `price`, `total`, `total_price`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Kashan', '2025-03-07', '2025-03-07', 'Mayo', NULL, 'Sari', NULL, NULL, '100', '[\"1\"]', '[\"1\"]', '[\"Tikka Biryani\"]', '[\"kg\"]', '[\"12\"]', '[\"1000\"]', '[\"12000.00\"]', '12000.00', '1', '2025-03-06 22:33:48', '2025-04-26 20:50:53', NULL),
(2, '1', 'Kashan', '2025-03-07', '2025-03-10', 'Barat Event', NULL, 'sari', NULL, NULL, '500', '[\"1\",\"2\"]', '[\"1\",\"4\"]', '[\"Makhni Biryani\",\"Ch: Hotshot\"]', '[\"kg\",\"pcs\"]', '[\"12\",\"100\"]', '[\"1000\",\"30\"]', '[\"12000.00\",\"3000.00\"]', '15000.00', '1', '2025-03-06 23:02:44', '2025-04-26 20:52:49', NULL),
(3, '1', 'waleed Order', '2025-05-03', '2025-05-15', 'Valima', 'Table', 'Sari Banquet', NULL, NULL, '150', '[\"1\",\"1\"]', '[\"1\",\"2\"]', '[\"Tikka Biryani\",\"Korma\"]', '[\"kg\",\"kg\"]', '[\"12\",\"15\"]', '[\"1000\",\"747\"]', '[\"12000.00\",\"11205.00\"]', '23205.00', '1', '2025-04-26 20:34:51', '2025-05-03 15:03:45', NULL),
(4, '1', 'Zain', '2025-05-03', '2025-05-15', 'Birthday', 'Buffy', 'Sari Banquet', NULL, NULL, '500', '[\"1\"]', '[\"1\"]', '[\"Tikka Biryani\"]', '[\"kg\"]', '[\"12\"]', '[\"1000\"]', '[\"12000.00\"]', '12000.00', NULL, '2025-05-02 22:56:59', '2025-05-02 22:56:59', NULL),
(5, '1', 'Ahmed (0318-2879575)', '2025-05-11', '2025-05-17', 'Wedding', 'Table', 'Dollmen Banquet', NULL, NULL, '600', '[\"1\",\"2\",\"3\",\"4\"]', '[\"1\",\"4\",\"5\",\"7\"]', '[\"Tikka Biryani\",\"Ch: Hotshot\",\"Shanwari Karahi\",\"Mutton Paya Meat\"]', '[\"kg\",\"pcs\",\"kg\",\"pcs\"]', '[\"12\",\"100\",\"10\",\"100\"]', '[\"1000\",\"30\",\"750\",\"150\"]', '[\"12000.00\",\"3000.00\",\"7500.00\",\"15000.00\"]', '37500.00', '1', '2025-05-10 20:17:26', '2025-05-10 20:17:59', NULL),
(6, '1', 'Kashan Shaikh', '2025-05-11', '2025-05-22', 'wedding', 'Buffy', 'Sari', '03173859647', 'Muneeb', '200', '[\"1\"]', '[\"1\"]', '[\"Tikka Biryani\"]', '[\"kg\"]', '[\"12\"]', '[\"1000\"]', '[\"12000.00\"]', '12000.00', NULL, '2025-05-11 09:28:53', '2025-05-11 09:28:53', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_19_143029_create_p_o_s_models_table', 2),
(6, '2023_11_19_143043_create_p_o_s_users_table', 2),
(7, '2023_11_19_144129_create_pos_users_table', 3),
(8, '2023_11_19_152308_create_admin_logins_table', 4),
(9, '2023_11_19_152711_create_admin_logins_table', 5),
(10, '2023_11_23_100636_create_pos_users_table', 6),
(11, '2023_11_23_103127_create_admin_logins_table', 7),
(12, '2023_12_18_073125_create_categories_table', 8),
(13, '2024_03_24_172415_create_categories_table', 9),
(14, '2024_03_24_183537_create_brands_table', 9),
(15, '2024_03_27_203749_create_units_table', 9),
(16, '2024_04_04_112855_create_products_table', 10),
(17, '2024_07_30_154326_create_warehouses_table', 11),
(18, '2024_07_30_202852_create_suppliers_table', 12),
(19, '2024_07_31_181341_create_staff_salaries_table', 13),
(20, '2024_08_08_155031_create_purchases_table', 14),
(21, '2024_09_05_164000_create_customers_table', 15),
(22, '2024_09_07_204610_create_purchase_returns_table', 16),
(23, '2024_09_08_200216_create_sales_table', 17),
(24, '2024_09_10_203621_create_claim_returns_table', 18),
(25, '2025_01_22_152605_create_customer_credits_table', 19),
(26, '2025_01_22_152630_create_customer_recoveries_table', 19),
(27, '2025_02_28_233845_create_subcategories_table', 20),
(28, '2025_02_28_234954_create_subcategories_table', 21),
(29, '2025_03_01_020819_create_products_table', 22),
(30, '2025_03_01_021600_create_products_table', 23),
(31, '2025_03_01_130932_create_customers_table', 24),
(32, '2025_03_01_232036_create_orders_table', 25),
(33, '2025_03_01_232545_create_order_items_table', 25),
(34, '2025_03_02_011344_create_vendors_table', 26),
(35, '2025_03_07_024109_create_menu_estimates_table', 27),
(36, '2025_03_11_004256_create_kitchen_items_table', 28),
(37, '2025_03_11_004309_create_kitchen_inventories_table', 28),
(38, '2025_03_12_173232_create_gate_passes_table', 29),
(39, '2025_03_12_174733_create_gate_pass_items_table', 30),
(40, '2025_03_21_221146_create_accountants_table', 31),
(41, '2025_03_21_222853_create_accountant_ledgers_table', 32),
(42, '2025_03_21_222906_create_accountant_expenses_table', 32),
(43, '2025_04_21_024356_create_item_categories_table', 33),
(44, '2025_04_21_030533_create_item_products_table', 34),
(45, '2025_04_21_034825_create_warehouse_stocks_table', 35),
(46, '2025_04_21_034841_create_warehouse_product_stocks_table', 35),
(47, '2025_04_21_035011_create_stock_transfers_table', 35),
(48, '2025_04_27_021447_create_vendor_order_assigns_table', 36),
(49, '2025_04_28_014114_create_order_payments_table', 37);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` text DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `sale_date` text DEFAULT NULL,
  `order_name` text DEFAULT NULL,
  `delivery_date` text DEFAULT NULL,
  `delivery_time` text DEFAULT NULL,
  `event_type` text DEFAULT NULL,
  `Venue` text DEFAULT NULL,
  `person_program` text DEFAULT NULL,
  `special_instructions` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `item_category` text DEFAULT NULL,
  `item_subcategory` text DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `total_price` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `payable_amount` text DEFAULT NULL,
  `advance_paid` text DEFAULT NULL,
  `remaining_amount` text DEFAULT NULL,
  `order_status` text DEFAULT NULL,
  `payment_status` text DEFAULT NULL,
  `order_type` text DEFAULT NULL,
  `assign_status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `customer_id`, `customer_name`, `sale_date`, `order_name`, `delivery_date`, `delivery_time`, `event_type`, `Venue`, `person_program`, `special_instructions`, `note`, `item_category`, `item_subcategory`, `item_name`, `unit`, `quantity`, `price`, `total`, `total_price`, `discount`, `payable_amount`, `advance_paid`, `remaining_amount`, `order_status`, `payment_status`, `order_type`, `assign_status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Kashan', '2025-03-07', NULL, '2025-03-07', NULL, 'Mayo', 'Sari', '100', NULL, NULL, '[\"1\"]', '[\"1\"]', '[\"Tikka Biryani\"]', '[\"kg\"]', '[\"12\"]', '[\"1000\"]', '[\"12000.00\"]', '12000.00', '0', '12000.00', '17000', '-5000', 'Delivered', 'Paid', 'menu', 'Assigned', '2025-04-26 20:50:53', '2025-05-03 15:42:16'),
(2, 1, NULL, 'Kashan', '2025-03-07', NULL, '2025-03-10', NULL, 'Barat Event', 'sari', '500', NULL, NULL, '[\"1\",\"2\"]', '[\"1\",\"4\"]', '[\"Makhni Biryani\",\"Ch: Hotshot\"]', '[\"kg\",\"pcs\"]', '[\"12\",\"100\"]', '[\"1000\",\"30\"]', '[\"12000.00\",\"3000.00\"]', '15000.00', '0', '15000.00', '0', '15000.00', 'confirmed', 'pending', 'menu', '1,2', '2025-04-26 20:52:49', '2025-05-11 10:48:38'),
(3, NULL, NULL, 'Waleed', '2025-04-27', 'Kashan', '2025-05-08', '22:22', NULL, 'sari', '100', 'no', '', '[\"Pakistani\"]', '[\"Biryani\"]', '[\"Tikka Biryani\"]', '[\"(kg)\"]', '[\"12\"]', '[\"1000\"]', '[\"12000.00\"]', '12000.00', '0', '12000.00', '12000', '0', 'Delivered', 'Paid', 'Online Order', NULL, '2025-04-26 20:56:16', '2025-05-03 15:43:36'),
(4, 1, '3', 'Arsalan', '2025-04-27', 'Kashan', '2025-04-30', '05:47', 'Valima', 'Sari', '100', 'no', NULL, '[\"1\"]', '[\"1\"]', '[\"Tikka Biryani\"]', '[\"kg\"]', '[\"12\"]', '[\"1000\"]', '[\"12000.00\"]', '12000.00', '0', '12000', '12000', '0', 'Pending', 'Paid', 'System Order', NULL, '2025-04-27 00:47:27', '2025-05-03 15:02:28'),
(5, 1, '1', 'soban', '2025-04-28', 'Muneeb', '2025-05-10', '01:51', 'Birthday', 'Sari', '250', 'No', 'Testing', '[\"1\"]', '[\"1\"]', '[\"Tikka Biryani\"]', '[\"kg\"]', '[\"12\"]', '[\"1000\"]', '[\"12000.00\"]', '12000.00', '0', '12000', '4000', '8000', 'Pending', 'Unpaid', 'System Order', NULL, '2025-04-27 20:52:17', '2025-04-27 20:53:13'),
(6, 1, NULL, 'waleed Order', '2025-05-03', NULL, '2025-05-15', NULL, 'Valima', 'Sari Banquet', '150', NULL, NULL, '[\"1\",\"1\"]', '[\"1\",\"2\"]', '[\"Tikka Biryani\",\"Korma\"]', '[\"kg\",\"kg\"]', '[\"12\",\"15\"]', '[\"1000\",\"747\"]', '[\"12000.00\",\"11205.00\"]', '23205.00', '0', '23205.00', '0', '23205.00', 'confirmed', 'pending', 'menu', NULL, '2025-05-03 15:03:45', '2025-05-03 15:03:45'),
(7, 1, NULL, 'Ahmed (0318-2879575)', '2025-05-11', NULL, '2025-05-17', NULL, 'Wedding', 'Dollmen Banquet', '600', NULL, NULL, '[\"1\",\"2\",\"3\",\"4\"]', '[\"1\",\"4\",\"5\",\"7\"]', '[\"Tikka Biryani\",\"Ch: Hotshot\",\"Shanwari Karahi\",\"Mutton Paya Meat\"]', '[\"kg\",\"pcs\",\"kg\",\"pcs\"]', '[\"12\",\"100\",\"10\",\"100\"]', '[\"1000\",\"30\",\"750\",\"150\"]', '[\"12000.00\",\"3000.00\",\"7500.00\",\"15000.00\"]', '37500.00', '0', '37500.00', '0', '37500.00', 'confirmed', 'pending', 'menu', NULL, '2025-05-10 20:17:59', '2025-05-10 20:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` text DEFAULT NULL,
  `paid_amount` text DEFAULT NULL,
  `payment_date` text DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_payments`
--

INSERT INTO `order_payments` (`id`, `order_id`, `paid_amount`, `payment_date`, `purpose`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '4', '2000', '2025-04-28 01:43:36', 'Payment Received', '2025-04-27 20:43:36', '2025-04-27 20:43:36', NULL),
(2, '4', '2000', '2025-04-28 01:43:50', 'Payment Received', '2025-04-27 20:43:50', '2025-04-27 20:43:50', NULL),
(3, '5', '2000', '2025-04-28 01:53:01', 'Payment Received', '2025-04-27 20:53:01', '2025-04-27 20:53:01', NULL),
(4, '5', '2000', '2025-04-28 01:53:13', 'Payment Received', '2025-04-27 20:53:13', '2025-04-27 20:53:13', NULL),
(5, '4', '8000', '2025-05-03 20:02:28', 'Payment Received', '2025-05-03 15:02:28', '2025-05-03 15:02:28', NULL),
(6, '3', '12000', '2025-05-03 20:37:51', 'Payment Received', '2025-05-03 15:37:51', '2025-05-03 15:37:51', NULL),
(7, '1', '5000', '2025-05-03 20:41:36', 'Payment Received', '2025-05-03 15:41:36', '2025-05-03 15:41:36', NULL),
(8, '1', '5000', '2025-05-03 20:41:46', 'Payment Received', '2025-05-03 15:41:46', '2025-05-03 15:41:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_users`
--

CREATE TABLE `pos_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` text DEFAULT NULL,
  `f_name` text DEFAULT NULL,
  `l_name` text DEFAULT NULL,
  `user_name` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `role` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `user_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `unit_id`, `name`, `image`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Tikka Biryani', NULL, '1000', '2025-03-05 21:25:39', '2025-03-05 21:25:39'),
(2, 1, 1, 1, 'Makhni Biryani', NULL, '1000', '2025-03-05 21:33:28', '2025-03-05 21:33:28'),
(3, 1, 2, 1, 'Korma', NULL, '747', '2025-03-05 21:33:50', '2025-03-05 21:33:50'),
(4, 1, 2, 1, 'Badami Korma', NULL, '850', '2025-03-05 21:34:20', '2025-03-05 21:34:20'),
(5, 2, 4, 2, 'Ch: Hotshot', NULL, '30', '2025-03-05 21:40:46', '2025-03-05 21:40:46'),
(6, 3, 5, 1, 'Shanwari Karahi', NULL, '750', '2025-03-05 21:41:30', '2025-03-05 21:41:30'),
(7, 3, 6, 1, 'Behari Tikka', NULL, '350', '2025-03-05 21:42:25', '2025-03-05 21:42:25'),
(8, 4, 7, 2, 'Mutton Paya Meat', NULL, '150', '2025-03-05 21:43:02', '2025-03-05 21:43:02'),
(9, 3, 9, 1, 'Finger Fish', '1745508471_680a5877f1681.jpg', '500', '2025-03-15 16:53:22', '2025-04-24 15:27:51'),
(10, 1, 1, 1, 'Tikka', NULL, '1000', '2025-04-22 20:12:44', '2025-04-22 20:12:44'),
(11, 3, 5, 1, 'BBQ karahi', '1745507516_680a54bcbc24a.jpg', '800', '2025-04-24 15:11:56', '2025-04-24 15:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` text DEFAULT NULL,
  `supplier` text DEFAULT NULL,
  `purchase_date` text DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `item_category` text DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `total_price` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `Payable_amount` text DEFAULT NULL,
  `paid_amount` text DEFAULT NULL,
  `due_amount` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `is_return` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `invoice_no`, `supplier`, `purchase_date`, `warehouse_id`, `item_category`, `item_name`, `quantity`, `price`, `total`, `note`, `total_price`, `discount`, `Payable_amount`, `paid_amount`, `due_amount`, `status`, `is_return`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INVPURC-001', 'Waleed bhai', '2025-04-24', NULL, '[\"Mirch Maslay\"]', '[\"Pesi wi mirchi\"]', '[\"6\"]', '[\"100\"]', '[\"1000\"]', 'Purchased', '1000', '0', '0', '1000', '0', 'Paid', '1', '2025-04-24 16:02:59', '2025-04-24 20:12:31', NULL),
(2, 'INVPURC-002', 'local', '2025-05-03', 'warehouse one', '[\"Mutton\"]', '[\"Mutton\"]', '[\"10\"]', '[\"2300\"]', '[\"23000\"]', 'no', '23000', '0', '23000', NULL, '23000', NULL, NULL, '2025-05-03 16:16:50', '2025-05-03 16:16:50', NULL),
(3, 'INVPURC-003', 'local', '2025-05-03', 'warehouse one', '[\"Mutton\"]', '[\"Mutton\"]', '[\"10\"]', '[\"2300\"]', '[\"23000\"]', 'sale', '23000', '0', '23000', '0', '23000', NULL, NULL, '2025-05-03 16:18:00', '2025-05-03 16:18:00', NULL),
(4, 'INVPURC-004', 'local', '2025-05-10', 'warehouse one', '[\"Mirch Maslay\"]', '[\"Pesi wi mirchi\"]', '[\"20\"]', '[\"400\"]', '[\"8000\"]', NULL, '8000', '0', '8000', '0', '8000', NULL, NULL, '2025-05-10 18:24:30', '2025-05-10 18:24:30', NULL),
(5, 'INVPURC-005', 'loc', '2025-05-10', 'warehouse one', '[\"Mirch Maslay\"]', '[\"Pesi wi mirchi\"]', '[\"20\"]', '[\"250\"]', '[\"5000\"]', NULL, '5000', '0', '5000', '0', '5000', NULL, NULL, '2025-05-10 18:26:16', '2025-05-10 18:26:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` text DEFAULT NULL,
  `return_date` text DEFAULT NULL,
  `supplier` text DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `return_quantity` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `subtotal` text DEFAULT NULL,
  `total_price` text DEFAULT NULL,
  `payable_amount` text DEFAULT NULL,
  `paid_amount` text DEFAULT NULL,
  `due_amount` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_returns`
--

INSERT INTO `purchase_returns` (`id`, `purchase_id`, `return_date`, `supplier`, `warehouse_id`, `item_name`, `return_quantity`, `price`, `total`, `note`, `discount`, `subtotal`, `total_price`, `payable_amount`, `paid_amount`, `due_amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '2025-04-24', 'Waleed bhai', NULL, '[\"Pesi wi mirchi\"]', '[\"2\"]', '[\"100\"]', '[\"200\"]', 'Purchase return', '0', '200', '200', '200.00', '200', '0', 'Paid', '2025-04-24 16:33:14', '2025-04-24 16:35:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` text DEFAULT NULL,
  `user_type` text DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `customer` text DEFAULT NULL,
  `sale_date` text DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `item_category` text DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `total` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `total_price` text DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `Payable_amount` text DEFAULT NULL,
  `cash_received` text DEFAULT NULL,
  `change_return` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `userid`, `user_type`, `invoice_no`, `customerId`, `customer`, `sale_date`, `warehouse_id`, `item_category`, `item_name`, `quantity`, `price`, `total`, `note`, `total_price`, `discount`, `Payable_amount`, `cash_received`, `change_return`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'admin', 'INV-001', 1, 'Darryl Washington', '2025-02-06', 'warehouse one', '[\"Lipstick\"]', '[\"Eveline Cosmetics Variete Satin Lipstick\"]', '[\"2\"]', '[\"800.00\"]', '[\"1600.00\"]', 'sale', '1600', '0', '1600', '0', '0', '2025-02-05 20:43:37', '2025-02-05 20:43:37', NULL),
(2, '1', 'admin', 'INV-002', 1, 'Darryl Washington', '2025-02-06', 'warehouse one', '[\"Lipstick\"]', '[\"Eveline Cosmetics Variete Satin Lipstick\"]', '[\"2\"]', '[\"800.00\"]', '[\"1600.00\"]', 'sale', '1600', '0', '1600', '0', '0', '2025-02-05 20:44:19', '2025-02-05 20:44:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_salaries`
--

CREATE TABLE `staff_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_name` text DEFAULT NULL,
  `staff_year` text DEFAULT NULL,
  `staff_month` text DEFAULT NULL,
  `staff_amount` text DEFAULT NULL,
  `staff_date` text DEFAULT NULL,
  `staff_status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfers`
--

CREATE TABLE `stock_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_name` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `transfer_date` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_transfers`
--

INSERT INTO `stock_transfers` (`id`, `warehouse_name`, `category`, `product_name`, `quantity`, `transfer_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'warehouse one', 'Mirch Maslay', 'Pesi wi mirchi', '10', '2025-04-21', '2025-04-20 23:57:07', '2025-04-20 23:57:07', NULL),
(2, 'warehouse one', 'Mirch Maslay', 'Pesi wi mirchi', '10', '2025-04-21', '2025-04-20 23:58:06', '2025-04-20 23:58:06', NULL),
(3, 'warehouse one', 'Mirch Maslay', 'Pesi wi mirchi', '10', '2025-04-21', '2025-04-20 23:58:56', '2025-04-20 23:58:56', NULL),
(4, 'warehouse one', 'Mirch Maslay', 'Pesi wi mirchi', '10', '2025-05-10', '2025-05-10 18:25:44', '2025-05-10 18:25:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Biryani', '2025-03-05 21:16:04', '2025-03-05 21:16:04'),
(2, 1, 'Salan', '2025-03-05 21:16:15', '2025-03-05 21:16:15'),
(3, 1, 'Desert', '2025-03-05 21:16:25', '2025-03-05 21:16:25'),
(4, 2, 'Fried', '2025-03-05 21:17:10', '2025-03-05 21:17:10'),
(5, 3, 'Karahi', '2025-03-05 21:17:24', '2025-03-05 21:17:24'),
(6, 3, 'BBQ', '2025-03-05 21:17:31', '2025-03-05 21:17:31'),
(7, 4, 'Meat', '2025-03-05 21:17:47', '2025-03-05 21:17:47'),
(8, 3, 'Desert', '2025-03-05 21:18:08', '2025-03-05 21:18:17'),
(9, 3, 'fish', '2025-03-15 16:52:52', '2025-03-15 16:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `company_name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `Payable` text DEFAULT NULL,
  `Receivable` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `admin_or_user_id`, `name`, `email`, `mobile`, `company_name`, `address`, `Payable`, `Receivable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Sadam Bhai', 'sadam12@gmail.com', '03173859647', 'sadam comunicatoins', 'hyderabad', NULL, NULL, '2024-10-24 16:35:38', '2024-10-24 16:35:38', NULL),
(2, '1', 'Waleed', 'Waleed12@gmail.com', '03112328933', 'Testing', 'hyderabad', NULL, NULL, '2025-01-13 20:59:24', '2025-01-13 20:59:24', NULL),
(3, '1', 'Kashan', 'kashan12@gmail.com', '031123289333', 'Testing', 'Hyderabad', NULL, NULL, '2025-01-19 13:15:35', '2025-01-19 13:15:35', NULL),
(4, '1', 'testing', NULL, '03112328933', NULL, NULL, NULL, NULL, '2025-01-21 17:41:33', '2025-01-21 17:41:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `admin_or_user_id`, `unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'kg', '2025-03-05 21:05:05', '2025-03-05 21:05:05', NULL),
(2, '1', 'pcs', '2025-03-05 21:05:11', '2025-03-05 21:05:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` text DEFAULT NULL,
  `admin_id` text DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` text NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `admin_id`, `name`, `email`, `email_verified_at`, `username`, `password`, `usertype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Ahmad Memon', 'admin@gmail.com', NULL, 'admin', '$2y$12$390.Z4fWZTx8QBfiKlBDOOu6IJsuUSsWzgAed1T4o2hVg0tjivHr6', 'admin', NULL, NULL, '2025-05-11 07:56:48'),
(2, NULL, NULL, 'Super Admin', 'superadmin@gmail.com', NULL, 'super admin', '$2y$12$nOsxlNP1ysxS4gdu1RLqZOdVnGY/OgMwZYnZxXcSg5koo0lNLwipK', 'super admin', NULL, '2024-10-24 17:13:57', '2024-10-24 17:13:57'),
(4, '1', NULL, 'Muneeb', 'muneeb12@gmail.com', NULL, NULL, '$2y$12$7isyNNt8s7o118ppExpYbeRZ21oP.2hizSnVQCzCYy5O3J5xzhxpO', 'Accountant', NULL, '2025-04-18 22:31:47', '2025-04-18 22:31:47'),
(5, '2', NULL, 'Waleed', 'waleed12@gmail.com', NULL, NULL, '$2y$12$QJMQzWM3lI6AlNtfHYwYaeQexrTkia8fXjiBKrBpxk1R7zQnJoRC6', 'Accountant', NULL, '2025-04-18 22:48:19', '2025-04-18 22:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `identity` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `phone`, `address`, `identity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'arsalan', '0123123', 'near city polic station,', 'Vend-0001', '2025-03-01 20:30:15', '2025-03-01 20:30:15', NULL),
(2, 'kashan Shaikh', '03173859647', 'hyd', 'Vend-0002', '2025-04-18 23:12:11', '2025-04-18 23:17:55', NULL),
(3, 'testing', '03112328944', 'hyd', 'Vend-0003', '2025-04-27 20:22:53', '2025-04-27 20:22:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_order_assigns`
--

CREATE TABLE `vendor_order_assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` text DEFAULT NULL,
  `order_id` text DEFAULT NULL,
  `item_id` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `assign_date` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_order_assigns`
--

INSERT INTO `vendor_order_assigns` (`id`, `vendor_id`, `order_id`, `item_id`, `quantity`, `assign_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '2', '1', '12', '2025-05-11 15:48:38', '2025-05-11 10:48:38', '2025-05-11 10:48:38', NULL),
(2, '2', '2', '2', '100', '2025-05-11 15:48:38', '2025-05-11 10:48:38', '2025-05-11 10:48:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `admin_or_user_id`, `name`, `address`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'warehouse one', 'hyderabad CIty', 'Enabled', '2024-10-24 16:36:06', '2024-10-24 16:36:06', NULL),
(2, '1', 'Warehouse 2', 'hyderabad', 'Enabled', '2025-04-20 22:58:49', '2025-04-20 22:58:49', NULL),
(3, '1', 'Warehouse 6 number', '6 number', 'Enabled', '2025-04-20 22:59:01', '2025-04-20 22:59:01', NULL),
(4, '1', 'Warehose Fatech Chok', 'Fatech Chok', 'Enabled', '2025-04-20 22:59:30', '2025-04-20 22:59:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product_stocks`
--

CREATE TABLE `warehouse_product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_name` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_product_stocks`
--

INSERT INTO `warehouse_product_stocks` (`id`, `warehouse_name`, `category`, `product_name`, `brand`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'warehouse one', 'Mirch Maslay', 'Pesi wi mirchi', 'Shan', '50', '2025-04-20 23:29:48', '2025-05-10 18:26:16', NULL),
(2, 'warehouse one', 'Mutton', 'Mutton', 'Mutton', '40', '2025-05-03 16:07:49', '2025-05-03 16:18:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_stocks`
--

CREATE TABLE `warehouse_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_or_user_id` text DEFAULT NULL,
  `stock_date` date DEFAULT NULL,
  `warehouse_name` text DEFAULT NULL,
  `supplier_name` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `model` text DEFAULT NULL,
  `quantity` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_stocks`
--

INSERT INTO `warehouse_stocks` (`id`, `admin_or_user_id`, `stock_date`, `warehouse_name`, `supplier_name`, `category`, `product_name`, `model`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '2025-04-21', 'warehouse one', 'Local', 'Mirch Maslay', 'Pesi wi mirchi', 'Shan', '50', '2025-04-20 23:29:48', '2025-04-20 23:29:48', NULL),
(2, '1', '2025-05-03', 'warehouse one', 'local', 'Mutton', 'Mutton', 'Mutton', '10', '2025-05-03 16:07:49', '2025-05-03 16:07:49', NULL),
(3, '1', '2025-05-03', 'warehouse one', 'local', 'Mutton', 'Mutton', 'Mutton', '20', '2025-05-03 16:08:47', '2025-05-03 16:08:47', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountants`
--
ALTER TABLE `accountants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accountant_expenses`
--
ALTER TABLE `accountant_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accountant_ledgers`
--
ALTER TABLE `accountant_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claim_returns`
--
ALTER TABLE `claim_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_credits`
--
ALTER TABLE `customer_credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_recoveries`
--
ALTER TABLE `customer_recoveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gate_passes`
--
ALTER TABLE `gate_passes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gate_pass_items`
--
ALTER TABLE `gate_pass_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_products`
--
ALTER TABLE `item_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kitchen_inventories`
--
ALTER TABLE `kitchen_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kitchen_items`
--
ALTER TABLE `kitchen_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_estimates`
--
ALTER TABLE `menu_estimates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos_users`
--
ALTER TABLE `pos_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_salaries`
--
ALTER TABLE `staff_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_order_assigns`
--
ALTER TABLE `vendor_order_assigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_product_stocks`
--
ALTER TABLE `warehouse_product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_stocks`
--
ALTER TABLE `warehouse_stocks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountants`
--
ALTER TABLE `accountants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accountant_expenses`
--
ALTER TABLE `accountant_expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accountant_ledgers`
--
ALTER TABLE `accountant_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `claim_returns`
--
ALTER TABLE `claim_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_credits`
--
ALTER TABLE `customer_credits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_recoveries`
--
ALTER TABLE `customer_recoveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gate_passes`
--
ALTER TABLE `gate_passes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gate_pass_items`
--
ALTER TABLE `gate_pass_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_products`
--
ALTER TABLE `item_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kitchen_inventories`
--
ALTER TABLE `kitchen_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kitchen_items`
--
ALTER TABLE `kitchen_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_estimates`
--
ALTER TABLE `menu_estimates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_users`
--
ALTER TABLE `pos_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_salaries`
--
ALTER TABLE `staff_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor_order_assigns`
--
ALTER TABLE `vendor_order_assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warehouse_product_stocks`
--
ALTER TABLE `warehouse_product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouse_stocks`
--
ALTER TABLE `warehouse_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
