## phpMyAdmin SQL Dump
## version 2.6.4-pl2
## http://www.phpmyadmin.net
## 
## Host: localhost
## Generation Time: Dec 29, 2005 at 04:12 AM
## Server version: 4.0.16
## PHP Version: 4.3.11
## 
## Database: `domsnitt_p_nu1`
## 
DROP DATABASE `domsnitt_p_nu1`;
CREATE DATABASE `domsnitt_p_nu1`;
USE domsnitt_p_nu1;

## ########################################################

## 
## Table structure for table `nuke_aum_dupconfig`
## 

DROP TABLE IF EXISTS `nuke_aum_dupconfig`;
CREATE TABLE `nuke_aum_dupconfig` (
  `configid` int(11) NOT NULL auto_increment,
  `allowSchedule` tinyint(1) NOT NULL default '0',
  `duptime` int(11) NOT NULL default '0',
  `allowSendMail` tinyint(1) NOT NULL default '1',
  `duration` int(11) NOT NULL default '0',
  `mbtext` text NOT NULL,
  PRIMARY KEY  (`configid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_aum_dupconfig`
## 


## ########################################################

## 
## Table structure for table `nuke_aum_mfilter`
## 

DROP TABLE IF EXISTS `nuke_aum_mfilter`;
CREATE TABLE `nuke_aum_mfilter` (
  `mfid` int(11) NOT NULL auto_increment,
  `mdomain` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`mfid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_aum_mfilter`
## 


## ########################################################

## 
## Table structure for table `nuke_aum_pruneq`
## 

DROP TABLE IF EXISTS `nuke_aum_pruneq`;
CREATE TABLE `nuke_aum_pruneq` (
  `pqid` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `pqdue` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pqid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_aum_pruneq`
## 


## ########################################################

## 
## Table structure for table `nuke_authors`
## 

DROP TABLE IF EXISTS `nuke_authors`;
CREATE TABLE `nuke_authors` (
  `aid` varchar(25) NOT NULL default '',
  `name` varchar(50) default NULL,
  `url` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `pwd` varchar(40) default NULL,
  `counter` int(11) NOT NULL default '0',
  `radminsuper` tinyint(1) NOT NULL default '1',
  `admlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_authors`
## 

INSERT INTO `nuke_authors` (`aid`, `name`, `url`, `email`, `pwd`, `counter`, `radminsuper`, `admlanguage`) VALUES ('admin', 'God', 'http://', 'domsnitt@domsnittalumni.net', 'a947daa2a5822cce170e0fcc76eedada', 3, 1, 'english');
INSERT INTO `nuke_authors` (`aid`, `name`, `url`, `email`, `pwd`, `counter`, `radminsuper`, `admlanguage`) VALUES ('ContentAdmin', 'ContentAdmin', '', 'contentadmin@domsniittalumni.net', '38960ad9855343c7d028881bdce873da', 0, 0, '');
INSERT INTO `nuke_authors` (`aid`, `name`, `url`, `email`, `pwd`, `counter`, `radminsuper`, `admlanguage`) VALUES ('ShivaAdmin', 'shivaadmin', '', 'shiva@domsnittalumni.net', 'a947daa2a5822cce170e0fcc76eedada', 0, 1, '');

## ########################################################

## 
## Table structure for table `nuke_autonews`
## 

DROP TABLE IF EXISTS `nuke_autonews`;
CREATE TABLE `nuke_autonews` (
  `anid` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `aid` varchar(30) NOT NULL default '',
  `title` varchar(80) NOT NULL default '',
  `time` varchar(19) NOT NULL default '',
  `hometext` text NOT NULL,
  `bodytext` text NOT NULL,
  `topic` int(3) NOT NULL default '1',
  `informant` varchar(20) NOT NULL default '',
  `notes` text NOT NULL,
  `ihome` int(1) NOT NULL default '0',
  `alanguage` varchar(30) NOT NULL default '',
  `acomm` int(1) NOT NULL default '0',
  `associated` text NOT NULL,
  PRIMARY KEY  (`anid`),
  KEY `anid` (`anid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_autonews`
## 


## ########################################################

## 
## Table structure for table `nuke_banned_ip`
## 

DROP TABLE IF EXISTS `nuke_banned_ip`;
CREATE TABLE `nuke_banned_ip` (
  `id` int(11) NOT NULL auto_increment,
  `ip_address` varchar(15) NOT NULL default '',
  `reason` varchar(255) NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_banned_ip`
## 


## ########################################################

## 
## Table structure for table `nuke_banner`
## 

DROP TABLE IF EXISTS `nuke_banner`;
CREATE TABLE `nuke_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `alttext` varchar(255) NOT NULL default '',
  `date` datetime default NULL,
  `dateend` datetime default NULL,
  `type` tinyint(1) NOT NULL default '0',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`bid`),
  KEY `bid` (`bid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_banner`
## 


## ########################################################

## 
## Table structure for table `nuke_bannerclient`
## 

DROP TABLE IF EXISTS `nuke_bannerclient`;
CREATE TABLE `nuke_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `contact` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `login` varchar(10) NOT NULL default '',
  `passwd` varchar(10) NOT NULL default '',
  `extrainfo` text NOT NULL,
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_bannerclient`
## 


## ########################################################

## 
## Table structure for table `nuke_bbauth_access`
## 

DROP TABLE IF EXISTS `nuke_bbauth_access`;
CREATE TABLE `nuke_bbauth_access` (
  `group_id` mediumint(8) NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `auth_view` tinyint(1) NOT NULL default '0',
  `auth_read` tinyint(1) NOT NULL default '0',
  `auth_post` tinyint(1) NOT NULL default '0',
  `auth_reply` tinyint(1) NOT NULL default '0',
  `auth_edit` tinyint(1) NOT NULL default '0',
  `auth_delete` tinyint(1) NOT NULL default '0',
  `auth_sticky` tinyint(1) NOT NULL default '0',
  `auth_announce` tinyint(1) NOT NULL default '0',
  `auth_vote` tinyint(1) NOT NULL default '0',
  `auth_pollcreate` tinyint(1) NOT NULL default '0',
  `auth_attachments` tinyint(1) NOT NULL default '0',
  `auth_mod` tinyint(1) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `forum_id` (`forum_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbauth_access`
## 


## ########################################################

## 
## Table structure for table `nuke_bbbanlist`
## 

DROP TABLE IF EXISTS `nuke_bbbanlist`;
CREATE TABLE `nuke_bbbanlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) NOT NULL default '0',
  `ban_ip` varchar(8) NOT NULL default '',
  `ban_email` varchar(255) default NULL,
  `ban_time` int(11) default NULL,
  `ban_expire_time` int(11) default NULL,
  `ban_by_userid` mediumint(8) default NULL,
  `ban_priv_reason` text,
  `ban_pub_reason_mode` tinyint(1) default NULL,
  `ban_pub_reason` text,
  PRIMARY KEY  (`ban_id`),
  KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_bbbanlist`
## 


## ########################################################

## 
## Table structure for table `nuke_bbcategories`
## 

DROP TABLE IF EXISTS `nuke_bbcategories`;
CREATE TABLE `nuke_bbcategories` (
  `cat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_title` varchar(100) default NULL,
  `cat_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_order` (`cat_order`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

## 
## Dumping data for table `nuke_bbcategories`
## 

INSERT INTO `nuke_bbcategories` (`cat_id`, `cat_title`, `cat_order`) VALUES (2, 'Website', 10);
INSERT INTO `nuke_bbcategories` (`cat_id`, `cat_title`, `cat_order`) VALUES (3, 'DASF', 20);
INSERT INTO `nuke_bbcategories` (`cat_id`, `cat_title`, `cat_order`) VALUES (4, 'Connect', 30);

## ########################################################

## 
## Table structure for table `nuke_bbconfig`
## 

DROP TABLE IF EXISTS `nuke_bbconfig`;
CREATE TABLE `nuke_bbconfig` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbconfig`
## 

INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('config_id', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('board_disable', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('sitename', 'MySite.com');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('site_desc', '');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('cookie_name', 'phpbb2mysql');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('cookie_path', '/');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('cookie_domain', 'MySite.com');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('cookie_secure', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('session_length', '3600');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_html', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_html_tags', 'b,i,u,pre');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_bbcode', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_smilies', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_sig', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_namechange', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_theme_create', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_avatar_local', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_avatar_remote', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('allow_avatar_upload', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('override_user_style', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('posts_per_page', '15');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('topics_per_page', '50');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('hot_threshold', '25');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('max_poll_options', '10');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('max_sig_chars', '255');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('max_inbox_privmsgs', '100');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('max_sentbox_privmsgs', '100');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('max_savebox_privmsgs', '100');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('board_email_sig', 'Thanks, Webmaster@MySite.com');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('board_email', 'Webmaster@MySite.com');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('smtp_delivery', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('smtp_host', '');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('require_activation', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('flood_interval', '15');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('board_email_form', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('avatar_filesize', '6144');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('avatar_max_width', '80');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('avatar_max_height', '80');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('avatar_path', 'modules/Forums/images/avatars');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('avatar_gallery_path', 'modules/Forums/images/avatars');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('smilies_path', 'modules/Forums/images/smiles');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('default_style', '1');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('default_dateformat', 'D M d, Y g:i a');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('board_timezone', '10');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('prune_enable', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('privmsg_disable', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('gzip_compress', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('coppa_fax', '');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('coppa_mail', '');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('board_startdate', '1013908210');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('default_lang', 'english');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('smtp_username', '');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('smtp_password', '');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('record_online_users', '2');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('record_online_date', '1034668530');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('server_name', 'MySite.com');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('server_port', '80');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('script_path', '/modules/Forums/');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('version', '.0.10');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('enable_confirm', '0');
INSERT INTO `nuke_bbconfig` (`config_name`, `config_value`) VALUES ('sendmail_fix', '0');

## ########################################################

## 
## Table structure for table `nuke_bbdisallow`
## 

DROP TABLE IF EXISTS `nuke_bbdisallow`;
CREATE TABLE `nuke_bbdisallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(25) default NULL,
  PRIMARY KEY  (`disallow_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_bbdisallow`
## 


## ########################################################

## 
## Table structure for table `nuke_bbforum_prune`
## 

DROP TABLE IF EXISTS `nuke_bbforum_prune`;
CREATE TABLE `nuke_bbforum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `prune_days` tinyint(4) unsigned NOT NULL default '0',
  `prune_freq` tinyint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`prune_id`),
  KEY `forum_id` (`forum_id`)
) TYPE=MyISAM AUTO_INCREMENT=25 ;

## 
## Dumping data for table `nuke_bbforum_prune`
## 

INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (1, 1, 14, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (2, 3, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (3, 4, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (4, 6, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (5, 7, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (6, 8, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (7, 9, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (8, 10, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (9, 11, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (10, 12, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (11, 13, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (12, 14, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (13, 15, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (14, 16, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (15, 17, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (16, 18, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (17, 19, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (18, 20, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (19, 21, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (20, 22, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (21, 23, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (22, 24, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (23, 25, 7, 1);
INSERT INTO `nuke_bbforum_prune` (`prune_id`, `forum_id`, `prune_days`, `prune_freq`) VALUES (24, 26, 7, 1);

## ########################################################

## 
## Table structure for table `nuke_bbforums`
## 

DROP TABLE IF EXISTS `nuke_bbforums`;
CREATE TABLE `nuke_bbforums` (
  `forum_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_name` varchar(150) default NULL,
  `forum_desc` text,
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_order` mediumint(8) unsigned NOT NULL default '1',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `prune_next` int(11) default NULL,
  `prune_enable` tinyint(1) NOT NULL default '1',
  `auth_view` tinyint(2) NOT NULL default '0',
  `auth_read` tinyint(2) NOT NULL default '0',
  `auth_post` tinyint(2) NOT NULL default '0',
  `auth_reply` tinyint(2) NOT NULL default '0',
  `auth_edit` tinyint(2) NOT NULL default '0',
  `auth_delete` tinyint(2) NOT NULL default '0',
  `auth_sticky` tinyint(2) NOT NULL default '0',
  `auth_announce` tinyint(2) NOT NULL default '0',
  `auth_vote` tinyint(2) NOT NULL default '0',
  `auth_pollcreate` tinyint(2) NOT NULL default '0',
  `auth_attachments` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `forums_order` (`forum_order`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) TYPE=MyISAM AUTO_INCREMENT=27 ;

## 
## Dumping data for table `nuke_bbforums`
## 

INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (1, 2, 'Support', 'Posts related Alumni Website usage', 0, 10, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (2, 3, 'Charter', 'Discussions regarding DASF Charter', 0, 10, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (3, 4, '1984', 'Class of 1984', 0, 10, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (4, 4, '1985', 'Class of 1985', 0, 20, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (5, 4, '1986', 'Class of 1986', 0, 30, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (6, 4, '1987', 'Class of 1987', 0, 40, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (7, 4, '1988', 'Class of 1988', 0, 50, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (8, 4, '1989', 'Class of 1989', 0, 60, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (9, 4, '1990', 'Class of 1990', 0, 70, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (10, 4, '1991', 'Class of 1991', 0, 80, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (11, 4, '1992', 'Class of 1992', 0, 90, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (12, 4, '1993', 'Class of 1993', 0, 100, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (13, 4, '1994', 'Class of 1994', 0, 110, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (14, 4, '1995', 'Class of 1995', 0, 120, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (15, 4, '1996', 'Class of 1996', 0, 130, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (16, 4, '1997', 'Class of 1997', 0, 140, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (17, 4, '1998', 'Class of 1998', 0, 150, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (18, 4, '1999', 'Class of 1999', 0, 160, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (19, 4, '2000', 'Class of 2000', 0, 170, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (20, 4, '2001', 'Class of 2001', 0, 180, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (21, 4, '2002', 'Class of 2002', 0, 190, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (22, 4, '2003', 'Class of 2003', 0, 200, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (23, 4, '2004', 'Class of 2004', 0, 210, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (24, 4, '2005', 'Class of 2005', 0, 220, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (25, 4, '2006', 'Class of 2006', 0, 230, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` (`forum_id`, `cat_id`, `forum_name`, `forum_desc`, `forum_status`, `forum_order`, `forum_posts`, `forum_topics`, `forum_last_post_id`, `prune_next`, `prune_enable`, `auth_view`, `auth_read`, `auth_post`, `auth_reply`, `auth_edit`, `auth_delete`, `auth_sticky`, `auth_announce`, `auth_vote`, `auth_pollcreate`, `auth_attachments`) VALUES (26, 4, '2007', 'Class of 2007', 0, 240, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);

## ########################################################

## 
## Table structure for table `nuke_bbgroups`
## 

DROP TABLE IF EXISTS `nuke_bbgroups`;
CREATE TABLE `nuke_bbgroups` (
  `group_id` mediumint(8) NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_name` varchar(40) NOT NULL default '',
  `group_description` varchar(255) NOT NULL default '',
  `group_moderator` mediumint(8) NOT NULL default '0',
  `group_single_user` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_single_user` (`group_single_user`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

## 
## Dumping data for table `nuke_bbgroups`
## 

INSERT INTO `nuke_bbgroups` (`group_id`, `group_type`, `group_name`, `group_description`, `group_moderator`, `group_single_user`) VALUES (1, 1, 'Anonymous', 'Personal User', 0, 1);

## ########################################################

## 
## Table structure for table `nuke_bbposts`
## 

DROP TABLE IF EXISTS `nuke_bbposts`;
CREATE TABLE `nuke_bbposts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) NOT NULL default '0',
  `post_time` int(11) NOT NULL default '0',
  `poster_ip` varchar(8) NOT NULL default '',
  `post_username` varchar(25) default NULL,
  `enable_bbcode` tinyint(1) NOT NULL default '1',
  `enable_html` tinyint(1) NOT NULL default '0',
  `enable_smilies` tinyint(1) NOT NULL default '1',
  `enable_sig` tinyint(1) NOT NULL default '1',
  `post_edit_time` int(11) default NULL,
  `post_edit_count` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `post_time` (`post_time`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

## 
## Dumping data for table `nuke_bbposts`
## 


## ########################################################

## 
## Table structure for table `nuke_bbposts_text`
## 

DROP TABLE IF EXISTS `nuke_bbposts_text`;
CREATE TABLE `nuke_bbposts_text` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `bbcode_uid` varchar(10) NOT NULL default '',
  `post_subject` varchar(60) default NULL,
  `post_text` text,
  PRIMARY KEY  (`post_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbposts_text`
## 


## ########################################################

## 
## Table structure for table `nuke_bbprivmsgs`
## 

DROP TABLE IF EXISTS `nuke_bbprivmsgs`;
CREATE TABLE `nuke_bbprivmsgs` (
  `privmsgs_id` mediumint(8) unsigned NOT NULL auto_increment,
  `privmsgs_type` tinyint(4) NOT NULL default '0',
  `privmsgs_subject` varchar(255) NOT NULL default '0',
  `privmsgs_from_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_to_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_date` int(11) NOT NULL default '0',
  `privmsgs_ip` varchar(8) NOT NULL default '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL default '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL default '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL default '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`privmsgs_id`),
  KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  KEY `privmsgs_to_userid` (`privmsgs_to_userid`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

## 
## Dumping data for table `nuke_bbprivmsgs`
## 

INSERT INTO `nuke_bbprivmsgs` (`privmsgs_id`, `privmsgs_type`, `privmsgs_subject`, `privmsgs_from_userid`, `privmsgs_to_userid`, `privmsgs_date`, `privmsgs_ip`, `privmsgs_enable_bbcode`, `privmsgs_enable_html`, `privmsgs_enable_smilies`, `privmsgs_attach_sig`) VALUES (4, 1, 'hi', 10, 8, 1135855880, 'cbc8d341', 1, 1, 1, 0);
INSERT INTO `nuke_bbprivmsgs` (`privmsgs_id`, `privmsgs_type`, `privmsgs_subject`, `privmsgs_from_userid`, `privmsgs_to_userid`, `privmsgs_date`, `privmsgs_ip`, `privmsgs_enable_bbcode`, `privmsgs_enable_html`, `privmsgs_enable_smilies`, `privmsgs_attach_sig`) VALUES (3, 1, 'hi', 12, 11, 1135847567, '3b5c9e47', 1, 1, 1, 0);

## ########################################################

## 
## Table structure for table `nuke_bbprivmsgs_text`
## 

DROP TABLE IF EXISTS `nuke_bbprivmsgs_text`;
CREATE TABLE `nuke_bbprivmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL default '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL default '0',
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_text_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbprivmsgs_text`
## 

INSERT INTO `nuke_bbprivmsgs_text` (`privmsgs_text_id`, `privmsgs_bbcode_uid`, `privmsgs_text`) VALUES (3, 'aa95dadc1b', ':P  :evil:  :?:  :?:  :?:  :?:  :?:');
INSERT INTO `nuke_bbprivmsgs_text` (`privmsgs_text_id`, `privmsgs_bbcode_uid`, `privmsgs_text`) VALUES (4, 'ace7929629', 'Satish,\r\n\r\ncan this place be used as a forum where DASF members can have discussion?\r\n\r\nLalit');

## ########################################################

## 
## Table structure for table `nuke_bbranks`
## 

DROP TABLE IF EXISTS `nuke_bbranks`;
CREATE TABLE `nuke_bbranks` (
  `rank_id` smallint(5) unsigned NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` mediumint(8) NOT NULL default '0',
  `rank_max` mediumint(8) NOT NULL default '0',
  `rank_special` tinyint(1) default '0',
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

## 
## Dumping data for table `nuke_bbranks`
## 

INSERT INTO `nuke_bbranks` (`rank_id`, `rank_title`, `rank_min`, `rank_max`, `rank_special`, `rank_image`) VALUES (1, 'Site Admin', -1, -1, 1, 'modules/Forums/images/ranks/6stars.gif');
INSERT INTO `nuke_bbranks` (`rank_id`, `rank_title`, `rank_min`, `rank_max`, `rank_special`, `rank_image`) VALUES (2, 'Newbie', 1, 0, 0, 'modules/Forums/images/ranks/1star.gif');

## ########################################################

## 
## Table structure for table `nuke_bbsearch_results`
## 

DROP TABLE IF EXISTS `nuke_bbsearch_results`;
CREATE TABLE `nuke_bbsearch_results` (
  `search_id` int(11) unsigned NOT NULL default '0',
  `session_id` varchar(32) NOT NULL default '',
  `search_array` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `session_id` (`session_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbsearch_results`
## 


## ########################################################

## 
## Table structure for table `nuke_bbsearch_wordlist`
## 

DROP TABLE IF EXISTS `nuke_bbsearch_wordlist`;
CREATE TABLE `nuke_bbsearch_wordlist` (
  `word_text` varchar(50) binary NOT NULL default '',
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_text`),
  KEY `word_id` (`word_id`)
) TYPE=MyISAM AUTO_INCREMENT=15 ;

## 
## Dumping data for table `nuke_bbsearch_wordlist`
## 

INSERT INTO `nuke_bbsearch_wordlist` (`word_text`, `word_id`, `word_common`) VALUES (0x6665617475726573, 1, 0);
INSERT INTO `nuke_bbsearch_wordlist` (`word_text`, `word_id`, `word_common`) VALUES (0x7365637572697479, 2, 0);
INSERT INTO `nuke_bbsearch_wordlist` (`word_text`, `word_id`, `word_common`) VALUES (0x7375636b73, 3, 0);
INSERT INTO `nuke_bbsearch_wordlist` (`word_text`, `word_id`, `word_common`) VALUES (0x74657374696e67, 4, 0);

## ########################################################

## 
## Table structure for table `nuke_bbsearch_wordmatch`
## 

DROP TABLE IF EXISTS `nuke_bbsearch_wordmatch`;
CREATE TABLE `nuke_bbsearch_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) NOT NULL default '0',
  KEY `word_id` (`word_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbsearch_wordmatch`
## 


## ########################################################

## 
## Table structure for table `nuke_bbsessions`
## 

DROP TABLE IF EXISTS `nuke_bbsessions`;
CREATE TABLE `nuke_bbsessions` (
  `session_id` char(32) NOT NULL default '',
  `session_user_id` mediumint(8) NOT NULL default '0',
  `session_start` int(11) NOT NULL default '0',
  `session_time` int(11) NOT NULL default '0',
  `session_ip` char(8) NOT NULL default '0',
  `session_page` int(11) NOT NULL default '0',
  `session_logged_in` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_id_ip_user_id` (`session_id`,`session_ip`,`session_user_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbsessions`
## 

INSERT INTO `nuke_bbsessions` (`session_id`, `session_user_id`, `session_start`, `session_time`, `session_ip`, `session_page`, `session_logged_in`) VALUES ('0866abc94cac40f73635cabadcacff44', 1, 1135853602, 1135853602, 'dd867d02', -4, 0);
INSERT INTO `nuke_bbsessions` (`session_id`, `session_user_id`, `session_start`, `session_time`, `session_ip`, `session_page`, `session_logged_in`) VALUES ('043577d282453da984a2a9abc5959224', 1, 1135855480, 1135855480, 'dd867d02', -10, 0);
INSERT INTO `nuke_bbsessions` (`session_id`, `session_user_id`, `session_start`, `session_time`, `session_ip`, `session_page`, `session_logged_in`) VALUES ('e813cf9aa18277ec4b4b829d7d3c0b0e', 1, 1135857047, 1135857047, 'dd867d02', 0, 0);
INSERT INTO `nuke_bbsessions` (`session_id`, `session_user_id`, `session_start`, `session_time`, `session_ip`, `session_page`, `session_logged_in`) VALUES ('29a8a931e4e2c546c64650d13c8fa83d', 1, 1135857211, 1135857211, 'dd867d02', 0, 0);
INSERT INTO `nuke_bbsessions` (`session_id`, `session_user_id`, `session_start`, `session_time`, `session_ip`, `session_page`, `session_logged_in`) VALUES ('6ba8b32d464b2d6634dbda950c364ea2', 1, 1135857040, 1135857040, 'dd867d02', 0, 0);

## ########################################################

## 
## Table structure for table `nuke_bbsmilies`
## 

DROP TABLE IF EXISTS `nuke_bbsmilies`;
CREATE TABLE `nuke_bbsmilies` (
  `smilies_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(50) default NULL,
  `smile_url` varchar(100) default NULL,
  `emoticon` varchar(75) default NULL,
  PRIMARY KEY  (`smilies_id`)
) TYPE=MyISAM AUTO_INCREMENT=45 ;

## 
## Dumping data for table `nuke_bbsmilies`
## 

INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (1, ':D', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (2, ':-D', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (3, ':grin:', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (4, ':)', 'icon_smile.gif', 'Smile');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (5, ':-)', 'icon_smile.gif', 'Smile');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (6, ':smile:', 'icon_smile.gif', 'Smile');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (7, ':(', 'icon_sad.gif', 'Sad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (8, ':-(', 'icon_sad.gif', 'Sad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (9, ':sad:', 'icon_sad.gif', 'Sad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (10, ':o', 'icon_surprised.gif', 'Surprised');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (11, ':-o', 'icon_surprised.gif', 'Surprised');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (12, ':eek:', 'icon_surprised.gif', 'Surprised');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (13, '8O', 'icon_eek.gif', 'Shocked');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (14, '8-O', 'icon_eek.gif', 'Shocked');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (15, ':shock:', 'icon_eek.gif', 'Shocked');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (16, ':?', 'icon_confused.gif', 'Confused');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (17, ':-?', 'icon_confused.gif', 'Confused');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (18, ':???:', 'icon_confused.gif', 'Confused');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (19, '8)', 'icon_cool.gif', 'Cool');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (20, '8-)', 'icon_cool.gif', 'Cool');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (21, ':cool:', 'icon_cool.gif', 'Cool');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (22, ':lol:', 'icon_lol.gif', 'Laughing');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (23, ':x', 'icon_mad.gif', 'Mad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (24, ':-x', 'icon_mad.gif', 'Mad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (25, ':mad:', 'icon_mad.gif', 'Mad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (26, ':P', 'icon_razz.gif', 'Razz');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (27, ':-P', 'icon_razz.gif', 'Razz');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (28, ':razz:', 'icon_razz.gif', 'Razz');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (29, ':oops:', 'icon_redface.gif', 'Embarassed');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (30, ':cry:', 'icon_cry.gif', 'Crying or Very sad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (31, ':evil:', 'icon_evil.gif', 'Evil or Very Mad');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (32, ':twisted:', 'icon_twisted.gif', 'Twisted Evil');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (33, ':roll:', 'icon_rolleyes.gif', 'Rolling Eyes');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (34, ':wink:', 'icon_wink.gif', 'Wink');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (35, ';)', 'icon_wink.gif', 'Wink');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (36, ';-)', 'icon_wink.gif', 'Wink');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (37, ':!:', 'icon_exclaim.gif', 'Exclamation');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (38, ':?:', 'icon_question.gif', 'Question');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (39, ':idea:', 'icon_idea.gif', 'Idea');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (40, ':arrow:', 'icon_arrow.gif', 'Arrow');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (41, ':|', 'icon_neutral.gif', 'Neutral');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (42, ':-|', 'icon_neutral.gif', 'Neutral');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (43, ':neutral:', 'icon_neutral.gif', 'Neutral');
INSERT INTO `nuke_bbsmilies` (`smilies_id`, `code`, `smile_url`, `emoticon`) VALUES (44, ':mrgreen:', 'icon_mrgreen.gif', 'Mr. Green');

## ########################################################

## 
## Table structure for table `nuke_bbthemes`
## 

DROP TABLE IF EXISTS `nuke_bbthemes`;
CREATE TABLE `nuke_bbthemes` (
  `themes_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(30) NOT NULL default '',
  `style_name` varchar(30) NOT NULL default '',
  `head_stylesheet` varchar(100) default NULL,
  `body_background` varchar(100) default NULL,
  `body_bgcolor` varchar(6) default NULL,
  `body_text` varchar(6) default NULL,
  `body_link` varchar(6) default NULL,
  `body_vlink` varchar(6) default NULL,
  `body_alink` varchar(6) default NULL,
  `body_hlink` varchar(6) default NULL,
  `tr_color1` varchar(6) default NULL,
  `tr_color2` varchar(6) default NULL,
  `tr_color3` varchar(6) default NULL,
  `tr_class1` varchar(25) default NULL,
  `tr_class2` varchar(25) default NULL,
  `tr_class3` varchar(25) default NULL,
  `th_color1` varchar(6) default NULL,
  `th_color2` varchar(6) default NULL,
  `th_color3` varchar(6) default NULL,
  `th_class1` varchar(25) default NULL,
  `th_class2` varchar(25) default NULL,
  `th_class3` varchar(25) default NULL,
  `td_color1` varchar(6) default NULL,
  `td_color2` varchar(6) default NULL,
  `td_color3` varchar(6) default NULL,
  `td_class1` varchar(25) default NULL,
  `td_class2` varchar(25) default NULL,
  `td_class3` varchar(25) default NULL,
  `fontface1` varchar(50) default NULL,
  `fontface2` varchar(50) default NULL,
  `fontface3` varchar(50) default NULL,
  `fontsize1` tinyint(4) default NULL,
  `fontsize2` tinyint(4) default NULL,
  `fontsize3` tinyint(4) default NULL,
  `fontcolor1` varchar(6) default NULL,
  `fontcolor2` varchar(6) default NULL,
  `fontcolor3` varchar(6) default NULL,
  `span_class1` varchar(25) default NULL,
  `span_class2` varchar(25) default NULL,
  `span_class3` varchar(25) default NULL,
  `img_size_poll` smallint(5) unsigned default NULL,
  `img_size_privmsg` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`themes_id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_bbthemes`
## 

INSERT INTO `nuke_bbthemes` (`themes_id`, `template_name`, `style_name`, `head_stylesheet`, `body_background`, `body_bgcolor`, `body_text`, `body_link`, `body_vlink`, `body_alink`, `body_hlink`, `tr_color1`, `tr_color2`, `tr_color3`, `tr_class1`, `tr_class2`, `tr_class3`, `th_color1`, `th_color2`, `th_color3`, `th_class1`, `th_class2`, `th_class3`, `td_color1`, `td_color2`, `td_color3`, `td_class1`, `td_class2`, `td_class3`, `fontface1`, `fontface2`, `fontface3`, `fontsize1`, `fontsize2`, `fontsize3`, `fontcolor1`, `fontcolor2`, `fontcolor3`, `span_class1`, `span_class2`, `span_class3`, `img_size_poll`, `img_size_privmsg`) VALUES (1, 'subSilver', 'subSilver', 'subSilver.css', '', '0E3259', '000000', '006699', '5493B4', '', 'DD6900', 'EFEFEF', 'DEE3E7', 'D1D7DC', '', '', '', '98AAB1', '006699', 'FFFFFF', 'cellpic1.gif', 'cellpic3.gif', 'cellpic2.jpg', 'FAFAFA', 'FFFFFF', '', 'row1', 'row2', '', 'Verdana, Arial, Helvetica, sans-serif', 'Trebuchet MS', 'Courier, ''Courier New'', sans-serif', 10, 11, 12, '444444', '006600', 'FFA34F', '', '', '', NULL, NULL);

## ########################################################

## 
## Table structure for table `nuke_bbthemes_name`
## 

DROP TABLE IF EXISTS `nuke_bbthemes_name`;
CREATE TABLE `nuke_bbthemes_name` (
  `themes_id` smallint(5) unsigned NOT NULL default '0',
  `tr_color1_name` char(50) default NULL,
  `tr_color2_name` char(50) default NULL,
  `tr_color3_name` char(50) default NULL,
  `tr_class1_name` char(50) default NULL,
  `tr_class2_name` char(50) default NULL,
  `tr_class3_name` char(50) default NULL,
  `th_color1_name` char(50) default NULL,
  `th_color2_name` char(50) default NULL,
  `th_color3_name` char(50) default NULL,
  `th_class1_name` char(50) default NULL,
  `th_class2_name` char(50) default NULL,
  `th_class3_name` char(50) default NULL,
  `td_color1_name` char(50) default NULL,
  `td_color2_name` char(50) default NULL,
  `td_color3_name` char(50) default NULL,
  `td_class1_name` char(50) default NULL,
  `td_class2_name` char(50) default NULL,
  `td_class3_name` char(50) default NULL,
  `fontface1_name` char(50) default NULL,
  `fontface2_name` char(50) default NULL,
  `fontface3_name` char(50) default NULL,
  `fontsize1_name` char(50) default NULL,
  `fontsize2_name` char(50) default NULL,
  `fontsize3_name` char(50) default NULL,
  `fontcolor1_name` char(50) default NULL,
  `fontcolor2_name` char(50) default NULL,
  `fontcolor3_name` char(50) default NULL,
  `span_class1_name` char(50) default NULL,
  `span_class2_name` char(50) default NULL,
  `span_class3_name` char(50) default NULL,
  PRIMARY KEY  (`themes_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbthemes_name`
## 

INSERT INTO `nuke_bbthemes_name` (`themes_id`, `tr_color1_name`, `tr_color2_name`, `tr_color3_name`, `tr_class1_name`, `tr_class2_name`, `tr_class3_name`, `th_color1_name`, `th_color2_name`, `th_color3_name`, `th_class1_name`, `th_class2_name`, `th_class3_name`, `td_color1_name`, `td_color2_name`, `td_color3_name`, `td_class1_name`, `td_class2_name`, `td_class3_name`, `fontface1_name`, `fontface2_name`, `fontface3_name`, `fontsize1_name`, `fontsize2_name`, `fontsize3_name`, `fontcolor1_name`, `fontcolor2_name`, `fontcolor3_name`, `span_class1_name`, `span_class2_name`, `span_class3_name`) VALUES (1, 'The lightest row colour', 'The medium row color', 'The darkest row colour', '', '', '', 'Border round the whole page', 'Outer table border', 'Inner table border', 'Silver gradient picture', 'Blue gradient picture', 'Fade-out gradient on index', 'Background for quote boxes', 'All white areas', '', 'Background for topic posts', '2nd background for topic posts', '', 'Main fonts', 'Additional topic title font', 'Form fonts', 'Smallest font size', 'Medium font size', 'Normal font size (post body etc)', 'Quote & copyright text', 'Code text colour', 'Main table header text colour', '', '', '');

## ########################################################

## 
## Table structure for table `nuke_bbtopics`
## 

DROP TABLE IF EXISTS `nuke_bbtopics`;
CREATE TABLE `nuke_bbtopics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(8) unsigned NOT NULL default '0',
  `topic_title` char(60) NOT NULL default '',
  `topic_poster` mediumint(8) NOT NULL default '0',
  `topic_time` int(11) NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_vote` tinyint(1) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_moved_id` (`topic_moved_id`),
  KEY `topic_status` (`topic_status`),
  KEY `topic_type` (`topic_type`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_bbtopics`
## 


## ########################################################

## 
## Table structure for table `nuke_bbtopics_watch`
## 

DROP TABLE IF EXISTS `nuke_bbtopics_watch`;
CREATE TABLE `nuke_bbtopics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `notify_status` tinyint(1) NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_status` (`notify_status`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbtopics_watch`
## 


## ########################################################

## 
## Table structure for table `nuke_bbuser_group`
## 

DROP TABLE IF EXISTS `nuke_bbuser_group`;
CREATE TABLE `nuke_bbuser_group` (
  `group_id` mediumint(8) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `user_pending` tinyint(1) default NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbuser_group`
## 

INSERT INTO `nuke_bbuser_group` (`group_id`, `user_id`, `user_pending`) VALUES (1, -1, 0);

## ########################################################

## 
## Table structure for table `nuke_bbvote_desc`
## 

DROP TABLE IF EXISTS `nuke_bbvote_desc`;
CREATE TABLE `nuke_bbvote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_text` text NOT NULL,
  `vote_start` int(11) NOT NULL default '0',
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_bbvote_desc`
## 


## ########################################################

## 
## Table structure for table `nuke_bbvote_results`
## 

DROP TABLE IF EXISTS `nuke_bbvote_results`;
CREATE TABLE `nuke_bbvote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbvote_results`
## 


## ########################################################

## 
## Table structure for table `nuke_bbvote_voters`
## 

DROP TABLE IF EXISTS `nuke_bbvote_voters`;
CREATE TABLE `nuke_bbvote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_id` mediumint(8) NOT NULL default '0',
  `vote_user_ip` char(8) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_bbvote_voters`
## 


## ########################################################

## 
## Table structure for table `nuke_bbwords`
## 

DROP TABLE IF EXISTS `nuke_bbwords`;
CREATE TABLE `nuke_bbwords` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` char(100) NOT NULL default '',
  `replacement` char(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_bbwords`
## 


## ########################################################

## 
## Table structure for table `nuke_blocks`
## 

DROP TABLE IF EXISTS `nuke_blocks`;
CREATE TABLE `nuke_blocks` (
  `bid` int(10) NOT NULL auto_increment,
  `bkey` varchar(15) NOT NULL default '',
  `title` varchar(60) NOT NULL default '',
  `content` text NOT NULL,
  `url` varchar(200) NOT NULL default '',
  `bposition` char(1) NOT NULL default '',
  `weight` int(10) NOT NULL default '1',
  `active` int(1) NOT NULL default '1',
  `refresh` int(10) NOT NULL default '0',
  `time` varchar(14) NOT NULL default '0',
  `blanguage` varchar(30) NOT NULL default '',
  `blockfile` varchar(255) NOT NULL default '',
  `view` int(1) NOT NULL default '0',
  `expire` varchar(14) NOT NULL default '0',
  `action` char(1) NOT NULL default '',
  `subscription` int(1) NOT NULL default '0',
  PRIMARY KEY  (`bid`),
  KEY `bid` (`bid`),
  KEY `title` (`title`)
) TYPE=MyISAM AUTO_INCREMENT=21 ;

## 
## Dumping data for table `nuke_blocks`
## 

INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (1, '', 'Navigation', '', '', 'l', 1, 1, 0, '', '', 'block-Modules.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (2, 'admin', 'Administration', '<strong><big>·</big></strong> <a href="admin.php">Administration</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=adminStory">NEW Story</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=create">Change Survey</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=content">Content</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=logout">Logout</a>', '', 'l', 2, 1, 0, '985591188', '', '', 2, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (3, '', 'Who''s Online', '', '', 'r', 5, 1, 0, '', '', 'block-doms-CZUser-Info.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (4, '', 'Search', '', '', 'l', 3, 0, 3600, '', '', 'block-Search.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (5, '', 'Languages', '', '', 'l', 4, 0, 3600, '', '', 'block-Languages.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (6, '', 'Random Headlines', '', '', 'l', 5, 0, 3600, '', '', 'block-Random_Headlines.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (8, 'userbox', 'User''s Custom Box', '', '', 'r', 3, 0, 0, '', '', '', 1, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (9, '', 'Categories Menu', '', '', 'r', 6, 0, 0, '', '', 'block-Categories.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (10, '', 'Survey', '', '', 'r', 4, 1, 3600, '', '', 'block-Survey.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (11, '', 'Login', '', '', 'r', 1, 1, 0, '', '', 'block-doms-Login.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (12, '', 'Big Story of Today', '', '', 'r', 2, 1, 0, '', '', 'block-Big_Story_of_Today.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (13, '', 'Old Articles', '', '', 'r', 7, 0, 3600, '', '', 'block-Old_Articles.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (14, '', 'Information', '<br><center><font class="content">\r\n<a href="http://phpnuke.org"><img src="images/powered/powered5.jpg" border="0" alt="Powered by PHP-Nuke" title="Powered by PHP-Nuke" width="88" height="31"></a>\r\n<br><br>\r\n<a href="http://validator.w3.org/check/referer"><img src="images/html401.gif" width="88" height="31" alt="Valid HTML 4.01!" title="Valid HTML 4.01!" border="0"></a>\r\n<br><br>\r\n<a href="http://jigsaw.w3.org/css-validator"><img src="images/css.gif" width="88" height="31" alt="Valid CSS!" title="Valid CSS!" border="0"></a></font></center><br>', '', 'r', 8, 0, 0, '', '', '', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (15, '', 'Forums', '', '', 'd', 1, 1, 3600, '', '', 'block-iCGstation-Forums.php', 1, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (16, '', 'Usage Policy', '', '', 'd', 2, 0, 0, '', '', 'block-Content.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (17, '', 'Latest News', '', '', 'c', 1, 1, 0, '', '', 'block-Last_5_Articles.php', 1, '0', 'd', 0);
INSERT INTO `nuke_blocks` (`bid`, `bkey`, `title`, `content`, `url`, `bposition`, `weight`, `active`, `refresh`, `time`, `blanguage`, `blockfile`, `view`, `expire`, `action`, `subscription`) VALUES (20, '', 'Top Users', '', '', 'r', 9, 0, 3600, '', '', 'block-doms_user_points.php', 0, '0', 'd', 0);

## ########################################################

## 
## Table structure for table `nuke_comments`
## 

DROP TABLE IF EXISTS `nuke_comments`;
CREATE TABLE `nuke_comments` (
  `tid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `date` datetime default NULL,
  `name` varchar(60) NOT NULL default '',
  `email` varchar(60) default NULL,
  `url` varchar(60) default NULL,
  `host_name` varchar(60) default NULL,
  `subject` varchar(85) NOT NULL default '',
  `comment` text NOT NULL,
  `score` tinyint(4) NOT NULL default '0',
  `reason` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`),
  KEY `sid` (`sid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_comments`
## 


## ########################################################

## 
## Table structure for table `nuke_config`
## 

DROP TABLE IF EXISTS `nuke_config`;
CREATE TABLE `nuke_config` (
  `sitename` varchar(255) NOT NULL default '',
  `nukeurl` varchar(255) NOT NULL default '',
  `site_logo` varchar(255) NOT NULL default '',
  `slogan` varchar(255) NOT NULL default '',
  `startdate` varchar(50) NOT NULL default '',
  `adminmail` varchar(255) NOT NULL default '',
  `anonpost` tinyint(1) NOT NULL default '0',
  `Default_Theme` varchar(255) NOT NULL default '',
  `foot1` text NOT NULL,
  `foot2` text NOT NULL,
  `foot3` text NOT NULL,
  `commentlimit` int(9) NOT NULL default '4096',
  `anonymous` varchar(255) NOT NULL default '',
  `minpass` tinyint(1) NOT NULL default '5',
  `pollcomm` tinyint(1) NOT NULL default '1',
  `articlecomm` tinyint(1) NOT NULL default '1',
  `broadcast_msg` tinyint(1) NOT NULL default '1',
  `my_headlines` tinyint(1) NOT NULL default '1',
  `top` int(3) NOT NULL default '10',
  `storyhome` int(2) NOT NULL default '10',
  `user_news` tinyint(1) NOT NULL default '1',
  `oldnum` int(2) NOT NULL default '30',
  `ultramode` tinyint(1) NOT NULL default '0',
  `banners` tinyint(1) NOT NULL default '1',
  `backend_title` varchar(255) NOT NULL default '',
  `backend_language` varchar(10) NOT NULL default '',
  `language` varchar(100) NOT NULL default '',
  `locale` varchar(10) NOT NULL default '',
  `multilingual` tinyint(1) NOT NULL default '0',
  `useflags` tinyint(1) NOT NULL default '0',
  `notify` tinyint(1) NOT NULL default '0',
  `notify_email` varchar(255) NOT NULL default '',
  `notify_subject` varchar(255) NOT NULL default '',
  `notify_message` varchar(255) NOT NULL default '',
  `notify_from` varchar(255) NOT NULL default '',
  `moderate` tinyint(1) NOT NULL default '0',
  `admingraphic` tinyint(1) NOT NULL default '1',
  `httpref` tinyint(1) NOT NULL default '1',
  `httprefmax` int(5) NOT NULL default '1000',
  `CensorMode` tinyint(1) NOT NULL default '3',
  `CensorReplace` varchar(10) NOT NULL default '',
  `copyright` text NOT NULL,
  `Version_Num` varchar(10) NOT NULL default '',
  `AutoActivateMode` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`sitename`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_config`
## 

INSERT INTO `nuke_config` (`sitename`, `nukeurl`, `site_logo`, `slogan`, `startdate`, `adminmail`, `anonpost`, `Default_Theme`, `foot1`, `foot2`, `foot3`, `commentlimit`, `anonymous`, `minpass`, `pollcomm`, `articlecomm`, `broadcast_msg`, `my_headlines`, `top`, `storyhome`, `user_news`, `oldnum`, `ultramode`, `banners`, `backend_title`, `backend_language`, `language`, `locale`, `multilingual`, `useflags`, `notify`, `notify_email`, `notify_subject`, `notify_message`, `notify_from`, `moderate`, `admingraphic`, `httpref`, `httprefmax`, `CensorMode`, `CensorReplace`, `copyright`, `Version_Num`, `AutoActivateMode`) VALUES ('DOMS NITT Alumni Network', 'http://www.domsnittalumni.net/portal/', 'logo.bmp', '', 'Dec 2005', 'support@domsnittalumni.net', 0, 'iCGstation', '', 'All logos and trademarks in this site are property of their respective owner. The comments are property of their posters, all the rest © 2005 by DASF.', '', 4096, 'Anonymous', 5, 1, 1, 1, 1, 10, 10, 1, 30, 0, 1, 'PHP-Nuke Powered Site', 'en-us', 'english', 'en_US', 0, 0, 0, 'contentadmin@domsnittalumni.net', 'NEWS for my site', 'Hey! You got a new submission for your site.', 'webmaster', 0, 1, 1, 1000, 3, '*****', 'PHP-Nuke Copyright &copy; 2004 by Francisco Burzi. This is free software, and you may redistribute it under the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">GPL</font></a>. PHP-Nuke comes with absolutely no warranty, for details, see the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">license</font></a>.', '7.5', 0);

## ########################################################

## 
## Table structure for table `nuke_confirm`
## 

DROP TABLE IF EXISTS `nuke_confirm`;
CREATE TABLE `nuke_confirm` (
  `confirm_id` char(32) NOT NULL default '',
  `session_id` char(32) NOT NULL default '',
  `code` char(6) NOT NULL default '',
  PRIMARY KEY  (`session_id`,`confirm_id`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_confirm`
## 


## ########################################################

## 
## Table structure for table `nuke_counter`
## 

DROP TABLE IF EXISTS `nuke_counter`;
CREATE TABLE `nuke_counter` (
  `type` varchar(80) NOT NULL default '',
  `var` varchar(80) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0'
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_counter`
## 

INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('total', 'hits', 2228);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'WebTV', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'Lynx', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'MSIE', 2221);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'Opera', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'Konqueror', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'Netscape', 3);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'Bot', 3);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('browser', 'Other', 1);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'Windows', 2222);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'Linux', 1);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'Mac', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'FreeBSD', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'SunOS', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'IRIX', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'BeOS', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'OS/2', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'AIX', 0);
INSERT INTO `nuke_counter` (`type`, `var`, `count`) VALUES ('os', 'Other', 5);

## ########################################################

## 
## Table structure for table `nuke_countrycodes`
## 

DROP TABLE IF EXISTS `nuke_countrycodes`;
CREATE TABLE `nuke_countrycodes` (
  `code` char(2) default NULL,
  `country` text
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_countrycodes`
## 

INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AF', 'Afghanistan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AL', 'Albania');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('DZ', 'Algeria');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AS', 'American Samoa');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AD', 'Andorra');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AO', 'Angola');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AI', 'Anguilla');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AQ', 'Antarctica');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AR', 'Argentina');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AM', 'Armenia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AW', 'Aruba');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AU', 'Australia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AT', 'Austria');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AZ', 'Azerbaidjan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BS', 'Bahamas');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BH', 'Bahrain');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BD', 'Banglades');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BB', 'Barbados');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BY', 'Belarus');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BE', 'Belgium');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BZ', 'Belize');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BJ', 'Benin');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BM', 'Bermuda');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BO', 'Bolivia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BA', 'Bosnia-Herzegovina');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BW', 'Botswana');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BV', 'Bouvet Island');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BR', 'Brazil');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IO', 'British Indian O. Terr.');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BG', 'Bulgaria');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BF', 'Burkina Faso');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BI', 'Burundi');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('BT', 'Buthan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KH', 'Cambodia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CM', 'Cameroon');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CA', 'Canada');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CV', 'Cape Verde');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KY', 'Cayman Islands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CF', 'Central African Rep.');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TD', 'Chad');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CL', 'Chile');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CN', 'China');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CX', 'Christmas Island');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CC', 'Cocos (Keeling) Isl.');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CO', 'Colombia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KM', 'Comoros');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CG', 'Congo');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CK', 'Cook Islands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CR', 'Costa Rica');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('HR', 'Croatia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CU', 'Cuba');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CY', 'Cyprus');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CZ', 'Czech Republic');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CS', 'Czechoslovakia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('DK', 'Denmark');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('DJ', 'Djibouti');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('DM', 'Dominica');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('DO', 'Dominican Republic');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TP', 'East Timor');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('EC', 'Ecuador');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('EG', 'Egypt');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SV', 'El Salvador');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('EE', 'Estonia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ET', 'Ethiopia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('FK', 'Falkland Isl.(UK)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('FO', 'Faroe Islands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('FJ', 'Fiji');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('FI', 'Finland');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('FR', 'France');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('FX', 'France (European Ter.)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TF', 'French Southern Terr.');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GA', 'Gabon');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GM', 'Gambia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GE', 'Georgia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('DE', 'Germany');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GH', 'Ghana');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GI', 'Gibraltar');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GB', 'Great Britain (UK)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GR', 'Greece');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GL', 'Greenland');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GD', 'Grenada');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GP', 'Guadeloupe (Fr.)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GU', 'Guam (US)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GT', 'Guatemala');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GN', 'Guinea');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GW', 'Guinea Bissau');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GY', 'Guyana');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('GF', 'Guyana (Fr.)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('HT', 'Haiti');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('HM', 'Heard & McDonald Isl.');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('HN', 'Honduras');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('HK', 'Hong Kong');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('HU', 'Hungary');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IS', 'Iceland');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IN', 'India');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ID', 'Indonesia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IR', 'Iran');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IQ', 'Iraq');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IE', 'Ireland');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IL', 'Israel');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('IT', 'Italy');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CI', 'Ivory Coast');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('JM', 'Jamaica');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('JP', 'Japan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('JO', 'Jordan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KZ', 'Kazachstan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KE', 'Kenya');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KG', 'Kirgistan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KI', 'Kiribati');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KP', 'Korea (North)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KR', 'Korea (South)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KW', 'Kuwait');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LA', 'Laos');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LV', 'Latvia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LB', 'Lebanon');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LS', 'Lesotho');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LR', 'Liberia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LY', 'Libya');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LI', 'Liechtenstein');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LT', 'Lithuania');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LU', 'Luxembourg');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MO', 'Macau');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MG', 'Madagascar');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MW', 'Malawi');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MY', 'Malaysia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MV', 'Maldives');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ML', 'Mali');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MT', 'Malta');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MH', 'Marshall Islands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MQ', 'Martinique (Fr.)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MR', 'Mauritania');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MU', 'Mauritius');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MX', 'Mexico');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('FM', 'Micronesia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MD', 'Moldavia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MC', 'Monaco');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MN', 'Mongolia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MS', 'Montserrat');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MA', 'Morocco');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MZ', 'Mozambique');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MM', 'Myanmar');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NA', 'Namibia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NR', 'Nauru');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NP', 'Nepal');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AN', 'Netherland Antilles');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NL', 'Netherlands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NT', 'Neutral Zone');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NC', 'New Caledonia (Fr.)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NZ', 'New Zealand');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NI', 'Nicaragua');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NE', 'Niger');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NG', 'Nigeria');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NU', 'Niue');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NF', 'Norfolk Island');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('MP', 'Northern Mariana Isl.');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('NO', 'Norway');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('OM', 'Oman');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PK', 'Pakistan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PW', 'Palau');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PA', 'Panama');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PG', 'Papua New');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PY', 'Paraguay');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PE', 'Peru');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PH', 'Philippines');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PN', 'Pitcairn');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PL', 'Poland');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PF', 'Polynesia (Fr.)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PT', 'Portugal');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PR', 'Puerto Rico (US)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('QA', 'Qatar');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('RE', 'Reunion (Fr.)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('RO', 'Romania');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('RU', 'Russian Federation');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('RW', 'Rwanda');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LC', 'Saint Lucia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('WS', 'Samoa');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SM', 'San Marino');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SA', 'Saudi Arabia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SN', 'Senegal');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SC', 'Seychelles');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SL', 'Sierra Leone');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SG', 'Singapore');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SK', 'Slovak Republic');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SI', 'Slovenia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SB', 'Solomon Islands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SO', 'Somalia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ZA', 'South Africa');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SU', 'Soviet Union');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ES', 'Spain');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('LK', 'Sri Lanka');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SH', 'St. Helena');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('PM', 'St. Pierre & Miquelon');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ST', 'St. Tome and Principe');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('KN', 'St.Kitts Nevis Anguilla');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('VC', 'St.Vincent & Grenadines');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SD', 'Sudan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SR', 'Suriname');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SJ', 'Svalbard & Jan Mayen Is');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SZ', 'Swaziland');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SE', 'Sweden');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('CH', 'Switzerland');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('SY', 'Syria');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TJ', 'Tadjikistan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TW', 'Taiwan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TZ', 'Tanzania');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TH', 'Thailand');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TG', 'Togo');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TK', 'Tokelau');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TO', 'Tonga');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TT', 'Trinidad & Tobago');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TN', 'Tunisia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TR', 'Turkey');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TM', 'Turkmenistan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TC', 'Turks & Caicos Islands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('TV', 'Tuvalu');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('UG', 'Uganda');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('UA', 'Ukraine');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('AE', 'United Arab Emirates');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('UK', 'United Kingdom');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('US', 'United States');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('UY', 'Uruguay');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('UM', 'US Minor outlying Isl.');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('UZ', 'Uzbekistan');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('VU', 'Vanuatu');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('VA', 'Vatican City State');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('VE', 'Venezuela');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('VN', 'Vietnam');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('VI', 'Virgin Islands (US)');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('WF', 'Wallis & Futuna Islands');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('EH', 'Western Sahara');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('YE', 'Yemen');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('YU', 'Yugoslavia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ZR', 'Zaire');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ZM', 'Zambia');
INSERT INTO `nuke_countrycodes` (`code`, `country`) VALUES ('ZW', 'Zimbabwe');

## ########################################################

## 
## Table structure for table `nuke_downloads_categories`
## 

DROP TABLE IF EXISTS `nuke_downloads_categories`;
CREATE TABLE `nuke_downloads_categories` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `cdescription` text NOT NULL,
  `ldescription` text,
  `parentid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`),
  KEY `title` (`title`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_downloads_categories`
## 

INSERT INTO `nuke_downloads_categories` (`cid`, `title`, `cdescription`, `ldescription`, `parentid`) VALUES (1, 'DASF', 'DASF', NULL, 0);

## ########################################################

## 
## Table structure for table `nuke_downloads_downloads`
## 

DROP TABLE IF EXISTS `nuke_downloads_downloads`;
CREATE TABLE `nuke_downloads_downloads` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime default NULL,
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `hits` int(11) NOT NULL default '0',
  `submitter` varchar(60) NOT NULL default '',
  `downloadratingsummary` double(6,4) NOT NULL default '0.0000',
  `totalvotes` int(11) NOT NULL default '0',
  `totalcomments` int(11) NOT NULL default '0',
  `filesize` int(11) NOT NULL default '0',
  `version` varchar(10) NOT NULL default '',
  `homepage` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  KEY `title` (`title`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

## 
## Dumping data for table `nuke_downloads_downloads`
## 


## ########################################################

## 
## Table structure for table `nuke_downloads_editorials`
## 

DROP TABLE IF EXISTS `nuke_downloads_editorials`;
CREATE TABLE `nuke_downloads_editorials` (
  `downloadid` int(11) NOT NULL default '0',
  `adminid` varchar(60) NOT NULL default '',
  `editorialtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `editorialtext` text NOT NULL,
  `editorialtitle` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`downloadid`),
  KEY `downloadid` (`downloadid`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_downloads_editorials`
## 


## ########################################################

## 
## Table structure for table `nuke_downloads_modrequest`
## 

DROP TABLE IF EXISTS `nuke_downloads_modrequest`;
CREATE TABLE `nuke_downloads_modrequest` (
  `requestid` int(11) NOT NULL auto_increment,
  `lid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `modifysubmitter` varchar(60) NOT NULL default '',
  `brokendownload` int(3) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `filesize` int(11) NOT NULL default '0',
  `version` varchar(10) NOT NULL default '',
  `homepage` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`requestid`),
  UNIQUE KEY `requestid` (`requestid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_downloads_modrequest`
## 


## ########################################################

## 
## Table structure for table `nuke_downloads_newdownload`
## 

DROP TABLE IF EXISTS `nuke_downloads_newdownload`;
CREATE TABLE `nuke_downloads_newdownload` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `submitter` varchar(60) NOT NULL default '',
  `filesize` int(11) NOT NULL default '0',
  `version` varchar(10) NOT NULL default '',
  `homepage` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  KEY `title` (`title`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

## 
## Dumping data for table `nuke_downloads_newdownload`
## 


## ########################################################

## 
## Table structure for table `nuke_downloads_votedata`
## 

DROP TABLE IF EXISTS `nuke_downloads_votedata`;
CREATE TABLE `nuke_downloads_votedata` (
  `ratingdbid` int(11) NOT NULL auto_increment,
  `ratinglid` int(11) NOT NULL default '0',
  `ratinguser` varchar(60) NOT NULL default '',
  `rating` int(11) NOT NULL default '0',
  `ratinghostname` varchar(60) NOT NULL default '',
  `ratingcomments` text NOT NULL,
  `ratingtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ratingdbid`),
  KEY `ratingdbid` (`ratingdbid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_downloads_votedata`
## 


## ########################################################

## 
## Table structure for table `nuke_encyclopedia`
## 

DROP TABLE IF EXISTS `nuke_encyclopedia`;
CREATE TABLE `nuke_encyclopedia` (
  `eid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `elanguage` varchar(30) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  PRIMARY KEY  (`eid`),
  KEY `eid` (`eid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_encyclopedia`
## 


## ########################################################

## 
## Table structure for table `nuke_encyclopedia_text`
## 

DROP TABLE IF EXISTS `nuke_encyclopedia_text`;
CREATE TABLE `nuke_encyclopedia_text` (
  `tid` int(10) NOT NULL auto_increment,
  `eid` int(10) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  `counter` int(10) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `tid` (`tid`),
  KEY `eid` (`eid`),
  KEY `title` (`title`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_encyclopedia_text`
## 


## ########################################################

## 
## Table structure for table `nuke_faqanswer`
## 

DROP TABLE IF EXISTS `nuke_faqanswer`;
CREATE TABLE `nuke_faqanswer` (
  `id` tinyint(4) NOT NULL auto_increment,
  `id_cat` tinyint(4) NOT NULL default '0',
  `question` varchar(255) default '',
  `answer` text,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `id_cat` (`id_cat`)
) TYPE=MyISAM AUTO_INCREMENT=10 ;

## 
## Dumping data for table `nuke_faqanswer`
## 

INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (1, 1, 'How do I register with website', '<ol>\r\n<li>Click on Register Here Link, You shall be taken to registration form\r\n\r\n<li>Please fill-up the form, please don''t forget to fill-up the all the details requested for.\r\n\r\n<li>On submission, a confirmation mail shall be sent your email account provided during the registration. The mail might be delayed owing to network traffic and site level traffic.\r\n\r\n<li>Click on the confirmation link provided to activate your account\r\n\r\n<li>Login with nick name and password provided during the registration\r\n\r\n<li>For any further help contact: support@domsnittalumni.net  \r\n</ol> ');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (2, 1, 'How do I change my password', '<ol>\r\n<li> Logon to the website\r\n<li> Click on Your Account\r\n<li> Click on Your Info\r\n<li> Goto bottom of the list and enter the new password\r\n<li>submit the information\r\n</ol>');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (3, 1, 'How do I create content,faq,surveys, etc...', 'You need to be a content admin to create or post the following items. \r\n<ul>\r\n<li>Content</li>\r\n<li>Downloads</li>\r\n<li>Encyclopedia</li>\r\n<li>F.A.Q.</li>\r\n<li>News</li>\r\n<li>Reviews</li>\r\n<li>Survey / Polls</li>\r\n<li>Topics</li>\r\n<li>Web Links</li>\r\n</ul>\r\n\r\nSend a mail requesting for Content Administrator Account to support@domsnittalumni.net <BR>\r\n\r\n<p>The request will be processed with-in 24-48 hours by the website team, the request would be approved or disapproved after a due diligence process and the mail informing the same shall be sent.</P>\r\n');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (4, 1, 'How do I logon using my Content Administrator Account', '<ol>\r\n<li> Go to Home Page </li>\r\n<li>Please click on Lock icon displayed in Login Box </li>\r\n<li>Login using your Content Administrator Account and password </li>\r\n</ol>');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (5, 1, 'How do I get support for this website', 'There are multiple ways to get support for this website\r\n\r\n<ul>\r\n<li>You can mail to support@domsnittalumni.net</li>\r\n\r\n<li>You can use <A href="http://www.domsnittalumni.net/portal/modules.php?name=Forums&file=viewforum&f=1">support website forum</A></li>\r\n\r\n</ul>\r\n');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (6, 1, 'why site doesn''t support uploading of the files in the download section', '<p>As part of the security measure aginst virus and trojan propogation, the site doesn''t support uploading of the files.</p>\r\n\r\nWe are working towards providing this support in future');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (7, 1, 'How do I create a forum', '<p>Currently the site doesn''t permit creating of forums for normal users and content administrators</P>\r\n\r\nHowever, you can request for the same by mailing to support@domsnittalumni.net\r\n');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (8, 1, 'Why does some of the posts made to forums vanish', '\r\nSome of the reasons could be:-\r\n\r\n<ul>\r\n\r\n<li>For some of the forums listed under few categories like connect are pruned automatically after certain duration</li>\r\n\r\n<li>Some of the posts are pruned by moderators as they don''t comply to the site usage policy </li>\r\n\r\n</ul>\r\n');
INSERT INTO `nuke_faqanswer` (`id`, `id_cat`, `question`, `answer`) VALUES (9, 1, 'I had submitted news, but I don''t see it appearing on the homepage or news archives', 'Website has built-in workflows,The submitted news needs to be aproved by the administrator, before it can get published.');

## ########################################################

## 
## Table structure for table `nuke_faqcategories`
## 

DROP TABLE IF EXISTS `nuke_faqcategories`;
CREATE TABLE `nuke_faqcategories` (
  `id_cat` tinyint(3) NOT NULL auto_increment,
  `categories` varchar(255) default NULL,
  `flanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id_cat`),
  KEY `id_cat` (`id_cat`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_faqcategories`
## 

INSERT INTO `nuke_faqcategories` (`id_cat`, `categories`, `flanguage`) VALUES (1, 'Website', '');

## ########################################################

## 
## Table structure for table `nuke_groups`
## 

DROP TABLE IF EXISTS `nuke_groups`;
CREATE TABLE `nuke_groups` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_groups`
## 

INSERT INTO `nuke_groups` (`id`, `name`, `description`, `points`) VALUES (1, 'WebsiteAdmins', 'Administrators and Moderators of the website', 0);

## ########################################################

## 
## Table structure for table `nuke_groups_points`
## 

DROP TABLE IF EXISTS `nuke_groups_points`;
CREATE TABLE `nuke_groups_points` (
  `id` int(10) NOT NULL auto_increment,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=22 ;

## 
## Dumping data for table `nuke_groups_points`
## 

INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (1, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (2, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (3, 4);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (4, 4);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (5, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (6, 2);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (7, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (8, 4);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (9, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (10, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (11, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (12, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (13, 0);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (14, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (15, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (16, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (17, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (18, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (19, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (20, 1);
INSERT INTO `nuke_groups_points` (`id`, `points`) VALUES (21, 1);

## ########################################################

## 
## Table structure for table `nuke_headlines`
## 

DROP TABLE IF EXISTS `nuke_headlines`;
CREATE TABLE `nuke_headlines` (
  `hid` int(11) NOT NULL auto_increment,
  `sitename` varchar(30) NOT NULL default '',
  `headlinesurl` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`hid`),
  KEY `hid` (`hid`)
) TYPE=MyISAM AUTO_INCREMENT=28 ;

## 
## Dumping data for table `nuke_headlines`
## 

INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (1, 'AbsoluteGames', 'http://files.gameaholic.com/agfa.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (2, 'BSDToday', 'http://www.bsdtoday.com/backend/bt.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (3, 'BrunchingShuttlecocks', 'http://www.brunching.com/brunching.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (4, 'DailyDaemonNews', 'http://daily.daemonnews.org/ddn.rdf.php3');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (5, 'DigitalTheatre', 'http://www.dtheatre.com/backend.php3?xml=yes');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (6, 'DotKDE', 'http://dot.kde.org/rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (7, 'FreeDOS', 'http://www.freedos.org/channels/rss.cgi');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (8, 'Freshmeat', 'http://freshmeat.net/backend/fm.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (9, 'Gnome Desktop', 'http://www.gnomedesktop.org/backend.php');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (10, 'HappyPenguin', 'http://happypenguin.org/html/news.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (11, 'HollywoodBitchslap', 'http://hollywoodbitchslap.com/hbs.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (12, 'Learning Linux', 'http://www.learninglinux.com/backend.php');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (13, 'LinuxCentral', 'http://linuxcentral.com/backend/lcnew.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (14, 'LinuxJournal', 'http://www.linuxjournal.com/news.rss');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (15, 'LinuxWeelyNews', 'http://lwn.net/headlines/rss');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (16, 'Listology', 'http://listology.com/recent.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (17, 'MozillaNewsBot', 'http://www.mozilla.org/newsbot/newsbot.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (18, 'NewsForge', 'http://www.newsforge.com/newsforge.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (19, 'NukeResources', 'http://www.nukeresources.com/backend.php');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (20, 'NukeScripts', 'http://www.nukescripts.net/backend.php');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (21, 'PDABuzz', 'http://www.pdabuzz.com/netscape.txt');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (22, 'PHP-Nuke', 'http://phpnuke.org/backend.php');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (23, 'PHP.net', 'http://www.php.net/news.rss');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (24, 'PHPBuilder', 'http://phpbuilder.com/rss_feed.php');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (25, 'PerlMonks', 'http://www.perlmonks.org/headlines.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (26, 'TheNextLevel', 'http://www.the-nextlevel.com/rdf/tnl.rdf');
INSERT INTO `nuke_headlines` (`hid`, `sitename`, `headlinesurl`) VALUES (27, 'WebReference', 'http://webreference.com/webreference.rdf');

## ########################################################

## 
## Table structure for table `nuke_journal`
## 

DROP TABLE IF EXISTS `nuke_journal`;
CREATE TABLE `nuke_journal` (
  `jid` int(11) NOT NULL auto_increment,
  `aid` varchar(30) NOT NULL default '',
  `title` varchar(80) default NULL,
  `bodytext` text NOT NULL,
  `mood` varchar(48) NOT NULL default '',
  `pdate` varchar(48) NOT NULL default '',
  `ptime` varchar(48) NOT NULL default '',
  `status` varchar(48) NOT NULL default '',
  `mtime` varchar(48) NOT NULL default '',
  `mdate` varchar(48) NOT NULL default '',
  PRIMARY KEY  (`jid`),
  KEY `jid` (`jid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_journal`
## 


## ########################################################

## 
## Table structure for table `nuke_journal_comments`
## 

DROP TABLE IF EXISTS `nuke_journal_comments`;
CREATE TABLE `nuke_journal_comments` (
  `cid` int(11) NOT NULL auto_increment,
  `rid` varchar(48) NOT NULL default '',
  `aid` varchar(30) NOT NULL default '',
  `comment` text NOT NULL,
  `pdate` varchar(48) NOT NULL default '',
  `ptime` varchar(48) NOT NULL default '',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`),
  KEY `rid` (`rid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_journal_comments`
## 


## ########################################################

## 
## Table structure for table `nuke_journal_stats`
## 

DROP TABLE IF EXISTS `nuke_journal_stats`;
CREATE TABLE `nuke_journal_stats` (
  `id` int(11) NOT NULL auto_increment,
  `joid` varchar(48) NOT NULL default '',
  `nop` varchar(48) NOT NULL default '',
  `ldp` varchar(24) NOT NULL default '',
  `ltp` varchar(24) NOT NULL default '',
  `micro` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_journal_stats`
## 


## ########################################################

## 
## Table structure for table `nuke_links_categories`
## 

DROP TABLE IF EXISTS `nuke_links_categories`;
CREATE TABLE `nuke_links_categories` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `cdescription` text NOT NULL,
  `parentid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_links_categories`
## 

INSERT INTO `nuke_links_categories` (`cid`, `title`, `cdescription`, `parentid`) VALUES (1, 'DOMS', 'Links Related DOMS', 0);

## ########################################################

## 
## Table structure for table `nuke_links_editorials`
## 

DROP TABLE IF EXISTS `nuke_links_editorials`;
CREATE TABLE `nuke_links_editorials` (
  `linkid` int(11) NOT NULL default '0',
  `adminid` varchar(60) NOT NULL default '',
  `editorialtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `editorialtext` text NOT NULL,
  `editorialtitle` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`linkid`),
  KEY `linkid` (`linkid`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_links_editorials`
## 


## ########################################################

## 
## Table structure for table `nuke_links_links`
## 

DROP TABLE IF EXISTS `nuke_links_links`;
CREATE TABLE `nuke_links_links` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime default NULL,
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `hits` int(11) NOT NULL default '0',
  `submitter` varchar(60) NOT NULL default '',
  `linkratingsummary` double(6,4) NOT NULL default '0.0000',
  `totalvotes` int(11) NOT NULL default '0',
  `totalcomments` int(11) NOT NULL default '0',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

## 
## Dumping data for table `nuke_links_links`
## 

INSERT INTO `nuke_links_links` (`lid`, `cid`, `sid`, `title`, `url`, `description`, `date`, `name`, `email`, `hits`, `submitter`, `linkratingsummary`, `totalvotes`, `totalcomments`) VALUES (1, 0, 0, 'NIIT Home Page', 'http://www.nitt.edu', 'NITT Homepage', '2005-12-14 01:28:26', '', '', 0, 'satish1', 0.0000, 0, 0);
INSERT INTO `nuke_links_links` (`lid`, `cid`, `sid`, `title`, `url`, `description`, `date`, `name`, `email`, `hits`, `submitter`, `linkratingsummary`, `totalvotes`, `totalcomments`) VALUES (2, 1, 0, 'NIIT Home Page', 'http://www.nitt.edu/', 'NITT Home page', '2005-12-14 01:31:52', '', '', 4, '', 0.0000, 0, 0);
INSERT INTO `nuke_links_links` (`lid`, `cid`, `sid`, `title`, `url`, `description`, `date`, `name`, `email`, `hits`, `submitter`, `linkratingsummary`, `totalvotes`, `totalcomments`) VALUES (3, 1, 0, 'DOMS Home Page', 'http://www.nitt.edu/departments/mba/', 'DOMS Home Page', '2005-12-14 01:34:29', '', '', 4, 'satish1', 0.0000, 0, 0);
INSERT INTO `nuke_links_links` (`lid`, `cid`, `sid`, `title`, `url`, `description`, `date`, `name`, `email`, `hits`, `submitter`, `linkratingsummary`, `totalvotes`, `totalcomments`) VALUES (4, 1, 0, 'NITT Offical Alumni Page', 'http://recal.nitt.edu/', 'NITT Official Alumni page hosted in the campus', '2005-12-27 07:56:54', '', '', 1, 'satish', 0.0000, 0, 0);

## ########################################################

## 
## Table structure for table `nuke_links_modrequest`
## 

DROP TABLE IF EXISTS `nuke_links_modrequest`;
CREATE TABLE `nuke_links_modrequest` (
  `requestid` int(11) NOT NULL auto_increment,
  `lid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `modifysubmitter` varchar(60) NOT NULL default '',
  `brokenlink` int(3) NOT NULL default '0',
  PRIMARY KEY  (`requestid`),
  UNIQUE KEY `requestid` (`requestid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_links_modrequest`
## 


## ########################################################

## 
## Table structure for table `nuke_links_newlink`
## 

DROP TABLE IF EXISTS `nuke_links_newlink`;
CREATE TABLE `nuke_links_newlink` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `submitter` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

## 
## Dumping data for table `nuke_links_newlink`
## 


## ########################################################

## 
## Table structure for table `nuke_links_votedata`
## 

DROP TABLE IF EXISTS `nuke_links_votedata`;
CREATE TABLE `nuke_links_votedata` (
  `ratingdbid` int(11) NOT NULL auto_increment,
  `ratinglid` int(11) NOT NULL default '0',
  `ratinguser` varchar(60) NOT NULL default '',
  `rating` int(11) NOT NULL default '0',
  `ratinghostname` varchar(60) NOT NULL default '',
  `ratingcomments` text NOT NULL,
  `ratingtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ratingdbid`),
  KEY `ratingdbid` (`ratingdbid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_links_votedata`
## 


## ########################################################

## 
## Table structure for table `nuke_main`
## 

DROP TABLE IF EXISTS `nuke_main`;
CREATE TABLE `nuke_main` (
  `main_module` varchar(255) NOT NULL default ''
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_main`
## 

INSERT INTO `nuke_main` (`main_module`) VALUES ('News');

## ########################################################

## 
## Table structure for table `nuke_message`
## 

DROP TABLE IF EXISTS `nuke_message`;
CREATE TABLE `nuke_message` (
  `mid` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `content` text NOT NULL,
  `date` varchar(14) NOT NULL default '',
  `expire` int(7) NOT NULL default '0',
  `active` int(1) NOT NULL default '1',
  `view` int(1) NOT NULL default '1',
  `mlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  UNIQUE KEY `mid` (`mid`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_message`
## 

INSERT INTO `nuke_message` (`mid`, `title`, `content`, `date`, `expire`, `active`, `view`, `mlanguage`) VALUES (1, 'Welcome to DOMS NIT Trichy - Alumni Network - Alpha Version', '<br>If you are an alumni,faculty and student of DOMS NIT Trichy - Please register your self <A href="modules.php?name=Your_Account&op=new_user">Click Here to Register </A>\r\n\r\n<p> Having trouble registering check out <a href="modules.php?name=FAQ&myfaq=yes&id_cat=1&categories=Website"><b>FAQ</b></a></p>\r\n\r\n<p><b>Check out the usage policy. <A href="modules.php?name=Content&pa=showpage&pid=1">Usage Policy</A></b></p>\r\n<BR>', '993373194', 0, 1, 1, '');

## ########################################################

## 
## Table structure for table `nuke_modules`
## 

DROP TABLE IF EXISTS `nuke_modules`;
CREATE TABLE `nuke_modules` (
  `mid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `custom_title` varchar(255) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  `view` int(1) NOT NULL default '0',
  `inmenu` tinyint(1) NOT NULL default '1',
  `mod_group` int(10) default '0',
  `admins` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  KEY `mid` (`mid`),
  KEY `title` (`title`),
  KEY `custom_title` (`custom_title`)
) TYPE=MyISAM AUTO_INCREMENT=23 ;

## 
## Dumping data for table `nuke_modules`
## 

INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (1, 'AvantGo', 'AvantGo', 0, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (2, 'Content', 'Content', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (3, 'Downloads', 'Downloads', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (4, 'Encyclopedia', 'Encyclopedia', 0, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (5, 'FAQ', 'FAQ', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (6, 'Feedback', 'Feedback', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (7, 'Forums', 'Forums', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (8, 'Journal', 'Journal', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (9, 'Members_List', 'Members List', 1, 1, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (10, 'News', 'News', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (11, 'Private_Messages', 'Private Messages', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (12, 'Recommend_Us', 'Recommend Us', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (13, 'Reviews', 'Reviews', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (14, 'Search', 'Search', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (15, 'Statistics', 'Statistics', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (16, 'Stories_Archive', 'Stories Archive', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (17, 'Submit_News', 'Submit News', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (18, 'Surveys', 'Surveys', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (19, 'Top', 'Top 10', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (20, 'Topics', 'Topics', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (21, 'Web_Links', 'Web Links', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` (`mid`, `title`, `custom_title`, `active`, `view`, `inmenu`, `mod_group`, `admins`) VALUES (22, 'Your_Account', 'Your Account', 1, 0, 1, 0, '');

## ########################################################

## 
## Table structure for table `nuke_mostonline`
## 

DROP TABLE IF EXISTS `nuke_mostonline`;
CREATE TABLE `nuke_mostonline` (
  `total` int(10) NOT NULL default '0',
  `members` int(10) NOT NULL default '0',
  `nonmembers` int(10) NOT NULL default '0',
  PRIMARY KEY  (`total`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_mostonline`
## 

INSERT INTO `nuke_mostonline` (`total`, `members`, `nonmembers`) VALUES (6, 2, 4);

## ########################################################

## 
## Table structure for table `nuke_optimize_gain`
## 

DROP TABLE IF EXISTS `nuke_optimize_gain`;
CREATE TABLE `nuke_optimize_gain` (
  `gain` decimal(10,3) default NULL
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_optimize_gain`
## 

INSERT INTO `nuke_optimize_gain` (`gain`) VALUES (15.665);

## ########################################################

## 
## Table structure for table `nuke_pages`
## 

DROP TABLE IF EXISTS `nuke_pages`;
CREATE TABLE `nuke_pages` (
  `pid` int(10) NOT NULL auto_increment,
  `cid` int(10) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `subtitle` varchar(255) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  `page_header` text NOT NULL,
  `text` text NOT NULL,
  `page_footer` text NOT NULL,
  `signature` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `counter` int(10) NOT NULL default '0',
  `clanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `pid` (`pid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

## 
## Dumping data for table `nuke_pages`
## 

INSERT INTO `nuke_pages` (`pid`, `cid`, `title`, `subtitle`, `active`, `page_header`, `text`, `page_footer`, `signature`, `date`, `counter`, `clanguage`) VALUES (1, 3, 'Usage Policy', '<B>TERMS AND CONDITIONS - Version 1.0</B>', 1, '<p>TERMS OF USE FOR:THE DOMS,NITT ALUMNI ASSOCIATION WEB SITE</p>', '<p> \r\nThe DOMS, NITT Alumni Association Website is provided by the DASF is designed to facilitate communication among alumni, students and faculty for College-related purposes.</p>\r\n\r\n<b>I. Privacy and Security</b>\r\n<p>\r\nThe Alumni Association and the College have not, do not and will never sell alumni information to anyone. All alumni information is strictly guarded for use by individual Alumni and the Alumni Association for personal and College-related purposes only. </P>\r\n\r\n<p>The Alumni Association has taken all reasonable precautions to secure the personal information available through the online community. The DOMS, NITT Alumni Association Online Community is password protected to allow access by registered College Alumni, Current Students and Faculty only. Although this precaution should effectively protect any personal information available through the DOMS, NITT Alumni Association Online Community from abuse or outside interference, a certain degree of privacy risk is faced any time information is shared over the Internet. Therefore, through the Online Directory feature of the DOMS, NITT Alumni Association Online Community, you have the ability to hide your information from being viewed by other community members. </P>\r\n \r\n<b>II. Policy and Guidelines for Proper Use</b>\r\n<p>\r\nTo safeguard the operation of the DOMS, NITT Alumni Association Web Site, the Alumni Association has adopted many guidelines and policies that are used by the College to govern conduct, particularly conduct that occurs in an Online environment. </P>\r\n\r\n<i>Usage Policy</I><p>\r\nThis web site and all portions of the online community is for official Alumni Association use, as well as for individual communication of a personal nature between members listed herein. Use of this site or community information for any other purpose, including but not limited to reproducing and storing in a retrieval system by any means, electronic or mechanical, photocopying, or use of the names, addresses or other information contained in this web site or online community for any mailing (electronic or postal), is strictly prohibited without advance written permission of the DOMS, NITT Alumni Association.</P>\r\n\r\n<p>To contact the DOMS, NITT Alumni Association,  mailto:support@domsnittalumni.net </P>\r\n<p>\r\n\r\n<p>In addition to the Alumni Association and College''s policies and guidelines, users of the DOMS, NITT Alumni Association Web Site must abide by the following specific rules and regulations: <p>\r\n\r\n<p>A. Unauthorized copying, reproduction, republishing, uploading, downloading, posting, transmitting or duplicating any of the material or data is prohibited. You may download or copy any downloadable materials displayed on the DOMS, NITT Alumni Association Web Site and Online Community for home, noncommercial and personal in nature use only; provided, however, that you maintain all copyright, trademark and other notices contained in such material and you agree to abide by all additional copyright notices or restrictions contained in any material accessed through the DOMS, NITT Alumni Association Web Site. \r\nUsers shall not copy, download or otherwise use the information contained in the DOMS, NITT Alumni Association Web Site to send any commercial, public or political email. This includes SPAM.</P>\r\n\r\n<p>B. Use of information or communications available through the DOMS, NITT Alumni Association Web Site for any commercial, public or political purposes is strictly prohibited. Prohibited activities include, but are not limited to, solicitations for services, cold-calling of any kind or mass-mailings for any purposes. Information available through the DOMS, NITT Alumni Association Web Site may be used for communications of personal nature and official College-related purposes only. </p>\r\n\r\n<p>C. Users shall not restrict nor inhibit any other user from enjoying any service on the DOMS, NITT Alumni Association Web Site. Posting of obscene materials or use of obscene language, posting of vulgar materials, or use of vulgar language, or use of abusive, defamatory, profane, or threatening language of any kind, will constitute a violation of these policies governing the use of the DOMS, NITT Alumni Association Web Site Community. \r\nUsers shall not copy, download or otherwise use the information contained in the DOMS, NITT Alumni Association Web Site to send any commercial, public or political email. This includes SPAM.\r\nAdditionally, users shall not upload, transmit, distribute or otherwise publish any materials containing a virus or any other harmful component. \r\n</p>\r\n<p>D. All aliases adopted by DOMS, NITT Alumni Association Web Site users are subject to approval by the C the Alumni Association to ensure that the proper image is associated with the institution. \r\nNeither the College nor the Alumni Association is responsible for screening communications in advance, and neither the College nor the Association will actively monitor the use of the DOMS, NITT Alumni Association Web Site. For this reason, it is essential that the Alumni users of the DOMS, NITT Alumni Association Web Site report any abuses or misuse of the DOMS, NITT Alumni Association Web Site to the Alumni Association. If the Alumni Association determines that a user''s participation in the DOMS, NITT Alumni Association Web Site an creates a liability for the Alumni Association or that the user has violated the policies set forth herein, the Alumni Association reserves the right, in its sole discretion, to take actions against the user. The Alumni Association reserves the right to expel a user and deny a user further access to the DOMS, NITT Alumni Association Web Site if such user violates these policies or any applicable laws or regulations. </p>\r\n\r\n<b>III. Liability and Indemnity </b>\r\n\r\n<p>The reliability of the information available through the DOMS, NITT Alumni Association Web Site is largely dependent upon the actions of community registrants. The Alumni Association can make no representations about the accuracy, reliability, completeness, or timeliness of this information. </p>\r\n\r\n<p>The Alumni Association does not warrant that the DOMS, NITT Alumni Association Web Site web site and services provided will operate error-free or that the site and its server are free of computer viruses or other harmful material. To the fullest extent permitted by the law, the Alumni Association disclaims all warranties, including the warranties of merchantability, non-infringement, and fitness for particular purpose. In no event shall the Alumni Association or the College be liable for any damages whatsoever, including, without limitation, incidental, consequential, or punitive damages, resulting from the use of or inability to use information, materials or services available on the DOMS, NITT Alumni Association Web Site. </p>\r\n\r\n<p>By using the DOMS, NITT Alumni Association Web Site, you agree to indemnify, defend, and hold harmless the Alumni Association, the College, and their respective agents from and against any and all losses, claims, damages, costs, and expenses that may arise from your use of the DOMS, NITT Alumni Association Web Site  or your breach of these policies. The Alumni Association will provide notice to you of any such action or claim, and reserves the right to participate, at our expense, in the investigation, settlement, and defense of any such action or claim. </p>\r\n\r\n<p>Please note that the Alumni Association may revise these policies and your continued use of the site constitutes your agreement to comply with such modifications. You should review the policies periodically to ensure that you are familiar with them. </p>\r\n\r\n<p>Participation in the DOMS, NITT Alumni Association Web Site is a privilege. By using this web site, community and services provided therein, you agree to abide by the DOMS, NITT Alumni Association Web Site policies outlined herein.</p>\r\n', 'Thanks\r\nDASF Team', '', '2005-12-18 23:01:11', 21, 'english');
INSERT INTO `nuke_pages` (`pid`, `cid`, `title`, `subtitle`, `active`, `page_header`, `text`, `page_footer`, `signature`, `date`, `counter`, `clanguage`) VALUES (2, 2, 'DASF Charter', '', 1, 'DOMS Alumni Student Faculty (DASF) board.', '<b>Objectives</b>\r\n<ol>\r\n<li>Purpose Networking</li>\r\n<li>Placements</li>\r\n<li>Fund raising</li>\r\n<li>Summer projects</li>\r\n<li>Guest lectures</li>\r\n<li>Upgradation of curriculum</li>\r\n<li>Participation in seminars</li>\r\n<li>Selection process</li>\r\n</ol>', '', '', '2005-12-26 09:52:31', 4, 'english');
INSERT INTO `nuke_pages` (`pid`, `cid`, `title`, `subtitle`, `active`, `page_header`, `text`, `page_footer`, `signature`, `date`, `counter`, `clanguage`) VALUES (3, 2, 'DASF Board Members', '', 1, '', 'Mr.Tenzing (1988)\r\nMr.Satish (1997)\r\nMr.Subramaniam (1998)\r\nMr.Sunder Rajan (1999)\r\nMs.Madalasa (2000)\r\nMr.Abdul Mateen (2002)\r\nMr.Bharath Upadhaya (2003)\r\nMr Hariharasudhan (2004)\r\nMr.Shiva Kiran (2005)\r\nMr.Thangadurai (2006)\r\nMr.Prem Kumar (2007)\r\n\r\nUnfinished Structure of DASF Board\r\nbusiness Mode of operation of DASF \r\n', '', '', '2005-12-26 11:11:15', 3, 'english');
INSERT INTO `nuke_pages` (`pid`, `cid`, `title`, `subtitle`, `active`, `page_header`, `text`, `page_footer`, `signature`, `date`, `counter`, `clanguage`) VALUES (4, 1, 'Contact Address', '', 1, 'Contact Address', '<p>\r\n<b>The Head of the Department</b><br>\r\nDepartment of Management Studies,<br>\r\nNational Institute of Technology,<br>\r\nTiruchirapalli - 620 015<br>\r\nEmail : mba@nitt.edu<br>  \r\nTelex : 455-294 RECTIN<br>  \r\nPhone : (0431) 2500281(3 lines)<br> \r\nFax : 91-431-2500133<br> \r\n</p>\r\n \r\n\r\n  \r\n ', '', '', '2005-12-27 08:14:07', 1, 'english');

## ########################################################

## 
## Table structure for table `nuke_pages_categories`
## 

DROP TABLE IF EXISTS `nuke_pages_categories`;
CREATE TABLE `nuke_pages_categories` (
  `cid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

## 
## Dumping data for table `nuke_pages_categories`
## 

INSERT INTO `nuke_pages_categories` (`cid`, `title`, `description`) VALUES (1, 'DOMS', 'Content Related DOMS');
INSERT INTO `nuke_pages_categories` (`cid`, `title`, `description`) VALUES (2, 'DASF', 'Content related to DASF');
INSERT INTO `nuke_pages_categories` (`cid`, `title`, `description`) VALUES (3, 'Website', 'Website Related Content');

## ########################################################

## 
## Table structure for table `nuke_poll_check`
## 

DROP TABLE IF EXISTS `nuke_poll_check`;
CREATE TABLE `nuke_poll_check` (
  `ip` varchar(20) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `pollID` int(10) NOT NULL default '0'
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_poll_check`
## 

INSERT INTO `nuke_poll_check` (`ip`, `time`, `pollID`) VALUES ('203.129.195.138', '1135850532', 1);

## ########################################################

## 
## Table structure for table `nuke_poll_data`
## 

DROP TABLE IF EXISTS `nuke_poll_data`;
CREATE TABLE `nuke_poll_data` (
  `pollID` int(11) NOT NULL default '0',
  `optionText` char(50) NOT NULL default '',
  `optionCount` int(11) NOT NULL default '0',
  `voteID` int(11) NOT NULL default '0'
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_poll_data`
## 

INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, 'Ummmm, not bad', 0, 1);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, 'Good', 3, 2);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, 'Terrific', 2, 3);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, 'What the hell is this?', 0, 4);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 5);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 6);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 7);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 8);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 9);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 10);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 11);
INSERT INTO `nuke_poll_data` (`pollID`, `optionText`, `optionCount`, `voteID`) VALUES (1, '', 0, 12);

## ########################################################

## 
## Table structure for table `nuke_poll_desc`
## 

DROP TABLE IF EXISTS `nuke_poll_desc`;
CREATE TABLE `nuke_poll_desc` (
  `pollID` int(11) NOT NULL auto_increment,
  `pollTitle` varchar(100) NOT NULL default '',
  `timeStamp` int(11) NOT NULL default '0',
  `voters` mediumint(9) NOT NULL default '0',
  `planguage` varchar(30) NOT NULL default '',
  `artid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`pollID`),
  KEY `pollID` (`pollID`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_poll_desc`
## 

INSERT INTO `nuke_poll_desc` (`pollID`, `pollTitle`, `timeStamp`, `voters`, `planguage`, `artid`) VALUES (1, 'What do you think about this site?', 961405160, 5, 'english', 0);

## ########################################################

## 
## Table structure for table `nuke_pollcomments`
## 

DROP TABLE IF EXISTS `nuke_pollcomments`;
CREATE TABLE `nuke_pollcomments` (
  `tid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `pollID` int(11) NOT NULL default '0',
  `date` datetime default NULL,
  `name` varchar(60) NOT NULL default '',
  `email` varchar(60) default NULL,
  `url` varchar(60) default NULL,
  `host_name` varchar(60) default NULL,
  `subject` varchar(60) NOT NULL default '',
  `comment` text NOT NULL,
  `score` tinyint(4) NOT NULL default '0',
  `reason` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`),
  KEY `pollID` (`pollID`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_pollcomments`
## 


## ########################################################

## 
## Table structure for table `nuke_public_messages`
## 

DROP TABLE IF EXISTS `nuke_public_messages`;
CREATE TABLE `nuke_public_messages` (
  `mid` int(10) NOT NULL auto_increment,
  `content` varchar(255) NOT NULL default '',
  `date` varchar(14) default NULL,
  `who` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  KEY `mid` (`mid`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_public_messages`
## 


## ########################################################

## 
## Table structure for table `nuke_queue`
## 

DROP TABLE IF EXISTS `nuke_queue`;
CREATE TABLE `nuke_queue` (
  `qid` smallint(5) unsigned NOT NULL auto_increment,
  `uid` mediumint(9) NOT NULL default '0',
  `uname` varchar(40) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `story` text,
  `storyext` text NOT NULL,
  `timestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `topic` varchar(20) NOT NULL default '',
  `alanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`qid`),
  KEY `qid` (`qid`),
  KEY `uid` (`uid`),
  KEY `uname` (`uname`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

## 
## Dumping data for table `nuke_queue`
## 


## ########################################################

## 
## Table structure for table `nuke_quotes`
## 

DROP TABLE IF EXISTS `nuke_quotes`;
CREATE TABLE `nuke_quotes` (
  `qid` int(10) unsigned NOT NULL auto_increment,
  `quote` text,
  PRIMARY KEY  (`qid`),
  KEY `qid` (`qid`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

## 
## Dumping data for table `nuke_quotes`
## 

INSERT INTO `nuke_quotes` (`qid`, `quote`) VALUES (1, 'Nos morituri te salutamus - CBHS');

## ########################################################

## 
## Table structure for table `nuke_referer`
## 

DROP TABLE IF EXISTS `nuke_referer`;
CREATE TABLE `nuke_referer` (
  `rid` int(11) NOT NULL auto_increment,
  `url` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`)
) TYPE=MyISAM AUTO_INCREMENT=54 ;

## 
## Dumping data for table `nuke_referer`
## 

INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (43, 'http://www.whois.sc/domsnittalumni.net');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (44, 'http://domsnittalumni.net/portal/modules.php?name=Your_Account&op=userinfo&bypass=1&username=lalit');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (45, 'http://us.f354.mail.yahoo.com/ym/ShowLetter?MsgId=6746_9474225_59179_1851_779_0_43809_3244_433333941');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (46, 'http://domsnittalumni.net/portal/modules.php?name=Your_Account&op=userinfo&bypass=1&username=lalit');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (47, 'http://domsnittalumni.net/portal/modules.php?name=Private_Messages&file=index&sid=a48da9b0f360fa356b');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (48, 'http://domsnittalumni.net/portal/modules.php?name=Forums&file=profile&mode=viewprofile&u=12&sid=fdf5');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (49, 'http://us.f368.mail.yahoo.com/ym/ShowLetter?MsgId=3289_145723_15690_2968_3235_0_13841_12580_16521042');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (50, 'http://domsnittalumni.net/portal/modules.php?name=Your_Account&op=userinfo&bypass=1&username=lalit');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (51, 'http://mail.nitt.edu/horde/imp/message.php?index=276');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (52, 'http://domsnittalumni.net/portal/modules.php?name=Members_List');
INSERT INTO `nuke_referer` (`rid`, `url`) VALUES (53, 'http://www.google.co.in/search?hl=en&q=domsnittalumni&meta=');

## ########################################################

## 
## Table structure for table `nuke_related`
## 

DROP TABLE IF EXISTS `nuke_related`;
CREATE TABLE `nuke_related` (
  `rid` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `url` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`),
  KEY `tid` (`tid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_related`
## 


## ########################################################

## 
## Table structure for table `nuke_reviews`
## 

DROP TABLE IF EXISTS `nuke_reviews`;
CREATE TABLE `nuke_reviews` (
  `id` int(10) NOT NULL auto_increment,
  `date` date NOT NULL default '0000-00-00',
  `title` varchar(150) NOT NULL default '',
  `text` text NOT NULL,
  `reviewer` varchar(20) default NULL,
  `email` varchar(60) default NULL,
  `score` int(10) NOT NULL default '0',
  `cover` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `url_title` varchar(50) NOT NULL default '',
  `hits` int(10) NOT NULL default '0',
  `rlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_reviews`
## 


## ########################################################

## 
## Table structure for table `nuke_reviews_add`
## 

DROP TABLE IF EXISTS `nuke_reviews_add`;
CREATE TABLE `nuke_reviews_add` (
  `id` int(10) NOT NULL auto_increment,
  `date` date default NULL,
  `title` varchar(150) NOT NULL default '',
  `text` text NOT NULL,
  `reviewer` varchar(20) NOT NULL default '',
  `email` varchar(60) default NULL,
  `score` int(10) NOT NULL default '0',
  `url` varchar(100) NOT NULL default '',
  `url_title` varchar(50) NOT NULL default '',
  `rlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_reviews_add`
## 


## ########################################################

## 
## Table structure for table `nuke_reviews_comments`
## 

DROP TABLE IF EXISTS `nuke_reviews_comments`;
CREATE TABLE `nuke_reviews_comments` (
  `cid` int(10) NOT NULL auto_increment,
  `rid` int(10) NOT NULL default '0',
  `userid` varchar(25) NOT NULL default '',
  `date` datetime default NULL,
  `comments` text,
  `score` int(10) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`),
  KEY `rid` (`rid`),
  KEY `userid` (`userid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_reviews_comments`
## 


## ########################################################

## 
## Table structure for table `nuke_reviews_main`
## 

DROP TABLE IF EXISTS `nuke_reviews_main`;
CREATE TABLE `nuke_reviews_main` (
  `title` varchar(100) default NULL,
  `description` text
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_reviews_main`
## 

INSERT INTO `nuke_reviews_main` (`title`, `description`) VALUES ('Reviews Section Title', 'Reviews Section Long Description');

## ########################################################

## 
## Table structure for table `nuke_session`
## 

DROP TABLE IF EXISTS `nuke_session`;
CREATE TABLE `nuke_session` (
  `uname` varchar(25) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `host_addr` varchar(48) NOT NULL default '',
  `guest` int(1) NOT NULL default '0',
  KEY `time` (`time`),
  KEY `guest` (`guest`)
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_session`
## 

INSERT INTO `nuke_session` (`uname`, `time`, `host_addr`, `guest`) VALUES ('221.134.125.2', '1135857218', '221.134.125.2', 1);
INSERT INTO `nuke_session` (`uname`, `time`, `host_addr`, `guest`) VALUES ('59.92.158.71', '1135857953', '59.92.158.71', 1);
INSERT INTO `nuke_session` (`uname`, `time`, `host_addr`, `guest`) VALUES ('203.200.211.65', '1135856239', '203.200.211.65', 1);

## ########################################################

## 
## Table structure for table `nuke_stats_date`
## 

DROP TABLE IF EXISTS `nuke_stats_date`;
CREATE TABLE `nuke_stats_date` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_stats_date`
## 

INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 1, 31, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 2, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 3, 31, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 4, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 5, 31, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 6, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 7, 31, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 8, 31, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 9, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 10, 31, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 7, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 8, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 9, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 10, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 11, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 12, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 13, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 14, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 15, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 16, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 17, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 18, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 19, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 20, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 21, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 22, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 24, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 25, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 26, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 27, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 28, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 29, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 11, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 1, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 2, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 3, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 4, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 5, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 6, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 7, 23);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 8, 255);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 9, 137);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 10, 33);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 11, 73);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 12, 52);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 13, 38);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 14, 119);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 15, 12);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 16, 10);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 17, 2);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 18, 58);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 19, 331);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 20, 177);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 21, 9);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 22, 41);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 23, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 24, 16);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 25, 9);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 26, 297);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 27, 93);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 28, 113);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 29, 329);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 30, 0);
INSERT INTO `nuke_stats_date` (`year`, `month`, `date`, `hits`) VALUES (2005, 12, 31, 0);

## ########################################################

## 
## Table structure for table `nuke_stats_hour`
## 

DROP TABLE IF EXISTS `nuke_stats_hour`;
CREATE TABLE `nuke_stats_hour` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hour` tinyint(4) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0'
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_stats_hour`
## 

INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 7, 23, 23);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 0, 56);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 1, 47);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 2, 50);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 3, 69);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 4, 26);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 5, 3);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 8, 4);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 8, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 1, 70);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 2, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 3, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 6, 7);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 7, 27);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 8, 16);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 9, 14);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 9, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 7, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 9, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 13, 10);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 14, 5);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 16, 13);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 22, 3);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 10, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 1, 16);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 7, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 22, 36);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 11, 23, 20);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 0, 7);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 1, 20);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 3, 4);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 7, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 8, 19);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 12, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 1, 19);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 4, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 7, 16);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 9, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 21, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 13, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 0, 9);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 1, 89);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 3, 6);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 4, 13);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 9, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 14, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 0, 10);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 2, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 3, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 15, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 3, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 4, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 8, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 9, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 12, 3);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 16, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 6, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 17, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 19, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 20, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 21, 6);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 22, 13);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 18, 23, 37);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 0, 14);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 1, 76);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 2, 19);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 3, 28);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 4, 10);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 5, 81);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 6, 82);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 8, 6);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 10, 5);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 11, 9);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 16, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 19, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 0, 9);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 4, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 7, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 8, 67);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 9, 43);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 10, 29);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 20, 23, 26);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 8, 8);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 21, 23, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 1, 4);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 3, 31);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 22, 6);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 22, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 0, 16);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 24, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 16, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 21, 8);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 25, 23, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 2, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 5, 48);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 6, 14);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 7, 6);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 8, 10);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 9, 110);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 10, 65);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 11, 28);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 15, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 17, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 20, 6);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 21, 5);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 26, 23, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 3, 21);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 6, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 7, 29);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 8, 40);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 20, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 27, 23, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 0, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 1, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 2, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 3, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 4, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 19, 1);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 22, 73);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 28, 23, 39);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 0, 93);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 1, 67);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 2, 94);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 3, 73);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 4, 2);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 5, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 6, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 7, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 8, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 9, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 10, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 11, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 12, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 13, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 14, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 15, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 16, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 17, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 18, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 19, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 20, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 21, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 22, 0);
INSERT INTO `nuke_stats_hour` (`year`, `month`, `date`, `hour`, `hits`) VALUES (2005, 12, 29, 23, 0);

