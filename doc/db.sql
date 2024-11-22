CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `blog`;

/*Table structure for table `blog_article` */

DROP TABLE IF EXISTS `blog_article`;

CREATE TABLE `blog_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '文章标题',
  `summary` varchar(400) DEFAULT NULL COMMENT '文章摘要 最多100字，默认抽取文章最前面的字数',
  `author_id` int(11) NOT NULL COMMENT '作者ID',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  `head_img` varchar(250) DEFAULT NULL COMMENT '文章封面图片',
  `top_flag` char(1) DEFAULT 'N' COMMENT '是否置顶 ',
  `status` char(1) DEFAULT 'D' COMMENT '状态 D草稿 P已发布',
  `password` varchar(32) DEFAULT NULL COMMENT '文章私密访问时的',
  `src_flag` char(1) DEFAULT 'O' COMMENT '文章来源：O原创,C 翻译, L 转载',
  `comment_flag` char(1) DEFAULT 'Y' COMMENT '是否评论 Y可以评论 N 不可以评论',
  `req_auth` char(1) DEFAULT NULL COMMENT '登录后才可访问',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='文章';

/*Table structure for table `blog_article_content` */

DROP TABLE IF EXISTS `blog_article_content`;

CREATE TABLE `blog_article_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL COMMENT '博客ID',
  `content` mediumtext,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `blog_article_likes` */

DROP TABLE IF EXISTS `blog_article_likes`;

CREATE TABLE `blog_article_likes` (
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`,`user_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章点赞记录表';

/*Table structure for table `blog_article_tags` */

DROP TABLE IF EXISTS `blog_article_tags`;

CREATE TABLE `blog_article_tags` (
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `tag_id` int(11) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `idx_tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章标签关联表';

/*Table structure for table `blog_categories` */

DROP TABLE IF EXISTS `blog_categories`;

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `description` varchar(300) DEFAULT NULL COMMENT '分类描述',
  `parent_id` int(11) DEFAULT NULL COMMENT '父分类ID',
  `order` int(11) DEFAULT '0' COMMENT '排序',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

/*Table structure for table `blog_comments` */

DROP TABLE IF EXISTS `blog_comments`;

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父评论ID',
  `content` text NOT NULL COMMENT '评论内容',
  `status` enum('pending','approved','spam') NOT NULL DEFAULT 'pending' COMMENT '状态',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_article` (`article_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_parent` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

/*Table structure for table `blog_search_logs` */

DROP TABLE IF EXISTS `blog_search_logs`;

CREATE TABLE `blog_search_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL COMMENT '搜索关键词',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID(未登录为空)',
  `ip` varchar(45) NOT NULL COMMENT 'IP地址',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_keyword` (`keyword`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='搜索记录表';

/*Table structure for table `blog_tags` */

DROP TABLE IF EXISTS `blog_tags`;

CREATE TABLE `blog_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '标签名称',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `bio` varchar(100) DEFAULT '我的签名简介是……' COMMENT '简介',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `password` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(250) DEFAULT NULL COMMENT '头像地址',
  `user_type` char(1) DEFAULT 'G' COMMENT 'M 管理员 G普通用户',
  `addr` varchar(250) DEFAULT NULL COMMENT '地址',
  `reg_ip` varchar(32) DEFAULT NULL COMMENT '注册IP',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `status` char(1) DEFAULT NULL COMMENT '用户状态 N 正常,D 禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
