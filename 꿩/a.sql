-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.39 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- glvs_phno_master 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `glvs_phno_master` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `glvs_phno_master`;

-- 테이블 glvs_phno_master.glvs_common_cd 구조 내보내기
CREATE TABLE IF NOT EXISTS `glvs_common_cd` (
  `comm_cd_id` varchar(50) NOT NULL,
  `comm_cd_val` varchar(100) NOT NULL,
  `comm_cd_val_nm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`comm_cd_id`,`comm_cd_val`),
  KEY `idx_comm_cd_val` (`comm_cd_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 glvs_phno_master.glvs_common_cd:~51 rows (대략적) 내보내기
INSERT INTO `glvs_common_cd` (`comm_cd_id`, `comm_cd_val`, `comm_cd_val_nm`) VALUES
	('exchange_rt_cd', 'E001', '300'),
	('sale_ctgr_cd', 'S001', '0.1.2.3 SERIES'),
	('sale_ctgr_cd', 'S002', '0.1.9 SERIES'),
	('sale_ctgr_cd', 'S003', '1314 SERIES'),
	('sale_ctgr_cd', 'S004', '520 SERIES'),
	('sale_ctgr_cd', 'S005', 'AAA SERIES'),
	('sale_ctgr_cd', 'S006', 'AAAA SERIES'),
	('sale_ctgr_cd', 'S007', 'AAAAA SERIES'),
	('sale_ctgr_cd', 'S008', 'AAAAAA SERIES'),
	('sale_ctgr_cd', 'S009', 'AAAB SERIES'),
	('sale_ctgr_cd', 'S010', 'AABA SERIES'),
	('sale_ctgr_cd', 'S011', 'AABAA SERIES'),
	('sale_ctgr_cd', 'S012', 'AABB SERIES'),
	('sale_ctgr_cd', 'S013', 'AABBCC SERIES'),
	('sale_ctgr_cd', 'S014', 'AABBCCDD SERIES'),
	('sale_ctgr_cd', 'S015', 'AB SERIES'),
	('sale_ctgr_cd', 'S016', 'ABAA SERIES'),
	('sale_ctgr_cd', 'S017', 'ABAA/AABA SERIES'),
	('sale_ctgr_cd', 'S018', 'ABAB SERIES'),
	('sale_ctgr_cd', 'S019', 'ABABAB SERIES'),
	('sale_ctgr_cd', 'S020', 'ABBA SERIES'),
	('sale_ctgr_cd', 'S021', 'ABBB SERIES'),
	('sale_ctgr_cd', 'S022', 'BOSS SERIES'),
	('sale_ctgr_cd', 'S023', 'FENGSHUI 1349 SERIES'),
	('sale_ctgr_cd', 'S024', 'FENGSHUI 2678 SERIES'),
	('sale_ctgr_cd', 'S025', 'ICHING SERIES'),
	('sale_ctgr_cd', 'S026', 'LADDER SERIES'),
	('sale_ctgr_cd', 'S027', 'MATAFIZIK SERIES'),
	('sale_ctgr_cd', 'S028', 'NORMAL SERIES'),
	('sale_ctgr_cd', 'S029', 'ONG 88 SERIES'),
	('sale_ctgr_cd', 'S030', 'OTHER SERIES'),
	('sale_ctgr_cd', 'S031', 'REPEAT SERIES'),
	('sale_ctgr_cd', 'S032', 'THOUSAND NUMBER SERIES'),
	('sale_ctgr_cd', 'S033', 'YEAR SERIES'),
	('sale_phn_pfx_cd', 'P00', '010'),
	('sale_phn_pfx_cd', 'P01', '011'),
	('sale_phn_pfx_cd', 'P02', '012'),
	('sale_phn_pfx_cd', 'P03', '013'),
	('sale_phn_pfx_cd', 'P04', '014'),
	('sale_phn_pfx_cd', 'P05', '015'),
	('sale_phn_pfx_cd', 'P06', '016'),
	('sale_phn_pfx_cd', 'P07', '017'),
	('sale_phn_pfx_cd', 'P08', '018'),
	('sale_phn_pfx_cd', 'P09', '019'),
	('sale_phn_pfx_cd', 'P10', '0192'),
	('sale_phn_pfx_cd', 'P11', '0193'),
	('sale_status_cd', 'S01', 'Selling'),
	('sale_status_cd', 'S02', 'SoldOut'),
	('sale_status_cd', 'S03', 'SettlementCompleted'),
	('user_typ_cd', 'U01', 'Seller'),
	('user_typ_cd', 'U02', 'Admin');

-- 테이블 glvs_phno_master.glvs_sale_phn_num 구조 내보내기
CREATE TABLE IF NOT EXISTS `glvs_sale_phn_num` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `sale_phn_num` varchar(50) NOT NULL,
  `sale_phn_pfx_cd` varchar(5) NOT NULL,
  `sale_ctgr_cd` varchar(50) NOT NULL,
  `sale_price` decimal(65,10) NOT NULL,
  `sale_status_cd` varchar(50) NOT NULL,
  `sale_contact` varchar(50) NOT NULL,
  `rgst_nm` varchar(50) NOT NULL,
  `rgst_dt` date NOT NULL,
  `audit_nm` varchar(50) DEFAULT NULL,
  `audit_dt` date DEFAULT NULL,
  `user_typ_cd` varchar(50) DEFAULT NULL,
  `user_nm` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sale_id`) USING BTREE,
  UNIQUE KEY `sale_phn_num` (`sale_phn_num`),
  KEY `fk_sale_status_cd` (`sale_status_cd`) USING BTREE,
  KEY `fk_sale_ctgr_cd` (`sale_ctgr_cd`) USING BTREE,
  KEY `fk_sale_phn_pfx_cd` (`sale_phn_pfx_cd`) USING BTREE,
  KEY `user_typ_cd` (`user_typ_cd`),
  CONSTRAINT `fk_sale_ctgr_cd` FOREIGN KEY (`sale_ctgr_cd`) REFERENCES `glvs_common_cd` (`comm_cd_val`),
  CONSTRAINT `fk_sale_phn_pfx_cd` FOREIGN KEY (`sale_phn_pfx_cd`) REFERENCES `glvs_common_cd` (`comm_cd_val`),
  CONSTRAINT `fk_sale_status_cd` FOREIGN KEY (`sale_status_cd`) REFERENCES `glvs_common_cd` (`comm_cd_val`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 glvs_phno_master.glvs_sale_phn_num:~24 rows (대략적) 내보내기
INSERT INTO `glvs_sale_phn_num` (`sale_id`, `sale_phn_num`, `sale_phn_pfx_cd`, `sale_ctgr_cd`, `sale_price`, `sale_status_cd`, `sale_contact`, `rgst_nm`, `rgst_dt`, `audit_nm`, `audit_dt`, `user_typ_cd`, `user_nm`) VALUES
	(3, '011-1435-6789', 'P01', 'S025', 300.0000000000, 'S01', '010-3453-0745', 'Park', '2024-06-28', NULL, NULL, 'U02', 'c'),
	(30, '012-3456-8789', 'P03', 'S028', 100.0000000000, 'S03', '010-5737-0741', 'JeongTaek', '2023-01-01', NULL, NULL, 'U02', 'zz'),
	(39, '011-9988-8444', 'P02', 'S002', 12333.0000000000, 'S02', '012-2222-7890', 'Jessica', '2024-08-01', NULL, NULL, 'U01', 'abc'),
	(40, '012-1234-8987', 'P03', 'S033', 630.0000000000, 'S03', '010-5737-0741', 'JeongTaek', '2023-11-11', NULL, NULL, 'U02', 'zz'),
	(42, '011-3456-8789', 'P01', 'S028', 100.0000000000, 'S02', '012-2222-7890', 'Jessica', '2023-01-01', NULL, NULL, 'U01', 'abc'),
	(44, '010-0112-2334', 'P00', 'S014', 900.0000000000, 'S03', '012-3456-7890', 'John', '2024-08-06', NULL, NULL, 'U01', 'a'),
	(45, '010-1010-1010', 'P00', 'S019', 101010.0000000000, 'S03', '012-3456-7890', 'John', '2024-08-06', NULL, NULL, 'U01', 'a'),
	(54, '011-5555-5555', 'P00', 'S019', 55554.0000000000, 'S01', '012-3456-7890', 'John', '2024-08-06', NULL, NULL, 'U01', 'a'),
	(55, '012-1212-1212', 'P02', 'S019', 10000.0000000000, 'S01', '012-3456-7890', 'John', '2024-08-06', NULL, NULL, 'U01', 'a'),
	(56, '010-2222-2223', 'P00', 'S001', 22223.0000000000, 'S01', '011-1111-1111', 'Li', '2024-08-07', NULL, NULL, 'U01', 'b'),
	(57, '010-1314-1314', 'P02', 'S003', 131314.0000000000, 'S01', '011-1111-1111', 'Li', '2024-08-07', NULL, NULL, 'U01', 'b'),
	(58, '019-0191-1919', 'P00', 'S002', 19191.0000000000, 'S01', '011-1111-1111', 'Li', '2024-08-07', NULL, NULL, 'U01', 'b'),
	(59, '018-8855-8585', 'P08', 'S022', 85858.0000000000, 'S01', '011-1111-1111', 'Li', '2024-08-07', NULL, NULL, 'U01', 'b'),
	(60, '016-1231-1321', 'P06', 'S001', 1231.0000000000, 'S01', '011-1111-1111', 'Li', '2024-08-07', NULL, NULL, 'U01', 'b'),
	(62, '010-0111-1010', 'P00', 'S021', 10101.0000000000, 'S03', '010-5737-0741', 'JeongTaek', '2024-08-07', NULL, NULL, 'U02', 'zz'),
	(63, '010-0100-0100', 'P00', 'S017', 10000.0000000000, 'S02', '010-5737-0741', 'JeongTaek', '2024-08-07', NULL, NULL, 'U02', 'zz'),
	(64, '011-1212-2323', 'P01', 'S019', 8000.0000000000, 'S01', '010-5737-0741', 'JeongTaek', '2024-08-08', NULL, NULL, 'U02', 'zz'),
	(65, '010-5858-5858', 'P00', 'S019', 5858.0000000000, 'S02', '012-2222-7890', 'Jessica', '2024-08-08', NULL, NULL, 'U01', 'abc'),
	(66, '010-5555-5858', 'P00', 'S018', 5555.0000000000, 'S02', '012-2222-7890', 'Jessica', '2024-08-08', NULL, NULL, 'U01', 'abc'),
	(72, '012-1231-1231', 'P00', 'S001', 1231.0000000000, 'S02', '010-5737-0741', 'JeongTaek', '2024-08-08', NULL, NULL, 'U02', 'zz'),
	(73, '012-0190-1902', 'P00', 'S002', 1233.0000000000, 'S02', '011-1236-7890', 'Jung', '2024-08-08', NULL, NULL, 'U01', 'e'),
	(74, '011-1919-0190', 'P01', 'S002', 1919.0000000000, 'S01', '011-1236-7890', 'Jung', '2024-08-08', NULL, NULL, 'U01', 'e'),
	(75, '014-1919-2910', 'P04', 'S002', 2323.0000000000, 'S01', '011-1236-7890', 'Jung', '2024-08-08', NULL, NULL, 'U01', 'e'),
	(76, '016-6688-8237', 'P06', 'S012', 600.0000000000, 'S01', '011-1236-7890', 'Jung', '2024-08-08', NULL, NULL, 'U01', 'e'),
	(77, '013-3334-3257', 'P03', 'S009', 1233.0000000000, 'S01', '011-1236-7890', 'Jung', '2024-08-08', NULL, NULL, 'U01', 'e'),
	(78, '011-1111-2356', 'P01', 'S007', 11111.0000000000, 'S01', '019-2344-4321', 'RYU', '2024-08-08', NULL, NULL, 'U02', 'f'),
	(79, '017-1139-1323', 'P07', 'S010', 300.0000000000, 'S01', '019-2344-4321', 'RYU', '2024-08-08', NULL, NULL, 'U02', 'f'),
	(80, '017-5200-2345', 'P07', 'S004', 520.0000000000, 'S01', '017-3487-7890', 'Kwon', '2024-08-08', NULL, NULL, 'U01', 'g'),
	(81, '018-8888-8321', 'P08', 'S008', 8888.0000000000, 'S01', '017-3487-7890', 'Kwon', '2024-08-08', NULL, NULL, 'U01', 'g'),
	(82, '016-1211-9867', 'P06', 'S016', 200.0000000000, 'S01', '017-3487-7890', 'Kwon', '2024-08-08', NULL, NULL, 'U01', 'g'),
	(83, '010-2024-1232', 'P00', 'S033', 2024.0000000000, 'S01', '011-3448-7890', 'Yoon', '2024-08-08', NULL, NULL, 'U01', 'i'),
	(84, '010-0001-2334', 'P00', 'S032', 9999.0000000000, 'S01', '011-3448-7890', 'Yoon', '2024-08-08', NULL, NULL, 'U01', 'i'),
	(85, '010-2678-1234', 'P00', 'S024', 9999.0000000000, 'S01', '011-5380-7890', 'Ko', '2024-08-08', NULL, NULL, 'U01', 'm'),
	(86, '010-2233-4455', 'P00', 'S014', 8000.0000000000, 'S01', '011-5380-7890', 'Ko', '2024-08-08', NULL, NULL, 'U01', 'm'),
	(87, '013-1435-3456', 'P03', 'S003', 1314.0000000000, 'S02', '014-3580-4321', 'Jin', '2024-08-08', NULL, NULL, 'U02', 'n'),
	(88, '017-2012-3405', 'P07', 'S001', 700.0000000000, 'S02', '014-3580-4321', 'Jin', '2024-08-08', NULL, NULL, 'U02', 'n'),
	(89, '015-5344-1232', 'P05', 'S010', 200.0000000000, 'S03', '011-1111-1111', 'Li', '2024-08-08', NULL, NULL, 'U01', 'b'),
	(90, '017-7777-7123', 'P07', 'S008', 7777.0000000000, 'S02', '015-1231-2232', 'Kim', '2024-08-08', NULL, NULL, 'U02', 'd'),
	(92, '012-3334-5212', 'P02', 'S005', 222.0000000000, 'S02', '014-3580-4321', 'Jin', '2024-08-08', NULL, NULL, 'U02', 'n'),
	(93, '011-5200-2343', 'P01', 'S004', 500.0000000000, 'S02', '014-3580-4321', 'Jin', '2024-08-08', NULL, NULL, 'U02', 'n');

-- 테이블 glvs_phno_master.glvs_settl_rt 구조 내보내기
CREATE TABLE IF NOT EXISTS `glvs_settl_rt` (
  `settl_id` int NOT NULL AUTO_INCREMENT,
  `settl_rt` decimal(10,2) NOT NULL,
  PRIMARY KEY (`settl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 glvs_phno_master.glvs_settl_rt:~1 rows (대략적) 내보내기
INSERT INTO `glvs_settl_rt` (`settl_id`, `settl_rt`) VALUES
	(1, 90.00);

-- 테이블 glvs_phno_master.glvs_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `glvs_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_nm` varchar(100) NOT NULL,
  `user_pw` varchar(255) NOT NULL,
  `user_contact` varchar(25) NOT NULL,
  `user_typ_cd` varchar(50) NOT NULL,
  `user_bank_acc` varchar(255) NOT NULL,
  `rgst_nm` varchar(50) NOT NULL,
  `rgst_dt` date NOT NULL,
  `audit_nm` varchar(50) NOT NULL,
  `audit_dt` date NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_nm` (`user_nm`),
  UNIQUE KEY `rgst_nm` (`rgst_nm`),
  KEY `fk_user_typ_cd` (`user_typ_cd`),
  CONSTRAINT `fk_user_typ_cd` FOREIGN KEY (`user_typ_cd`) REFERENCES `glvs_common_cd` (`comm_cd_val`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 glvs_phno_master.glvs_user:~18 rows (대략적) 내보내기
INSERT INTO `glvs_user` (`user_id`, `user_nm`, `user_pw`, `user_contact`, `user_typ_cd`, `user_bank_acc`, `rgst_nm`, `rgst_dt`, `audit_nm`, `audit_dt`) VALUES
	(1, 'abc', '123', '012-2222-7890', 'U01', '토스11-111-1111 ', 'Jessica', '2024-08-05', 'JeongTaek', '2024-08-05'),
	(2, 'zz', '123', '010-5737-0741', 'U02', '신한110-521-321238', 'JeongTaek', '2024-08-05', 'JeongTaek', '2024-08-05'),
	(3, 'a', '123', '012-3456-7890', 'U01', 'NH111-111-1122', 'John', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(4, 'b', '123', '011-1111-1111', 'U01', 'KM111-222-2222', 'Li', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(5, 'c', '123', '010-3453-0745', 'U02', 'HN222-111-3333', 'Park', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(6, 'd', '123', '015-1231-2232', 'U02', 'SH110-521-23232', 'Kim', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(7, 'e', '123', '011-1236-7890', 'U01', 'SH111-444-3336', 'Jung', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(8, 'f', '123', '019-2344-4321', 'U02', 'NH444-565-6665', 'RYU', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(9, 'g', '123', '017-3487-7890', 'U01', 'SH111-234-3334', 'Kwon', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(10, 'h', '123', '017-3466-4321', 'U02', 'NH444-555-6663', 'Ahn', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(11, 'i', '123', '011-3448-7890', 'U01', 'SH111-257-3332', 'Yoon', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(12, 'j', '123', '016-9438-4321', 'U02', 'NH444-555-3451', 'Im', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(13, 'k', '123', '011-5656-7890', 'U01', 'SH111-222-3735', 'Lim', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(14, 'l', '123', '015-2479-4321', 'U02', 'NH444-555-6661', 'Hwang', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(15, 'm', '123', '011-5380-7890', 'U01', 'SH111-222-3329', 'Ko', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(16, 'n', '123', '014-3580-4321', 'U02', 'NH444-555-6667', 'Jin', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(17, 'o', '123', '011-3432-7890', 'U01', 'SH111-222-4436', 'Ju', '2024-08-08', 'JeongTaek', '2024-08-08'),
	(18, 'p', '123', '013-2346-4321', 'U02', 'NH444-555-6556', 'Yu', '2024-08-08', 'JeongTaek', '2024-08-08');

-- 테이블 glvs_phno_master.sync_changes 구조 내보내기
CREATE TABLE IF NOT EXISTS `sync_changes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rgst_nm` varchar(255) NOT NULL,
  `new_user_contact` varchar(255) DEFAULT NULL,
  `new_sale_contact` varchar(255) DEFAULT NULL,
  `update_type` enum('user_to_sale','sale_to_user') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 glvs_phno_master.sync_changes:~0 rows (대략적) 내보내기
INSERT INTO `sync_changes` (`id`, `rgst_nm`, `new_user_contact`, `new_sale_contact`, `update_type`) VALUES
	(1, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(2, 'JeongTaek', NULL, '010-5555-5555', 'user_to_sale'),
	(3, 'JeongTaek', '010-5555-5555', NULL, 'sale_to_user'),
	(4, 'JeongTaek', NULL, '010-5555-5555', 'user_to_sale'),
	(5, 'JeongTaek', '010-5555-5555', NULL, 'sale_to_user'),
	(6, 'JeongTaek', NULL, '012-3456-7890', 'user_to_sale'),
	(7, 'JeongTaek', '012-3456-7890', NULL, 'sale_to_user'),
	(8, 'JeongTaek', NULL, '012-1234-9870', 'user_to_sale'),
	(9, 'JeongTaek', '012-1234-9870', NULL, 'sale_to_user'),
	(10, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(11, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(12, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(13, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(14, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(15, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(16, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(17, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(18, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(19, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(20, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(21, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(22, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(23, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(24, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(25, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(26, 'Jessica Walker', NULL, '010-5555-5555', 'user_to_sale'),
	(27, 'Jessica', NULL, '010-5555-5555', 'user_to_sale'),
	(28, 'Jessica', NULL, '011-9988-4440', 'user_to_sale'),
	(29, 'Jessica', '011-9988-4440', NULL, 'sale_to_user'),
	(30, 'Jessica', NULL, '012-3456-7890', 'user_to_sale'),
	(31, 'Jessica', '012-3456-7890', NULL, 'sale_to_user'),
	(32, 'Jessica', NULL, '012-3456-7890', 'user_to_sale'),
	(33, 'Jessica', '012-3456-7890', NULL, 'sale_to_user'),
	(34, 'Jessica', NULL, '012-3456-7890', 'user_to_sale'),
	(35, 'Jessica', '012-3456-7890', NULL, 'sale_to_user'),
	(38, 'JeongTaek', NULL, '11', 'user_to_sale'),
	(39, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(40, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(41, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(42, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(43, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(44, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(45, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(46, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(47, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(48, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(49, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(50, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(51, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(52, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(53, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(54, 'John', '123-456-7012-3456-7890890', NULL, 'sale_to_user'),
	(55, 'Li', '012-3444-7890', NULL, 'sale_to_user'),
	(56, 'Li', '012-3444-7890', NULL, 'sale_to_user'),
	(57, 'Li', '012-3444-7890', NULL, 'sale_to_user'),
	(58, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(59, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(60, 'Li', '012-3444-7890', NULL, 'sale_to_user'),
	(61, 'Li', '012-3444-7890', NULL, 'sale_to_user'),
	(62, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(63, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(64, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(65, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(66, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(67, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(68, 'Park', '010-3453-0745', NULL, 'sale_to_user'),
	(69, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(70, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(71, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(72, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(73, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(74, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(75, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(76, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(77, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(78, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(79, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(80, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(81, 'JeongTaek', NULL, '010-5737-0742', 'user_to_sale'),
	(82, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(83, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(84, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(85, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(86, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(87, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(88, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(89, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(90, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(91, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(92, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(93, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(94, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(95, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(96, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(97, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(98, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(99, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(100, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(101, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(102, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(103, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(104, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(105, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(106, 'Park', '010-3453-0745', NULL, 'sale_to_user'),
	(107, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(108, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(109, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(110, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(111, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(112, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(113, 'Jane Smith', '013-9876-5432', NULL, 'sale_to_user'),
	(114, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(115, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(116, 'Laura Allen', '013-7654-3200', NULL, 'sale_to_user'),
	(117, 'Robert Brown', '014-1234-5678', NULL, 'sale_to_user'),
	(118, 'Emily Davis', '015-7654-3210', NULL, 'sale_to_user'),
	(119, 'Michael Wilson', '016-1122-3344', NULL, 'sale_to_user'),
	(120, 'Choi', '010-2465-0743', NULL, 'sale_to_user'),
	(121, 'Linda Johnson', '017-4433-2210', NULL, 'sale_to_user'),
	(122, 'Lee', '010-1235-0742', NULL, 'sale_to_user'),
	(123, 'David Martinez', '018-9988-7760', NULL, 'sale_to_user'),
	(124, 'Sarah Rodriguez', '019-5544-3320', NULL, 'sale_to_user'),
	(125, 'Lee', '010-1235-0742', NULL, 'sale_to_user'),
	(126, 'David Martinez', '018-9988-7760', NULL, 'sale_to_user'),
	(127, 'Sarah Rodriguez', '019-5544-3320', NULL, 'sale_to_user'),
	(128, 'Linda Johnson', '017-4433-2210', NULL, 'sale_to_user'),
	(129, 'Michael Wilson', '016-1122-3344', NULL, 'sale_to_user'),
	(130, 'Choi', '010-2465-0743', NULL, 'sale_to_user'),
	(131, 'John', NULL, '012-2223-3333', 'user_to_sale'),
	(132, 'John', NULL, '012-2223-3333', 'user_to_sale'),
	(133, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(134, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(135, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(136, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(137, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(138, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(139, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(140, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(141, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(142, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(143, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(144, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(145, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(146, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(147, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(148, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(149, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(150, 'John', '012-3456-7890', NULL, 'sale_to_user'),
	(151, 'Park', '010-3453-0745', NULL, 'sale_to_user'),
	(152, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(153, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(154, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(155, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(156, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(157, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(158, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(159, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(160, 'Jane Smith', '013-9876-5432', NULL, 'sale_to_user'),
	(161, 'Laura Allen', '013-7654-3200', NULL, 'sale_to_user'),
	(162, 'Robert Brown', '014-1234-5678', NULL, 'sale_to_user'),
	(163, 'Emily Davis', '015-7654-3210', NULL, 'sale_to_user'),
	(164, 'John', NULL, '012-2224-2222', 'user_to_sale'),
	(165, 'John', NULL, '012-3456-7890', 'user_to_sale'),
	(166, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(167, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(168, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(169, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(170, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(171, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(172, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(173, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(174, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(175, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(176, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(177, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(178, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(179, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(180, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(181, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(182, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(183, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(184, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(185, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(186, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(187, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(188, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(189, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(190, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(191, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(192, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(193, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(194, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(195, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(196, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(197, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(198, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(199, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(200, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(201, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(202, 'Jessica', NULL, '012-2222-7890', 'user_to_sale'),
	(203, 'Jessica', '012-2222-7890', NULL, 'sale_to_user'),
	(204, 'aPark', NULL, '019-8888-4444', 'user_to_sale'),
	(205, 'Park', NULL, '019-8888-4444', 'user_to_sale'),
	(206, 'Park', NULL, '019-8888-4444', 'user_to_sale'),
	(207, 'Park', NULL, '010-3453-0745', 'user_to_sale'),
	(208, 'Park', '010-3453-0745', NULL, 'sale_to_user'),
	(209, 'Park', NULL, '010-3453-0745', 'user_to_sale'),
	(210, 'Park', '010-3453-0745', NULL, 'sale_to_user'),
	(211, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(212, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(213, 'JeongTaek', NULL, '010-5737-0741', 'user_to_sale'),
	(214, 'JeongTaek', '010-5737-0741', NULL, 'sale_to_user'),
	(215, 'Li', NULL, '011-1111-1111', 'user_to_sale'),
	(216, 'Li', '011-1111-1111', NULL, 'sale_to_user'),
	(217, 'Jin', NULL, '014-3580-4321', 'user_to_sale'),
	(218, 'Jin', '014-3580-4321', NULL, 'sale_to_user'),
	(219, 'Jin', NULL, '014-3580-4321', 'user_to_sale'),
	(220, 'Jin', '014-3580-4321', NULL, 'sale_to_user');

-- 이벤트 glvs_phno_master.sync_changes_event 구조 내보내기
DELIMITER //
CREATE EVENT `sync_changes_event` ON SCHEDULE EVERY 1 MINUTE STARTS '2024-08-07 20:46:55' ON COMPLETION NOT PRESERVE ENABLE DO CALL sync_changes_procedure()//
DELIMITER ;

-- 프로시저 glvs_phno_master.sync_changes_procedure 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sync_changes_procedure`()
BEGIN
    -- 从中间表更新 glvs_sale_phn_num
    UPDATE glvs_sale_phn_num s
    JOIN sync_changes c ON s.rgst_nm = c.rgst_nm
    SET s.sale_contact = c.new_sale_contact
    WHERE c.update_type = 'user_to_sale';

    -- 从中间表更新 glvs_user
    UPDATE glvs_user u
    JOIN sync_changes c ON u.rgst_nm = c.rgst_nm
    SET u.user_contact = c.new_user_contact
    WHERE c.update_type = 'sale_to_user';

    -- 清空中间表
    TRUNCATE TABLE sync_changes;
END//
DELIMITER ;

-- 트리거 glvs_phno_master.sale_to_user_trigger 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `sale_to_user_trigger` AFTER UPDATE ON `glvs_sale_phn_num` FOR EACH ROW BEGIN
    INSERT INTO sync_changes (rgst_nm, new_user_contact, update_type)
    VALUES (NEW.rgst_nm, NEW.sale_contact, 'sale_to_user');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 glvs_phno_master.sync_sale_to_user_contact 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `sync_sale_to_user_contact` AFTER UPDATE ON `glvs_sale_phn_num` FOR EACH ROW BEGIN
    UPDATE glvs_user
    SET user_contact = NEW.sale_contact
    WHERE rgst_nm = NEW.rgst_nm; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 glvs_phno_master.user_to_sale_trigger 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `user_to_sale_trigger` AFTER UPDATE ON `glvs_user` FOR EACH ROW BEGIN
    INSERT INTO sync_changes (rgst_nm, new_sale_contact, update_type)
    VALUES (NEW.rgst_nm, NEW.user_contact, 'user_to_sale');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