## ########################################################

## 
## Table structure for table `nuke_stats_month`
## 

DROP TABLE IF EXISTS `nuke_stats_month`;
CREATE TABLE `nuke_stats_month` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_stats_month`
## 

INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 1, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 2, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 3, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 4, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 5, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 6, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 7, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 8, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 9, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 10, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 11, 0);
INSERT INTO `nuke_stats_month` (`year`, `month`, `hits`) VALUES (2005, 12, 2227);

## ########################################################

## 
## Table structure for table `nuke_stats_year`
## 

DROP TABLE IF EXISTS `nuke_stats_year`;
CREATE TABLE `nuke_stats_year` (
  `year` smallint(6) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

## 
## Dumping data for table `nuke_stats_year`
## 

INSERT INTO `nuke_stats_year` (`year`, `hits`) VALUES (2005, 2227);

## ########################################################

## 
## Table structure for table `nuke_stories`
## 

DROP TABLE IF EXISTS `nuke_stories`;
CREATE TABLE `nuke_stories` (
  `sid` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `aid` varchar(30) NOT NULL default '',
  `title` varchar(80) default NULL,
  `time` datetime default NULL,
  `hometext` text,
  `bodytext` text NOT NULL,
  `comments` int(11) default '0',
  `counter` mediumint(8) unsigned default NULL,
  `topic` int(3) NOT NULL default '1',
  `informant` varchar(20) NOT NULL default '',
  `notes` text NOT NULL,
  `ihome` int(1) NOT NULL default '0',
  `alanguage` varchar(30) NOT NULL default '',
  `acomm` int(1) NOT NULL default '0',
  `haspoll` int(1) NOT NULL default '0',
  `pollID` int(10) NOT NULL default '0',
  `score` int(10) NOT NULL default '0',
  `ratings` int(10) NOT NULL default '0',
  `associated` text NOT NULL,
  PRIMARY KEY  (`sid`),
  KEY `sid` (`sid`),
  KEY `catid` (`catid`),
  KEY `counter` (`counter`),
  KEY `topic` (`topic`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

## 
## Dumping data for table `nuke_stories`
## 

INSERT INTO `nuke_stories` (`sid`, `catid`, `aid`, `title`, `time`, `hometext`, `bodytext`, `comments`, `counter`, `topic`, `informant`, `notes`, `ihome`, `alanguage`, `acomm`, `haspoll`, `pollID`, `score`, `ratings`, `associated`) VALUES (1, 2, 'admin', 'DOMS Alumni - Alpha Release', '2005-12-08 01:32:36', 'New DOMS Alumni - Alpha version of the site release of limited audience, the beta version would be release on Dec 20th', '', 0, 17, 2, 'admin', '', 1, '', 0, 0, 0, 0, 0, '2-');
INSERT INTO `nuke_stories` (`sid`, `catid`, `aid`, `title`, `time`, `hometext`, `bodytext`, `comments`, `counter`, `topic`, `informant`, `notes`, `ihome`, `alanguage`, `acomm`, `haspoll`, `pollID`, `score`, `ratings`, `associated`) VALUES (2, 1, 'admin', 'Bangalore Chapter Meet - 11th Dec', '2005-12-19 03:46:11', 'There was an informal meet of the alumni in Bangalore to foster the activities of the DASF. <br />\r\n<br />\r\n<br />\r\nThe out comes of the meet are:<br />\r\n<br />\r\n<UL>\r\n<b>Funding</b><br />\r\n<br />\r\n\r\n<li>There needs to be a fund base of rupees 2lakhs+ every year for activities like …<br />\r\n<br />\r\nGuest Lectures: 1 lakh<br />\r\n<br />\r\nLibrary fund:         40 k<br />\r\n<br />\r\nWorkshops:          50 k<br />\r\n<br />\r\nAlumni (Annual meet): 30k<br />\r\n<br />\r\nRegional alumni chapter meets can be self funded by the alumni.<br />\r\n<br />\r\n            <br />\r\n<br />\r\n<b>Collection of funds</b><br />\r\n<br />\r\n<li>500 per head for the first year. Thinking of having a life time fee which will become the main corpus for the DASF Activities. (Can any one calculate how much it can be - ??)<br />\r\n<br />\r\n<li>An account needs to be opened in ICICI (As it gives flexibility of e-pay) on the Alumni Association name. <br />\r\n<br />\r\n<li>Funds can be transferred to the account directly on the name of alumni association.<br />\r\n<br />\r\n<li>The account will be maintained by one alumnus, one faculty and one student.<br />\r\n<br />\r\n            <br />\r\n<br />\r\n<b>DASF</b><br />\r\n<br />\r\n<li>It needs to be registered legally.<br />\r\n<br />\r\n                                    <br />\r\n<br />\r\n<b>Guest Lectures</b> <br />\r\n<br />\r\n<li>The faculty will be requested to give the list of curriculum on which they want the alumni to generate guest lectures. Approximately we calculated around 10 hours of guest lectures on each of the course. There are around 36 courses (both for first and second years included in a year). If say half of that is funded by dept with their regular funding for GLs, then the remaining hours of GLs can be taken care by DASF.<br />\r\n<br />\r\n<li>Traveling and accommodation needs to be taken care by the dept. Apart from it there can be payment on usual norms to the Guest Faculty. <br />\r\n<br />\r\n <br />\r\n<br />\r\n<b>Networking</b><br />\r\n<br />\r\n<li>The issues of alumni data base maintenance and networking can be addressed by the upcoming website.<br />\r\n<br />\r\n <br />\r\n<br />\r\n<b>Alumni meet</b><br />\r\n<br />\r\nA yearly all alumni annual meet. (Funded by DASF)<br />\r\n<br />\r\nA half yearly meet at city level.(Self funded)<br />\r\n<br />\r\n</ul>', '', 0, 12, 3, 'shivakiran', '', 1, '', 0, 0, 0, 0, 0, '3-');
INSERT INTO `nuke_stories` (`sid`, `catid`, `aid`, `title`, `time`, `hometext`, `bodytext`, `comments`, `counter`, `topic`, `informant`, `notes`, `ihome`, `alanguage`, `acomm`, `haspoll`, `pollID`, `score`, `ratings`, `associated`) VALUES (3, 1, 'admin', 'Alumni Meet Bangalore', '2005-12-19 03:46:56', 'MINUTES OF LIGATURE’05(ALUMNI MEET)<br />\r\nNOVEMBER 13, 2005, ASHRAYA INTERNATIONAL<br />\r\nBANGLORE<br />\r\n<br />\r\n<br />\r\n<br />\r\nHead of Dept’s                      The department’s developments in curriculum <br />\r\n Welcome address        	 upgradation, infrastructure,placements etc<br />\r\n	Call for alumni fund for the betterment of the department.<br />\r\n	Inaugration of fund by donating Rs 5000<br />\r\n<br />\r\n<br />\r\nPresentation by	Mission of DOMS<br />\r\nVinod	Various achievements like 100% placement, shifting to        <br />\r\n	 trimester pattern etc.<br />\r\n	Alumni’s generous contribution in times of need.<br />\r\n	Purpose and constitution of DOMS Alumni Student Faculty  <br />\r\n	 (DASF) board.<br />\r\n<br />\r\nAlumni’s	Urgent requirement of complete alumni database.<br />\r\nWords	Placement aid by provision of leads and in any other way <br />\r\n	 possible.<br />\r\n	Acceptance to share corporate and academic knowledge in <br />\r\n	 the form of guest lectures<br />\r\n	Willingness to contribute generously for the betterment of <br />\r\n	 the dept.<br />\r\n	Idea of selling the image of DOMS as DOMS but not NITT.<br />\r\n	Focus on dept’s expertise in systems and data analytics.<br />\r\n	Provision of consultancy services to small scale industries in <br />\r\n	 Trichy.<br />\r\n	Installation of loyalty in minds of student which helps in lower attrition rate which in turn develops the image of the college<br />\r\n	<br />\r\n<br />\r\nDASF<br />\r\nBOARD<br />\r\nPurpose	Networking.<br />\r\n	Placements<br />\r\n                                                Fund raising<br />\r\n	Summer projects<br />\r\n	Guest lectures<br />\r\n	Upgradation of curriculum<br />\r\n	Participation in seminars<br />\r\n	Selection process<br />\r\n<br />\r\n  Members 	Mr.Tenzing (1988)<br />\r\n  elected	Mr.Satish (1997)<br />\r\n	Mr.Subramaniam (1998)<br />\r\n	Mr.Sunder Rajan (1999)<br />\r\n	Ms.Madalasa (2000)<br />\r\n	Mr.Abdul Mateen (2002)<br />\r\n	Mr.Bharath Upadhaya (2003)<br />\r\n	Mr Hariharasudhan (2004)<br />\r\n	Mr.Shiva Kiran (2005)<br />\r\n	Mr.Thangadurai (2006)<br />\r\n	Mr.Prem Kumar (2007)<br />\r\n<br />\r\nUnfinished	Structure of DASF Board<br />\r\n business	Mode of operation of DASF <br />\r\n<br />\r\n The meet was adjourned at 2 p.m.<br />\r\n', '', 0, 11, 3, 'shivakiran', '', 1, '', 0, 0, 0, 0, 0, '3-');

## ########################################################

## 
## Table structure for table `nuke_stories_cat`
## 

DROP TABLE IF EXISTS `nuke_stories_cat`;
CREATE TABLE `nuke_stories_cat` (
  `catid` int(11) NOT NULL auto_increment,
  `title` varchar(20) NOT NULL default '',
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`catid`),
  KEY `catid` (`catid`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

## 
## Dumping data for table `nuke_stories_cat`
## 

INSERT INTO `nuke_stories_cat` (`catid`, `title`, `counter`) VALUES (1, 'DASF', 3);
INSERT INTO `nuke_stories_cat` (`catid`, `title`, `counter`) VALUES (2, 'Website', 0);

## ########################################################

## 
## Table structure for table `nuke_subscriptions`
## 

DROP TABLE IF EXISTS `nuke_subscriptions`;
CREATE TABLE `nuke_subscriptions` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) default '0',
  `subscription_expire` varchar(50) NOT NULL default '',
  KEY `id` (`id`,`userid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

