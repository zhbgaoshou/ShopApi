/*
 Navicat Premium Data Transfer

 Source Server         : music
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 17/11/2023 14:34:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_account
-- ----------------------------
DROP TABLE IF EXISTS `account_account`;
CREATE TABLE `account_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `level` smallint NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_account_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_account_groups`;
CREATE TABLE `account_account_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_account_groups_account_id_group_id_33a11f43_uniq`(`account_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `account_account_groups_group_id_31ca8e7b_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `account_account_groups_account_id_7aa27e9f_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_account_groups_group_id_31ca8e7b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_account_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `account_account_user_permissions`;
CREATE TABLE `account_account_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_account_user_per_account_id_permission_id_fa4fbca7_uniq`(`account_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `account_account_user_permission_id_e6a453ba_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `account_account_user_account_id_8c2c4a68_fk_account_a` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_account_user_permission_id_e6a453ba_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_shop
-- ----------------------------
DROP TABLE IF EXISTS `account_shop`;
CREATE TABLE `account_shop`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` smallint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `account_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_shop_account_id_65ca659b_fk_account_account_id`(`account_id` ASC) USING BTREE,
  CONSTRAINT `account_shop_account_id_65ca659b_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_shopproduct
-- ----------------------------
DROP TABLE IF EXISTS `account_shopproduct`;
CREATE TABLE `account_shopproduct`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `shop_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_shopproduct_account_id_3a256c05_fk_account_account_id`(`account_id` ASC) USING BTREE,
  INDEX `account_shopproduct_product_id_9028990f_fk_product_product_id`(`product_id` ASC) USING BTREE,
  INDEX `account_shopproduct_shop_id_00d7d353_fk_account_shop_id`(`shop_id` ASC) USING BTREE,
  CONSTRAINT `account_shopproduct_account_id_3a256c05_fk_account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_shopproduct_product_id_9028990f_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_shopproduct_shop_id_00d7d353_fk_account_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `account_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment_comment
-- ----------------------------
DROP TABLE IF EXISTS `comment_comment`;
CREATE TABLE `comment_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_comment_product_id_fcb90737_fk_product_product_id`(`product_id` ASC) USING BTREE,
  INDEX `comment_comment_user_id_6078e57b_fk_User_wxuser_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comment_comment_product_id_fcb90737_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment_commentimage
-- ----------------------------
DROP TABLE IF EXISTS `comment_commentimage`;
CREATE TABLE `comment_commentimage`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `comment_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_commentimage_comment_id_669cddea_fk_comment_comment_id`(`comment_id` ASC) USING BTREE,
  CONSTRAINT `comment_commentimage_comment_id_669cddea_fk_comment_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment_commentupvote
-- ----------------------------
DROP TABLE IF EXISTS `comment_commentupvote`;
CREATE TABLE `comment_commentupvote`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `comment_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_commentupvote_comment_id_2be311ea_fk_comment_comment_id`(`comment_id` ASC) USING BTREE,
  INDEX `comment_commentupvote_user_id_b7eb4c03_fk_User_wxuser_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comment_commentupvote_comment_id_2be311ea_fk_comment_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_commentupvote_user_id_b7eb4c03_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon_coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon_coupon`;
CREATE TABLE `coupon_coupon`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(10, 1) NOT NULL,
  `valve` int NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NOT NULL,
  `count` int NOT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_account_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for index_indexcarousel
-- ----------------------------
DROP TABLE IF EXISTS `index_indexcarousel`;
CREATE TABLE `index_indexcarousel`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_indexcarousel_product_id_cbe694b2_fk_product_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `index_indexcarousel_product_id_cbe694b2_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for index_indexseckill
-- ----------------------------
DROP TABLE IF EXISTS `index_indexseckill`;
CREATE TABLE `index_indexseckill`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_indexseckill_product_id_e4ae7bf9_fk_product_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `index_indexseckill_product_id_e4ae7bf9_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for index_indexsuggest
-- ----------------------------
DROP TABLE IF EXISTS `index_indexsuggest`;
CREATE TABLE `index_indexsuggest`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_indexsuggest_product_id_8e116530_fk_product_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `index_indexsuggest_product_id_8e116530_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_product
-- ----------------------------
DROP TABLE IF EXISTS `product_product`;
CREATE TABLE `product_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `cover` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type_id` bigint NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_product_type_id_db92a7b7_fk_product_type_id`(`type_id` ASC) USING BTREE,
  CONSTRAINT `product_product_type_id_db92a7b7_fk_product_type_id` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_productimg
-- ----------------------------
DROP TABLE IF EXISTS `product_productimg`;
CREATE TABLE `product_productimg`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img_type` smallint NOT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_productimg_product_id_be4aaa8a_fk_product_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_productimg_product_id_be4aaa8a_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_productspec
-- ----------------------------
DROP TABLE IF EXISTS `product_productspec`;
CREATE TABLE `product_productspec`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `property` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `property_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_productspec_product_id_929bc0d8_fk_product_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_productspec_product_id_929bc0d8_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_productspecgroup
-- ----------------------------
DROP TABLE IF EXISTS `product_productspecgroup`;
CREATE TABLE `product_productspecgroup`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `group_price` decimal(10, 2) NOT NULL,
  `group_sales` int NOT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `group_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_productspecg_product_id_2106bef3_fk_product_p`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_productspecg_product_id_2106bef3_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `className` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `user_useraddress`;
CREATE TABLE `user_useraddress`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cellphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `User_useraddress_user_id_a36664d0_fk_User_wxuser_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `User_useraddress_user_id_a36664d0_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_userorder
-- ----------------------------
DROP TABLE IF EXISTS `user_userorder`;
CREATE TABLE `user_userorder`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` smallint NOT NULL,
  `order_time` bigint NULL DEFAULT NULL,
  `pay_time` bigint NULL DEFAULT NULL,
  `deliver_time` bigint NULL DEFAULT NULL,
  `received_time` bigint NULL DEFAULT NULL,
  `postage` decimal(10, 2) NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `order_number` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `User_userorder_product_id_5775dfee_fk_product_product_id`(`product_id` ASC) USING BTREE,
  INDEX `User_userorder_user_id_9e7a5563_fk_User_wxuser_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `User_userorder_product_id_5775dfee_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `User_userorder_user_id_9e7a5563_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_userproductcart
-- ----------------------------
DROP TABLE IF EXISTS `user_userproductcart`;
CREATE TABLE `user_userproductcart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `spec_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `User_userproductcart_product_id_e59c3cca_fk_product_product_id`(`product_id` ASC) USING BTREE,
  INDEX `User_userproductcart_user_id_84965efa_fk_User_wxuser_id`(`user_id` ASC) USING BTREE,
  INDEX `User_userproductcart_spec_id_7556b77a_fk_product_p`(`spec_id` ASC) USING BTREE,
  CONSTRAINT `User_userproductcart_product_id_e59c3cca_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `User_userproductcart_spec_id_7556b77a_fk_product_p` FOREIGN KEY (`spec_id`) REFERENCES `product_productspecgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `User_userproductcart_user_id_84965efa_fk_User_wxuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_wxuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_wxuser
-- ----------------------------
DROP TABLE IF EXISTS `user_wxuser`;
CREATE TABLE `user_wxuser`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `openId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
