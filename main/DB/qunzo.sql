-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2025 at 11:20 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qunzo-client`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `avatar`, `name`, `email`, `phone`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Super Admin', 'admin@qunzo.com', '', '$2y$12$WbpxsP5oRRAv.WtRjbBVnuTNUZHX04628SFh5IHWsdY5JDUPNp3xi', 1, '2024-11-19 22:45:36', '2025-04-29 11:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale_id` int DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_jobs`
--

CREATE TABLE `cron_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `next_run_at` timestamp NULL DEFAULT NULL,
  `last_run_at` timestamp NULL DEFAULT NULL,
  `schedule` int DEFAULT NULL,
  `type` enum('system','custom') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('running','paused') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserved_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `name`, `next_run_at`, `last_run_at`, `schedule`, `type`, `status`, `reserved_method`, `url`, `created_at`, `updated_at`) VALUES
(1, 'User Inactive Account Disabled', '2025-11-01 12:45:52', '2025-11-01 12:15:52', 1800, 'system', 'running', 'userInactive', NULL, NULL, '2025-11-01 12:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `cron_job_logs`
--

CREATE TABLE `cron_job_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `cron_job_id` bigint UNSIGNED DEFAULT NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('fiat','crypto') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fiat',
  `symbol` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_rate` decimal(28,8) DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_csses`
--

CREATE TABLE `custom_csses` (
  `id` bigint UNSIGNED NOT NULL,
  `css` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_csses`
--

INSERT INTO `custom_csses` (`id`, `css`, `created_at`, `updated_at`) VALUES
(1, '//The Custom CSS will be added on the site head tag\r\n.site-head-tag {\r\n	margin: 0;\r\n  	padding: 0;\r\n}', '2024-11-19 22:45:36', '2025-03-19 02:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_methods`
--

CREATE TABLE `deposit_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `gateway_id` bigint UNSIGNED DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('auto','manual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'manual',
  `gateway_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) DEFAULT '0.00000000',
  `charge_type` enum('percentage','fixed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_deposit` decimal(28,8) DEFAULT NULL,
  `maximum_deposit` decimal(28,8) DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_withdraw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `logo`, `name`, `gateway_code`, `supported_currencies`, `credentials`, `is_withdraw`, `status`, `created_at`, `updated_at`) VALUES
(1, 'global/gateway/paypal.png', 'Paypal', 'paypal', '[\"USD\", \"EUR\", \"GBP\", \"CAD\", \"AUD\", \"JPY\", \"SGD\", \"NZD\", \"CHF\", \"SEK\", \"NOK\", \"DKK\", \"PLN\", \"HUF\", \"CZK\", \"ILS\", \"BRL\", \"MXN\", \"HKD\", \"TWD\", \"TRY\", \"INR\", \"RUB\", \"ZAR\", \"MYR\", \"THB\", \"IDR\", \"PHP\", \"NGN\", \"GHS\"]', '{\"client_id\":\"AUnfkQ3v2J-d5g-ZEq8l5Oosha8FmAJ3Z9jt71BkD6l-Z3FMIR5FmkYp_6QHwaYx0LvMNvHDsB9Vh84O\",\"client_secret\":\"EJjci35CFj762ut15pn0VWmojEG0GwE68byyHnBq_NoAXXW9mjkjdLFYLfVQwyLs8QAbP1QJAXPl5oAl\",\"app_id\":\"APP-80W284485P519543T\",\"mode\":\"sandbox\"}', 'paypal_email', 1, NULL, '2023-06-20 10:51:45'),
(2, 'global/gateway/stripe.png', 'Stripe', 'stripe', '[\"USD\",\"AUD\",\"BRL\",\"CAD\",\"CHF\",\"DKK\",\"EUR\",\"GBP\",\"HKD\",\"INR\",\"JPY\",\"MXN\",\"MYR\",\"NOK\",\"NZD\",\"PLN\",\"SEK\",\"SGD\"]', '{\"stripe_key\":\"pk_test_51KHQhKAmfDlh6wQq4srkOEY3FkivTCXmRSb7bJqr90q3ZkVWAR2AkRWfKBnegpmKAHea5cNVAToiy7yoa3Q075mR00jlhXsZTO\",\"stripe_secret\":\"sk_test_51KHQhKAmfDlh6wQqXfg4ZScnTRahxbdXV0mKw30nOI4f8gtB2v5rho7IyJtZqkf8SwwuNgLTO2WPGFyk9vnFl8gO00MhSe8Kbj\"}', '0', 1, NULL, '2022-11-13 01:46:46'),
(3, 'global/gateway/mollie.png', 'Mollie', 'mollie', '[\"EUR\", \"USD\", \"GBP\", \"CAD\", \"AUD\", \"CHF\", \"DKK\", \"NOK\", \"SEK\", \"PLN\", \"CZK\", \"HUF\", \"RON\", \"BGN\", \"HRK\", \"ISK\", \"ZAR\"]', '{\"api_key\":\"test_intSTCDEBaDSu28D6DUpn5wnQhTnzB\"}', '0', 1, NULL, '2022-10-28 09:43:50'),
(4, 'global/gateway/perfectmoney.png', 'Perfect Money', 'perfectmoney', '[\"USD\", \"EUR\", \"RUB\", \"UAH\"]', '{\"PM_ACCOUNTID\":\"96793260\",\"PM_PASSPHRASE\":\"77887848a\",\"PM_MARCHANTID\":\"U36928259\",\"PM_MARCHANT_NAME\":\"tdevs\"}', 'member_id', 1, NULL, '2023-06-19 07:01:24'),
(5, 'global/gateway/coinbase.png', 'Coinbase', 'coinbase', '[\"USD\", \"EUR\", \"GBP\", \"CAD\", \"AUD\", \"JPY\", \"BTC\", \"ETH\", \"LTC\", \"BCH\", \"XRP\", \"EOS\"]', '{\"apiKey\":\"8ef6c4ca-f5c7-4717-9d9a-002adf7e7590\",\"account_id\":\"\",\"private_key\":\"\",\"webhookSecret\":\"b789f547-8954-4880-89ae-5a0233006647\",\"apiVersion\":\"2018-03-22\"}', 'email_address', 1, NULL, '2022-10-28 13:16:15'),
(6, 'global/gateway/paystack.png', 'Paystack', 'paystack', '[\"NGN\", \"USD\", \"GBP\", \"EUR\", \"GHS\", \"KES\", \"ZAR\", \"UGX\", \"TZS\", \"RWF\"]', '{\"public_key\":\"pk_test_8e60e513e47ba5619ac0888c9fac99f2853641fa\",\"secret_key\":\"sk_test_e521a3c6d1c37897092868e02e0ddba8c3f0aa01\",\"merchant_email\":\"learn2222earn@gmail.com\"}', '0', 1, NULL, '2022-12-17 03:18:45'),
(7, 'global/gateway/voguepay.png', 'Voguepay', 'voguepay', '[\"USD\", \"EUR\", \"GBP\", \"NGN\", \"GHS\", \"KES\", \"ZAR\", \"UGX\", \"TZS\", \"RWF\"]', '{\"merchant_id\":\"sandbox_760e43f202878f651659820234cad9\"}', '0', 1, NULL, '2022-11-13 20:08:13'),
(8, 'global/gateway/flutterwave.png', 'Flutterwave', 'flutterwave', '[\"USD\", \"EUR\", \"GBP\", \"NGN\", \"GHS\", \"KES\", \"ZAR\", \"UGX\", \"TZS\", \"RWF\", \"CAD\", \"AUD\", \"JPY\", \"INR\"]', '{\"public_key\":\"FLWPUBK_TEST-34d73043494d02b871d7ba051efa471f-X\",\"secret_key\":\"FLWSECK_TEST-efc192c9a48969fc259c517aef8bcc82-X\",\"encryption_key\":\"FLWSECK_TEST4a47bb501118\"}', 'account_bank,account_number', 1, NULL, '2022-12-16 17:06:06'),
(9, 'global/gateway/coingate.png', 'CoinGate', 'coingate', '[\"BTC\", \"ETH\", \"LTC\", \"XRP\", \"BCH\", \"EOS\", \"XLM\", \"XMR\", \"DASH\", \"DOGE\", \"ZEC\"]', '{\"api_token\":\"NPfn5eAGjha_PqfQmC6F_rMA6_zaGVLmVk6Uvsfu\"}', '0', 1, NULL, '2022-11-22 16:01:12'),
(10, 'global/gateway/monnify.svg', 'Monnify', 'monnify', '[\"NGN\"]', '{\"api_key\":\"MK_TEST_BDQKAE9QNX\",\"api_secret\":\"4PSEUWJJ1HAKEYPXTT375CR9Y1LLX369\",\"base_url\":\"https:\\/\\/sandbox.monnify.com\",\"contract_code\":\"0086188339\"}', '0', 1, NULL, '2022-12-05 03:02:39'),
(11, 'global/gateway/securionpay.png', 'SecurionPay', 'securionpay', '[\"USD\", \"EUR\", \"GBP\", \"JPY\", \"CAD\", \"AUD\", \"CHF\", \"SEK\", \"NOK\", \"DKK\"]', '{\"public_key\":\"pk_test_7bkvbNaJzb1Eh2Egtp9NQ9Os\",\"secret_key\":\"sk_test_7bkvbSEKpHWR4bJL8qdoq7c9\"}', '0', 1, NULL, '2022-12-07 05:11:19'),
(12, 'global/gateway/coinpayments.svg', 'CoinPayments', 'coinpayments', '[\"BTC\", \"BTC.LN\", \"BCH\", \"LTC\", \"VLX\", \"VLX.Native\", \"APL\", \"ASK\", \"BCN\", \"BEAM\", \"BIZZ.TRC20\", \"BNB\", \"BNB.BSC\", \"BTCV\", \"BTG\", \"BTT.OLD\", \"BTT.TRC20\", \"CELO\", \"CLOAK\", \"CRW\", \"CURE\", \"cUSD\", \"USD\", \"CAD\", \"EUR\", \"ARS\", \"AUD\", \"AZN\", \"BGN\", \"BRL\", \"BYN\", \"CHF\", \"CLP\", \"CNY\", \"COP\", \"CZK\",\"DKK\", \"GBP\", \"GIP\", \"HKD\", \"HUF\", \"IDR\", \"ILS\", \"INR\", \"IRR\", \"IRT\", \"ISK\",\"JPY\",\"KRW\",\"LAK\",\"MKD\",\"MXN\",\"ZAR\",\"MYR\", \"NGN\", \"NOK\", \"NZD\", \"PEN\", \"PHP\", \"PKR\", \"PLN\", \"RON\", \"RUB\", \"SEK\", \"SGD\", \"THB\", \"TRY\", \"TWD\", \"UAH\", \"VND\"]', '{\"buyer_email\":\"tdevs330@gmail.com\",\"public_key\":\"07de16d3d2100a2440dc81b8659e1b1e607501ca1a5d57f5dfeeedcee361d7a2\",\"private_key\":\"077D15c2C8F915efbbb054a97A3dcc35a7c994e5F6111deb20f38D3AfF34eD8D\",\"ipn_secret\":\"@tdevs\",\"marchant_id\":\"26dd12941806e2c5e8ecc30460c8b7fc\"}', '0', 1, NULL, '2023-07-07 20:18:04'),
(13, 'global/gateway/nowpayments.png', 'Nowpayments', 'nowpayments', '[\"BTC\", \"ETH\", \"LTC\", \"BCH\", \"BNB\", \"XRP\", \"USDT\", \"DOGE\", \"ADA\", \"DOT\", \"LINK\", \"XLM\", \"USDC\", \"TRX\", \"ATOM\", \"XTZ\", \"EOS\", \"XMR\", \"ZEC\", \"DASH\"]', '{\"api_key\":\"SZTR71W-Z48MZ8G-Q5YH6X5-91F72XK\",\"secret_key\":\"cX7FhXcLYX\\/KJPqFnGgRKbcXDzyVUccN\"}', '0', 1, NULL, '2023-07-06 21:33:31'),
(14, 'global/gateway/coinremitter.png', 'Coinremitter', 'coinremitter', '[\"BTC\",\"ETH\"]', '{\"api_key\":\"$2y$10$mTa7SwWG8k1hJ\\/LP3PLTrOclnliQSrC99fsc528mBeTqBsNlj4MvK\",\"password\":\"12345678\"}', 'to_address', 1, NULL, '2023-07-06 21:33:31'),
(15, 'global/gateway/cryptomus.png', 'Cryptomus', 'cryptomus', '[\"BCH\",\"BNB\",\"BTC\",\"BUSD\",\"CGPT\",\"DAI\",\"DASH\",\"DOFE\",\"ETH\",\"LTC\",\"MATIC\",\"TON\",\"TRX\",\"USDC\",\"USDT\",\"VERSE\",\"XMR\"]\r\n\r\n', '{\"payment_key\":\"uQ4LFWCBE3dT84uQnt7ycL7p9WcSwjkSPQaZbik3ChoWO0egw51f4EAaZQKmefhPP0F1cX8OpRcl2c3HexNedoR7FGEYGA1mTgMPI8lzKl7Ct2I43R6SSC3gVDS3rkGX\",\"payout_key\":\"qseRhcxu6wsxhygfhyidwrrgryrrgefhPP0F1cNedoR7FGEYGA1mTgMPX8OpRcl2c3HexNedoR7FGEYGA1mTgMPI8lzKl7Ct2I43R6S1f4EAaZQKmefhSC3gVDS3rkGX\",\"merchant_id\":\"c26b80a8-9549-4a66-bb53-774f12809249\"}', 'address', 1, NULL, '2023-07-08 04:20:55'),
(16, 'global/gateway/paymongo.png', 'Paymongo', 'paymongo', '[\"PHP\", \"USD\", \"AUD\", \"CAD\", \"EUR\", \"HKD\", \"JPY\", \"SGD\", \"GBP\"]\n', '{\"public_key\":\"pk_test_4dV3PdbbGie3BffowbHVSKCU\",\"secret_key\":\"sk_test_xA6gsPKtgESQY1YMndhufaCo\",\"password\":\"5k0HVZ0^%33n\"}', '0', 1, NULL, '2023-07-10 22:48:12'),
(17, 'global/gateway/btcpayserver.png', 'Btcpayserver', 'btcpayserver', '[\"BTC\", \"ETH\", \"XRP\", \"BCH\", \"LTC\", \"ADA\", \"DOT\", \"LINK\", \"XLM\", \"DOGE\"]', '{\"host\":\"https:\\/\\/btcpay.greenway.management\",\"api_key\":\"94f975f1af98d75df559b9d67e13993929ed2e01\",\"store_id\":\"8kP1mwvGdFpFd55pYkuA8B6fEomnUUvGAa8Ad4n4z91M\",\"webhook_secret\":\"3awb9SbJkqozTkYrfGJ5Bx1R8Xrz\"}', '0', 1, NULL, '2023-07-06 21:33:31'),
(18, 'global/gateway/binance.svg', 'Binance', 'binance', '[\"BTC\", \"ETH\", \"BNB\", \"XRP\", \"LTC\", \"BCH\", \"ADA\", \"DOT\", \"LINK\",\"XLM\",\"USDT\",\"USDC\",\"DOGE\",\"SOL\",\"UNI\",\"MATIC\",\"ICP\", \"ETC\", \"XMR\", \"THETA\"]', '{\"api_key\":\"nmgmcaz7oaqijdefee8okmoghsrxrnxzctxzkm7nsgqwjhxe2i7hhyncsgihgxiu\",\"api_secret\":\"birh9qjpyyg4jtt9zsok2ozvpaq3cc9gb1wrtn8ojcnfas71ulg9cxm4su6kttbx\"}', 'address', 1, NULL, '2023-08-17 11:42:51'),
(19, 'global/gateway/cashmaal.png', 'Cashmaal', 'cashmaal', '[\"USD\", \"PKR\"]', '{\"web_id\":\"9101\",\"secret_key\":\"\"}', 'to_email', 1, NULL, '2023-08-19 12:47:56'),
(20, 'global/gateway/blockio.png', 'Block.io', 'blockio', '[\"BTC\", \"LTC\",\"DOGE\"]', '{\"pin\":\"169725cdd2800148b029f804f8f681f102c69b3c\",\"api_key\":\"d4a4-399b-8b74-c73f\"}', 'to_address', 1, NULL, '2023-09-02 08:06:34'),
(21, 'global/gateway/blockchain.png', 'Blockchain', 'blockchain', '[\"BTC\"]', '{\"api_key\":\"21\",\"xpub_code\":\"12\"}', '0', 1, NULL, '2023-08-28 22:30:54'),
(22, 'global/gateway/instamojo.png', 'Instamojo', 'instamojo', '[\"INR\"]', '{\"api_key\":\"test_2241633c3bc44a3de84a3b33969\",\"auth_token\":\"test_279f083f7bebefd35217feef22d\",\"salt\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}', '0', 1, NULL, '2023-08-28 22:30:54'),
(23, 'global/gateway/paytm.png', 'Paytm', 'paytm', '[\"AUD\", \"ARS\", \"BDT\", \"BRL\", \"BGN\", \"CAD\", \"CLP\", \"CNY\", \"COP\",\r\n    \"HRK\", \"CZK\", \"DKK\", \"EGP\", \"EUR\", \"GEL\", \"GHS\", \"HKD\", \"HUF\",\r\n    \"INR\", \"IDR\", \"ILS\", \"JPY\", \"KES\", \"MYR\", \"MXN\", \"MAD\", \"NPR\",\r\n    \"NZD\", \"NGN\", \"NOK\", \"PKR\", \"PEN\", \"PHP\", \"PLN\", \"RON\", \"RUB\",\r\n    \"SGD\", \"ZAR\", \"KRW\", \"LKR\", \"SEK\", \"CHF\", \"THB\", \"TRY\", \"UGX\",\r\n    \"UAH\", \"AED\", \"GBP\", \"USD\", \"VND\", \"XOF\"]', '{\"merchant_id\":\"DIY12386817555501617\",\"merchant_key\":\"bKMfNxPPf_QdZppa\",\"merchant_website\":\"DIYtestingweb\",\"channel\":\"WEB\",\"industry_type\":\"Retail\"}', '0', 1, NULL, '2023-08-30 01:47:57'),
(24, 'global/gateway/razorpay.png', 'Razorpay', 'razorpay', '[\"INR\"]', '{\"razorpay_key\":\"rzp_live_7P4mIHWbTiZ5en\",\"razorpay_secret\":\"UBV0t5iSUUoU3rRccAZKnhfP\"}', '0', 1, NULL, '2024-02-07 03:38:46'),
(25, 'global/gateway/twocheckout.png', '2Checkout', 'twocheckout', '[\"AFN\", \"ALL\", \"DZD\", \"ARS\", \"AUD\", \"AZN\", \"BSD\", \"BDT\", \"BBD\", \"BZD\", \r\n    \"BMD\", \"BOB\", \"BWP\", \"BRL\", \"GBP\", \"BND\", \"BGN\", \"CAD\", \"CLP\", \"CNY\", \r\n    \"COP\", \"CRC\", \"HRK\", \"CZK\", \"DKK\", \"DOP\", \"XCD\", \"EGP\", \"EUR\", \"FJD\", \r\n    \"GTQ\", \"HKD\", \"HNL\", \"HUF\", \"INR\", \"IDR\", \"ILS\", \"JMD\", \"JPY\", \"KZT\", \r\n    \"KES\", \"LAK\", \"MMK\", \"LBP\", \"LRD\", \"MOP\", \"MYR\", \"MVR\", \"MRO\", \"MUR\", \r\n    \"MXN\", \"MAD\", \"NPR\", \"TWD\", \"NZD\", \"NIO\", \"NOK\", \"PKR\", \"PGK\", \"PEN\", \r\n    \"PHP\", \"PLN\", \"QAR\", \"RON\", \"RUB\", \"WST\", \"SAR\", \"SCR\", \"SGD\", \"SBD\", \r\n    \"ZAR\", \"KRW\", \"LKR\", \"SEK\", \"CHF\", \"SYP\", \"THB\", \"TOP\", \"TTD\", \"TRY\", \r\n    \"UAH\", \"AED\", \"USD\", \"VUV\", \"VND\", \"XOF\", \"YER\"]', '{\"seller_id\":\"250507228545\",\"secret_word\":\"=+0CNzfvTItqp*ygwiQE\"}', '0', 1, NULL, '2023-08-30 08:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `currency_id` bigint UNSIGNED NOT NULL,
  `redeemer_id` bigint UNSIGNED DEFAULT NULL,
  `code` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(20,8) NOT NULL,
  `charge` decimal(20,8) NOT NULL,
  `final_amount` decimal(20,8) NOT NULL,
  `claimed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` json NOT NULL,
  `charge` decimal(28,8) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `total_amount` decimal(28,8) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `fields` json DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_contents`
--

CREATE TABLE `landing_contents` (
  `id` bigint UNSIGNED NOT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_id` int DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` bigint UNSIGNED NOT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_rtl` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `flag`, `name`, `locale`, `is_rtl`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'English', 'en', 0, 0, 1, NULL, '2025-04-13 11:56:52');

-- --------------------------------------------------------

--
-- Table structure for table `level_referrals`
--

CREATE TABLE `level_referrals` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `the_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bounty` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `level_referrals`
--

INSERT INTO `level_referrals` (`id`, `type`, `the_order`, `bounty`, `created_at`, `updated_at`) VALUES
(1, 'deposit', '1', 10, '2025-03-06 06:05:53', '2025-03-06 06:05:53'),
(2, 'transfer', '1', 5, '2025-03-06 06:06:42', '2025-03-06 06:06:42'),
(3, 'cash_out', '1', 6, '2025-03-06 06:06:48', '2025-03-06 06:07:56'),
(5, 'payment', '1', 3, '2025-03-06 06:07:04', '2025-03-06 06:07:04'),
(6, 'invoice_pay', '1', 6, '2025-03-06 06:07:13', '2025-03-06 06:07:13'),
(7, 'withdraw', '1', 5, '2025-03-06 06:07:26', '2025-03-06 06:07:26'),
(8, 'create_gift', '1', 2, '2025-03-06 06:07:34', '2025-03-06 06:07:34'),
(9, 'exchange', '1', 10, '2025-03-06 06:07:45', '2025-03-06 06:07:45'),
(11, 'request_money', '1', 5, '2025-03-09 06:23:20', '2025-03-09 06:23:20'),
(12, 'transfer', '2', 20, '2025-03-09 06:48:34', '2025-03-09 06:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `login_activities`
--

CREATE TABLE `login_activities` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secret_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','rejected','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `model` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `user_id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(6, '2024_08_18_061828_create_settings_table', 1),
(7, '2024_08_18_063514_create_admins_table', 1),
(8, '2024_08_18_071630_create_permission_tables', 1),
(10, '2024_08_18_083253_create_gateways_table', 1),
(11, '2024_08_18_090031_create_notifications_table', 1),
(12, '2024_08_18_095609_create_kycs_table', 1),
(13, '2024_08_18_101453_create_user_kycs_table', 1),
(14, '2024_08_19_041604_create_plugins_table', 1),
(16, '2024_08_19_043611_create_tickets_table', 1),
(18, '2024_08_19_044159_create_navigations_table', 1),
(19, '2024_08_19_044603_create_themes_table', 1),
(22, '2024_08_19_044845_create_custom_csses_table', 1),
(23, '2024_08_19_045416_create_level_referrals_table', 1),
(25, '2024_08_19_050813_create_withdrawal_schedules_table', 1),
(27, '2024_08_19_051434_create_login_activities_table', 1),
(29, '2024_08_20_091013_create_cron_jobs_table', 1),
(30, '2024_08_20_091118_create_cron_job_logs_table', 1),
(31, '2024_08_20_091341_create_blogs_table', 1),
(32, '2024_08_20_092532_create_set_tunes_table', 1),
(33, '2024_08_20_092845_create_page_settings_table', 1),
(35, '2024_08_20_093138_create_testimonials_table', 1),
(37, '2024_09_08_121409_create_withdraw_accounts_table', 1),
(38, '2024_09_19_054431_create_referrals_table', 1),
(39, '2024_11_14_040813_create_messages_table', 1),
(42, '2018_08_29_205156_create_translations_table', 2),
(44, '2018_08_29_200844_create_languages_table', 3),
(45, '2024_11_23_084815_create_languages_table', 4),
(51, '2024_11_20_045313_create_merchants_table', 5),
(52, '2024_11_24_060620_create_merchant_forms_table', 5),
(53, '2024_11_30_094656_create_agents_table', 6),
(54, '2024_11_30_094702_create_agent_forms_table', 6),
(60, '2025_01_04_091256_create_personal_access_tokens_table', 10),
(64, '2024_11_17_061922_create_currencies_table', 12),
(66, '0001_01_01_000000_create_users_table', 13),
(67, '2024_08_18_082613_create_transactions_table', 13),
(69, '2024_08_19_050624_create_withdraw_methods_table', 13),
(70, '2024_08_19_050945_create_deposit_methods_table', 13),
(71, '2024_11_17_105848_create_user_wallets_table', 13),
(73, '2024_12_29_114936_create_invoices_table', 13),
(75, '2025_01_08_092924_create_sandbox_transactions_table', 13),
(76, '2024_12_30_035108_create_money_requests_table', 14),
(77, '2024_12_10_110437_create_gifts_table', 15),
(80, '2024_08_20_053202_create_templates_table', 16),
(81, '2024_08_19_043507_create_subscribers_table', 17),
(84, '2024_08_19_044604_create_landing_pages_table', 18),
(85, '2024_08_19_044605_create_landing_contents_table', 18),
(86, '2024_08_19_044052_create_pages_table', 19),
(88, '2024_08_20_093008_create_socials_table', 20),
(90, '2024_08_20_093321_create_user_navigations_table', 21),
(91, '2025_08_19_174218_create_telescope_entries_table', 22),
(92, '2025_09_07_093943_add_current_step_column_to_users_table', 23),
(93, '2025_09_15_045428_add_for_column_to_kycs_table', 24),
(94, '2025_09_16_053110_drop_data_column_from_users', 25),
(95, '2025_10_30_103209_create_beneficiaries_table', 26),
(96, '2025_11_06_084029_create_user_devices_table', 27);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `money_requests`
--

CREATE TABLE `money_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `requester_user_id` bigint UNSIGNED NOT NULL,
  `recipient_user_id` bigint UNSIGNED NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(20,8) NOT NULL,
  `charge` decimal(20,8) NOT NULL,
  `final_amount` decimal(20,8) NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('success','pending','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

CREATE TABLE `navigations` (
  `id` bigint UNSIGNED NOT NULL,
  `page_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` json DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_position` int DEFAULT NULL,
  `header_position` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `translate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigations`
--

INSERT INTO `navigations` (`id`, `page_id`, `name`, `type`, `url`, `footer_position`, `header_position`, `status`, `created_at`, `updated_at`, `translate`) VALUES
(2, 16, 'Contact', '[\"widget_three\", \"widget_two\", \"header\"]', 'contact', 14, 7, 1, '2022-10-24 08:02:26', '2025-04-28 05:03:14', NULL),
(4, 14, 'Privacy', '[\"widget_two\"]', '/page/privacy-policy', 17, NULL, 1, '2022-10-24 08:05:24', '2025-04-09 09:35:38', NULL),
(11, 3, 'About', '[\"widget_two\", \"header\"]', 'about', NULL, 5, 1, '2022-10-27 09:38:03', '2025-03-25 04:17:23', NULL),
(14, NULL, 'Home', '[\"header\", \"widget_one\"]', '/', NULL, 1, 1, '2022-10-28 02:34:49', '2025-02-04 04:06:02', NULL),
(16, 1, 'Blog', '[\"widget_one\", \"header\"]', 'blog', NULL, 6, 1, '2022-11-16 20:35:57', '2025-04-28 05:03:14', NULL),
(18, 209, 'Account Login', '[\"widget_one\"]', '/login', 16, NULL, 1, '2022-11-16 18:01:03', '2025-02-04 03:56:16', NULL),
(19, 13, 'Terms and Conditions', '[\"widget_two\"]', '/page/terms-conditions', 15, NULL, 1, '2022-11-16 18:03:30', '2025-04-09 09:37:56', NULL),
(32, 8, 'Agent', '[\"header\"]', 'agent', 18, 3, 1, '2025-03-24 08:13:48', '2025-04-28 05:03:14', NULL),
(33, 7, 'Merchant', '[\"header\"]', 'merchant', 19, 4, 1, '2025-03-24 08:14:11', '2025-04-28 05:03:14', NULL),
(34, NULL, 'API Documentation', '[\"widget_three\"]', '/api-documentation', 20, NULL, 1, '2025-03-24 08:17:22', '2025-03-24 08:17:22', NULL),
(35, NULL, 'Agent Portal', '[\"widget_one\"]', '/agent/dashboard', 21, NULL, 1, '2025-03-25 08:27:57', '2025-04-27 09:15:35', NULL),
(36, NULL, 'Merchant Portal', '[\"widget_one\"]', '/merchant/dashboard', 22, NULL, 1, '2025-03-25 08:28:16', '2025-04-27 09:15:52', NULL),
(37, 27, 'How It Works', '[\"header\"]', 'how-it-works', 23, 2, 1, '2025-04-28 05:02:58', '2025-04-28 05:03:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` enum('static','dynamic') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'dynamic',
  `status` tinyint DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `theme`, `title`, `code`, `data`, `type`, `status`, `locale`, `url`, `created_at`, `updated_at`) VALUES
(13, 'default', 'Terms & Conditions', 'terms-conditions', '{\"section_id\":\"[]\",\"meta_keywords\":\"Terms and Conditions\",\"meta_description\":\"Terms and Conditions\",\"content\":\"<p>Welcome to <strong>Qunzo<\\/strong>. By accessing or using our platform, you agree to be bound by the following terms and conditions. Please read them carefully before using any Qunzo services.<\\/p>\\r\\n\\r\\n    <h4>1. Acceptance of Terms<\\/h4>\\r\\n    <p>By registering, accessing, or using Qunzo, you acknowledge that you have read, understood, and agree to comply with these Terms &amp; Conditions. If you do not agree, please discontinue using our services immediately.<\\/p>\\r\\n\\r\\n    <h4>2. Account Responsibilities<\\/h4>\\r\\n    <p>Each user is responsible for maintaining the confidentiality of their account credentials. Any actions taken under your account will be considered authorized by you. Please contact support immediately if you detect unauthorized activity.<\\/p>\\r\\n\\r\\n    <h4>3. Services Overview<\\/h4>\\r\\n    <p><strong>Qunzo<\\/strong> is a smart digital wallet and payment ecosystem designed to simplify financial management. Our key features include:<\\/p>\\r\\n    <ul>\\r\\n        <li>Multi-Wallet System (Main, Savings, Profit, etc.)<\\/li>\\r\\n        <li>Merchant Module for business payments<\\/li>\\r\\n        <li>Agent Module for cash-in and cash-out<\\/li>\\r\\n        <li>Gift Code and Invoice Payment Links<\\/li>\\r\\n        <li>Money Exchange between currencies<\\/li>\\r\\n        <li>Send &amp; Request Money features<\\/li>\\r\\n        <li>QR Code for all wallet operations<\\/li>\\r\\n        <li>Merchant API for developers<\\/li>\\r\\n    <\\/ul>\\r\\n\\r\\n    <h4>4. User Conduct<\\/h4>\\r\\n    <p>You agree not to use Qunzo for any unlawful or fraudulent activities, including but not limited to money laundering, scams, identity theft, or unauthorized access attempts.<\\/p>\\r\\n\\r\\n    <h4>5. Fees and Transactions<\\/h4>\\r\\n    <p>Applicable fees are displayed before confirming any transaction. You agree to review and accept all charges before proceeding. Qunzo reserves the right to modify fees with prior notice.<\\/p>\\r\\n\\r\\n    <h4>6. Refund Policy<\\/h4>\\r\\n    <p>All successful transactions are final. Refunds will only be issued in cases of technical errors or duplicate payments, verified by our system and support team.<\\/p>\\r\\n\\r\\n    <h4>7. Limitation of Liability<\\/h4>\\r\\n    <p>Qunzo is not liable for any indirect, incidental, or consequential damages resulting from service use, data loss, or technical failures, except as required by law.<\\/p>\\r\\n\\r\\n    <h4>8. Privacy Policy<\\/h4>\\r\\n    <p>We value your privacy. Your data is protected and processed in accordance with our <a href=\\\"\\/privacy-policy\\\">Privacy Policy<\\/a>. Qunzo ensures compliance with global data protection standards.<\\/p>\\r\\n\\r\\n    <h4>9. Modification of Terms<\\/h4>\\r\\n    <p>Qunzo reserves the right to update or modify these Terms at any time. Any significant changes will be communicated via email or platform notice. Continued use of Qunzo indicates acceptance of updates.<\\/p>\\r\\n\\r\\n    <h4>10. Suspension and Termination<\\/h4>\\r\\n    <p>Qunzo may suspend or terminate accounts that violate our Terms, engage in suspicious activity, or attempt to exploit system vulnerabilities.<\\/p>\\r\\n\\r\\n    <h4>11. Contact Information<\\/h4>\\r\\n    <p>For questions regarding these Terms &amp; Conditions, don\'t hesitate to get in touch with us at <a href=\\\"mailto:support@qunzo.com\\\">support@qunzo.com<\\/a>.<\\/p>\\r\\n\\r\\n    <p><em>Last Updated: November 1, 2025<\\/em><\\/p>\",\"title\":\"Terms and Conditions\"}', 'static', 1, 'en', '/terms-conditions', '2025-04-05 08:48:43', '2025-11-01 10:41:53'),
(14, 'default', 'Privacy & Policy', 'privacy-policy', '{\"meta_keywords\":\"Privacy & Policy\",\"meta_description\":\"Privacy & Policy\",\"section_id\":\"[]\",\"content\":\"<p>At <strong>Qunzo<\\/strong>, we value your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our platform and related services.<\\/p>\\r\\n\\r\\n    <h4>1. Information We Collect<\\/h4>\\r\\n    <p>We collect several types of information to provide and improve our services:<\\/p>\\r\\n    <ul>\\r\\n        <li><strong>Personal Information:<\\/strong> Name, email address, phone number, and verification documents (if required).<\\/li>\\r\\n        <li><strong>Financial Information:<\\/strong> Wallet details, transactions, and payment history.<\\/li>\\r\\n        <li><strong>Technical Data:<\\/strong> IP address, browser type, device information, and access timestamps.<\\/li>\\r\\n        <li><strong>Usage Data:<\\/strong> Interactions with our platform, preferences, and behavioral patterns.<\\/li>\\r\\n    <\\/ul>\\r\\n\\r\\n    <h4>2. How We Use Your Information<\\/h4>\\r\\n    <p>We use collected information to:<\\/p>\\r\\n    <ul>\\r\\n        <li>Provide, maintain, and improve Qunzo\\u2019s services.<\\/li>\\r\\n        <li>Process transactions securely and efficiently.<\\/li>\\r\\n        <li>Verify user identity and prevent fraudulent activities.<\\/li>\\r\\n        <li>Send important updates, alerts, and promotional messages (if permitted).<\\/li>\\r\\n        <li>Comply with legal and regulatory requirements.<\\/li>\\r\\n    <\\/ul>\\r\\n\\r\\n    <h4>3. Data Security<\\/h4>\\r\\n    <p>We implement industry-standard security measures, including encryption and access controls, to protect your personal information from unauthorized access, disclosure, or destruction. However, no online system is entirely risk-free, and users share data at their own discretion.<\\/p>\\r\\n\\r\\n    <h4>4. Cookies and Tracking<\\/h4>\\r\\n    <p>Qunzo uses cookies and similar technologies to enhance your browsing experience and analyze platform performance. You may adjust browser settings to reject cookies, but some features may not function properly.<\\/p>\\r\\n\\r\\n    <h4>5. Sharing of Information<\\/h4>\\r\\n    <p>We do not sell or rent user data. However, we may share information with:<\\/p>\\r\\n    <ul>\\r\\n        <li>Trusted service providers assisting in operations (e.g., payment gateways, analytics).<\\/li>\\r\\n        <li>Regulatory authorities, if legally required.<\\/li>\\r\\n        <li>Business partners with user consent or for integrated services.<\\/li>\\r\\n    <\\/ul>\\r\\n\\r\\n    <h4>6. Data Retention<\\/h4>\\r\\n    <p>Your data will be retained as long as necessary to provide services, comply with laws, or resolve disputes. Once no longer needed, we securely delete or anonymize the information.<\\/p>\\r\\n\\r\\n    <h4>7. Your Rights<\\/h4>\\r\\n    <p>You have the right to:<\\/p>\\r\\n    <ul>\\r\\n        <li>Access, review, or correct your personal data.<\\/li>\\r\\n        <li>Request deletion of your data (subject to legal retention requirements).<\\/li>\\r\\n        <li>Withdraw consent for promotional communications.<\\/li>\\r\\n        <li>File a complaint with a data protection authority if you believe your rights are violated.<\\/li>\\r\\n    <\\/ul>\\r\\n\\r\\n    <h4>8. Third-Party Links<\\/h4>\\r\\n    <p>Our platform may include links to third-party websites. Qunzo is not responsible for the privacy practices or content of external sites. We recommend reviewing their privacy policies before providing personal information.<\\/p>\\r\\n\\r\\n    <h4>9. Children\'s Privacy<\\/h4>\\r\\n    <p>Qunzo\\u2019s services are not directed toward individuals under 18 years old. We do not knowingly collect personal data from minors. If you believe we have done so inadvertently, please contact us for removal.<\\/p>\\r\\n\\r\\n    <h4>10. Policy Updates<\\/h4>\\r\\n    <p>We may revise this Privacy Policy periodically. Updates will be posted on this page with a new \\\"Last Updated\\\" date. Continued use of Qunzo after updates means you accept the revised policy.<\\/p>\\r\\n\\r\\n    <h4>11. Contact Us<\\/h4>\\r\\n    <p>If you have any questions or concerns regarding this Privacy Policy, don\'t hesitate to get in touch with us at:<\\/p>\\r\\n    <p><a href=\\\"mailto:support@qunzo.com\\\">support@qunzo.com<\\/a><\\/p>\\r\\n\\r\\n    <p><em>Last Updated: November 1, 2025<\\/em><\\/p>\",\"title\":\"Privacy & Policy\"}', 'static', 1, 'en', '/privacy-policy', '2025-04-05 09:02:29', '2025-11-01 10:42:52'),
(29, 'default', 'Api Documentation', 'api-documentation', '{\"title\":\"API Documentation\",\"meta_keywords\":\"API Documentation\",\"meta_description\":\"API Documentation\",\"section_id\":\"[]\"}', 'static', 1, 'en', '/api-documentation', '2025-04-05 09:02:29', '2025-11-01 08:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `page_settings`
--

CREATE TABLE `page_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_settings`
--

INSERT INTO `page_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'username_show', '1', '2025-04-06 04:43:02', '2025-04-06 04:43:02'),
(2, 'username_validation', '1', '2025-04-06 04:43:02', '2025-04-30 09:21:29'),
(3, 'phone_show', '1', '2025-04-06 04:43:02', '2025-04-06 04:43:02'),
(4, 'phone_validation', '1', '2025-04-06 04:43:02', '2025-04-06 05:04:11'),
(5, 'country_show', '1', '2025-04-06 04:43:02', '2025-04-09 10:52:39'),
(6, 'country_validation', '1', '2025-04-06 04:43:02', '2025-04-06 05:04:11'),
(7, 'referral_code_show', '1', '2025-04-06 04:43:02', '2025-04-06 04:43:02'),
(8, 'referral_code_validation', '0', '2025-04-06 04:43:02', '2025-04-06 04:43:02'),
(9, 'gender_show', '1', '2025-04-06 04:43:02', '2025-04-06 04:43:02'),
(10, 'gender_validation', '0', '2025-04-06 04:43:02', '2025-04-06 04:59:25'),
(11, 'merchant_username_show', '0', '2025-04-10 03:44:59', '2025-04-10 04:12:26'),
(12, 'merchant_username_validation', '0', '2025-04-10 03:44:59', '2025-04-10 03:44:59'),
(13, 'merchant_phone_show', '1', '2025-04-10 03:44:59', '2025-04-10 03:44:59'),
(14, 'merchant_phone_validation', '0', '2025-04-10 03:44:59', '2025-04-10 03:44:59'),
(15, 'merchant_country_show', '1', '2025-04-10 03:44:59', '2025-04-10 03:44:59'),
(16, 'merchant_country_validation', '0', '2025-04-10 03:44:59', '2025-04-10 03:44:59'),
(17, 'merchant_gender_show', '1', '2025-04-10 03:44:59', '2025-04-10 03:53:40'),
(18, 'merchant_gender_validation', '0', '2025-04-10 03:44:59', '2025-04-10 03:44:59'),
(19, 'agent_username_show', '1', '2025-04-10 04:53:43', '2025-04-10 04:53:43'),
(20, 'agent_username_validation', '0', '2025-04-10 04:53:43', '2025-04-10 04:53:43'),
(21, 'agent_phone_show', '1', '2025-04-10 04:53:43', '2025-04-10 04:53:43'),
(22, 'agent_phone_validation', '0', '2025-04-10 04:53:43', '2025-04-10 04:53:43'),
(23, 'agent_country_show', '1', '2025-04-10 04:53:43', '2025-04-10 04:53:43'),
(24, 'agent_country_validation', '0', '2025-04-10 04:53:43', '2025-04-10 04:53:43'),
(25, 'agent_gender_show', '1', '2025-04-10 04:53:43', '2025-04-10 04:53:43'),
(26, 'agent_gender_validation', '0', '2025-04-10 04:53:43', '2025-04-10 04:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `category`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Statistics Management', 'total-users', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(2, 'Statistics Management', 'total-agents', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(3, 'Statistics Management', 'total-merchants', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(4, 'Statistics Management', 'all-deposits', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(5, 'Statistics Management', 'all-currencies', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(6, 'Statistics Management', 'total-staff', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(7, 'Statistics Management', 'total-withdraw', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(8, 'Statistics Management', 'total-referral', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(9, 'Statistics Management', 'total-automatic-gateway', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(10, 'Statistics Management', 'total-ticket', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(11, 'Statistics Management', 'total-transfer', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(12, 'Statistics Management', 'total-cashout', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(13, 'Statistics Management', 'total-payments', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(14, 'Statistics Management', 'site-statistics-chart', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(15, 'Statistics Management', 'top-country-statistics', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(16, 'Statistics Management', 'top-browser-statistics', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(17, 'Statistics Management', 'top-os-statistics', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(18, 'Statistics Management', 'latest-users', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(19, 'Statistics Management', 'latest-merchants', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(20, 'Statistics Management', 'latest-agents', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(21, 'Customer Management', 'customer-list', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(22, 'Customer Management', 'customer-mail-send', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(23, 'Customer Management', 'customer-basic-manage', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(24, 'Customer Management', 'customer-balance-add-or-subtract', 'admin', '2025-11-01 05:58:53', '2025-11-01 05:58:53'),
(25, 'Customer Management', 'customer-change-password', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(26, 'Customer Management', 'all-type-status', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(27, 'Merchant Management', 'merchant-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(28, 'Merchant Management', 'merchant-mail-send', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(29, 'Merchant Management', 'merchant-basic-manage', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(30, 'Merchant Management', 'merchant-balance-add-or-subtract', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(31, 'Merchant Management', 'merchant-change-password', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(32, 'Merchant Management', 'merchant-all-type-status', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(33, 'Merchant Management', 'merchant-delete', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(34, 'Merchant Management', 'merchant-kyc-info', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(35, 'Agent Management', 'agent-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(36, 'Agent Management', 'agent-mail-send', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(37, 'Agent Management', 'agent-basic-manage', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(38, 'Agent Management', 'agent-balance-add-or-subtract', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(39, 'Agent Management', 'agent-change-password', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(40, 'Agent Management', 'agent-all-type-status', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(41, 'Agent Management', 'agent-delete', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(42, 'Agent Management', 'agent-kyc-info', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(43, 'Verification Center', 'verification-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(44, 'Verification Center', 'verification-action', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(45, 'Verification Center', 'verification-form-manage', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(46, 'Role Management', 'role-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(47, 'Role Management', 'role-create', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(48, 'Role Management', 'role-edit', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(49, 'Staff Management', 'staff-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(50, 'Staff Management', 'staff-create', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(51, 'Staff Management', 'staff-edit', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(52, 'Transaction Management', 'transaction-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(53, 'Deposit Management', 'automatic-gateway-manage', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(54, 'Deposit Management', 'manual-gateway-manage', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(55, 'Deposit Management', 'deposit-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(56, 'Deposit Management', 'deposit-action', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(57, 'Withdraw Management', 'withdraw-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(58, 'Withdraw Management', 'withdraw-method-manage', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(59, 'Withdraw Management', 'withdraw-action', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(60, 'Withdraw Management', 'withdraw-schedule', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(61, 'Referral Management', 'manage-referral', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(62, 'Referral Management', 'referral-create', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(63, 'Referral Management', 'referral-edit', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(64, 'Referral Management', 'referral-delete', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(65, 'Appearance Management', 'custom-css', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(66, 'Support Ticket Management', 'support-ticket-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(67, 'Support Ticket Management', 'support-ticket-action', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(68, 'Setting Management', 'site-setting', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(69, 'Setting Management', 'email-setting', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(70, 'Setting Management', 'plugin-setting', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(71, 'Setting Management', 'currencies-setting', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(72, 'Setting Management', 'language-setting', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(73, 'Setting Management', 'page-setting', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(74, 'Setting Management', 'notification-tune-setting', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(75, 'Template Management', 'template-list', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(76, 'Template Management', 'template-edit', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(77, 'Template Management', 'template-update', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(78, 'Template Management', 'template-delete', 'admin', '2025-11-01 05:58:54', '2025-11-01 05:58:54'),
(79, 'System Management', 'manage-cron-job', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55'),
(80, 'System Management', 'cron-job-create', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55'),
(81, 'System Management', 'cron-job-edit', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55'),
(82, 'System Management', 'cron-job-delete', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55'),
(83, 'System Management', 'cron-job-logs', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55'),
(84, 'System Management', 'cron-job-run', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55'),
(85, 'System Management', 'clear-cache', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55'),
(86, 'System Management', 'application-details', 'admin', '2025-11-01 05:58:55', '2025-11-01 05:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(196) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `icon`, `type`, `name`, `description`, `data`, `status`, `created_at`, `updated_at`) VALUES
(5, 'global/plugin/vonage.png', 'sms', 'Vonage', 'Vonage API (formerly Nexmo) provides cloud-based SMS API for seamless communication integration.\n\n', '{\"from\":\"8801887094529\",\"api_key\":\"d67bcc94\",\"api_secret\":\"Gu5QVwrCZRSORjOs\"}', 0, NULL, '2023-12-26 00:56:45'),
(6, 'global/plugin/twilio.png', 'sms', 'Twillo', 'Build agility into your customer engagement\r\n\r\n\r\n', '{\"twilio_sid\":\"AC9620e699606601c99d920d795d053d83\",\"twilio_auth_token\":\"7b97976578e99b93d1dd1a0f2fbf0849\",\"twilio_phone\":\"+19292426081\"}', 0, NULL, '2023-12-31 04:26:09'),
(13, 'global/plugin/firebase.png', 'notification', 'Firebase', 'Real Time Notifications For Flutter App', '{\"upload_account_json\":\"global\\/files\\/serviceAccount.json\"}', 0, NULL, '2025-11-06 09:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super-Admin', 'admin', '2024-11-19 22:45:34', '2024-11-19 22:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
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
(69, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sandbox_transactions`
--

CREATE TABLE `sandbox_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `tnx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(28,8) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `callback_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `manual_field_data` json DEFAULT NULL,
  `approval_cause` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'string',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `type`, `created_at`, `updated_at`) VALUES
(1, 'site_logo', 'global/uploads/global/uploads/settings//mjxazf4dfek3ckRSFjOl.svg', 'string', '2024-11-19 22:45:36', '2025-11-01 11:28:41'),
(2, 'site_logo_height', '35', 'string', '2024-11-19 22:45:36', '2025-11-01 11:18:38'),
(3, 'site_logo_width', 'auto', 'string', '2024-11-19 22:45:36', '2025-11-01 11:18:47'),
(4, 'site_favicon', 'global/uploads/global/uploads/settings//1xOFnDDUyWS2LSBOp0pG.svg', 'string', '2024-11-19 22:45:36', '2025-11-01 10:48:04'),
(5, 'login_bg', 'global/uploads/global/uploads/settings//UBl7eVJdIqLwnwGrwg07.jpg', 'string', '2024-11-19 22:45:36', '2025-11-01 11:44:25'),
(6, 'site_admin_prefix', 'admin', 'string', '2024-11-19 22:45:36', '2025-04-16 11:58:11'),
(7, 'site_title', 'Qunzo', 'string', '2024-11-19 22:45:36', '2025-11-01 11:03:12'),
(8, 'account_number_prefix', 'DGB', 'string', '2024-11-19 22:45:36', '2024-11-21 04:58:29'),
(9, 'site_currency', 'USD', 'string', '2024-11-19 22:45:36', '2024-11-21 04:58:29'),
(10, 'currency_symbol', '$', 'string', '2024-11-19 22:45:36', '2024-11-21 04:58:29'),
(11, 'site_timezone', 'Asia/Dhaka', 'string', '2024-11-19 22:45:36', '2025-08-30 00:13:47'),
(12, 'referral_code_limit', '6', 'integer', '2024-11-19 22:45:36', '2024-11-21 04:58:29'),
(13, 'account_no_limit', '10', 'integer', '2024-11-19 22:45:36', '2024-11-21 04:58:29'),
(14, 'home_redirect', '/', 'string', '2024-11-19 22:45:36', '2025-04-10 06:42:59'),
(15, 'site_email', 'admin@qunzo.com', 'string', '2024-11-19 22:45:36', '2025-11-01 10:48:04'),
(16, 'support_email', 'support@qunzo.com', 'string', '2024-11-19 22:45:36', '2025-11-01 10:48:04'),
(17, 'referral_rules_visibility', '1', 'boolean', '2024-11-19 22:45:36', '2025-03-06 06:51:36'),
(18, 'deposit_level', '1', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(19, 'multiple_currency', '1', 'boolean', '2024-11-19 22:45:36', '2025-04-17 05:24:33'),
(20, 'transfer_status', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:24:02'),
(21, 'email_verification', '1', 'boolean', '2024-11-19 22:45:36', '2025-09-01 05:47:31'),
(22, 'kyc_verification', '1', 'boolean', '2024-11-19 22:45:36', '2025-04-12 11:43:53'),
(23, 'fa_verification', '1', 'boolean', '2024-11-19 22:45:36', '2025-04-06 10:10:46'),
(24, 'otp_verification', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:24:02'),
(25, 'account_creation', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:24:02'),
(26, 'user_deposit', '1', 'boolean', '2024-11-19 22:45:36', '2025-04-16 06:03:46'),
(27, 'user_portfolio', '1', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(28, 'user_withdraw', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:24:02'),
(29, 'user_pay_bill', '1', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(30, 'sign_up_referral', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:24:02'),
(31, 'referral_signup_bonus', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:24:02'),
(32, 'site_animation', '0', 'boolean', '2024-11-19 22:45:36', '2025-04-28 06:03:29'),
(33, 'back_to_top', '1', 'boolean', '2024-11-19 22:45:36', '2025-04-12 05:06:27'),
(34, 'language_switcher', '1', 'boolean', '2024-11-19 22:45:36', '2025-11-02 11:27:17'),
(35, 'default_mode', 'light', 'string', '2024-11-19 22:45:36', '2025-04-26 10:28:49'),
(36, 'debug_mode', '0', 'boolean', '2024-11-19 22:45:36', '2025-05-03 04:42:13'),
(37, 'session_lifetime', '120', 'string', '2024-11-19 22:45:36', '2025-04-24 05:02:00'),
(38, 'referral_bonus', '20', 'double', '2024-11-19 22:45:36', '2024-11-21 05:56:54'),
(39, 'signup_bonus', '20', 'double', '2024-11-19 22:45:36', '2024-11-21 05:56:54'),
(40, 'transfer_min_amount', '10', 'double', '2024-11-19 22:45:36', '2024-11-21 05:56:54'),
(41, 'transfer_max_amount', '20000', 'double', '2024-11-19 22:45:36', '2024-11-21 05:56:54'),
(42, 'fund_transfer_charge', '4', 'double', '2024-11-19 22:45:36', '2024-11-21 05:56:54'),
(43, 'fund_transfer_charge_type', 'percentage', 'double', '2024-11-19 22:45:36', '2024-11-21 05:56:54'),
(44, 'withdraw_day_limit', '20', 'double', '2024-11-19 22:45:36', '2024-11-21 05:56:54'),
(45, 'kyc_deposit', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:17:07'),
(46, 'kyc_fund_transfer', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:21:54'),
(47, 'kyc_dps', '0', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:17:07'),
(48, 'kyc_fdr', '0', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:17:07'),
(49, 'kyc_loan', '0', 'boolean', '2024-11-19 22:45:36', '2024-11-25 03:17:07'),
(50, 'kyc_pay_bill', '1', 'boolean', '2024-11-19 22:45:36', '2024-12-01 02:45:56'),
(51, 'kyc_withdraw', '1', 'boolean', '2024-11-19 22:45:36', '2025-04-24 05:02:32'),
(52, 'deposit_passcode_status', '0', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(53, 'fund_transfer_passcode_status', '0', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(54, 'dps_passcode_status', '0', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(55, 'fdr_passcode_status', '0', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(56, 'loan_passcode_status', '0', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(57, 'pay_bill_passcode_status', '0', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(58, 'withdraw_passcode_status', '0', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(59, 'inactive_account_disabled', '0', 'string', '2024-11-19 22:45:36', '2025-04-24 05:02:08'),
(60, 'inactive_days', '30', 'string', '2024-11-19 22:45:36', '2025-04-24 05:01:16'),
(61, 'inactive_account_fees', '1', 'switch', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(62, 'fee_amount', '5', 'double', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(63, 'email_from_name', 'Qunzo', 'string', '2024-11-19 22:45:36', '2025-11-06 10:57:41'),
(64, 'email_from_address', 'qunzo@tdevs.co', 'string', '2024-11-19 22:45:36', '2025-11-06 10:57:41'),
(65, 'mailing_driver', 'smtp', 'string', '2024-11-19 22:45:36', '2025-03-04 05:54:45'),
(66, 'mail_username', '6df8bc29b11979', 'string', '2024-11-19 22:45:36', '2025-09-01 08:27:26'),
(67, 'mail_password', 'c2e0a83868b48f', 'string', '2024-11-19 22:45:36', '2025-09-01 08:27:26'),
(68, 'mail_host', 'sandbox.smtp.mailtrap.io', 'string', '2024-11-19 22:45:36', '2025-03-04 05:54:45'),
(69, 'mail_port', '587', 'integer', '2024-11-19 22:45:36', '2025-04-05 04:50:51'),
(70, 'mail_secure', 'tls', 'string', '2024-11-19 22:45:36', '2025-03-04 05:54:45'),
(71, 'suggested_regular_license_price_from', '10', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(72, 'suggested_regular_license_price_to', '15', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(73, 'suggested_extended_license_price_from', '20', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(74, 'suggested_extended_license_price_to', '50', 'checkbox', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(75, 'maintenance_mode', '0', 'boolean', '2024-11-19 22:45:36', '2025-04-30 06:10:04'),
(76, 'secret_key', 'secret', 'string', '2024-11-19 22:45:36', '2025-04-15 11:20:34'),
(77, 'maintenance_title', 'Site is under maintenance', 'string', '2024-11-19 22:45:36', '2025-11-01 11:28:56'),
(78, 'maintenance_text', 'Sorry for interrupt! Site will live soon.', 'string', '2024-11-19 22:45:36', '2025-04-15 11:20:34'),
(79, 'gdpr_status', '1', 'boolean', '2024-11-19 22:45:36', '2024-11-21 02:33:49'),
(80, 'gdpr_text', 'Please allow us to collect data about how you use our website. We will use it to improve our website, make your browsing experience and our business decisions better.', 'string', '2024-11-19 22:45:36', '2025-03-27 03:50:12'),
(81, 'gdpr_button_label', 'Learn More', 'string', '2024-11-19 22:45:36', '2024-11-21 02:33:49'),
(82, 'gdpr_button_url', '/page/privacy-policy', 'string', '2024-11-19 22:45:36', '2025-04-24 05:16:21'),
(83, 'meta_description', 'Money Chain is a fully online banking system.', 'string', '2024-11-19 22:45:36', '2024-11-21 06:01:31'),
(84, 'meta_keywords', 'moneychain ,money exchange', 'string', '2024-11-19 22:45:36', '2024-11-21 06:01:31'),
(85, 'affiliate_commission_charge', '4', 'text', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(86, 'affiliate_commission_charge_type', 'percentage', 'text', '2024-11-19 22:45:36', '2024-11-19 22:45:36'),
(87, 'exchange_charge', '2', 'double', '2024-11-27 02:49:27', '2025-02-27 12:03:06'),
(88, 'exchange_charge_type', 'percentage', 'double', '2024-11-27 02:49:27', '2025-02-27 12:03:06'),
(89, 'cashout_charge', '5', 'double', '2025-02-20 03:37:57', '2025-02-27 09:14:04'),
(90, 'cashout_minimum', '100', 'double', '2025-02-20 03:37:58', '2025-02-27 09:12:02'),
(91, 'cashout_maximum', '10000', 'double', '2025-02-20 03:37:58', '2025-02-20 03:37:58'),
(92, 'cashout_daily_limit', '1000', 'double', '2025-02-20 03:37:58', '2025-02-27 10:02:29'),
(93, 'cashout_monthly_limit', '10000', 'double', '2025-02-20 03:37:58', '2025-02-27 09:44:40'),
(94, 'cashout_charge_type', 'percentage', 'double', '2025-02-20 03:40:15', '2025-02-27 09:14:54'),
(95, 'gift_charge', '10', 'double', '2025-02-22 04:20:22', '2025-02-22 04:20:51'),
(96, 'gift_charge_type', 'fixed', 'double', '2025-02-22 04:20:22', '2025-02-26 08:41:30'),
(97, 'gift_minimum', '100', 'double', '2025-02-22 04:20:22', '2025-02-22 04:20:22'),
(98, 'gift_maximum', '1000', 'double', '2025-02-22 04:20:22', '2025-02-22 04:20:39'),
(99, 'gift_daily_limit', '10', 'double', '2025-02-22 04:20:22', '2025-02-22 08:56:39'),
(100, 'invoice_charge', '2', 'double', '2025-02-22 08:29:54', '2025-02-22 08:45:24'),
(101, 'invoice_charge_type', 'fixed', 'double', '2025-02-22 08:29:54', '2025-02-22 08:45:19'),
(102, 'invoice_daily_limit', '10', 'double', '2025-02-22 08:29:54', '2025-02-22 08:30:13'),
(103, 'exchange_daily_limit', '20', 'double', '2025-02-22 08:45:12', '2025-02-22 08:45:12'),
(104, 'cashout_agent_commission', '2', 'double', '2025-02-22 09:16:37', '2025-02-22 09:16:46'),
(105, 'cashout_agent_commission_type', 'percentage', 'double', '2025-02-22 09:16:37', '2025-02-22 09:16:40'),
(106, 'api_payment_charge', '5', 'double', '2025-02-23 04:37:37', '2025-02-23 04:37:37'),
(107, 'api_payment_charge_type', 'fixed', 'double', '2025-02-23 04:37:37', '2025-02-23 04:37:37'),
(108, 'user_make_payment_charge', '5', 'double', '2025-02-24 09:11:25', '2025-02-24 09:11:25'),
(109, 'user_make_payment_charge_type', 'percentage', 'double', '2025-02-24 09:11:25', '2025-02-24 09:37:26'),
(110, 'merchant_make_payment_charge', '2', 'double', '2025-02-24 09:11:25', '2025-02-24 10:05:50'),
(111, 'merchant_make_payment_charge_type', 'fixed', 'double', '2025-02-24 09:11:25', '2025-02-24 10:05:50'),
(112, 'request_money_charge', '5', 'double', '2025-02-26 04:53:12', '2025-02-26 04:53:12'),
(113, 'request_money_charge_type', 'percentage', 'double', '2025-02-26 04:53:12', '2025-02-26 04:53:12'),
(114, 'request_money_daily_limit', '10', 'double', '2025-02-26 04:53:12', '2025-02-26 04:53:12'),
(115, 'transfer_charge', '5', 'double', '2025-02-27 04:49:05', '2025-02-27 04:49:05'),
(116, 'transfer_charge_type', 'percentage', 'double', '2025-02-27 04:49:06', '2025-02-27 04:49:06'),
(117, 'transfer_minimum', '10', 'double', '2025-02-27 04:49:06', '2025-02-27 04:49:06'),
(118, 'transfer_maximum', '1000', 'double', '2025-02-27 04:49:06', '2025-02-27 04:49:06'),
(119, 'transfer_daily_limit', '10000', 'double', '2025-02-27 04:49:06', '2025-02-27 04:49:09'),
(120, 'site_currency_decimals', '2', 'string', '2025-03-06 03:06:55', '2025-03-06 03:08:10'),
(121, 'deposit', '1', 'boolean', '2025-03-06 06:09:34', '2025-03-06 06:59:30'),
(122, 'transfer', '1', 'boolean', '2025-03-06 06:11:00', '2025-03-06 06:41:06'),
(123, 'cash_out', '1', 'boolean', '2025-03-06 06:11:02', '2025-03-06 06:11:02'),
(124, 'invoice_pay', '1', 'boolean', '2025-03-06 06:11:04', '2025-03-06 06:58:52'),
(125, 'exchange', '1', 'boolean', '2025-03-06 06:11:05', '2025-03-06 06:58:54'),
(126, 'create_gift', '1', 'boolean', '2025-03-06 06:11:06', '2025-03-06 06:58:56'),
(127, 'request_money_accept', '1', 'boolean', '2025-03-06 06:11:08', '2025-03-06 06:58:51'),
(128, 'payment', '1', 'boolean', '2025-03-06 06:11:11', '2025-03-06 06:58:50'),
(129, 'referral_rules', '[{\"icon\":\"tick\",\"rule\":\"Referrer gets a reward when the referred user makes a successful first deposit.\"},{\"icon\":\"cross\",\"rule\":\"No reward if the referred user fails KYC or cancels the deposit.\"}]', 'string', '2025-03-06 06:44:52', '2025-04-15 11:45:50'),
(130, 'preloader', '0', 'boolean', '2025-04-06 05:33:36', '2025-04-28 06:51:20'),
(131, 'kyc_cashout', '1', 'boolean', '2025-04-10 06:08:59', '2025-04-10 06:08:59'),
(132, 'kyc_exchange', '1', 'boolean', '2025-04-10 06:08:59', '2025-04-10 06:08:59'),
(133, 'kyc_payment', '1', 'boolean', '2025-04-10 06:08:59', '2025-04-10 06:08:59'),
(134, 'kyc_request_money', '1', 'boolean', '2025-04-10 06:08:59', '2025-04-10 06:08:59'),
(135, 'kyc_create_gift', '1', 'boolean', '2025-04-10 06:08:59', '2025-04-10 06:08:59'),
(136, 'kyc_invoice', '1', 'boolean', '2025-04-10 06:08:59', '2025-04-10 06:08:59'),
(137, 'kyc_gift', '1', 'boolean', '2025-04-10 06:09:33', '2025-04-10 06:09:33'),
(138, 'user_transfer', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-10 06:14:17'),
(139, 'user_cashout', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-10 06:14:17'),
(140, 'user_gift', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-10 06:14:17'),
(141, 'user_payment', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-10 06:14:17'),
(142, 'user_invoice', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-17 05:06:15'),
(143, 'user_request_money', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-10 06:16:42'),
(144, 'user_exchange', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-10 06:19:18'),
(145, 'user_ticket', '1', 'boolean', '2025-04-10 06:14:17', '2025-04-10 06:14:17'),
(146, 'kyc_wallet', '1', 'boolean', '2025-04-10 06:30:30', '2025-04-10 09:55:02'),
(147, 'merchant_system', '1', 'boolean', '2025-04-12 05:48:35', '2025-04-17 03:48:00'),
(148, 'agent_system', '1', 'boolean', '2025-04-12 06:20:27', '2025-04-12 10:55:13'),
(149, 'preloader_logo', 'global/uploads/global/uploads/settings//nBpFAKYuAn9dDT2Meoh9.svg', 'string', '2025-04-15 10:40:25', '2025-11-01 10:48:04'),
(150, 'merchant_verification', '1', 'boolean', '2025-04-16 05:57:19', '2025-09-17 05:18:59'),
(151, 'agent_verification', '1', 'boolean', '2025-04-16 05:57:19', '2025-09-16 05:45:04'),
(152, 'cashin_charge', '1', 'double', '2025-04-17 06:12:12', '2025-04-17 06:12:12'),
(153, 'cashin_charge_type', 'percentage', 'double', '2025-04-17 06:12:12', '2025-04-17 06:12:12'),
(154, 'cashin_agent_commission', '2', 'double', '2025-04-17 06:12:12', '2025-04-17 06:12:12'),
(155, 'cashin_agent_commission_type', 'percentage', 'double', '2025-04-17 06:12:12', '2025-04-17 06:12:12'),
(156, 'cashin_minimum', '10', 'double', '2025-04-17 06:12:12', '2025-04-17 06:12:12'),
(157, 'cashin_maximum', '10000', 'double', '2025-04-17 06:12:12', '2025-04-17 06:12:12'),
(158, 'cashin_daily_limit', '1000', 'double', '2025-04-17 06:12:12', '2025-04-17 06:52:54'),
(159, 'cashin_monthly_limit', '1000', 'double', '2025-04-17 06:12:12', '2025-04-17 06:12:12'),
(160, 'payment_minimum', '1', 'double', '2025-04-27 04:05:03', '2025-04-27 04:05:07'),
(161, 'payment_maximum', '1000', 'double', '2025-04-27 04:05:03', '2025-04-27 04:05:11'),
(162, 'exchange_minimum', '10', 'double', '2025-04-27 05:50:34', '2025-04-27 05:50:34'),
(163, 'exchange_maximum', '100000', 'double', '2025-04-27 05:50:34', '2025-04-27 05:50:34'),
(164, 'request_money_minimum', '10', 'double', '2025-04-27 06:16:47', '2025-04-27 06:16:47'),
(165, 'request_money_maximum', '10000', 'double', '2025-04-27 06:16:47', '2025-04-27 06:16:47'),
(166, 'admin_sidebar_logo', 'global/uploads/global/uploads/settings//C78NswUojjscovn6b9qJ.svg', 'string', '2025-11-01 11:28:41', '2025-11-01 11:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `set_tunes`
--

CREATE TABLE `set_tunes` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tune` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `set_tunes`
--

INSERT INTO `set_tunes` (`id`, `icon`, `name`, `tune`, `status`, `created_at`, `updated_at`) VALUES
(1, 'global/tune-icon/bewitched.png', 'Bewitched', 'global/tune/bewitched.mp3', 1, NULL, '2023-05-26 11:37:38'),
(2, 'global/tune-icon/crunchy.png', 'Crunchy', 'global/tune/crunchy.mp3', 0, NULL, '2023-05-26 11:37:38'),
(3, 'global/tune-icon/expert_notification.png', 'Expert Notification', 'global/tune/expert_notification.mp3', 0, NULL, '2023-05-26 11:37:38'),
(4, 'global/tune-icon/knock_knock.png', 'knock knock', 'global/tune/knock_knock.mp3', 0, NULL, '2023-05-26 11:37:38'),
(5, 'global/tune-icon/silencer.png', 'Silencer', 'global/tune/silencer.mp3', 0, NULL, '2023-05-26 11:37:38'),
(6, 'global/tune-icon/sticky.png', 'Sticky', 'global/tune/sticky.mp3', 0, NULL, '2023-05-26 11:37:38'),
(7, 'global/tune-icon/vopvoopvooop.png', 'Vopvoopvooop', 'global/tune/vopvoopvooop.mp3', 0, NULL, '2023-05-26 11:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `icon`, `url`, `position`, `created_at`, `updated_at`) VALUES
(2, 'global/uploads/socials/r4skxXdewAUhW6hJzzNI.svg', 'https://facebook.com', 2, '2025-03-24 05:47:16', '2025-03-24 05:47:16'),
(3, 'global/uploads/socials/GEt05hrQEZ6WzUIgjxvh.svg', 'https://x.com', 3, '2025-03-24 05:47:37', '2025-03-24 05:47:37'),
(4, 'global/uploads/socials/ibMKH4FAACALghe3aPuW.svg', 'https://youtube.com', 4, '2025-03-24 05:47:54', '2025-03-24 05:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_status` tinyint(1) NOT NULL DEFAULT '1',
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salutation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `button_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_status` tinyint(1) NOT NULL DEFAULT '1',
  `footer_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `code`, `for`, `icon`, `notification_status`, `email_status`, `sms_status`, `sms_body`, `email_body`, `notification_body`, `short_codes`, `banner`, `title`, `subject`, `salutation`, `button_level`, `button_link`, `footer_status`, `footer_body`, `created_at`, `updated_at`) VALUES
(1, 'User Mail Send', 'user_mail', 'User', 'mail', 1, 1, 1, 'Thanks for joining us [[site_title]]. Find out more at [[site_url]].', '[[message]]<br /> Thanks for joining us [[site_title]]<br /><br /><br />Find out more about in - [[site_url]]', 'Thanks for joining us [[site_title]]. Find out more at [[site_url]].', '[\"[[full_name]]\",\"[[site_url]]\",\"[[site_title]]\",\"[[subject]]\",\"[[message]]\"]', 'global/images/Uxp3vfYFFi4GuO95lyZn.jpg', 'Admin Mail', '[[subject]] for [[full_name]]', 'Hi [[full_name]],', 'Login Your Account', NULL, 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(2, 'Subscriber Mail Send', 'subscriber_mail', 'Subscriber', 'mail', 1, 1, 1, 'Welcome to [[site_title]]! Manage your account, trade crypto, and earn profits. Visit [[site_url]].', 'Thanks for joining our platform! ---  [[site_title]]<br /><br />[[message]]<br /><br />As a member of our platform, you can manage your account, buy or sell cryptocurrency, invest and earn profits.<br /><br />Find out more about in - [[site_url]]', 'Welcome to [[site_title]]! Manage your account, trade crypto, and earn profits. Visit [[site_url]].', '[\"[[full_name]]\",\"[[site_url]]\",\"[[site_title]]\",\"[[subject]]\",\"[[message]]\"]', NULL, 'Welcome to [[site_title]]', '[[subject]] for [[full_name]]', 'Hi [[full_name]],', 'Login Your Account', NULL, 1, 'Thanks for joining our platform! ---  [[site_title]]<br /><br />[[message]]<br /><br />As a member of our platform, you can manage your account, buy or sell cryptocurrency, invest and earn profits.<br /><br />Find out more about in - [[site_url]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(3, 'Manual Deposit Request', 'admin_manual_deposit', 'Admin', 'dollar-sign', 1, 1, 1, 'New manual deposit request of [[amount]] [[currency]]. Please review and approve.', 'A new manual deposit request has been submitted.<br /><br />\n                Amount: [[amount]] [[currency]]<br />\n                Charge: [[charge]] [[currency]]<br />\n                Wallet: [[wallet]]<br />\n                Gateway: [[gateway]]<br />\n                Requested At: [[request_at]]<br />\n                Total Amount: [[total_amount]] [[currency]]<br /><br />\n                Please review and approve it.', 'New manual deposit request of [[amount]] [[currency]]. Please review and approve.', '[\"[[amount]]\",\"[[charge]]\",\"[[wallet]]\",\"[[gateway]]\",\"[[request_at]]\",\"[[total_amount]]\",\"[[request_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/deposit_request.jpg', 'New Manual Deposit Request', 'New Deposit Request of [[amount]] [[currency]]', 'Hello Admin,', 'View Request', '[[request_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(4, 'Manual Deposit Request Approved', 'user_manual_deposit_approved', 'User', 'check-circle', 1, 1, 1, 'Your deposit request of [[amount]] [[currency]] has been approved. Funds have been credited to your account.', 'We are pleased to inform you that your deposit request has been approved.<br /><br />\n        Amount: [[amount]] [[currency]]<br />\n        Charge: [[charge]] [[currency]]<br />\n        Wallet: [[wallet]]<br />\n        Gateway: [[gateway]]<br />\n        Requested At: [[request_at]]<br />\n        Total Amount: [[total_amount]] [[currency]]<br /><br />\n        The funds have been credited to your account. Thank you for using our services!', 'Your deposit request of [[amount]] [[currency]] has been approved. Funds have been credited to your account.', '[\"[[full_name]]\",\"[[amount]]\",\"[[charge]]\",\"[[wallet]]\",\"[[gateway]]\",\"[[request_at]]\",\"[[total_amount]]\",\"[[transaction_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/deposit_approved.jpg', 'Deposit Request Approved', 'Your Deposit Request of [[amount]] [[currency]] has been Approved', 'Hi [[full_name]],', 'View Transaction', '[[transaction_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(5, 'Manual Deposit Request Rejected', 'user_manual_deposit_rejected', 'User', 'x-circle', 1, 1, 1, 'Your deposit request of [[amount]] [[currency]] has been rejected. Reason: [[rejection_reason]].', 'We regret to inform you that your deposit request has been rejected.<br /><br />\n        Amount: [[amount]] [[currency]]<br />\n        Charge: [[charge]] [[currency]]<br />\n        Wallet: [[wallet]]<br />\n        Gateway: [[gateway]]<br />\n        Requested At: [[request_at]]<br />\n        Total Amount: [[total_amount]] [[currency]]<br /><br />\n        Reason for Rejection: [[rejection_reason]]<br /><br />', 'Your deposit request of [[amount]] [[currency]] has been rejected. Reason: [[rejection_reason]].', '[\"[[full_name]]\",\"[[amount]]\",\"[[charge]]\",\"[[wallet]]\",\"[[gateway]]\",\"[[request_at]]\",\"[[total_amount]]\",\"[[rejection_reason]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/deposit_rejected.jpg', 'Deposit Request Rejected', 'Your Deposit Request of [[amount]] [[currency]] has been Rejected', 'Hi [[full_name]],', 'Contact Support', '[[support_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(6, 'Withdraw Request', 'admin_withdraw_request', 'Admin', 'arrow-up', 1, 1, 1, 'New withdrawal request of [[amount]] [[currency]]. Please review and approve.', 'A new withdrawal request has been submitted.<br /><br />\n                Amount: [[amount]] [[currency]]<br />\n                Charge: [[charge]] [[currency]]<br />\n                Wallet: [[wallet]]<br />\n                Gateway: [[gateway]]<br />\n                Requested At: [[request_at]]<br />\n                Total Amount: [[total_amount]] [[currency]]<br /><br />\n                Please review and approve it.', 'New withdrawal request of [[amount]] [[currency]]. Please review and approve.', '[\"[[amount]]\",\"[[charge]]\",\"[[wallet]]\",\"[[gateway]]\",\"[[request_at]]\",\"[[total_amount]]\",\"[[request_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/withdraw_request.jpg', 'New Withdraw Request', 'Withdraw Request of [[amount]] [[currency]]', 'Hello Admin,', 'View Request', '[[request_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(7, 'Ticket Reply', 'admin_ticket_reply', 'Admin', 'message-circle', 1, 1, 1, 'New reply received for ticket: [[title]]. Message: [[message]].', 'A new reply has been received for the support ticket.<br /><br />\n                Ticket Title: [[title]]<br />\n                Message: [[message]]<br /><br />\n                Click the button below to view and respond.', 'New reply received for ticket: [[title]]. Message: [[message]].', '[\"[[title]]\",\"[[message]]\",\"[[reply_link]]\",\"[[site_title]]\"]', 'global/images/ticket_reply.jpg', 'New Ticket Reply', 'New Reply for Ticket: [[title]]', 'Hello Admin,', 'View Ticket', '[[reply_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(8, 'Invoice Payment Received', 'user_invoice_payment', 'User', 'file-text', 1, 1, 1, 'Payment received for Invoice #[[invoice_number]]. Amount: [[amount]] [[currency]]. Thank you!', 'We have received your payment for Invoice #[[invoice_number]].<br /><br />Amount: [[amount]] [[currency]]<br />Charge: [[charge]] [[currency]]<br />Total: [[total_amount]] [[currency]]<br /><br />Thank you for your payment!', 'Payment received for Invoice #[[invoice_number]]. Amount: [[amount]] [[currency]]. Thank you!', '[\"[[full_name]]\",\"[[invoice_number]]\",\"[[amount]]\",\"[[charge]]\",\"[[total_amount]]\",\"[[invoice_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/invoice_payment.jpg', 'Invoice Payment Received', 'Payment received for Invoice #[[invoice_number]]', 'Hi [[full_name]],', 'View Invoice', '[[invoice_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(9, 'Request Money', 'user_request_money', 'User', 'dollar-sign', 1, 1, 1, 'You received a money request from [[sender_name]]. Amount: [[amount]] [[currency]].', 'You have received a money request from [[sender_name]].<br /><br />Amount: [[amount]] [[currency]]<br />Charge: [[charge]] [[currency]]<br />Total: [[total_amount]] [[currency]]<br />Sender Note: [[sender_note]]<br />Sender Wallet: [[sender_wallet]]<br />Sender Account No: [[sender_account_no]]', 'You received a money request from [[sender_name]]. Amount: [[amount]] [[currency]].', '[\"[[full_name]]\",\"[[amount]]\",\"[[charge]]\",\"[[total_amount]]\",\"[[sender_name]]\",\"[[sender_note]]\",\"[[sender_wallet]]\",\"[[sender_account_no]]\",\"[[request_money_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/request_money.jpg', 'Money Request Received', 'You received a money request from [[sender_name]]', 'Hi [[full_name]],', 'View Request', '[[request_money_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(10, 'Gift Redeemed', 'user_gift_redeemed', 'User', 'gift', 1, 1, 1, 'Gift redeemed by [[redeemer_name]]. Amount: [[amount]] [[currency]]. Gift Code: [[gift_code]].', 'A gift has been redeemed successfully.<br /><br />Redeemer Name: [[redeemer_name]]<br />Redeemer Account No: [[redeemer_account_no]]<br />Amount: [[amount]] [[currency]]<br />Gift Code: [[gift_code]]<br />Redeemed At: [[redeemed_at]]', 'Gift redeemed by [[redeemer_name]]. Amount: [[amount]] [[currency]]. Gift Code: [[gift_code]].', '[\"[[full_name]]\",\"[[redeemer_name]]\",\"[[redeemer_account_no]]\",\"[[amount]]\",\"[[gift_code]]\",\"[[redeemed_at]]\",\"[[gift_redeem_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/gift_redeemed.jpg', 'Gift Successfully Redeemed', 'Gift Redeemed by [[redeemer_name]]', 'Hi [[full_name]],', 'View Details', '[[gift_redeem_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(11, 'Money Received', 'user_receive_money', 'User', 'arrow-down', 1, 1, 1, 'You have received [[amount]] [[currency]] from [[sender_name]]. Check your account.', 'You have received a money transfer.<br /><br />\n        Amount: [[amount]] [[currency]]<br />\n        Sender Name: [[sender_name]]<br />\n        Sender Account No: [[sender_account_no]]<br /><br />\n        The funds have been successfully credited to your account.', 'You have received [[amount]] [[currency]] from [[sender_name]].', '[\"[[full_name]]\",\"[[amount]]\",\"[[currency]]\",\"[[sender_name]]\",\"[[sender_account_no]]\",\"[[transaction_link]]\",\"[[site_title]]\"]', 'global/images/receive_money.jpg', 'Money Received Successfully', 'You have received money from [[sender_name]]', 'Hi [[full_name]],', 'View Transaction', '[[transaction_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(12, 'Referral Joining', 'user_referral_join', 'User', 'users', 1, 1, 1, 'A new referral, [[referred_name]], has joined. Joined at: [[joined_at]].', 'You have received a referral bonus.<br /><br />Referred Name: [[referred_name]]<br />Referred Account No: [[referred_account_no]]<br />Joined At: [[joined_at]]', 'Your referral [[referred_name]] has successfully joined. Joined at: [[joined_at]].', '[\"[[full_name]]\",\"[[referred_name]]\",\"[[referred_account_no]]\",\"[[joined_at]]\",\"[[referral_link]]\",\"[[site_title]]\"]', 'global/images/referral_join.jpg', 'Referral Joining', 'Your referral [[referred_name]] has successfully joined', 'Hi [[full_name]],', 'View Referral', '[[referral_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(13, 'Ticket Reply', 'user_ticket_reply', 'User', 'message-circle', 1, 1, 1, 'New reply received for ticket: [[title]]. Message: [[message]].', 'A new reply has been received on your support ticket \"<b>[[title]]</b>\".<br /><br />Message: [[message]].<br /><br />Click the button below to view the reply.', 'New reply received for ticket: [[title]]. Message: [[message]].', '[\"[[full_name]]\",\"[[title]]\",\"[[message]]\",\"[[reply_link]]\",\"[[site_title]]\"]', 'global/images/ticket_reply.jpg', 'New Ticket Reply', 'Reply received for Ticket: [[title]]', 'Hi [[full_name]],', 'View Ticket', '[[reply_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(14, 'Payment', 'merchant_payment', 'Merchant', 'credit-card', 1, 1, 1, 'New payment of [[amount]] received via [[gateway]].', 'A new payment of <b>[[amount]]</b> has been received.<br /><br />\n                        Wallet: [[wallet]]<br />\n                        Gateway: [[gateway]]<br />\n                        Charge: [[charge]]<br />\n                        Total Amount: [[total_amount]]<br /><br />\n                        Payment Date: [[payment_at]]<br /><br />\n                        Payment ID: [[payment_id]]<br /><br />\n                        Customer: [[user_name]] ([[user_account_no]])<br /><br />\n                        Please verify and process accordingly.', 'New payment of [[amount]] received via [[gateway]].', '[\"[[merchant_name]]\",\"[[amount]]\",\"[[charge]]\",\"[[total_amount]]\",\"[[wallet]]\",\"[[gateway]]\",\"[[payment_at]]\",\"[[payment_id]]\",\"[[user_name]]\",\"[[user_account_no]]\",\"[[site_title]]\"]', 'global/images/payment.jpg', 'New Payment Received', 'Payment Received: [[payment_id]]', 'Hi [[merchant_name]],', NULL, NULL, 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(15, 'Ticket Reply', 'merchant_ticket_reply', 'Merchant', 'message-circle', 1, 1, 1, 'New reply received for ticket: [[title]]. Message: [[message]].', 'A new reply has been received on a support ticket \"<b>[[title]]</b>\".<br /><br />Message: [[message]].<br /><br />Click the button below to view the reply.', 'New reply received for ticket: [[title]]. Message: [[message]].', '[\"[[merchant_name]]\",\"[[title]]\",\"[[message]]\",\"[[reply_link]]\",\"[[site_title]]\"]', 'global/images/ticket_reply.jpg', 'New Ticket Reply', 'Reply received for Ticket: [[title]]', 'Hi [[merchant_name]],', 'View Ticket', '[[reply_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(16, 'Withdraw Request Approved', 'withdraw_approved', 'User', 'check-circle', 1, 1, 1, 'Your withdrawal request of [[amount]] [[currency]] has been approved. Funds have been transferred.', 'We are pleased to inform you that your withdrawal request has been approved.<br /><br />\n        Amount: [[amount]] [[currency]]<br />\n        Charge: [[charge]] [[currency]]<br />\n        Wallet: [[wallet]]<br />\n        Gateway: [[gateway]]<br />\n        Requested At: [[request_at]]<br />\n        Total Amount: [[total_amount]] [[currency]]<br /><br />\n        The funds have been successfully transferred. Thank you for using our services!', 'Your withdrawal request of [[amount]] [[currency]] has been approved. Funds have been transferred.', '[\"[[full_name]]\",\"[[amount]]\",\"[[charge]]\",\"[[wallet]]\",\"[[gateway]]\",\"[[request_at]]\",\"[[total_amount]]\",\"[[transaction_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/withdraw_approved.jpg', 'Withdraw Request Approved', 'Your Withdraw Request of [[amount]] [[currency]] has been Approved', 'Hi [[full_name]],', 'View Transaction', '[[transaction_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(17, 'Withdraw Request Rejected', 'withdraw_rejected', 'User', 'x-circle', 1, 1, 1, 'Your withdrawal request of [[amount]] [[currency]] has been rejected. Reason: [[rejection_reason]].', 'We regret to inform you that your withdrawal request has been rejected.<br /><br />\n        Amount: [[amount]] [[currency]]<br />\n        Charge: [[charge]] [[currency]]<br />\n        Wallet: [[wallet]]<br />\n        Gateway: [[gateway]]<br />\n        Requested At: [[request_at]]<br />\n        Total Amount: [[total_amount]] [[currency]]<br /><br />\n        Reason for Rejection: [[rejection_reason]]<br /><br />', 'Your withdrawal request of [[amount]] [[currency]] has been rejected. Reason: [[rejection_reason]].', '[\"[[full_name]]\",\"[[amount]]\",\"[[charge]]\",\"[[wallet]]\",\"[[gateway]]\",\"[[request_at]]\",\"[[total_amount]]\",\"[[rejection_reason]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/withdraw_rejected.jpg', 'Withdraw Request Rejected', 'Your Withdraw Request of [[amount]] [[currency]] has been Rejected', 'Hi [[full_name]],', 'Contact Support', '[[support_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(18, 'Cash In Successful', 'user_cash_in', 'User', 'arrow-down-circle', 1, 1, 1, 'Cash-in successful! Amount: [[amount]] [[currency]], Wallet: [[wallet]], Total received: [[total_amount]] [[currency]].', 'Your cash-in request has been successfully processed.<br /><br />\n    Amount: [[amount]] [[currency]]<br />\n    Charge: [[charge]] [[currency]]<br />\n    Total Amount: [[total_amount]] [[currency]]<br />\n    Wallet: [[wallet]]<br />\n    Agent Name: [[agent_name]]<br />\n    Agent Account No: [[agent_account_no]]<br /><br />\n    Click the button below to view your transaction details.', 'You have successfully cashed in [[amount]] [[currency]] to [[wallet]]. Total received: [[total_amount]] [[currency]].', '[\"[[full_name]]\",\"[[amount]]\",\"[[charge]]\",\"[[total_amount]]\",\"[[wallet]]\",\"[[agent_name]]\",\"[[agent_account_no]]\",\"[[transaction_link]]\",\"[[site_title]]\",\"[[currency]]\"]', 'global/images/cash_in.jpg', 'Cash In Successful', 'You have successfully cashed in [[amount]] [[currency]]', 'Hi [[full_name]],', 'View Transaction', '[[transaction_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(19, 'Agent Commission Earned', 'agent_commission', 'Agent', 'dollar-sign', 1, 1, 1, 'You have received a commission of [[amount]]. Wallet: [[wallet]], Transaction ID: [[txn_id]].', 'You have earned a new commission.<br /><br />\n    <b>Amount:</b> [[amount]]<br />\n    <b>Wallet:</b> [[wallet]]<br />\n    <b>Transaction ID:</b> [[txn_id]]<br />\n    <b>Commission Date:</b> [[commission_at]]<br /><br />\n    Click the button below to view details.', 'You earned a commission of [[amount]]. Wallet: [[wallet]], Transaction ID: [[txn_id]].', '[\"[[full_name]]\",\"[[amount]]\",\"[[wallet]]\",\"[[commission_at]]\",\"[[txn_id]]\",\"[[transaction_link]]\",\"[[site_title]]\"]', 'global/images/agent_commission.jpg', 'Commission Earned', 'You have received a commission of [[amount]]', 'Hi [[full_name]],', 'View Commission', '[[transaction_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(20, 'Ticket Reply', 'agent_ticket_reply', 'Agent', 'message-circle', 1, 1, 1, 'New reply received for ticket: [[title]]. Message: [[message]].', 'A new reply has been received on a support ticket \"<b>[[title]]</b>\".<br /><br />\n    Message: [[message]].<br /><br />\n    Click the button below to view the reply.', 'New reply received for ticket: [[title]]. Message: [[message]].', '[\"[[agent_name]]\",\"[[title]]\",\"[[message]]\",\"[[reply_link]]\",\"[[site_title]]\"]', 'global/images/ticket_reply.jpg', 'New Ticket Reply', 'Reply received for Ticket: [[title]]', 'Hi [[agent_name]],', 'View Ticket', '[[reply_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(21, 'KYC Request', 'admin_kyc_request', 'Admin', 'check-circle', 1, 1, 1, 'New KYC request received from [[full_name]]. Review now.', 'A new KYC verification request has been submitted.<br /><br />\n    <b>Full Name:</b> [[full_name]]<br />\n    <b>Email:</b> [[email]]<br />\n    <b>KYC Type:</b> [[kyc_type]]<br /><br />\n    Click the button below to review the request.', 'New KYC request received from [[full_name]]. Click to review.', '[\"[[full_name]]\",\"[[email]]\",\"[[kyc_type]]\",\"[[kyc_review_link]]\",\"[[site_title]]\"]', 'global/images/kyc_request.jpg', 'New KYC Request from [[full_name]]', 'KYC request received from [[full_name]]', 'Hello Admin,', 'Review KYC', '[[kyc_review_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(22, 'KYC Action', 'kyc_action', 'User', 'check-circle', 1, 1, 1, 'Your KYC request is [[status]].', 'Your KYC verification request has been [[status]].<br /><br />\n    If you have any questions or need further assistance, please contact support.<br /><br />\n    Click the button below to view your KYC status.', 'Your KYC request has been [[status]]. Click to view.', '[\"[[full_name]]\",\"[[status]]\",\"[[kyc_status_link]]\",\"[[site_title]]\"]', 'global/images/kyc_action.jpg', 'Your KYC request is [[status]]', 'Your KYC request status update', 'Hi [[full_name]],', 'View KYC Status', '[[kyc_status_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(23, 'Forgot Password', 'forgot_password', 'User', 'key-round', 1, 1, 1, 'Reset your password here: [[token]] - [[site_title]]', 'We received a request to reset your password.<br /><br />\n    To reset your password, please click the button below or use the link provided.<br /><br />\n    If you didn’t request this, you can safely ignore this email.<br /><br />\n    Link: <a href=\"[[token]]\">[[token]]</a><br /><br />\n    Visit our site for more info: <a href=\"[[site_url]]\">[[site_url]]</a>', 'A password reset was requested. Click the link to proceed: [[token]]', '[\"[[token]]\",\"[[site_title]]\",\"[[site_url]]\"]', 'global/images/forgot_password.jpg', 'Reset Your Password', 'Reset Your Password - [[site_title]]', 'Hello,', 'Reset Password', '[[token]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(24, 'Email Verification', 'email_verification', 'User', 'check-circle', 1, 1, 1, 'Please verify your email address here: [[token]] - [[site_title]]', 'Hello!<br /><br />\n        Please click the button below to verify your email address.<br /><br />\n        If you didn’t request this, you can safely ignore this email.<br /><br />\n        <a href=\"[[token]]\">Verify Email Address</a><br /><br />\n        Visit our site for more info: <a href=\"[[site_url]]\">[[site_url]]</a>', 'Please verify your email address. Click the link to proceed: [[token]]', '[\"[[token]]\",\"[[full_name]]\",\"[[site_title]]\",\"[[site_url]]\"]', NULL, 'Verify Email Address', 'Verify Email Address - [[site_title]]', 'Hi [[full_name]],', 'Verify Email Address', '[[token]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(25, 'Contact Mail Send', 'contact_mail', 'Admin', 'mail', 0, 1, 0, NULL, 'Thanks for joining our platform! --- [[site_title]]<br /><br />\n[[message]]<br />\n[[full_name]]<br />\n[[email]]<br /><br />\nAs a member of our platform, you can mange your account, buy or sell cryptocurrency, invest and earn profits.<br /><br />\nFind out more about in - [[site_url]]', NULL, '[\"[[site_url]]\",\"[[site_title]]\",\"[[full_name]]\",\"[[email]]\",\"[[subject]]\",\"[[message]]\"]', NULL, 'Welcome to [[site_title]]', '[[subject]] for [[full_name]]', 'Hi [[full_name]],', 'Login Your Account', NULL, 1, 'Thanks for joining our platform! --- [[site_title]]<br /><br />\n[[message]]<br /><br /><br />\nAs a member of our platform, you can mange your account, buy or sell cryptocurrency, invest and earn profits.<br /><br />\nFind out more about in - [[site_url]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(26, 'App Forgot Password OTP', 'forgot_password_otp', 'User', 'key-round', 1, 1, 1, 'Reset your password here: [[token]] - [[site_title]]', 'We received a request to reset your password.<br /><br />\n        To reset your password, please click the button below or use the link provided.<br /><br />\n        If you didn’t request this, you can safely ignore this email.<br /><br />\n        Link: <a href=\"[[token]]\">[[token]]</a><br /><br />\n        Visit our site for more info: <a href=\"[[site_url]]\">[[site_url]]</a>', 'A password reset was requested. Click the link to proceed: [[token]]', '[\"[[token]]\",\"[[site_title]]\",\"[[site_url]]\"]', 'global/images/forgot_password.jpg', 'Reset Your Password', 'Reset Your Password - [[site_title]]', 'Hello,', 'Reset Password', NULL, 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(27, 'Email Verification', 'app_email_verification', 'User', 'check-circle', 1, 1, 1, 'Please verify your email address here: OTP: [[token]] - [[site_title]]', 'Hello!<br /><br />\n        Please use the otp below to verify your email address.<br /><br />\n        If you didn’t request this, you can safely ignore this email.<br /><br />\n        Use the given otp to verify your email address. <br>Your otp is <b>[[token]]</b><br /><br />\n        Visit our site for more info: <a href=\"[[site_url]]\">[[site_url]]</a>', 'Please verify your email address. Click the link to proceed: [[token]]', '[\"[[token]]\",\"[[full_name]]\",\"[[site_title]]\",\"[[site_url]]\"]', NULL, 'Verify Email Address', 'Verify Email Address - [[site_title]]', 'Hi [[full_name]],', NULL, NULL, 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(28, 'Ticket Closed', 'user_ticket_closed', 'User', 'check-circle', 1, 1, 1, 'Your ticket: [[title]] has been closed.', 'Your support ticket \"<b>[[title]]</b>\" has been closed.<br /><br />\n        Click the button below to view the ticket details.', 'Your ticket: [[title]] has been closed.', '[\"[[full_name]]\",\"[[title]]\",\"[[ticket_link]]\",\"[[site_title]]\"]', 'global/images/ticket_closed.jpg', 'Ticket Closed', 'Your Ticket: [[title]] Has Been Closed', 'Hi [[user_name]],', 'View Ticket', '[[ticket_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(29, 'New Ticket Created', 'admin_new_ticket', 'Admin', 'ticket', 1, 1, 1, 'New ticket created: [[title]]. Message: [[message]].', 'A new support ticket has been created.<br /><br />\n        Ticket Title: [[title]]<br />\n        Message: [[message]]<br /><br />\n        Click the button below to view and respond.', 'New ticket created: [[title]]. Message: [[message]].', '[\"[[title]]\",\"[[message]]\",\"[[ticket_link]]\",\"[[site_title]]\"]', 'global/images/new_ticket.jpg', 'New Ticket Created', 'New Ticket: [[title]]', 'Hello Admin,', 'View Ticket', '[[ticket_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(30, 'Request Money Accepted', 'user_request_money_accepted', 'User', 'check-circle', 1, 1, 1, 'Your request for [[amount]] [[currency]] has been accepted. [[site_title]]', 'Good news! Your money request of <b>[[amount]] [[currency]]</b> has been accepted.<br /><br />\n    The amount has been successfully added to your wallet.<br /><br />\n    Transaction ID: <b>[[trx_id]]</b><br />\n    Date: <b>[[date]]</b><br /><br />\n    You can view full transaction details in your dashboard.<br /><br />\n    Visit our site: <a href=\"[[site_url]]\">[[site_url]]</a>', 'Your money request of [[amount]] [[currency]] has been accepted successfully.', '[\"[[full_name]]\",\"[[amount]]\",\"[[currency]]\",\"[[trx_id]]\",\"[[date]]\",\"[[site_title]]\",\"[[site_url]]\",\"[[sender_name]]\",\"[[sender_note]]\",\"[[sender_wallet]]\",\"[[sender_account_no]]\",\"[[request_money_link]]\"]', 'global/images/request_money_accepted.jpg', 'Request Money Accepted', 'Your Money Request Has Been Accepted - [[site_title]]', 'Hi [[full_name]],', 'View Transaction', '[[transaction_link]]', 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10'),
(31, 'Agent Cashout Received', 'agent_cashout_received', 'Agent', 'dollar-sign', 1, 1, 1, 'Cash received from [[user_name]] for [[amount]] [[currency]]. Total: [[total_amount]] [[currency]].', 'You have received a cash from a user.<br /><br />\n    <b>User Name:</b> [[user_name]]<br />\n    <b>User Account No:</b> [[user_account_no]]<br />\n    <b>Amount:</b> [[amount]] [[currency]]<br />\n    <b>Charge:</b> [[charge]] [[currency]]<br />\n    <b>Total Amount:</b> [[total_amount]] [[currency]]<br />\n    <b>Wallet:</b> [[wallet]]<br />\n    <b>Transaction ID:</b> [[txn_id]]<br />\n    <b>Date:</b> [[date]]<br /><br />\n    Please provide the cash to the user.', 'Cash received from [[user_name]] for [[amount]] [[currency]].', '[\"[[full_name]]\",\"[[user_name]]\",\"[[user_account_no]]\",\"[[amount]]\",\"[[currency]]\",\"[[charge]]\",\"[[total_amount]]\",\"[[wallet]]\",\"[[txn_id]]\",\"[[date]]\",\"[[site_title]]\"]', 'global/images/agent_cashout.jpg', 'Cashout Request Received', 'Cash Received from [[user_name]] - [[site_title]]', 'Hi [[full_name]],', NULL, NULL, 1, 'Regards,<br />[[site_title]]', '2025-11-09 06:02:10', '2025-11-09 06:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('landing','site') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'landing',
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', 'site', 1, '2024-11-19 22:45:36', '2025-05-03 09:59:14');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachments` json DEFAULT NULL,
  `priority` enum('low','medium','high') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'low',
  `status` enum('open','closed','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `is_resolved` tinyint(1) DEFAULT '0',
  `is_locked` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `from_user_id` bigint UNSIGNED DEFAULT NULL,
  `from_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'User',
  `target_id` bigint UNSIGNED DEFAULT NULL,
  `invoice_id` bigint UNSIGNED DEFAULT NULL,
  `target_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_level` tinyint(1) DEFAULT '0',
  `tnx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL,
  `final_amount` decimal(28,8) NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_amount` decimal(28,8) DEFAULT NULL,
  `callback_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `manual_field_data` json DEFAULT NULL,
  `approval_cause` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role` enum('User','Agent','Merchant') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `kyc` tinyint DEFAULT '4',
  `phone_verified` tinyint DEFAULT '0',
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(28,8) DEFAULT '0.00000000',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `close_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ref_id` int DEFAULT NULL,
  `referral_code` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `google2fa_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_fa` tinyint DEFAULT '0',
  `withdraw_status` tinyint DEFAULT '1',
  `otp_status` tinyint DEFAULT '1',
  `deposit_status` tinyint DEFAULT '1',
  `transfer_status` tinyint DEFAULT '1',
  `referral_status` tinyint DEFAULT '1',
  `payment_status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `current_step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `kyc_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_valid` tinyint DEFAULT '0',
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_navigations`
--

CREATE TABLE `user_navigations` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT '0',
  `translation` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallets`
--

CREATE TABLE `user_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `currency_id` bigint UNSIGNED DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_schedules`
--

CREATE TABLE `withdrawal_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawal_schedules`
--

INSERT INTO `withdrawal_schedules` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sunday', 1, NULL, '2025-05-03 05:55:12'),
(2, 'Monday', 1, NULL, '2025-05-03 05:55:12'),
(3, 'Tuesday', 1, NULL, '2025-05-03 05:55:12'),
(4, 'Wednesday', 1, NULL, '2025-05-03 05:55:12'),
(5, 'Thursday', 1, NULL, '2025-05-03 05:55:12'),
(6, 'Friday', 1, NULL, '2025-05-03 05:55:12'),
(7, 'Saturday', 1, NULL, '2025-05-03 05:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_accounts`
--

CREATE TABLE `withdraw_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `user_wallet_id` bigint UNSIGNED NOT NULL,
  `withdraw_method_id` bigint UNSIGNED DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'manual',
  `gateway_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) DEFAULT NULL,
  `required_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required_time_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) DEFAULT NULL,
  `charge_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_withdraw` decimal(28,8) DEFAULT NULL,
  `max_withdraw` decimal(28,8) DEFAULT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_csses`
--
ALTER TABLE `custom_csses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_gateway_code_unique` (`gateway_code`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gifts_code_unique` (`code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_number_unique` (`number`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_contents`
--
ALTER TABLE `landing_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_referrals`
--
ALTER TABLE `level_referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_activities`
--
ALTER TABLE `login_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `money_requests`
--
ALTER TABLE `money_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_settings`
--
ALTER TABLE `page_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_settings_key_unique` (`key`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sandbox_transactions`
--
ALTER TABLE `sandbox_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `set_tunes`
--
ALTER TABLE `set_tunes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templates_code_unique` (`code`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_account_number_unique` (`account_number`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_navigations`
--
ALTER TABLE `user_navigations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_schedules`
--
ALTER TABLE `withdrawal_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_accounts`
--
ALTER TABLE `withdraw_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_csses`
--
ALTER TABLE `custom_csses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_contents`
--
ALTER TABLE `landing_contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `level_referrals`
--
ALTER TABLE `level_referrals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `login_activities`
--
ALTER TABLE `login_activities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `money_requests`
--
ALTER TABLE `money_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `page_settings`
--
ALTER TABLE `page_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sandbox_transactions`
--
ALTER TABLE `sandbox_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `set_tunes`
--
ALTER TABLE `set_tunes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_navigations`
--
ALTER TABLE `user_navigations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `withdrawal_schedules`
--
ALTER TABLE `withdrawal_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `withdraw_accounts`
--
ALTER TABLE `withdraw_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
