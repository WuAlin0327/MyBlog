/*
 Navicat MySQL Data Transfer

 Source Server         : 本地测试
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : MyBlog

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 21/12/2018 14:44:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add user', 6, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change user', 6, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 6, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can view user', 6, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add article', 7, 'add_article');
INSERT INTO `auth_permission` VALUES (26, 'Can change article', 7, 'change_article');
INSERT INTO `auth_permission` VALUES (27, 'Can delete article', 7, 'delete_article');
INSERT INTO `auth_permission` VALUES (28, 'Can view article', 7, 'view_article');
INSERT INTO `auth_permission` VALUES (29, 'Can add article2 tag', 8, 'add_article2tag');
INSERT INTO `auth_permission` VALUES (30, 'Can change article2 tag', 8, 'change_article2tag');
INSERT INTO `auth_permission` VALUES (31, 'Can delete article2 tag', 8, 'delete_article2tag');
INSERT INTO `auth_permission` VALUES (32, 'Can view article2 tag', 8, 'view_article2tag');
INSERT INTO `auth_permission` VALUES (33, 'Can add article up down', 9, 'add_articleupdown');
INSERT INTO `auth_permission` VALUES (34, 'Can change article up down', 9, 'change_articleupdown');
INSERT INTO `auth_permission` VALUES (35, 'Can delete article up down', 9, 'delete_articleupdown');
INSERT INTO `auth_permission` VALUES (36, 'Can view article up down', 9, 'view_articleupdown');
INSERT INTO `auth_permission` VALUES (37, 'Can add blog', 10, 'add_blog');
INSERT INTO `auth_permission` VALUES (38, 'Can change blog', 10, 'change_blog');
INSERT INTO `auth_permission` VALUES (39, 'Can delete blog', 10, 'delete_blog');
INSERT INTO `auth_permission` VALUES (40, 'Can view blog', 10, 'view_blog');
INSERT INTO `auth_permission` VALUES (41, 'Can add category', 11, 'add_category');
INSERT INTO `auth_permission` VALUES (42, 'Can change category', 11, 'change_category');
INSERT INTO `auth_permission` VALUES (43, 'Can delete category', 11, 'delete_category');
INSERT INTO `auth_permission` VALUES (44, 'Can view category', 11, 'view_category');
INSERT INTO `auth_permission` VALUES (45, 'Can add comment', 12, 'add_comment');
INSERT INTO `auth_permission` VALUES (46, 'Can change comment', 12, 'change_comment');
INSERT INTO `auth_permission` VALUES (47, 'Can delete comment', 12, 'delete_comment');
INSERT INTO `auth_permission` VALUES (48, 'Can view comment', 12, 'view_comment');
INSERT INTO `auth_permission` VALUES (49, 'Can add tag', 13, 'add_tag');
INSERT INTO `auth_permission` VALUES (50, 'Can change tag', 13, 'change_tag');
INSERT INTO `auth_permission` VALUES (51, 'Can delete tag', 13, 'delete_tag');
INSERT INTO `auth_permission` VALUES (52, 'Can view tag', 13, 'view_tag');
COMMIT;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `comment_count` int(11) NOT NULL,
  `up_count` int(11) NOT NULL,
  `down_count` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_nid` (`category_id`),
  KEY `blog_article_user_id_5beb0cc1_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_nid` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`nid`),
  CONSTRAINT `blog_article_user_id_5beb0cc1_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
BEGIN;
INSERT INTO `blog_article` VALUES (1, 'Python使用PIL模块生成随机验证码', '摘要: PIL模块的安装 生成随机验证码图片 还可以给图片验证码添加燥点与燥线 将下面代码添加到get_verify_code_img中 调用', '2018-12-17 12:28:50.855460', '<div id=\"cnblogs_post_body\" class=\"blogpost-body cnblogs-markdown\"><p>PIL模块的安装</p>\r\n<pre><code class=\"hljs cmake\">pip3 <span class=\"hljs-keyword\">install</span> pillow</code></pre>\r\n<p>生成随机验证码图片</p>\r\n<pre><code class=\"hljs python\"><span class=\"hljs-keyword\">import</span> random\r\n<span class=\"hljs-keyword\">from</span> PIL <span class=\"hljs-keyword\">import</span> Image, ImageDraw, ImageFont\r\n<span class=\"hljs-keyword\">from</span> io <span class=\"hljs-keyword\">import</span> BytesIO\r\n\r\n\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">def</span> <span class=\"hljs-title\">random_str</span><span class=\"hljs-params\">()</span>:</span>\r\n    <span class=\"hljs-string\">\'\'\'\r\n    生成随机字符\r\n    :return:随机字符\r\n    \'\'\'</span>\r\n    random_int = str(random.randint(<span class=\"hljs-number\">0</span>,<span class=\"hljs-number\">9</span>))\r\n    random_up = chr(random.randint(<span class=\"hljs-number\">65</span>,<span class=\"hljs-number\">90</span>))\r\n    random_down = chr(random.randint(<span class=\"hljs-number\">97</span>,<span class=\"hljs-number\">122</span>))\r\n    retu_str = random.choice([random_int,random_up,random_down])\r\n    <span class=\"hljs-keyword\">return</span> retu_str\r\n\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">def</span> <span class=\"hljs-title\">rndColor</span><span class=\"hljs-params\">()</span>:</span>\r\n    <span class=\"hljs-string\">\'\'\'\r\n    生成随机颜色\r\n    :return: 随机rbg颜色\r\n    \'\'\'</span>\r\n    <span class=\"hljs-keyword\">return</span> (random.randint(<span class=\"hljs-number\">0</span>, <span class=\"hljs-number\">255</span>), random.randint(<span class=\"hljs-number\">10</span>, <span class=\"hljs-number\">255</span>), random.randint(<span class=\"hljs-number\">64</span>, <span class=\"hljs-number\">255</span>))\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">def</span> <span class=\"hljs-title\">get_verify_code_img</span><span class=\"hljs-params\">(filename)</span>:</span>\r\n    <span class=\"hljs-string\">\'\'\'\r\n    生成随机验证码图片，保存到内存，通过HttpResponse发送到前端\r\n    :param request: 生成session\r\n    :return:  内存中的图片\r\n    \'\'\'</span>\r\n\r\n    <span class=\"hljs-comment\"># 创建图片与画笔</span>\r\n    img = Image.new(mode=<span class=\"hljs-string\">\'RGB\'</span>,size=(<span class=\"hljs-number\">186</span>,<span class=\"hljs-number\">34</span>),color=rndColor())\r\n    draw = ImageDraw.Draw(img)\r\n    verify = <span class=\"hljs-string\">\'\'</span>\r\n\r\n    <span class=\"hljs-comment\"># 字体样式</span>\r\n    font = ImageFont.truetype(font=<span class=\"hljs-string\">\'font1.ttf\'</span>,size=<span class=\"hljs-number\">20</span>)\r\n\r\n    <span class=\"hljs-comment\">#生成六位数验证码</span>\r\n    <span class=\"hljs-keyword\">for</span> i <span class=\"hljs-keyword\">in</span> range(<span class=\"hljs-number\">6</span>):\r\n        char = random_str()\r\n        verify += char\r\n        draw.text([i*<span class=\"hljs-number\">20</span>+<span class=\"hljs-number\">50</span>,<span class=\"hljs-number\">5</span>],char,font=font,fill=rndColor())\r\n\r\n    f = open(filename<span class=\"hljs-string\">\',\'</span>w<span class=\"hljs-string\">b\')\r\n    img.save(f,\'</span>png<span class=\"hljs-string\">\')</span></code></pre>\r\n<p>还可以给图片验证码添加燥点与燥线</p>\r\n<p>将下面代码添加到get_verify_code_img中</p>\r\n<pre><code class=\"hljs cs\">    <span class=\"hljs-meta\"># width=270</span>\r\n    <span class=\"hljs-meta\"># height=40</span>\r\n    <span class=\"hljs-meta\"># for i in range(10):</span>\r\n    <span class=\"hljs-meta\">#     x1=random.randint(0,width)</span>\r\n    <span class=\"hljs-meta\">#     x2=random.randint(0,width)</span>\r\n    <span class=\"hljs-meta\">#     y1=random.randint(0,height)</span>\r\n    <span class=\"hljs-meta\">#     y2=random.randint(0,height)</span>\r\n    <span class=\"hljs-meta\">#     draw.<span class=\"hljs-meta-keyword\">line</span>((x1,y1,x2,y2),fill=get_random_color())</span>\r\n    <span class=\"hljs-meta\">#</span>\r\n    <span class=\"hljs-meta\"># for i in range(100):</span>\r\n    <span class=\"hljs-meta\">#     draw.point([random.randint(0, width), random.randint(0, height)], fill=get_random_color())</span>\r\n    <span class=\"hljs-meta\">#     x = random.randint(0, width)</span>\r\n    <span class=\"hljs-meta\">#     y = random.randint(0, height)</span>\r\n    <span class=\"hljs-meta\">#     draw.arc((x, y, x + 4, y + 4), 0, 90, fill=get_random_color())</span></code></pre>\r\n<p>调用</p>\r\n<pre><code class=\"hljs less\"><span class=\"hljs-selector-tag\">get_verify_code_img</span>(<span class=\"hljs-string\">\'验证码.png\'</span>)</code></pre>\r\n</div>', 21, 17, 4, 1, 1);
INSERT INTO `blog_article` VALUES (2, 'Django之forms组件', '摘要: 校验字段功能： index.html views.py（forms暂时先放在views.py,为了程序可读性更高应新建一个.py文件） forms组件的渲染标签功能 方式1： views.py index.html 方式2:在views.py中定义字段可以添加label属性，在渲染标签时，默认的fo', '2018-12-17 12:29:16.386084', '...', 6, 2, 0, 1, 1);
INSERT INTO `blog_article` VALUES (3, 'Django与Ajax', '摘要: Ajax Ajax(asynchronous JavaScript And XML):异步javascript和xml。即使用javascript语言与服务器进行异步交互，传输的数据是xml(现在大部分都是使用json) 同步交互：客户端发出一个请求后，需要等待服务器响应结束后，才能发出第二个请求', '2018-12-17 12:29:46.469704', '...', 0, 3, 0, 1, 1);
INSERT INTO `blog_article` VALUES (5, 'Django之模板层-自定义过滤器以及标签', '摘要: 自定义标签与过滤器 1. 在settings中的INSTALLED_APPS配置当前app，不然django无法找到自定义的simple_tag. 2. 在app中创建templatetags模块(模块名只能是templatetags) 3. 创建任意 .py 文件，如：my_tags.py 使用自...', '2018-12-17 13:03:14.362585', '...', 12, 4, 2, 3, 8);
INSERT INTO `blog_article` VALUES (6, 'MySQL学习笔记', '摘要: 数据库 1. 数据库服务器：运行数据库管理软件的计算机 2. 数据库管理软件：mysql，oracle，db2，sqlserver 3. 库：文件夹 4. 表：文件 5. 记录：食物一系列典型的特征 6. 数据：描述事物特征的符号 数据库的分类： 关系型：sqllite,db2,oracle,acc', '2018-12-18 14:25:03.768991', '...', 0, 2, 0, 4, 1);
INSERT INTO `blog_article` VALUES (12, 'Django之发送邮件', 'Django只需要进行简单的配置既可以发送邮件\n在settings.py中设置以下属性\nEMAIL_BACKEND = \'django.core.mail.backends.smtp.EmailBackend\'\r\nEMAIL_HOST = \'smtp.163.com\'  # 邮箱服务器\r\nEMAIL', '2018-12-21 13:53:34.263305', '<div class=\"blogpost-body cnblogs-markdown\" id=\"cnblogs_post_body\"><p>Django只需要进行简单的配置既可以发送邮件</p>\n<p>在settings.py中设置以下属性</p>\n<pre><code class=\"hljs ini\"><span class=\"hljs-attr\">EMAIL_BACKEND</span> = <span class=\"hljs-string\">\'django.core.mail.backends.smtp.EmailBackend\'</span>\r\n<span class=\"hljs-attr\">EMAIL_HOST</span> = <span class=\"hljs-string\">\'smtp.163.com\'</span>  # 邮箱服务器\r\n<span class=\"hljs-attr\">EMAIL_PORT</span> = <span class=\"hljs-number\">25</span> # 端口\r\n<span class=\"hljs-attr\">EMAIL_HOST_USER</span> = <span class=\"hljs-string\">\'15083623778@163.com\'</span>    # 邮箱账号\r\n<span class=\"hljs-attr\">EMAIL_HOST_PASSWORD</span> = <span class=\"hljs-string\">\'\'</span>  # 邮箱的授权码\r\n<span class=\"hljs-attr\">DEFAULT_FROM_EMAIL</span> = <span class=\"hljs-string\">\'Python&lt;15083623778@163.com&gt;\'</span>\r\n<span class=\"hljs-attr\">EMAIL_USE_SSL</span> = <span class=\"hljs-literal\">False</span>  #证书</code></pre>\n<p>引入send_email</p>\n<pre><code class=\"hljs javascript\"><span class=\"hljs-keyword\">from</span> django.core.mail <span class=\"hljs-keyword\">import</span> send_mail</code></pre>\n<p>发送邮件</p>\n<pre><code class=\"hljs ruby\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">def</span> <span class=\"hljs-title\">sendEmail</span><span class=\"hljs-params\">(request)</span></span>:\r\n    send_mail(\r\n        <span class=\"hljs-string\">\'邮件的标题\'</span>,\r\n             <span class=\"hljs-string\">\'邮件的内容\'</span>,\r\n        settings.EMAIL_HOST_USER, <span class=\"hljs-comment\"># 邮件的发送者</span>\r\n        [<span class=\"hljs-string\">\'15083623778@163.com\'</span>] <span class=\"hljs-comment\"># 发送用户邮箱(可以添加多个邮箱，放在列表内)</span>\r\n    )\r\n    <span class=\"hljs-keyword\">return</span> HttpResponse(<span class=\"hljs-string\">\'ok\'</span>)</code></pre>\n<p>给发送邮件起一个线程</p>\n<pre><code class=\"hljs nginx\"><span class=\"hljs-attribute\">send</span> = Thread(target=send_mail,args=(\r\n        <span class=\"hljs-string\">\'邮件的标题\'</span>,\r\n             <span class=\"hljs-string\">\'邮件的内容\'</span>,\r\n        settings.EMAIL_HOST_USER,\r\n        [<span class=\"hljs-string\">\'15083623778@163.com\'</span>]\r\n    )\r\nsend.start()</code></pre>\n</div>', 0, 1, 0, 4, 1);
COMMIT;

-- ----------------------------
-- Table structure for blog_article2tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article2tag`;
CREATE TABLE `blog_article2tag` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `blog_article2tag_article_id_tag_id_b0745f42_uniq` (`article_id`,`tag_id`),
  KEY `blog_article2tag_tag_id_389b9a96_fk_blog_tag_nid` (`tag_id`),
  CONSTRAINT `blog_article2tag_article_id_753a2b60_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`),
  CONSTRAINT `blog_article2tag_tag_id_389b9a96_fk_blog_tag_nid` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article2tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_article2tag` VALUES (1, 2, 2);
INSERT INTO `blog_article2tag` VALUES (2, 3, 2);
INSERT INTO `blog_article2tag` VALUES (4, 12, 4);
COMMIT;

-- ----------------------------
-- Table structure for blog_articleupdown
-- ----------------------------
DROP TABLE IF EXISTS `blog_articleupdown`;
CREATE TABLE `blog_articleupdown` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `is_up` tinyint(1) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `blog_articleupdown_article_id_user_id_fa3d0c08_uniq` (`article_id`,`user_id`),
  KEY `blog_articleupdown_user_id_2c0ebe49_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `blog_articleupdown_article_id_9be1a8a2_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`),
  CONSTRAINT `blog_articleupdown_user_id_2c0ebe49_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_articleupdown
-- ----------------------------
BEGIN;
INSERT INTO `blog_articleupdown` VALUES (76, 0, 1, 1);
INSERT INTO `blog_articleupdown` VALUES (77, 1, 6, 1);
INSERT INTO `blog_articleupdown` VALUES (78, 1, 2, 1);
INSERT INTO `blog_articleupdown` VALUES (79, 1, 3, 1);
INSERT INTO `blog_articleupdown` VALUES (80, 1, 5, 1);
INSERT INTO `blog_articleupdown` VALUES (81, 1, 1, 7);
INSERT INTO `blog_articleupdown` VALUES (82, 1, 3, 7);
INSERT INTO `blog_articleupdown` VALUES (83, 1, 5, 7);
INSERT INTO `blog_articleupdown` VALUES (86, 1, 12, 1);
COMMIT;

-- ----------------------------
-- Table structure for blog_blog
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog`;
CREATE TABLE `blog_blog` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `site_name` varchar(64) NOT NULL,
  `theme` varchar(32) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_blog
-- ----------------------------
BEGIN;
INSERT INTO `blog_blog` VALUES (1, 'python社区', 'wualin222', 'wualin222的个人博客');
INSERT INTO `blog_blog` VALUES (2, '编程爱好者', 'zhangzz', 'zhangzz的个人博客');
INSERT INTO `blog_blog` VALUES (3, '91社区', 'wualin0327', '吴阿麟的个人博客');
INSERT INTO `blog_blog` VALUES (4, 'luffycity', 'alex123', 'alex123的个人博客');
INSERT INTO `blog_blog` VALUES (5, '我听见雨', 'tom123', 'tom123的个人博客');
INSERT INTO `blog_blog` VALUES (6, 'luffycity', 'tom321', 'tom321的个人博客');
COMMIT;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_category_blog_id_80f0723a_fk_blog_blog_nid` (`blog_id`),
  CONSTRAINT `blog_category_blog_id_80f0723a_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
BEGIN;
INSERT INTO `blog_category` VALUES (1, 'Python', 1);
INSERT INTO `blog_category` VALUES (2, 'Django', 2);
INSERT INTO `blog_category` VALUES (3, '吴阿麟的分类', 3);
INSERT INTO `blog_category` VALUES (4, '数据库', 1);
INSERT INTO `blog_category` VALUES (7, '随笔', 1);
INSERT INTO `blog_category` VALUES (8, '随笔', 2);
INSERT INTO `blog_category` VALUES (9, '一起学Python', 6);
COMMIT;

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_comment_article_id_3d58bca6_fk_blog_article_nid` (`article_id`),
  KEY `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_nid` (`parent_comment_id`),
  KEY `blog_comment_user_id_59a54155_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`nid`),
  CONSTRAINT `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_nid` FOREIGN KEY (`parent_comment_id`) REFERENCES `blog_comment` (`nid`),
  CONSTRAINT `blog_comment_user_id_59a54155_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
BEGIN;
INSERT INTO `blog_comment` VALUES (4, '111', '2018-12-19 20:45:58.777755', 1, NULL, 1);
INSERT INTO `blog_comment` VALUES (5, '再发表一篇评论', '2018-12-19 20:50:40.235220', 1, NULL, 1);
INSERT INTO `blog_comment` VALUES (7, '12345', '2018-12-20 10:16:12.898663', 1, NULL, 1);
INSERT INTO `blog_comment` VALUES (8, '2131231', '2018-12-20 10:22:40.876162', 1, NULL, 1);
INSERT INTO `blog_comment` VALUES (9, '请31231231', '2018-12-20 10:23:07.566148', 1, NULL, 1);
INSERT INTO `blog_comment` VALUES (10, '哈哈哈', '2018-12-20 10:23:40.780384', 3, NULL, 1);
INSERT INTO `blog_comment` VALUES (11, '哈哈哈哈', '2018-12-20 10:23:45.916577', 3, NULL, 1);
INSERT INTO `blog_comment` VALUES (12, '123', '2018-12-20 10:25:29.442568', 1, NULL, 1);
INSERT INTO `blog_comment` VALUES (13, '评论一发', '2018-12-20 10:27:37.539515', 2, NULL, 1);
INSERT INTO `blog_comment` VALUES (14, '评论评论', '2018-12-20 10:47:56.952679', 5, NULL, 1);
INSERT INTO `blog_comment` VALUES (15, '我也来评论一发', '2018-12-20 10:48:30.358699', 1, NULL, 7);
INSERT INTO `blog_comment` VALUES (16, '@wualin\n...', '2018-12-20 11:02:18.829397', 2, NULL, 7);
INSERT INTO `blog_comment` VALUES (17, '@wualin\n回复一发', '2018-12-20 11:08:09.931488', 2, 13, 7);
INSERT INTO `blog_comment` VALUES (18, '再回复一发', '2018-12-20 11:16:01.584354', 2, 13, 7);
INSERT INTO `blog_comment` VALUES (19, '你丫是不是傻逼', '2018-12-20 11:37:29.076298', 2, 18, 7);
INSERT INTO `blog_comment` VALUES (20, '不用评论一发了！', '2018-12-20 11:37:50.708650', 2, 13, 7);
INSERT INTO `blog_comment` VALUES (21, '傻逼！', '2018-12-20 11:39:31.139277', 1, 12, 7);
INSERT INTO `blog_comment` VALUES (22, '闭嘴吧你！', '2018-12-20 11:40:54.508586', 1, 21, 1);
INSERT INTO `blog_comment` VALUES (23, '我也再发表一篇评论', '2018-12-20 11:44:37.724434', 1, 5, 1);
INSERT INTO `blog_comment` VALUES (25, '啪啪啪', '2018-12-20 11:51:00.480247', 5, 14, 7);
INSERT INTO `blog_comment` VALUES (26, '你大爷', '2018-12-20 12:00:53.340866', 5, 25, 7);
INSERT INTO `blog_comment` VALUES (27, '敲你吗', '2018-12-20 12:01:41.972783', 5, NULL, 7);
INSERT INTO `blog_comment` VALUES (41, '发表了一篇评论', '2018-12-20 20:21:10.724261', 1, NULL, 7);
INSERT INTO `blog_comment` VALUES (42, '再试一下', '2018-12-20 20:24:31.967570', 1, NULL, 7);
INSERT INTO `blog_comment` VALUES (43, '11111', '2018-12-20 20:28:39.240152', 1, NULL, 7);
INSERT INTO `blog_comment` VALUES (44, '再发送一篇邮件试试，有本事再报错试试！', '2018-12-20 20:35:16.723142', 1, NULL, 7);
COMMIT;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `blog_tag_blog_id_a8c60c42_fk_blog_blog_nid` (`blog_id`),
  CONSTRAINT `blog_tag_blog_id_a8c60c42_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_tag` VALUES (1, 'WEB', 1);
INSERT INTO `blog_tag` VALUES (2, 'Django', 1);
INSERT INTO `blog_tag` VALUES (3, '数据库', 2);
INSERT INTO `blog_tag` VALUES (4, '前端', 1);
INSERT INTO `blog_tag` VALUES (5, 'Django', 2);
INSERT INTO `blog_tag` VALUES (6, '后端', 6);
COMMIT;

-- ----------------------------
-- Table structure for blog_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo`;
CREATE TABLE `blog_userinfo` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(11) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `telephone` (`telephone`),
  UNIQUE KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_userinfo_blog_id_aa34488f_fk_blog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_userinfo
-- ----------------------------
BEGIN;
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$jXkmJ1TPJajj$qmVrTim20QJX1vLxzXL9CpX4TpAONjFw1FGIfBB/R1w=', '2018-12-21 14:19:03.007244', 1, 'wualin', '阿麟', '吴', '1032298871@qq.com', 1, 1, '2018-12-16 13:07:00.000000', 1, '15083623778', 'avatars/car2.png', '2018-12-16 13:07:04.012014', 1);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$gkL82Gr79IBM$hhYQK3q7fIbkcMHvdIDfLO8xAYLZECu+ANHwDAc7jc0=', '2018-12-21 14:03:26.719827', 0, 'zhangzz', '', '', '1032298871@qq.com', 0, 1, '2018-12-17 12:27:00.000000', 7, '18870285321', 'avatars/car1.png', '2018-12-17 12:27:15.145698', 2);
INSERT INTO `blog_userinfo` VALUES ('123456', NULL, 0, '吴阿麟', '', '', '', 0, 1, '2018-12-17 13:00:00.000000', 8, '18870285493', '/avatars/default.jpg', '2018-12-17 13:02:06.812264', 3);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$GSwtwEJgek0b$1+kG5yGakFP+7WM1SHXeYjhZ6NrqbN6rbWilcHNJEpA=', '2018-12-19 08:57:27.461814', 0, 'alex123', '', '', '123@qq.com', 0, 1, '2018-12-19 08:57:09.627622', 9, NULL, '/avatars/default.jpg', '2018-12-19 08:57:09.755111', NULL);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$sq4gENzlhnW1$h8ZfQ11HK+uDiXwIDYxFH/lTZXSYghGPg/fOCRttJxY=', '2018-12-21 14:28:13.081286', 0, 'tom123', '', '', '1032298871@qq.com', 0, 1, '2018-12-21 14:26:12.427932', 10, NULL, 'avatars/miao_3SCnrXC.jpg', '2018-12-21 14:26:12.556326', 5);
INSERT INTO `blog_userinfo` VALUES ('pbkdf2_sha256$120000$nh5fbNW1oPkx$7yfbl3QuNXvdjwtCv3Jt1VVIHr2u0UjzSITiW0BUhrY=', '2018-12-21 14:34:00.592843', 0, 'tom321', '', '', '1032298871@qq.com', 0, 1, '2018-12-21 14:33:43.074142', 11, NULL, '/avatars/default.jpg', '2018-12-21 14:33:43.205596', 6);
COMMIT;

-- ----------------------------
-- Table structure for blog_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo_groups`;
CREATE TABLE `blog_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_userinfo_groups_userinfo_id_group_id_5f60ecec_uniq` (`userinfo_id`,`group_id`),
  KEY `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `blog_userinfo_groups_group_id_1fb5e93a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `blog_userinfo_groups_userinfo_id_f6f0498b_fk_blog_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `blog_userinfo_user_permissions`;
CREATE TABLE `blog_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_userinfo_user_permi_userinfo_id_permission_i_7d343093_uniq` (`userinfo_id`,`permission_id`),
  KEY `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `blog_userinfo_user_p_permission_id_ace80f7e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `blog_userinfo_user_p_userinfo_id_57e76697_fk_blog_user` FOREIGN KEY (`userinfo_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_blog_userinfo_nid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `blog_userinfo` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2018-12-17 12:24:59.901762', '6', 'wualin222', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2018-12-17 12:24:59.904239', '5', 'zhangzz.', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (3, '2018-12-17 12:24:59.905530', '4', 'zhangzz', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (4, '2018-12-17 12:25:48.942265', '1', 'wualin', 2, '[{\"changed\": {\"fields\": [\"last_login\", \"first_name\", \"last_name\", \"telephone\", \"blog\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (5, '2018-12-17 12:25:53.290255', '1', 'wualin', 2, '[]', 6, 1);
INSERT INTO `django_admin_log` VALUES (6, '2018-12-17 12:28:47.824369', '1', 'Python', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (7, '2018-12-17 12:28:50.856129', '1', 'Python使用PIL模块生成随机验证码', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (8, '2018-12-17 12:29:16.386697', '2', 'Django之forms组件', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2018-12-17 12:29:46.470542', '3', 'Django与Ajax', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2018-12-17 12:30:20.403744', '2', 'Django', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2018-12-17 12:30:22.136891', '4', 'Django之模型层-多表操作', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (12, '2018-12-17 12:55:42.188808', '1', 'wualin', 2, '[{\"changed\": {\"fields\": [\"last_login\", \"avatar\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (13, '2018-12-17 13:01:24.794350', '3', '91社区', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (14, '2018-12-17 13:02:06.815382', '8', '吴阿麟', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (15, '2018-12-17 13:03:12.494893', '3', '吴阿麟的分类', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (16, '2018-12-17 13:03:14.363134', '5', 'Django之模板层-自定义过滤器以及标签', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (17, '2018-12-17 13:06:22.203768', '7', 'zhangzz', 2, '[{\"changed\": {\"fields\": [\"last_login\", \"telephone\", \"avatar\", \"blog\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (18, '2018-12-18 01:30:46.101877', '1', 'WEB', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (19, '2018-12-18 01:30:55.883718', '2', 'Django', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (20, '2018-12-18 01:31:05.183337', '3', '数据库', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (21, '2018-12-18 01:31:58.347896', '1', 'Django之forms组件---Django', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2018-12-18 01:32:11.049563', '2', 'Django与Ajax---Django', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2018-12-18 01:32:19.771205', '3', 'Django之模型层-多表操作---数据库', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (24, '2018-12-18 01:32:27.063744', '4', 'Django之模板层-自定义过滤器以及标签---Django', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (25, '2018-12-18 13:35:16.441443', '4', '数据库', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (26, '2018-12-18 14:25:03.769596', '6', 'MySQL学习笔记', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (27, '2018-12-18 14:30:39.053728', '4', 'Django之模板层-自定义过滤器以及标签---Django', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (28, '2018-12-19 08:24:23.095774', '1', 'Python使用PIL模块生成随机验证码', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (29, '2018-12-19 08:34:37.531526', '1', 'Python使用PIL模块生成随机验证码', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (30, '2018-12-19 08:36:25.618395', '1', 'Python使用PIL模块生成随机验证码', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (31, '2018-12-19 08:37:14.645625', '1', 'Python使用PIL模块生成随机验证码', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'blog', 'article');
INSERT INTO `django_content_type` VALUES (8, 'blog', 'article2tag');
INSERT INTO `django_content_type` VALUES (9, 'blog', 'articleupdown');
INSERT INTO `django_content_type` VALUES (10, 'blog', 'blog');
INSERT INTO `django_content_type` VALUES (11, 'blog', 'category');
INSERT INTO `django_content_type` VALUES (12, 'blog', 'comment');
INSERT INTO `django_content_type` VALUES (13, 'blog', 'tag');
INSERT INTO `django_content_type` VALUES (6, 'blog', 'userinfo');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-12-16 06:16:26.846673');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-12-16 06:16:26.884550');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-12-16 06:16:26.983829');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-12-16 06:16:27.003207');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-12-16 06:16:27.013854');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-12-16 06:16:27.021461');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-12-16 06:16:27.036190');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-12-16 06:16:27.039904');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-12-16 06:16:27.047187');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-12-16 06:16:27.060237');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-12-16 06:16:27.074198');
INSERT INTO `django_migrations` VALUES (12, 'blog', '0001_initial', '2018-12-16 06:16:27.562010');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2018-12-16 06:16:27.620417');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2018-12-16 06:16:27.633856');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0003_logentry_add_action_flag_choices', '2018-12-16 06:16:27.657018');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2018-12-16 06:16:27.689236');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('6jdtx4v22yotpbmj1cu97mgt4m344pcf', 'ZjAyNDdjOGQ1YTk5OTEwZDllYTJiNDZhNWZmMWUyM2MwNmE5YmRmMTp7InZlcmlmeSI6InpldUdWNCJ9', '2018-12-30 13:10:26.376458');
INSERT INTO `django_session` VALUES ('892kf4fhxheijowudf5ywmw24hky0207', 'ZDUxMjkxZGEzODBmZGVhODVkYmViNTY5ZjRlMGU2MjI2OWViOWIzNzp7InZlcmlmeSI6IktVTDVYTiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-31 01:37:02.014251');
INSERT INTO `django_session` VALUES ('arqnvw1l123aly7106ezzon7g7szid3a', 'NDhiYTM2MDhlOTc5NjhhYTQ4ZjExYzdjYzJlYTc1ZjBhZjc3ZjM0Yjp7InZlcmlmeSI6ImNnS1A5TCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-31 01:46:46.572328');
INSERT INTO `django_session` VALUES ('arzu6h9wn6ot652n4doz3egcf1ybtwpv', 'MDUwNzk2MWM5YzFjZTgyYzU2MWI4NTc1NTZhYTdjM2Y5MjBkNjIwZTp7InZlcmlmeSI6IkQ3NU5ONiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-30 13:56:22.945392');
INSERT INTO `django_session` VALUES ('cjlpv82g83iw0k4qemc9uxuj57ngdquf', 'ZDFmNTQzMDJjMDIzNzdlZTI4M2JlZDIxZDkyNTJjMmE4OTJmYThhYTp7InZlcmlmeSI6IncyemZ3RyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-30 13:24:42.682603');
INSERT INTO `django_session` VALUES ('echxdb1ea8xxhclopgyjqnnst6bxmy7v', 'N2IxZGUzZjY5Mzc5NTlhMDVlMTZkYmQyOWY3OWYzYjA4MDYyYTdiZTp7InZlcmlmeSI6IlhSZFBQaiJ9', '2018-12-30 13:10:40.405634');
INSERT INTO `django_session` VALUES ('ev4i89k71o8n20g06x5rf48p7gnwxfn4', 'MzdhMDUwZTY5YjJiMTYyNDAxNjdkZjQ5ZDAyYjJjMzIwNDRmZmY5Nzp7InZlcmlmeSI6IjV5NWVIbiIsImd0X3NlcnZlcl9zdGF0dXMiOjEsInVzZXJfaWQiOiJ0ZXN0IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMxNzE4OWExMjM3ODJhZmExZWY3OGMzYTAzNDgzMWY0YWViOTFlYWYifQ==', '2018-12-31 02:45:36.248296');
INSERT INTO `django_session` VALUES ('gcjq2g4aea8lenkrn6xrdqtcawbaj3g3', 'YWQwZWI5ODExMDM0M2YzMDNhZGMyY2NkN2RlYmIyMjEzYWY3N2UwZjp7InZlcmlmeSI6IjZEOVltcSJ9', '2018-12-30 13:12:28.432467');
INSERT INTO `django_session` VALUES ('i2sucp8j9yi5m5377heh7826z3hdr5r3', 'ZjBjNWViNjNmMjQwODRlZDU2NjRlM2QwYWEwNzU0NTNjYjJkN2E3Yjp7InZlcmlmeSI6IktuSjVsRSJ9', '2018-12-31 01:49:48.118053');
INSERT INTO `django_session` VALUES ('i4bdi4rd97hdc8i87d63dc5grlibh002', 'OWNjMDVlMDAwYTFkMjQ0NTE5MWQzMjUzODUzNmY4ZWFmZTQ1ZDliODp7InZlcmlmeSI6Ik5LNjExaCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-31 00:42:41.893564');
INSERT INTO `django_session` VALUES ('j0dee1vjxf69bbjwz6kvwjyqhgodk2qq', 'MTU3YTY5YmEzMzIyNDU4MjM4ZWYwZTVmMGVjZWU0OTMwMmJkMzI0Nzp7InZlcmlmeSI6ImJqOGUxZyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-30 13:21:48.035969');
INSERT INTO `django_session` VALUES ('qq7dsyflwyqapagq06ckqdbjf4a90rce', 'ZTBlNGMzMjAwMTI1NzJmZGZhMWEwZDVjMDM2NDEyN2I4YzY3ZWQ2ZTp7InZlcmlmeSI6Ik5yVmt1MyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-31 01:02:16.607332');
INSERT INTO `django_session` VALUES ('t15t4g4f044mw7ghln3ompcjg1ig9s5k', 'OTdiODgwZTI2NDAyMWYwNTA2YzQ4ZTQ4MGRhZDdjMzk4M2E1ZjlmODp7InZlcmlmeSI6IjlwanM3YSIsIl9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjIxNmE3MWU2YTYxMmY0MzEwODZhNjgyYjE2NWUxZmM3Njc0Mzc1ZSJ9', '2019-01-04 14:34:00.594669');
INSERT INTO `django_session` VALUES ('vjshim5uq1isa41enoghblb2p6lor4im', 'ZGE1N2ZjNzIzZWE0NzBjNzIyOWRlNTU4MjU5YTgyOGE0MWI4YzI1Njp7InZlcmlmeSI6IjBEVk83QyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-31 01:27:38.212620');
INSERT INTO `django_session` VALUES ('xm9jik0wqb6x67fezgod9iverj3ijq6r', 'MjA2NzQ1YTI3NzNjZWY4MTE1ZjUyNTA2MjJlZjYwMTVhZjYyMDIzMjp7InZlcmlmeSI6IkE3MFZ4UyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTcxODlhMTIzNzgyYWZhMWVmNzhjM2EwMzQ4MzFmNGFlYjkxZWFmIn0=', '2018-12-30 13:58:23.759168');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
