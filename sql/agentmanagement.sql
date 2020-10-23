/*
 Date: 21/10/2020 21:20:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for things
-- ----------------------------
DROP TABLE IF EXISTS `tbl_things`;
CREATE TABLE `tbl_things`  (
  `id` BIGINT(0) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(10) NULL DEFAULT NULL,
  `thing_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thing_detail` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `start_time` DATETIME,
  `end_time` DATETIME,
  `state` INT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of things
INSERT INTO tbl_things VALUES(NULL,"张三","李四结婚","记得给红包！","2020-10-01","2020-10-03",3);
INSERT INTO tbl_things VALUES(NULL,"aaa","aaa","bbbbbbbb","2020-11-01","2020-10-03",2);
INSERT INTO tbl_things VALUES(NULL,"bbb","bbb","bbbbbbbb","2020-10-01","2020-10-03",1);
INSERT INTO tbl_things VALUES(NULL,"cccc","ccccc","cccccc","2020-10-01","2020-10-03",1);