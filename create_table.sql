CREATE DATABASE IF NOT EXISTS app;

USE app;

CREATE TABLE `user` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL,
    `user_year_type` tinyint(4) NOT NULL DEFAULT '0',
    `username` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
    `password` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
    `phone` varchar(64) COLLATE utf8mb4_general_ci NOT NULL UNIQUE,
    `gender` tinyint(4) NOT NULL DEFAULT '0',
    `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE
    CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `code`(
    `id` INT AUTO_INCREMENT,
    `code` INT NOT NULL,
    `phone` varchar(255) NOT NULL,
    `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bill` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL,
    `bill_id` bigint(20) NOT NULL,
    `income_or_outcome` varchar(64) NOT NULL,
    `money` double(8, 2) NOT NULL,
    `bill_type` varchar(64) NOT NULL,
    `bill_type_classification` varchar(64),
    `bill_tag` varchar(64),
    `bill_info` varchar(256),
    `bill_year` varchar(64) NOT NULL,
    `bill_month` varchar(64) NOT NULL,
    `bill_isoweek` varchar(64) NOT NULL,
    `bill_date` varchar(64) NOT NULL,
    `bill_photo` varchar(256),
    `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `budget` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL,
    `money` double(8, 2) NOT NULL,
    `budget_month` varchar(64) NOT NULL,
    `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `budget_alone` (`user_id`, `budget_month`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `family` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) NOT NULL UNIQUE,
    `family_id` bigint(20) NOT NULL,
    `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;