## 
## Dumping data for table `nuke_subscriptions`
## 


## ########################################################

## 
## Table structure for table `nuke_topics`
## 

DROP TABLE IF EXISTS `nuke_topics`;
CREATE TABLE `nuke_topics` (
  `topicid` int(3) NOT NULL auto_increment,
  `topicname` varchar(20) default NULL,
  `topicimage` varchar(20) default NULL,
  `topictext` varchar(40) default NULL,
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`topicid`),
  KEY `topicid` (`topicid`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

## 
## Dumping data for table `nuke_topics`
## 

INSERT INTO `nuke_topics` (`topicid`, `topicname`, `topicimage`, `topictext`, `counter`) VALUES (2, 'Website News', 'phpnuke.gif', 'Website', 0);
INSERT INTO `nuke_topics` (`topicid`, `topicname`, `topicimage`, `topictext`, `counter`) VALUES (3, 'DOMS News', 'phpnuke.gif', 'DOMS NEWS', 0);

## ########################################################

## 
## Table structure for table `nuke_users`
## 

DROP TABLE IF EXISTS `nuke_users`;
CREATE TABLE `nuke_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `username` varchar(25) NOT NULL default '',
  `user_email` varchar(255) NOT NULL default '',
  `femail` varchar(255) NOT NULL default '',
  `user_website` varchar(255) NOT NULL default '',
  `user_avatar` varchar(255) NOT NULL default '',
  `user_regdate` varchar(20) NOT NULL default '',
  `user_icq` varchar(15) default NULL,
  `user_occ` varchar(100) default NULL,
  `user_from` varchar(100) default NULL,
  `user_interests` varchar(150) NOT NULL default '',
  `user_sig` varchar(255) default NULL,
  `user_viewemail` tinyint(2) default NULL,
  `user_theme` int(3) default NULL,
  `user_aim` varchar(18) default NULL,
  `user_yim` varchar(25) default NULL,
  `user_msnm` varchar(25) default NULL,
  `user_password` varchar(40) NOT NULL default '',
  `storynum` tinyint(4) NOT NULL default '10',
  `umode` varchar(10) NOT NULL default '',
  `uorder` tinyint(1) NOT NULL default '0',
  `thold` tinyint(1) NOT NULL default '0',
  `noscore` tinyint(1) NOT NULL default '0',
  `bio` tinytext NOT NULL,
  `ublockon` tinyint(1) NOT NULL default '0',
  `ublock` tinytext NOT NULL,
  `theme` varchar(255) NOT NULL default '',
  `commentmax` int(11) NOT NULL default '4096',
  `counter` int(11) NOT NULL default '0',
  `newsletter` int(1) NOT NULL default '0',
  `user_posts` int(10) NOT NULL default '0',
  `user_attachsig` int(2) NOT NULL default '0',
  `user_rank` int(10) NOT NULL default '0',
  `user_level` int(10) NOT NULL default '1',
  `broadcast` tinyint(1) NOT NULL default '1',
  `popmeson` tinyint(1) NOT NULL default '0',
  `user_active` tinyint(1) default '1',
  `user_session_time` int(11) NOT NULL default '0',
  `user_session_page` smallint(5) NOT NULL default '0',
  `user_lastvisit` int(11) NOT NULL default '0',
  `user_timezone` tinyint(4) NOT NULL default '10',
  `user_style` tinyint(4) default NULL,
  `user_lang` varchar(255) NOT NULL default 'english',
  `user_dateformat` varchar(14) NOT NULL default 'D M d, Y g:i a',
  `user_new_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_unread_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_last_privmsg` int(11) NOT NULL default '0',
  `user_emailtime` int(11) default NULL,
  `user_allowhtml` tinyint(1) default '1',
  `user_allowbbcode` tinyint(1) default '1',
  `user_allowsmile` tinyint(1) default '1',
  `user_allowavatar` tinyint(1) NOT NULL default '1',
  `user_allow_pm` tinyint(1) NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) NOT NULL default '1',
  `user_notify` tinyint(1) NOT NULL default '0',
  `user_notify_pm` tinyint(1) NOT NULL default '0',
  `user_popup_pm` tinyint(1) NOT NULL default '0',
  `user_avatar_type` tinyint(4) NOT NULL default '3',
  `user_sig_bbcode_uid` varchar(10) default NULL,
  `user_actkey` varchar(32) default NULL,
  `user_newpasswd` varchar(32) default NULL,
  `points` int(10) default '0',
  `last_ip` varchar(15) NOT NULL default '0',
  `usertype` varchar(10) default NULL,
  `gradyear` int(4) default NULL,
  `company` varchar(50) default NULL,
  `designation` varchar(50) default NULL,
  `specialization` varchar(20) default NULL,
  `Company_Address_1` varchar(50) default NULL,
  `Company_Address_2` varchar(50) default NULL,
  `Company_Address_CITY` varchar(30) default NULL,
  `Company_Address_STATE` varchar(30) default NULL,
  `Company_Address_COUNTRY` varchar(30) default NULL,
  `Company_Address_MOBILE` varchar(30) default NULL,
  `Company_Address_PHONE` varchar(30) default NULL,
  `Company_Address_FAX` varchar(30) default NULL,
  `Company_Address_EMAIL` varchar(50) default NULL,
  `PERMANENT_Address_1` varchar(50) default NULL,
  `PERMANENT_Address_2` varchar(50) default NULL,
  `PERMANENT_Address_CITY` varchar(30) default NULL,
  `PERMANENT_Address_STATE` varchar(30) default NULL,
  `PERMANENT_Address_COUNTRY` varchar(30) default NULL,
  `PERMANENT_Address_MOBILE` varchar(30) default NULL,
  `PERMANENT_Address_PHONE` varchar(30) default NULL,
  `PERMANENT_Address_FAX` varchar(30) default NULL,
  `PERMANENT_Address_EMAIL` varchar(50) default NULL,
  `dasf_member` tinyint(1) default NULL,
  `guest_lectures_ok` tinyint(1) default NULL,
  `guest_lectures_topics` varchar(150) default NULL,
  `summer_projects_ok` tinyint(1) default NULL,
  `placements_ok` tinyint(1) default NULL,
  `financial_help_ok` tinyint(1) default NULL,
  `Company_Address_ZIP` varchar(50) default NULL,
  `PERMANENT_Address_ZIP` varchar(30) default NULL,
  `dob` date default '0000-00-00',
  `sex` char(1) default NULL,
  `is_married` tinyint(1) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `uid` (`user_id`),
  KEY `uname` (`username`),
  KEY `user_session_time` (`user_session_time`)
) TYPE=MyISAM AUTO_INCREMENT=13 ;

## 
## Dumping data for table `nuke_users`
## 

INSERT INTO `nuke_users` (`user_id`, `name`, `username`, `user_email`, `femail`, `user_website`, `user_avatar`, `user_regdate`, `user_icq`, `user_occ`, `user_from`, `user_interests`, `user_sig`, `user_viewemail`, `user_theme`, `user_aim`, `user_yim`, `user_msnm`, `user_password`, `storynum`, `umode`, `uorder`, `thold`, `noscore`, `bio`, `ublockon`, `ublock`, `theme`, `commentmax`, `counter`, `newsletter`, `user_posts`, `user_attachsig`, `user_rank`, `user_level`, `broadcast`, `popmeson`, `user_active`, `user_session_time`, `user_session_page`, `user_lastvisit`, `user_timezone`, `user_style`, `user_lang`, `user_dateformat`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_emailtime`, `user_allowhtml`, `user_allowbbcode`, `user_allowsmile`, `user_allowavatar`, `user_allow_pm`, `user_allow_viewonline`, `user_notify`, `user_notify_pm`, `user_popup_pm`, `user_avatar_type`, `user_sig_bbcode_uid`, `user_actkey`, `user_newpasswd`, `points`, `last_ip`, `usertype`, `gradyear`, `company`, `designation`, `specialization`, `Company_Address_1`, `Company_Address_2`, `Company_Address_CITY`, `Company_Address_STATE`, `Company_Address_COUNTRY`, `Company_Address_MOBILE`, `Company_Address_PHONE`, `Company_Address_FAX`, `Company_Address_EMAIL`, `PERMANENT_Address_1`, `PERMANENT_Address_2`, `PERMANENT_Address_CITY`, `PERMANENT_Address_STATE`, `PERMANENT_Address_COUNTRY`, `PERMANENT_Address_MOBILE`, `PERMANENT_Address_PHONE`, `PERMANENT_Address_FAX`, `PERMANENT_Address_EMAIL`, `dasf_member`, `guest_lectures_ok`, `guest_lectures_topics`, `summer_projects_ok`, `placements_ok`, `financial_help_ok`, `Company_Address_ZIP`, `PERMANENT_Address_ZIP`, `dob`, `sex`, `is_married`) VALUES (9, 'Sundara Rajan G', 'Sundar', 'g.sundararajan@iflexsolutions.com', '', '', 'gallery/004.gif', 'Dec 28, 2005', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '21873f3df81642e13eb8e688fc09a477', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135838480, 0, 1135837898, 10, NULL, 'english', 'D M d, Y g:i a', 0, 0, 1135837727, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, NULL, NULL, NULL, 4, '59.145.67.22', 'Alumni', 1999, 'i-flex solutions', 'Consultant', 'Systems', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL);
INSERT INTO `nuke_users` (`user_id`, `name`, `username`, `user_email`, `femail`, `user_website`, `user_avatar`, `user_regdate`, `user_icq`, `user_occ`, `user_from`, `user_interests`, `user_sig`, `user_viewemail`, `user_theme`, `user_aim`, `user_yim`, `user_msnm`, `user_password`, `storynum`, `umode`, `uorder`, `thold`, `noscore`, `bio`, `ublockon`, `ublock`, `theme`, `commentmax`, `counter`, `newsletter`, `user_posts`, `user_attachsig`, `user_rank`, `user_level`, `broadcast`, `popmeson`, `user_active`, `user_session_time`, `user_session_page`, `user_lastvisit`, `user_timezone`, `user_style`, `user_lang`, `user_dateformat`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_emailtime`, `user_allowhtml`, `user_allowbbcode`, `user_allowsmile`, `user_allowavatar`, `user_allow_pm`, `user_allow_viewonline`, `user_notify`, `user_notify_pm`, `user_popup_pm`, `user_avatar_type`, `user_sig_bbcode_uid`, `user_actkey`, `user_newpasswd`, `points`, `last_ip`, `usertype`, `gradyear`, `company`, `designation`, `specialization`, `Company_Address_1`, `Company_Address_2`, `Company_Address_CITY`, `Company_Address_STATE`, `Company_Address_COUNTRY`, `Company_Address_MOBILE`, `Company_Address_PHONE`, `Company_Address_FAX`, `Company_Address_EMAIL`, `PERMANENT_Address_1`, `PERMANENT_Address_2`, `PERMANENT_Address_CITY`, `PERMANENT_Address_STATE`, `PERMANENT_Address_COUNTRY`, `PERMANENT_Address_MOBILE`, `PERMANENT_Address_PHONE`, `PERMANENT_Address_FAX`, `PERMANENT_Address_EMAIL`, `dasf_member`, `guest_lectures_ok`, `guest_lectures_topics`, `summer_projects_ok`, `placements_ok`, `financial_help_ok`, `Company_Address_ZIP`, `PERMANENT_Address_ZIP`, `dob`, `sex`, `is_married`) VALUES (8, 'Satish Kumar', 'satish', 'avsk71@yahoo.com', 'satish@nothing.com', 'http://', 'gallery/048.gif', 'Dec 26, 2005', 'satish71', '', '', '', 'Satish Kumar A.V.', 0, NULL, '', 'avsk71', '', '72bfb409ab10f1a38901327b5148cd96', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1135855877, 0, 1135855492, 5, NULL, 'english', 'D M d, Y g:i a', 1, 0, 1135855880, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, NULL, NULL, NULL, 1, '221.134.125.2', 'Alumni', 1997, 'InMage Systems', 'VP Product Delivery & Principal Architect', 'Finance', '301,Shristi Towers', 'Madhapur', 'Hyderabad', 'AP', 'IN', '09885067235', '040 55848013', '040 55848016', 'satish@inmage.in', 'B 24/1', 'Rukminipuri,ECIL Post', 'Hyderabad', 'AP', 'IN', '09849029685', '040 27123276', '', 'avsk71@yahoo.com', 0, 0, '', 1, 1, 1, '500081', '500062', '1971-01-15', 'M', 1);
INSERT INTO `nuke_users` (`user_id`, `name`, `username`, `user_email`, `femail`, `user_website`, `user_avatar`, `user_regdate`, `user_icq`, `user_occ`, `user_from`, `user_interests`, `user_sig`, `user_viewemail`, `user_theme`, `user_aim`, `user_yim`, `user_msnm`, `user_password`, `storynum`, `umode`, `uorder`, `thold`, `noscore`, `bio`, `ublockon`, `ublock`, `theme`, `commentmax`, `counter`, `newsletter`, `user_posts`, `user_attachsig`, `user_rank`, `user_level`, `broadcast`, `popmeson`, `user_active`, `user_session_time`, `user_session_page`, `user_lastvisit`, `user_timezone`, `user_style`, `user_lang`, `user_dateformat`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_emailtime`, `user_allowhtml`, `user_allowbbcode`, `user_allowsmile`, `user_allowavatar`, `user_allow_pm`, `user_allow_viewonline`, `user_notify`, `user_notify_pm`, `user_popup_pm`, `user_avatar_type`, `user_sig_bbcode_uid`, `user_actkey`, `user_newpasswd`, `points`, `last_ip`, `usertype`, `gradyear`, `company`, `designation`, `specialization`, `Company_Address_1`, `Company_Address_2`, `Company_Address_CITY`, `Company_Address_STATE`, `Company_Address_COUNTRY`, `Company_Address_MOBILE`, `Company_Address_PHONE`, `Company_Address_FAX`, `Company_Address_EMAIL`, `PERMANENT_Address_1`, `PERMANENT_Address_2`, `PERMANENT_Address_CITY`, `PERMANENT_Address_STATE`, `PERMANENT_Address_COUNTRY`, `PERMANENT_Address_MOBILE`, `PERMANENT_Address_PHONE`, `PERMANENT_Address_FAX`, `PERMANENT_Address_EMAIL`, `dasf_member`, `guest_lectures_ok`, `guest_lectures_topics`, `summer_projects_ok`, `placements_ok`, `financial_help_ok`, `Company_Address_ZIP`, `PERMANENT_Address_ZIP`, `dob`, `sex`, `is_married`) VALUES (10, 'Lalit Mohan Balooni', 'Lalit', 'baloonilalit@rediffmail.com', '', 'http://', 'gallery/046.gif', 'Dec 28, 2005', '', '', '', '', 'Lalit Mohan\r\n(2003-05 batch)\r\n\r\nSatyam Computers Service\r\nHyderabad\r\nIndia', 0, NULL, '', '', '', '6aa18194456b8021dd2657a4a5b2f8f0', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135856122, -10, 1135855756, 10, 1, 'english', 'D M d, Y g:i a', 0, 0, 1135855800, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, 'dc171a8b04', '', NULL, 7, '203.200.211.65', 'Alumni', 2005, 'Satyam Computer Services Ltd', 'Business Analyst(CRM Practice)', 'Finance', '', '', '', '', 'AF', '', '', '', '', '', '', '', '', 'AF', '', '', '', '', 0, 0, '', 0, 0, 0, '', '', '0000-00-00', 'M', 0);
INSERT INTO `nuke_users` (`user_id`, `name`, `username`, `user_email`, `femail`, `user_website`, `user_avatar`, `user_regdate`, `user_icq`, `user_occ`, `user_from`, `user_interests`, `user_sig`, `user_viewemail`, `user_theme`, `user_aim`, `user_yim`, `user_msnm`, `user_password`, `storynum`, `umode`, `uorder`, `thold`, `noscore`, `bio`, `ublockon`, `ublock`, `theme`, `commentmax`, `counter`, `newsletter`, `user_posts`, `user_attachsig`, `user_rank`, `user_level`, `broadcast`, `popmeson`, `user_active`, `user_session_time`, `user_session_page`, `user_lastvisit`, `user_timezone`, `user_style`, `user_lang`, `user_dateformat`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_emailtime`, `user_allowhtml`, `user_allowbbcode`, `user_allowsmile`, `user_allowavatar`, `user_allow_pm`, `user_allow_viewonline`, `user_notify`, `user_notify_pm`, `user_popup_pm`, `user_avatar_type`, `user_sig_bbcode_uid`, `user_actkey`, `user_newpasswd`, `points`, `last_ip`, `usertype`, `gradyear`, `company`, `designation`, `specialization`, `Company_Address_1`, `Company_Address_2`, `Company_Address_CITY`, `Company_Address_STATE`, `Company_Address_COUNTRY`, `Company_Address_MOBILE`, `Company_Address_PHONE`, `Company_Address_FAX`, `Company_Address_EMAIL`, `PERMANENT_Address_1`, `PERMANENT_Address_2`, `PERMANENT_Address_CITY`, `PERMANENT_Address_STATE`, `PERMANENT_Address_COUNTRY`, `PERMANENT_Address_MOBILE`, `PERMANENT_Address_PHONE`, `PERMANENT_Address_FAX`, `PERMANENT_Address_EMAIL`, `dasf_member`, `guest_lectures_ok`, `guest_lectures_topics`, `summer_projects_ok`, `placements_ok`, `financial_help_ok`, `Company_Address_ZIP`, `PERMANENT_Address_ZIP`, `dob`, `sex`, `is_married`) VALUES (12, 'Arun Raghavan', 'bewada', 'arunrags@yahoo.com', '', '', 'gallery/blank.gif', 'Dec 29, 2005', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '9083609d9e941bcddd5b418a53acbdb1', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135847599, 0, 1135847567, 10, NULL, 'english', 'D M d, Y g:i a', 0, 0, 1135847490, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, NULL, NULL, NULL, 1, '59.92.158.71', 'Alumni', 1998, 'IBM Global services', 'Manager', 'Production', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL);
INSERT INTO `nuke_users` (`user_id`, `name`, `username`, `user_email`, `femail`, `user_website`, `user_avatar`, `user_regdate`, `user_icq`, `user_occ`, `user_from`, `user_interests`, `user_sig`, `user_viewemail`, `user_theme`, `user_aim`, `user_yim`, `user_msnm`, `user_password`, `storynum`, `umode`, `uorder`, `thold`, `noscore`, `bio`, `ublockon`, `ublock`, `theme`, `commentmax`, `counter`, `newsletter`, `user_posts`, `user_attachsig`, `user_rank`, `user_level`, `broadcast`, `popmeson`, `user_active`, `user_session_time`, `user_session_page`, `user_lastvisit`, `user_timezone`, `user_style`, `user_lang`, `user_dateformat`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_emailtime`, `user_allowhtml`, `user_allowbbcode`, `user_allowsmile`, `user_allowavatar`, `user_allow_pm`, `user_allow_viewonline`, `user_notify`, `user_notify_pm`, `user_popup_pm`, `user_avatar_type`, `user_sig_bbcode_uid`, `user_actkey`, `user_newpasswd`, `points`, `last_ip`, `usertype`, `gradyear`, `company`, `designation`, `specialization`, `Company_Address_1`, `Company_Address_2`, `Company_Address_CITY`, `Company_Address_STATE`, `Company_Address_COUNTRY`, `Company_Address_MOBILE`, `Company_Address_PHONE`, `Company_Address_FAX`, `Company_Address_EMAIL`, `PERMANENT_Address_1`, `PERMANENT_Address_2`, `PERMANENT_Address_CITY`, `PERMANENT_Address_STATE`, `PERMANENT_Address_COUNTRY`, `PERMANENT_Address_MOBILE`, `PERMANENT_Address_PHONE`, `PERMANENT_Address_FAX`, `PERMANENT_Address_EMAIL`, `dasf_member`, `guest_lectures_ok`, `guest_lectures_topics`, `summer_projects_ok`, `placements_ok`, `financial_help_ok`, `Company_Address_ZIP`, `PERMANENT_Address_ZIP`, `dob`, `sex`, `is_married`) VALUES (11, 'Madalasa Venkataraman', 'Madhu', 'vmadalasa@yahoo.com', '', '', 'gallery/103.gif', 'Dec 29, 2005', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '719d1229abb759e3a091cd36441dd540', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135843807, 0, 1135843807, 10, NULL, 'english', 'D M d, Y g:i a', 1, 0, 1135847567, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, NULL, NULL, NULL, 0, '164.164.81.4', 'Alumni', 2000, 'IIM B', 'Fellow Student', 'Finance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL);

## ########################################################

## 
## Table structure for table `nuke_users_temp`
## 

DROP TABLE IF EXISTS `nuke_users_temp`;
CREATE TABLE `nuke_users_temp` (
  `user_id` int(10) NOT NULL auto_increment,
  `username` varchar(25) NOT NULL default '',
  `user_email` varchar(255) NOT NULL default '',
  `user_password` varchar(40) NOT NULL default '',
  `user_regdate` varchar(20) NOT NULL default '',
  `check_num` varchar(50) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `usertype` varchar(10) default NULL,
  `gradyear` int(4) default NULL,
  `company` varchar(50) default NULL,
  `designation` varchar(50) default NULL,
  `fullname` varchar(60) default NULL,
  `specialization` varchar(20) default NULL,
  PRIMARY KEY  (`user_id`)
) TYPE=MyISAM AUTO_INCREMENT=16 ;

## 
## Dumping data for table `nuke_users_temp`
## 

INSERT INTO `nuke_users_temp` (`user_id`, `username`, `user_email`, `user_password`, `user_regdate`, `check_num`, `time`, `usertype`, `gradyear`, `company`, `designation`, `fullname`, `specialization`) VALUES (14, 'Subbu', 'nesubramanian@lycos.com', '61be360905cecd0e96e31c9d575283b1', 'Dec 29, 2005', '49760bb522db987b555be98055f6b404', '1135849182', 'Alumni', 1998, 'Saint Gobain Vetrotex India Ltd.', 'Manager - Specialty Products', 'N E Subramanian', 'Marketing');
INSERT INTO `nuke_users_temp` (`user_id`, `username`, `user_email`, `user_password`, `user_regdate`, `check_num`, `time`, `usertype`, `gradyear`, `company`, `designation`, `fullname`, `specialization`) VALUES (13, 'Shiva_Gopal', 'shiva_gopal@gmail.com', '7b8748028f4be28352d0f13a06c4cd05', 'Dec 29, 2005', '4e70f5a00eed4312d3e999b290dd3764', '1135844613', 'Alumni', 2005, 'Satyam Computer Services Ltd.', 'Business Analyst (CRM)', 'Shiva Ilengo Gopal', 'Marketing');
INSERT INTO `nuke_users_temp` (`user_id`, `username`, `user_email`, `user_password`, `user_regdate`, `check_num`, `time`, `usertype`, `gradyear`, `company`, `designation`, `fullname`, `specialization`) VALUES (15, 'selvan', 'selvan@nitt.edu', '9155816afb84f1574221b42a22620996', 'Dec 29, 2005', '5260bfb89b19eb27b70147b50be5afef', '1135850630', 'Faculty', 1992, 'NATIONAL INSTITUTE OF TECHNOLOGY', 'LECTURER', 'THAMARAISELVAN', 'Marketing');
## 
## Database: `test`
## 
DROP DATABASE `test`;
CREATE DATABASE `test`;
USE test;

## ########################################################

## 
## Table structure for table `about_items`
## 

DROP TABLE IF EXISTS `about_items`;
CREATE TABLE `about_items` (
  `about_ID` int(11) NOT NULL auto_increment,
  `about_header` varchar(100) NOT NULL default '',
  `about_main` text NOT NULL,
  `about_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `about_cat` varchar(10) NOT NULL default '',
  `picture_type` varchar(10) NOT NULL default '',
  `about_linknm1` varchar(50) NOT NULL default '',
  `about_linkad1` varchar(100) NOT NULL default '',
  `about_linknm2` varchar(50) NOT NULL default '',
  `about_linkad2` varchar(100) NOT NULL default '',
  `about_linknm3` varchar(50) NOT NULL default '',
  `about_linkad3` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`about_ID`)
) TYPE=MyISAM COMMENT='The contents of the second level "about" pages' AUTO_INCREMENT=4 ;

## 
## Dumping data for table `about_items`
## 

INSERT INTO `about_items` (`about_ID`, `about_header`, `about_main`, `about_date`, `about_cat`, `picture_type`, `about_linknm1`, `about_linkad1`, `about_linknm2`, `about_linkad2`, `about_linknm3`, `about_linkad3`) VALUES (1, 'about thailand', 'Some consider the beaches.\r\nSome enjoy the richness of its various cultures.\r\nSome are fascinated by its language.\r\nOthers are intrigued by its Buddhist traditions.\r\nFew are aware of its complex world of spirits.\r\nMany crave the food.\r\nMost remember the smiles.\r\nBut how many know\r\nwhat really lies behind?', '2005-12-12 00:00:00', 'aboutth', '', 'Behind the smile', '11', '', '', '', '');
INSERT INTO `about_items` (`about_ID`, `about_header`, `about_main`, `about_date`, `about_cat`, `picture_type`, `about_linknm1`, `about_linkad1`, `about_linknm2`, `about_linkad2`, `about_linknm3`, `about_linkad3`) VALUES (2, 'about us', 'WEC Thailand.\r\nForty eight people.\r\nSixteen nationalities.\r\nSeven provinces.\r\nOne vision.\r\nTo see Thai and Karen exalting their Creator.\r\nWe pray. We teach.\r\nWe train. We model.\r\nWe encourage. We evangelise.\r\nWe laugh. We cry.\r\nWhy?\r\nBecause God is not receiving of the worship of millions.', '2005-12-12 00:00:00', 'aboutus', '', 'vision and mission', '21', 'our teams', '22', 'meet a team ...', '23');
INSERT INTO `about_items` (`about_ID`, `about_header`, `about_main`, `about_date`, `about_cat`, `picture_type`, `about_linknm1`, `about_linkad1`, `about_linknm2`, `about_linkad2`, `about_linknm3`, `about_linkad3`) VALUES (3, 'how about you?', 'God is calling for lives devoted to Him.\r\nHe desires the lost to be boldly found.\r\nHe’s demanding a love\r\nthat compels us to go and demonstrate His Father heart.\r\nHe wants a commitment\r\nto see His kingdom increasing, whatever it takes.\r\nHe’s waiting for those who echo,\r\n‘no sacrifice is too great to make for Him’.\r\nHe delights in those who acknowledge, ‘I can’t, but He can.’\r\nHe’s raising up people from around the world to become effective cross-cultural ministry teams.\r\nIs He preparing you to be involved with us?', '2005-12-12 00:00:00', 'aboutyou', '', 'short term', '31', 'long term', '32', '', '');

## ########################################################

## 
## Table structure for table `link_items`
## 

DROP TABLE IF EXISTS `link_items`;
CREATE TABLE `link_items` (
  `link_ID` int(11) NOT NULL default '0',
  `link_header` varchar(100) NOT NULL default '',
  `link_subheader` varchar(100) NOT NULL default '',
  `link_main` text NOT NULL,
  `picture_type` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`link_ID`)
) TYPE=MyISAM COMMENT='Prayer points for the WEC Thailand website';

## 
## Dumping data for table `link_items`
## 

INSERT INTO `link_items` (`link_ID`, `link_header`, `link_subheader`, `link_main`, `picture_type`) VALUES (11, 'behind the smile test', 'the people of thailand', 'What is behind the famous smile of the Thai people?', '');
INSERT INTO `link_items` (`link_ID`, `link_header`, `link_subheader`, `link_main`, `picture_type`) VALUES (21, 'vision and mission', 'what we stand for', 'WEC international Thailand ...', '');
INSERT INTO `link_items` (`link_ID`, `link_header`, `link_subheader`, `link_main`, `picture_type`) VALUES (22, 'our teams', 'the people and the work they do', 'The teams ...', '');
INSERT INTO `link_items` (`link_ID`, `link_header`, `link_subheader`, `link_main`, `picture_type`) VALUES (23, 'meet a team', 'meet the team of tak', 'In Tak, we have a mix of ...', '');
INSERT INTO `link_items` (`link_ID`, `link_header`, `link_subheader`, `link_main`, `picture_type`) VALUES (31, 'short term', 'what is short term?', 'Short term means up till two years. What can you do ...', '');
INSERT INTO `link_items` (`link_ID`, `link_header`, `link_subheader`, `link_main`, `picture_type`) VALUES (32, 'long term', 'what is long term', 'Long term means 2 years or longer. What ...', '');

## ########################################################

## 
## Table structure for table `page_counters`
## 

DROP TABLE IF EXISTS `page_counters`;
CREATE TABLE `page_counters` (
  `page_ID` int(10) NOT NULL auto_increment,
  `page_name` varchar(30) NOT NULL default '',
  `page_date` varchar(11) NOT NULL default '0000-00-00',
  PRIMARY KEY  (`page_ID`)
) TYPE=MyISAM AUTO_INCREMENT=51 ;

## 
## Dumping data for table `page_counters`
## 

INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (35, 'aboutus', '2005-12-23');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (34, 'aboutyou', '2005-12-23');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (33, 'aboutus', '2005-12-23');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (32, 'aboutth', '2005-12-23');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (36, 'aboutth', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (37, 'aboutth', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (38, 'aboutus', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (39, 'aboutus', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (40, 'aboutus', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (41, 'aboutth', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (42, 'aboutth', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (43, 'aboutyou', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (44, 'aboutyou', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (45, 'aboutyou', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (46, 'aboutyou', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (47, 'aboutyou', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (48, 'aboutyou', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (49, 'aboutth', '2005-12-24');
INSERT INTO `page_counters` (`page_ID`, `page_name`, `page_date`) VALUES (50, 'aboutth', '2005-12-24');

## ########################################################

## 
## Table structure for table `picture_items`
## 

DROP TABLE IF EXISTS `picture_items`;
CREATE TABLE `picture_items` (
  `picture_ID` int(6) NOT NULL auto_increment,
  `picture_cat` varchar(10) NOT NULL default '',
  `picture_name` varchar(20) NOT NULL default '',
  `picture_desc` text NOT NULL,
  PRIMARY KEY  (`picture_ID`)
) TYPE=MyISAM COMMENT='Details about the picture of WEC Thailand' AUTO_INCREMENT=1 ;

## 
## Dumping data for table `picture_items`
## 


## ########################################################

## 
## Table structure for table `prayer_items`
## 

DROP TABLE IF EXISTS `prayer_items`;
CREATE TABLE `prayer_items` (
  `pray_ID` int(11) NOT NULL auto_increment,
  `pray_header` varchar(100) NOT NULL default '',
  `pray_main` text NOT NULL,
  `pray_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `pray_cat` varchar(10) NOT NULL default '',
  `picture_type` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`pray_ID`)
) TYPE=MyISAM COMMENT='Prayer points for the WEC Thailand website' AUTO_INCREMENT=25 ;

## 
## Dumping data for table `prayer_items`
## 

INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (1, 'Your prayers are needed NOW for Grace International School', 'Grace International School currently has 400 plus students that are housed in two different buildings. For next year already 150 new applicants had to be sent away because the school can not facilitate them.\r\nApart from the buildings Grace does not have enough teachers for all the classes.\r\n\r\nTherefore, please pray that the Lord will provide for new building funds. Secondly please pray that the Lord will send more teachers. We need teachers for tech-ed, high-school math and english.', '2005-12-01 13:05:23', 'urgent', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (2, 'Hostel parents have to get used to Chiang Mai', 'As from January 2006 new hostel parents will join us here in Chiang Mai. Please pray for them because they have just arrived from New Zealand and do not know the town, the language or the culture.\r\n\r\nPray also for the house girl, who works in the hostel five days per week, that she will be able to communicate with them. She can not really speak English.', '2005-11-29 19:30:43', 'urgent', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (3, 'Chachoengsao asks prayer for contact in town', 'The team in Chachoengsao asks prayer for a contact that they have in town, a person whos name can not be mentioned.\r\nPlease pray that our team members there will have blessed contacts with this person, which will result in that person getting to know Jesus as personal Saviour.', '2005-12-03 00:00:00', 'forus', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (4, 'Team building in Kamphaeng Phet', 'In Kamphaeng Phet we have 11 missionaries, spread over 2 towns. Technically these are part of three different teams, working in 3 different areas of responsibility. This makes us almost three teams. We would like to grow in corporate prayer, planning, worship and fellowship.', '2005-12-01 09:43:00', 'forus', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (5, 'Join the Christians in Chiang Mai in the prayer walk', 'On 23 January 2006 Thai and international churches in Chiang Mai organise a prayer walk through many parts of the city, in which they claim the city for the Lord Jesus, praise Him in faith for the coming harvest and encourage each other.\r\nIt starts 8:00 a.m. and includes a lunch. In the evening there will be special prayer concerts for evangelism and discipleship.\r\nFor more information go to www.prayforchiangmai.org.', '2005-12-02 18:26:31', 'forus', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (6, 'The land of the smile', 'Jesus “purchased men for God from every tribe and language and people and nation” Revelation 5:9, so that people from all nations, including Thailand, are rightfully His. God doesn’t see the Thai as a people group He would like to possess people from at some stage in the future, but as people for whom He has already given the full payment. Praise God for His unique ownership of Thai people.', '2005-12-03 21:00:00', 'forth', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (7, 'Asiacon a blessing for many', 'Thank you for your prayers for Asiacon. It turned out to be a blessing for many. The devotions, the seminars, the worship times and the updates from the International Office blessed us all.\r\nWe were very blessed to hear from all our fields in Asia what God is doing.\r\n\r\nAfter Asiacon (14-24 November 2005) we had two follow-up day, in which we gave an update to the whole Thai field. We had time to talk and pray things throug and trust that the Lord will work it out in our lives and ministries.', '2005-12-05 19:54:00', 'thank', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (8, 'New parents for our Hostel in Chiang Mai', 'We praise God for Peter and Marian Kroeze from New Zealand, who will arrive in Chiang Mai on 29 December 2005. They will take over our Hostel for one year, until Jurrian and Marielle van der Straaten come back in January 2007.', '2005-11-25 00:00:00', 'thank', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (17, 'test', 'Eerste regel.<br />\r\nTweede regel maar die is wat langer, zou een word wrap moeten hebben dus he :-)<br />\r\nDerde regel. Einde bestand.', '2026-12-05 13:25:05', 'urgent', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (22, 'test met popup', 'deze zou een popup moeten geven met de vraag of ik nog een record wil inserten', '2026-12-05 14:58:17', 'forus', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (19, 'test3', '111 nu niet alleen nl2br maar ook<br />\r222 de eregireplace met de backslash en erin die vervangen wordt door niets.<br />\r333 lukt dit beter?', '2026-12-05 13:35:23', 'forth', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (20, 'test3', '            111 nu niet alleen nl2br maar ook<br />\r\n<br />\r\n222 de eregireplace met de backslash en erin die vervangen wordt door niets.<br />\r\n<br />\r\n333 lukt dit beter?', '2026-12-05 13:36:18', 'forth', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (21, 'test met popup', 'deze zou een popup moeten geven met de vraag of ik nog een record wil inserten', '2026-12-05 14:58:17', 'forus', '');
INSERT INTO `prayer_items` (`pray_ID`, `pray_header`, `pray_main`, `pray_date`, `pray_cat`, `picture_type`) VALUES (24, 'Pray for Thailand', 'Jesus “purchased men for God from every tribe and language and people and nation.” (Revelation 5:9) Therefore, people from all nations, including Thailand, are rightfully His. God sees the Thai as people for whom He has already given the full payment, not merely as a people group from which some will become his possession at some point in the future.\r\n\r\n<b>Praise God for His unique ownership of Thai people.</b>\r\n\r\nFor Buddhists, the goal is enlightenment rather than the forgiveness of sin. In practice, this means that they strive to do enough good deeds to outweigh the bad. Many Thai believe that the evidence of this balance is shown in their health and prosperity, the tangible goal of this world and the next. The Buddha taught that the path to enlightenment can only be found through one’s own strength. Jesus proclaimed that He is the light of the world. But for people with a Buddhist mindset, Jesus and what He has done doesn’t sound like the enlightenment they are seeking. “The light shines in the darkness, but the darkness has not understood it.” (John 1:5)\r\n\r\n<b>Pray that Thai people may be drawn to “the light of the world” and receive true enlightenment—the realization of their need for a Saviour from their sin.</b>\r\n\r\nGood news is no news if you don’t understand it. “The god of this world has blinded the minds of the unbelieving so that they might not see the light of the gospel of the glory of Christ, who is the image of God.” (2 Corinthians 4:4) Much wisdom is needed to break through a worldview that makes many traditional presentations of the gospel incomprehensible.\r\n\r\n<b>Pray that Thai believers and Christian workers from other nations would have deep insight into the gospel and how to “proclaim it clearly.” (Colossians 4:4)</b>\r\n\r\nThe gospel, even presented in a Thai-friendly way, doesn’t bring change unless the Holy Spirit is at work.\r\n\r\n<b>Pray that the Holy Spirit would do the work Jesus promised He would of “convicting the world of guilt in regard to sin and righteousness and judgment” (John 16:8) here in Thailand.</b>\r\n\r\n<b>Pray that 1 Thessalonians 1:9 and 10 would become the testimony of more and more Thai.</b>\r\n\r\n<b>God’s harvest field is ripe. There is still much work to do for which God is continuing to send people from many nations to Thailand. We believe that God also wants to increasingly use Thai people to reach the Thai. Furthermore, God has uniquely prepared Thais to be messengers of the gospel to other nations.\r\nContinue to “Ask the Lord of the harvest to send out workers into His harvest field” (Matthew 9:38) both here in Thailand and abroad.</b>\r\n', '2027-12-05 12:16:08', 'forth', '');
