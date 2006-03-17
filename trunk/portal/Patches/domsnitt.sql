-- phpMyAdmin SQL Dump
-- version 2.6.4-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 09, 2005 at 05:10 AM
-- Server version: 4.0.16
-- PHP Version: 4.3.11
-- 
-- Database: `domsnitt_p_nu1`
-- 

-- --------------------------------------------------------
drop database domsnitt_p_nu1;
create database domsnitt_p_nu1;
grant all privileges on domsnitt_p_nu1.* to domsnitt_p_nu1@"localhost" identified by 'g0d0m$';
use domsnitt_p_nu1;
-- 
-- Table structure for table `nuke_authors`
-- 

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

-- 
-- Dumping data for table `nuke_authors`
-- 

INSERT INTO `nuke_authors` VALUES ('admin', 'God', 'http://', 'domsnitt@domsnittalumni.net', 'a947daa2a5822cce170e0fcc76eedada', 1, 1, 'english');
INSERT INTO `nuke_authors` VALUES ('satish', 'satish', '', 'satish@domsnittalumni.net', '72bfb409ab10f1a38901327b5148cd96', 0, 1, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_autonews`
-- 

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

-- 
-- Dumping data for table `nuke_autonews`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_banned_ip`
-- 

CREATE TABLE `nuke_banned_ip` (
  `id` int(11) NOT NULL auto_increment,
  `ip_address` varchar(15) NOT NULL default '',
  `reason` varchar(255) NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_banned_ip`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_banner`
-- 

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

-- 
-- Dumping data for table `nuke_banner`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bannerclient`
-- 

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

-- 
-- Dumping data for table `nuke_bannerclient`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbauth_access`
-- 

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

-- 
-- Dumping data for table `nuke_bbauth_access`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbbanlist`
-- 

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

-- 
-- Dumping data for table `nuke_bbbanlist`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbcategories`
-- 

CREATE TABLE `nuke_bbcategories` (
  `cat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_title` varchar(100) default NULL,
  `cat_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_order` (`cat_order`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `nuke_bbcategories`
-- 

INSERT INTO `nuke_bbcategories` VALUES (2, 'Website', 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbconfig`
-- 

CREATE TABLE `nuke_bbconfig` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbconfig`
-- 

INSERT INTO `nuke_bbconfig` VALUES ('config_id', '1');
INSERT INTO `nuke_bbconfig` VALUES ('board_disable', '0');
INSERT INTO `nuke_bbconfig` VALUES ('sitename', 'MySite.com');
INSERT INTO `nuke_bbconfig` VALUES ('site_desc', '');
INSERT INTO `nuke_bbconfig` VALUES ('cookie_name', 'phpbb2mysql');
INSERT INTO `nuke_bbconfig` VALUES ('cookie_path', '/');
INSERT INTO `nuke_bbconfig` VALUES ('cookie_domain', 'MySite.com');
INSERT INTO `nuke_bbconfig` VALUES ('cookie_secure', '0');
INSERT INTO `nuke_bbconfig` VALUES ('session_length', '3600');
INSERT INTO `nuke_bbconfig` VALUES ('allow_html', '1');
INSERT INTO `nuke_bbconfig` VALUES ('allow_html_tags', 'b,i,u,pre');
INSERT INTO `nuke_bbconfig` VALUES ('allow_bbcode', '1');
INSERT INTO `nuke_bbconfig` VALUES ('allow_smilies', '1');
INSERT INTO `nuke_bbconfig` VALUES ('allow_sig', '1');
INSERT INTO `nuke_bbconfig` VALUES ('allow_namechange', '0');
INSERT INTO `nuke_bbconfig` VALUES ('allow_theme_create', '0');
INSERT INTO `nuke_bbconfig` VALUES ('allow_avatar_local', '1');
INSERT INTO `nuke_bbconfig` VALUES ('allow_avatar_remote', '0');
INSERT INTO `nuke_bbconfig` VALUES ('allow_avatar_upload', '0');
INSERT INTO `nuke_bbconfig` VALUES ('override_user_style', '1');
INSERT INTO `nuke_bbconfig` VALUES ('posts_per_page', '15');
INSERT INTO `nuke_bbconfig` VALUES ('topics_per_page', '50');
INSERT INTO `nuke_bbconfig` VALUES ('hot_threshold', '25');
INSERT INTO `nuke_bbconfig` VALUES ('max_poll_options', '10');
INSERT INTO `nuke_bbconfig` VALUES ('max_sig_chars', '255');
INSERT INTO `nuke_bbconfig` VALUES ('max_inbox_privmsgs', '100');
INSERT INTO `nuke_bbconfig` VALUES ('max_sentbox_privmsgs', '100');
INSERT INTO `nuke_bbconfig` VALUES ('max_savebox_privmsgs', '100');
INSERT INTO `nuke_bbconfig` VALUES ('board_email_sig', 'Thanks, Webmaster@MySite.com');
INSERT INTO `nuke_bbconfig` VALUES ('board_email', 'Webmaster@MySite.com');
INSERT INTO `nuke_bbconfig` VALUES ('smtp_delivery', '0');
INSERT INTO `nuke_bbconfig` VALUES ('smtp_host', '');
INSERT INTO `nuke_bbconfig` VALUES ('require_activation', '0');
INSERT INTO `nuke_bbconfig` VALUES ('flood_interval', '15');
INSERT INTO `nuke_bbconfig` VALUES ('board_email_form', '0');
INSERT INTO `nuke_bbconfig` VALUES ('avatar_filesize', '6144');
INSERT INTO `nuke_bbconfig` VALUES ('avatar_max_width', '80');
INSERT INTO `nuke_bbconfig` VALUES ('avatar_max_height', '80');
INSERT INTO `nuke_bbconfig` VALUES ('avatar_path', 'modules/Forums/images/avatars');
INSERT INTO `nuke_bbconfig` VALUES ('avatar_gallery_path', 'modules/Forums/images/avatars');
INSERT INTO `nuke_bbconfig` VALUES ('smilies_path', 'modules/Forums/images/smiles');
INSERT INTO `nuke_bbconfig` VALUES ('default_style', '1');
INSERT INTO `nuke_bbconfig` VALUES ('default_dateformat', 'D M d, Y g:i a');
INSERT INTO `nuke_bbconfig` VALUES ('board_timezone', '10');
INSERT INTO `nuke_bbconfig` VALUES ('prune_enable', '0');
INSERT INTO `nuke_bbconfig` VALUES ('privmsg_disable', '0');
INSERT INTO `nuke_bbconfig` VALUES ('gzip_compress', '0');
INSERT INTO `nuke_bbconfig` VALUES ('coppa_fax', '');
INSERT INTO `nuke_bbconfig` VALUES ('coppa_mail', '');
INSERT INTO `nuke_bbconfig` VALUES ('board_startdate', '1013908210');
INSERT INTO `nuke_bbconfig` VALUES ('default_lang', 'english');
INSERT INTO `nuke_bbconfig` VALUES ('smtp_username', '');
INSERT INTO `nuke_bbconfig` VALUES ('smtp_password', '');
INSERT INTO `nuke_bbconfig` VALUES ('record_online_users', '2');
INSERT INTO `nuke_bbconfig` VALUES ('record_online_date', '1034668530');
INSERT INTO `nuke_bbconfig` VALUES ('server_name', 'MySite.com');
INSERT INTO `nuke_bbconfig` VALUES ('server_port', '80');
INSERT INTO `nuke_bbconfig` VALUES ('script_path', '/modules/Forums/');
INSERT INTO `nuke_bbconfig` VALUES ('version', '.0.10');
INSERT INTO `nuke_bbconfig` VALUES ('enable_confirm', '0');
INSERT INTO `nuke_bbconfig` VALUES ('sendmail_fix', '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbdisallow`
-- 

CREATE TABLE `nuke_bbdisallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(25) default NULL,
  PRIMARY KEY  (`disallow_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_bbdisallow`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbforum_prune`
-- 

CREATE TABLE `nuke_bbforum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `prune_days` tinyint(4) unsigned NOT NULL default '0',
  `prune_freq` tinyint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`prune_id`),
  KEY `forum_id` (`forum_id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `nuke_bbforum_prune`
-- 

INSERT INTO `nuke_bbforum_prune` VALUES (1, 1, 14, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbforums`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `nuke_bbforums`
-- 

INSERT INTO `nuke_bbforums` VALUES (1, 2, 'Support', 'Posts related Alumni Website usage', 0, 10, 2, 1, 2, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbgroups`
-- 

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

-- 
-- Dumping data for table `nuke_bbgroups`
-- 

INSERT INTO `nuke_bbgroups` VALUES (1, 1, 'Anonymous', 'Personal User', 0, 1);
INSERT INTO `nuke_bbgroups` VALUES (3, 2, 'Moderators', 'Moderators of this Forum', 5, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbposts`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `nuke_bbposts`
-- 

INSERT INTO `nuke_bbposts` VALUES (1, 1, 1, 1, 1134120948, 'dd867d02', 'nobody', 1, 1, 1, 0, NULL, 0);
INSERT INTO `nuke_bbposts` VALUES (2, 1, 1, 1, 1134121017, 'dd867d02', '', 1, 1, 1, 0, NULL, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbposts_text`
-- 

CREATE TABLE `nuke_bbposts_text` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `bbcode_uid` varchar(10) NOT NULL default '',
  `post_subject` varchar(60) default NULL,
  `post_text` text,
  PRIMARY KEY  (`post_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbposts_text`
-- 

INSERT INTO `nuke_bbposts_text` VALUES (1, '88392da22a', 'Testing the security features', 'It Sucks......');
INSERT INTO `nuke_bbposts_text` VALUES (2, '83cdda0282', 'Re: Testing the security features', '[quote:83cdda0282="nobody"]It Sucks......[/quote:83cdda0282]\r\n\r\nIt did actual get posted - Need to fix it.');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbprivmsgs`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `nuke_bbprivmsgs`
-- 

INSERT INTO `nuke_bbprivmsgs` VALUES (1, 5, 'Hi', 2, 3, 1134120423, 'dd867d02', 1, 1, 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbprivmsgs_text`
-- 

CREATE TABLE `nuke_bbprivmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL default '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL default '0',
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_text_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbprivmsgs_text`
-- 

INSERT INTO `nuke_bbprivmsgs_text` VALUES (1, '8707edcd57', 'Try around various features and get comfortable.\r\n\r\nTry visting www.phpnuke.org - PHPNUke is content management system aimed at building community portals. :D');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbranks`
-- 

CREATE TABLE `nuke_bbranks` (
  `rank_id` smallint(5) unsigned NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` mediumint(8) NOT NULL default '0',
  `rank_max` mediumint(8) NOT NULL default '0',
  `rank_special` tinyint(1) default '0',
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `nuke_bbranks`
-- 

INSERT INTO `nuke_bbranks` VALUES (1, 'Site Admin', -1, -1, 1, 'modules/Forums/images/ranks/6stars.gif');
INSERT INTO `nuke_bbranks` VALUES (2, 'Newbie', 1, 0, 0, 'modules/Forums/images/ranks/1star.gif');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbsearch_results`
-- 

CREATE TABLE `nuke_bbsearch_results` (
  `search_id` int(11) unsigned NOT NULL default '0',
  `session_id` varchar(32) NOT NULL default '',
  `search_array` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `session_id` (`session_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbsearch_results`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbsearch_wordlist`
-- 

CREATE TABLE `nuke_bbsearch_wordlist` (
  `word_text` varchar(50) binary NOT NULL default '',
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_text`),
  KEY `word_id` (`word_id`)
) TYPE=MyISAM AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `nuke_bbsearch_wordlist`
-- 

INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x6665617475726573, 1, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x7365637572697479, 2, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x7375636b73, 3, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x74657374696e67, 4, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x61637475616c, 5, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x666978, 6, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x706f73746564, 7, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbsearch_wordmatch`
-- 

CREATE TABLE `nuke_bbsearch_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) NOT NULL default '0',
  KEY `word_id` (`word_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbsearch_wordmatch`
-- 

INSERT INTO `nuke_bbsearch_wordmatch` VALUES (1, 3, 0);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (1, 1, 1);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (1, 2, 1);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (1, 4, 1);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (2, 3, 0);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (2, 5, 0);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (2, 6, 0);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (2, 7, 0);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (2, 1, 1);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (2, 2, 1);
INSERT INTO `nuke_bbsearch_wordmatch` VALUES (2, 4, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbsessions`
-- 

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

-- 
-- Dumping data for table `nuke_bbsessions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbsmilies`
-- 

CREATE TABLE `nuke_bbsmilies` (
  `smilies_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(50) default NULL,
  `smile_url` varchar(100) default NULL,
  `emoticon` varchar(75) default NULL,
  PRIMARY KEY  (`smilies_id`)
) TYPE=MyISAM AUTO_INCREMENT=45 ;

-- 
-- Dumping data for table `nuke_bbsmilies`
-- 

INSERT INTO `nuke_bbsmilies` VALUES (1, ':D', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `nuke_bbsmilies` VALUES (2, ':-D', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `nuke_bbsmilies` VALUES (3, ':grin:', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `nuke_bbsmilies` VALUES (4, ':)', 'icon_smile.gif', 'Smile');
INSERT INTO `nuke_bbsmilies` VALUES (5, ':-)', 'icon_smile.gif', 'Smile');
INSERT INTO `nuke_bbsmilies` VALUES (6, ':smile:', 'icon_smile.gif', 'Smile');
INSERT INTO `nuke_bbsmilies` VALUES (7, ':(', 'icon_sad.gif', 'Sad');
INSERT INTO `nuke_bbsmilies` VALUES (8, ':-(', 'icon_sad.gif', 'Sad');
INSERT INTO `nuke_bbsmilies` VALUES (9, ':sad:', 'icon_sad.gif', 'Sad');
INSERT INTO `nuke_bbsmilies` VALUES (10, ':o', 'icon_surprised.gif', 'Surprised');
INSERT INTO `nuke_bbsmilies` VALUES (11, ':-o', 'icon_surprised.gif', 'Surprised');
INSERT INTO `nuke_bbsmilies` VALUES (12, ':eek:', 'icon_surprised.gif', 'Surprised');
INSERT INTO `nuke_bbsmilies` VALUES (13, '8O', 'icon_eek.gif', 'Shocked');
INSERT INTO `nuke_bbsmilies` VALUES (14, '8-O', 'icon_eek.gif', 'Shocked');
INSERT INTO `nuke_bbsmilies` VALUES (15, ':shock:', 'icon_eek.gif', 'Shocked');
INSERT INTO `nuke_bbsmilies` VALUES (16, ':?', 'icon_confused.gif', 'Confused');
INSERT INTO `nuke_bbsmilies` VALUES (17, ':-?', 'icon_confused.gif', 'Confused');
INSERT INTO `nuke_bbsmilies` VALUES (18, ':???:', 'icon_confused.gif', 'Confused');
INSERT INTO `nuke_bbsmilies` VALUES (19, '8)', 'icon_cool.gif', 'Cool');
INSERT INTO `nuke_bbsmilies` VALUES (20, '8-)', 'icon_cool.gif', 'Cool');
INSERT INTO `nuke_bbsmilies` VALUES (21, ':cool:', 'icon_cool.gif', 'Cool');
INSERT INTO `nuke_bbsmilies` VALUES (22, ':lol:', 'icon_lol.gif', 'Laughing');
INSERT INTO `nuke_bbsmilies` VALUES (23, ':x', 'icon_mad.gif', 'Mad');
INSERT INTO `nuke_bbsmilies` VALUES (24, ':-x', 'icon_mad.gif', 'Mad');
INSERT INTO `nuke_bbsmilies` VALUES (25, ':mad:', 'icon_mad.gif', 'Mad');
INSERT INTO `nuke_bbsmilies` VALUES (26, ':P', 'icon_razz.gif', 'Razz');
INSERT INTO `nuke_bbsmilies` VALUES (27, ':-P', 'icon_razz.gif', 'Razz');
INSERT INTO `nuke_bbsmilies` VALUES (28, ':razz:', 'icon_razz.gif', 'Razz');
INSERT INTO `nuke_bbsmilies` VALUES (29, ':oops:', 'icon_redface.gif', 'Embarassed');
INSERT INTO `nuke_bbsmilies` VALUES (30, ':cry:', 'icon_cry.gif', 'Crying or Very sad');
INSERT INTO `nuke_bbsmilies` VALUES (31, ':evil:', 'icon_evil.gif', 'Evil or Very Mad');
INSERT INTO `nuke_bbsmilies` VALUES (32, ':twisted:', 'icon_twisted.gif', 'Twisted Evil');
INSERT INTO `nuke_bbsmilies` VALUES (33, ':roll:', 'icon_rolleyes.gif', 'Rolling Eyes');
INSERT INTO `nuke_bbsmilies` VALUES (34, ':wink:', 'icon_wink.gif', 'Wink');
INSERT INTO `nuke_bbsmilies` VALUES (35, ';)', 'icon_wink.gif', 'Wink');
INSERT INTO `nuke_bbsmilies` VALUES (36, ';-)', 'icon_wink.gif', 'Wink');
INSERT INTO `nuke_bbsmilies` VALUES (37, ':!:', 'icon_exclaim.gif', 'Exclamation');
INSERT INTO `nuke_bbsmilies` VALUES (38, ':?:', 'icon_question.gif', 'Question');
INSERT INTO `nuke_bbsmilies` VALUES (39, ':idea:', 'icon_idea.gif', 'Idea');
INSERT INTO `nuke_bbsmilies` VALUES (40, ':arrow:', 'icon_arrow.gif', 'Arrow');
INSERT INTO `nuke_bbsmilies` VALUES (41, ':|', 'icon_neutral.gif', 'Neutral');
INSERT INTO `nuke_bbsmilies` VALUES (42, ':-|', 'icon_neutral.gif', 'Neutral');
INSERT INTO `nuke_bbsmilies` VALUES (43, ':neutral:', 'icon_neutral.gif', 'Neutral');
INSERT INTO `nuke_bbsmilies` VALUES (44, ':mrgreen:', 'icon_mrgreen.gif', 'Mr. Green');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbthemes`
-- 

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

-- 
-- Dumping data for table `nuke_bbthemes`
-- 

INSERT INTO `nuke_bbthemes` VALUES (1, 'subSilver', 'subSilver', 'subSilver.css', '', '0E3259', '000000', '006699', '5493B4', '', 'DD6900', 'EFEFEF', 'DEE3E7', 'D1D7DC', '', '', '', '98AAB1', '006699', 'FFFFFF', 'cellpic1.gif', 'cellpic3.gif', 'cellpic2.jpg', 'FAFAFA', 'FFFFFF', '', 'row1', 'row2', '', 'Verdana, Arial, Helvetica, sans-serif', 'Trebuchet MS', 'Courier, ''Courier New'', sans-serif', 10, 11, 12, '444444', '006600', 'FFA34F', '', '', '', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbthemes_name`
-- 

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

-- 
-- Dumping data for table `nuke_bbthemes_name`
-- 

INSERT INTO `nuke_bbthemes_name` VALUES (1, 'The lightest row colour', 'The medium row color', 'The darkest row colour', '', '', '', 'Border round the whole page', 'Outer table border', 'Inner table border', 'Silver gradient picture', 'Blue gradient picture', 'Fade-out gradient on index', 'Background for quote boxes', 'All white areas', '', 'Background for topic posts', '2nd background for topic posts', '', 'Main fonts', 'Additional topic title font', 'Form fonts', 'Smallest font size', 'Medium font size', 'Normal font size (post body etc)', 'Quote & copyright text', 'Code text colour', 'Main table header text colour', '', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbtopics`
-- 

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

-- 
-- Dumping data for table `nuke_bbtopics`
-- 

INSERT INTO `nuke_bbtopics` VALUES (1, 1, 'Testing the security features', 1, 1134120948, 2, 1, 0, 0, 0, 2, 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbtopics_watch`
-- 

CREATE TABLE `nuke_bbtopics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `notify_status` tinyint(1) NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_status` (`notify_status`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbtopics_watch`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbuser_group`
-- 

CREATE TABLE `nuke_bbuser_group` (
  `group_id` mediumint(8) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `user_pending` tinyint(1) default NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbuser_group`
-- 

INSERT INTO `nuke_bbuser_group` VALUES (1, -1, 0);
INSERT INTO `nuke_bbuser_group` VALUES (3, 5, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbvote_desc`
-- 

CREATE TABLE `nuke_bbvote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_text` text NOT NULL,
  `vote_start` int(11) NOT NULL default '0',
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_bbvote_desc`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbvote_results`
-- 

CREATE TABLE `nuke_bbvote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbvote_results`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbvote_voters`
-- 

CREATE TABLE `nuke_bbvote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_id` mediumint(8) NOT NULL default '0',
  `vote_user_ip` char(8) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_bbvote_voters`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_bbwords`
-- 

CREATE TABLE `nuke_bbwords` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` char(100) NOT NULL default '',
  `replacement` char(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_bbwords`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_blocks`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=15 ;

-- 
-- Dumping data for table `nuke_blocks`
-- 

INSERT INTO `nuke_blocks` VALUES (1, '', 'Modules', '', '', 'l', 1, 1, 0, '', '', 'block-Modules.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (2, 'admin', 'Administration', '<strong><big>·</big></strong> <a href="admin.php">Administration</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=adminStory">NEW Story</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=create">Change Survey</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=content">Content</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=logout">Logout</a>', '', 'l', 2, 1, 0, '985591188', '', '', 2, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (3, '', 'Who''s Online', '', '', 'r', 3, 1, 0, '', '', 'block-Who_is_Online.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (4, '', 'Search', '', '', 'l', 3, 0, 3600, '', '', 'block-Search.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (5, '', 'Languages', '', '', 'l', 4, 0, 3600, '', '', 'block-Languages.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (6, '', 'Random Headlines', '', '', 'l', 5, 0, 3600, '', '', 'block-Random_Headlines.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (8, 'userbox', 'User''s Custom Box', '', '', 'r', 2, 0, 0, '', '', '', 1, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (9, '', 'Categories Menu', '', '', 'r', 4, 0, 0, '', '', 'block-Categories.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (10, '', 'Survey', '', '', 'r', 5, 1, 3600, '', '', 'block-Survey.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (11, '', 'Login', '', '', 'r', 1, 1, 3600, '', '', 'block-Login.php', 3, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (12, '', 'Big Story of Today', '', '', 'c', 1, 1, 0, '', '', 'block-Big_Story_of_Today.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (13, '', 'Old Articles', '', '', 'r', 6, 0, 3600, '', '', 'block-Old_Articles.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (14, '', 'Information', '<br><center><font class="content">\r\n<a href="http://phpnuke.org"><img src="images/powered/powered5.jpg" border="0" alt="Powered by PHP-Nuke" title="Powered by PHP-Nuke" width="88" height="31"></a>\r\n<br><br>\r\n<a href="http://validator.w3.org/check/referer"><img src="images/html401.gif" width="88" height="31" alt="Valid HTML 4.01!" title="Valid HTML 4.01!" border="0"></a>\r\n<br><br>\r\n<a href="http://jigsaw.w3.org/css-validator"><img src="images/css.gif" width="88" height="31" alt="Valid CSS!" title="Valid CSS!" border="0"></a></font></center><br>', '', 'r', 7, 0, 0, '', '', '', 0, '0', 'd', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_comments`
-- 

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

-- 
-- Dumping data for table `nuke_comments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_config`
-- 

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
  PRIMARY KEY  (`sitename`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_config`
-- 

INSERT INTO `nuke_config` VALUES ('DOMS NITT Alumni Network', 'http://www.domsnittalumni.net/portal/', 'logo.bmp', '', 'Dec 2005', 'support@domsnittalumni.net', 0, 'Kaput', '', 'All logos and trademarks in this site are property of their respective owner. The comments are property of their posters, all the rest © 2005 by DASF.', '', 4096, 'Anonymous', 5, 1, 1, 1, 1, 10, 10, 1, 30, 0, 1, 'PHP-Nuke Powered Site', 'en-us', 'english', 'en_US', 0, 0, 0, 'contentadmin@domsnittalumni.net', 'NEWS for my site', 'Hey! You got a new submission for your site.', 'webmaster', 0, 1, 1, 1000, 3, '*****', 'PHP-Nuke Copyright &copy; 2004 by Francisco Burzi. This is free software, and you may redistribute it under the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">GPL</font></a>. PHP-Nuke comes with absolutely no warranty, for details, see the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">license</font></a>.', '7.5');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_confirm`
-- 

CREATE TABLE `nuke_confirm` (
  `confirm_id` char(32) NOT NULL default '',
  `session_id` char(32) NOT NULL default '',
  `code` char(6) NOT NULL default '',
  PRIMARY KEY  (`session_id`,`confirm_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_confirm`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_counter`
-- 

CREATE TABLE `nuke_counter` (
  `type` varchar(80) NOT NULL default '',
  `var` varchar(80) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_counter`
-- 

INSERT INTO `nuke_counter` VALUES ('total', 'hits', 352);
INSERT INTO `nuke_counter` VALUES ('browser', 'WebTV', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'Lynx', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'MSIE', 350);
INSERT INTO `nuke_counter` VALUES ('browser', 'Opera', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'Konqueror', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'Netscape', 2);
INSERT INTO `nuke_counter` VALUES ('browser', 'Bot', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'Other', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'Windows', 351);
INSERT INTO `nuke_counter` VALUES ('os', 'Linux', 1);
INSERT INTO `nuke_counter` VALUES ('os', 'Mac', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'FreeBSD', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'SunOS', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'IRIX', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'BeOS', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'OS/2', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'AIX', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'Other', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_downloads_categories`
-- 

CREATE TABLE `nuke_downloads_categories` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `cdescription` text NOT NULL,
  `parentid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`),
  KEY `title` (`title`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_downloads_categories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_downloads_downloads`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_downloads_downloads`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_downloads_editorials`
-- 

CREATE TABLE `nuke_downloads_editorials` (
  `downloadid` int(11) NOT NULL default '0',
  `adminid` varchar(60) NOT NULL default '',
  `editorialtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `editorialtext` text NOT NULL,
  `editorialtitle` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`downloadid`),
  KEY `downloadid` (`downloadid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_downloads_editorials`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_downloads_modrequest`
-- 

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

-- 
-- Dumping data for table `nuke_downloads_modrequest`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_downloads_newdownload`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_downloads_newdownload`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_downloads_votedata`
-- 

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

-- 
-- Dumping data for table `nuke_downloads_votedata`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_encyclopedia`
-- 

CREATE TABLE `nuke_encyclopedia` (
  `eid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `elanguage` varchar(30) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  PRIMARY KEY  (`eid`),
  KEY `eid` (`eid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_encyclopedia`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_encyclopedia_text`
-- 

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

-- 
-- Dumping data for table `nuke_encyclopedia_text`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_faqanswer`
-- 

CREATE TABLE `nuke_faqanswer` (
  `id` tinyint(4) NOT NULL auto_increment,
  `id_cat` tinyint(4) NOT NULL default '0',
  `question` varchar(255) default '',
  `answer` text,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `id_cat` (`id_cat`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_faqanswer`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_faqcategories`
-- 

CREATE TABLE `nuke_faqcategories` (
  `id_cat` tinyint(3) NOT NULL auto_increment,
  `categories` varchar(255) default NULL,
  `flanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id_cat`),
  KEY `id_cat` (`id_cat`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_faqcategories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_groups`
-- 

CREATE TABLE `nuke_groups` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `nuke_groups`
-- 

INSERT INTO `nuke_groups` VALUES (1, 'WebsiteAdmins', 'Administrators and Moderators of the website', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_groups_points`
-- 

CREATE TABLE `nuke_groups_points` (
  `id` int(10) NOT NULL auto_increment,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) TYPE=MyISAM AUTO_INCREMENT=22 ;

-- 
-- Dumping data for table `nuke_groups_points`
-- 

INSERT INTO `nuke_groups_points` VALUES (1, 0);
INSERT INTO `nuke_groups_points` VALUES (2, 0);
INSERT INTO `nuke_groups_points` VALUES (3, 0);
INSERT INTO `nuke_groups_points` VALUES (4, 0);
INSERT INTO `nuke_groups_points` VALUES (5, 0);
INSERT INTO `nuke_groups_points` VALUES (6, 0);
INSERT INTO `nuke_groups_points` VALUES (7, 0);
INSERT INTO `nuke_groups_points` VALUES (8, 0);
INSERT INTO `nuke_groups_points` VALUES (9, 0);
INSERT INTO `nuke_groups_points` VALUES (10, 0);
INSERT INTO `nuke_groups_points` VALUES (11, 0);
INSERT INTO `nuke_groups_points` VALUES (12, 0);
INSERT INTO `nuke_groups_points` VALUES (13, 0);
INSERT INTO `nuke_groups_points` VALUES (14, 0);
INSERT INTO `nuke_groups_points` VALUES (15, 0);
INSERT INTO `nuke_groups_points` VALUES (16, 0);
INSERT INTO `nuke_groups_points` VALUES (17, 0);
INSERT INTO `nuke_groups_points` VALUES (18, 0);
INSERT INTO `nuke_groups_points` VALUES (19, 0);
INSERT INTO `nuke_groups_points` VALUES (20, 0);
INSERT INTO `nuke_groups_points` VALUES (21, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_headlines`
-- 

CREATE TABLE `nuke_headlines` (
  `hid` int(11) NOT NULL auto_increment,
  `sitename` varchar(30) NOT NULL default '',
  `headlinesurl` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`hid`),
  KEY `hid` (`hid`)
) TYPE=MyISAM AUTO_INCREMENT=28 ;

-- 
-- Dumping data for table `nuke_headlines`
-- 

INSERT INTO `nuke_headlines` VALUES (1, 'AbsoluteGames', 'http://files.gameaholic.com/agfa.rdf');
INSERT INTO `nuke_headlines` VALUES (2, 'BSDToday', 'http://www.bsdtoday.com/backend/bt.rdf');
INSERT INTO `nuke_headlines` VALUES (3, 'BrunchingShuttlecocks', 'http://www.brunching.com/brunching.rdf');
INSERT INTO `nuke_headlines` VALUES (4, 'DailyDaemonNews', 'http://daily.daemonnews.org/ddn.rdf.php3');
INSERT INTO `nuke_headlines` VALUES (5, 'DigitalTheatre', 'http://www.dtheatre.com/backend.php3?xml=yes');
INSERT INTO `nuke_headlines` VALUES (6, 'DotKDE', 'http://dot.kde.org/rdf');
INSERT INTO `nuke_headlines` VALUES (7, 'FreeDOS', 'http://www.freedos.org/channels/rss.cgi');
INSERT INTO `nuke_headlines` VALUES (8, 'Freshmeat', 'http://freshmeat.net/backend/fm.rdf');
INSERT INTO `nuke_headlines` VALUES (9, 'Gnome Desktop', 'http://www.gnomedesktop.org/backend.php');
INSERT INTO `nuke_headlines` VALUES (10, 'HappyPenguin', 'http://happypenguin.org/html/news.rdf');
INSERT INTO `nuke_headlines` VALUES (11, 'HollywoodBitchslap', 'http://hollywoodbitchslap.com/hbs.rdf');
INSERT INTO `nuke_headlines` VALUES (12, 'Learning Linux', 'http://www.learninglinux.com/backend.php');
INSERT INTO `nuke_headlines` VALUES (13, 'LinuxCentral', 'http://linuxcentral.com/backend/lcnew.rdf');
INSERT INTO `nuke_headlines` VALUES (14, 'LinuxJournal', 'http://www.linuxjournal.com/news.rss');
INSERT INTO `nuke_headlines` VALUES (15, 'LinuxWeelyNews', 'http://lwn.net/headlines/rss');
INSERT INTO `nuke_headlines` VALUES (16, 'Listology', 'http://listology.com/recent.rdf');
INSERT INTO `nuke_headlines` VALUES (17, 'MozillaNewsBot', 'http://www.mozilla.org/newsbot/newsbot.rdf');
INSERT INTO `nuke_headlines` VALUES (18, 'NewsForge', 'http://www.newsforge.com/newsforge.rdf');
INSERT INTO `nuke_headlines` VALUES (19, 'NukeResources', 'http://www.nukeresources.com/backend.php');
INSERT INTO `nuke_headlines` VALUES (20, 'NukeScripts', 'http://www.nukescripts.net/backend.php');
INSERT INTO `nuke_headlines` VALUES (21, 'PDABuzz', 'http://www.pdabuzz.com/netscape.txt');
INSERT INTO `nuke_headlines` VALUES (22, 'PHP-Nuke', 'http://phpnuke.org/backend.php');
INSERT INTO `nuke_headlines` VALUES (23, 'PHP.net', 'http://www.php.net/news.rss');
INSERT INTO `nuke_headlines` VALUES (24, 'PHPBuilder', 'http://phpbuilder.com/rss_feed.php');
INSERT INTO `nuke_headlines` VALUES (25, 'PerlMonks', 'http://www.perlmonks.org/headlines.rdf');
INSERT INTO `nuke_headlines` VALUES (26, 'TheNextLevel', 'http://www.the-nextlevel.com/rdf/tnl.rdf');
INSERT INTO `nuke_headlines` VALUES (27, 'WebReference', 'http://webreference.com/webreference.rdf');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_journal`
-- 

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

-- 
-- Dumping data for table `nuke_journal`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_journal_comments`
-- 

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

-- 
-- Dumping data for table `nuke_journal_comments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_journal_stats`
-- 

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

-- 
-- Dumping data for table `nuke_journal_stats`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_links_categories`
-- 

CREATE TABLE `nuke_links_categories` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `cdescription` text NOT NULL,
  `parentid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_links_categories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_links_editorials`
-- 

CREATE TABLE `nuke_links_editorials` (
  `linkid` int(11) NOT NULL default '0',
  `adminid` varchar(60) NOT NULL default '',
  `editorialtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `editorialtext` text NOT NULL,
  `editorialtitle` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`linkid`),
  KEY `linkid` (`linkid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_links_editorials`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_links_links`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_links_links`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_links_modrequest`
-- 

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

-- 
-- Dumping data for table `nuke_links_modrequest`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_links_newlink`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_links_newlink`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_links_votedata`
-- 

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

-- 
-- Dumping data for table `nuke_links_votedata`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_main`
-- 

CREATE TABLE `nuke_main` (
  `main_module` varchar(255) NOT NULL default ''
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_main`
-- 

INSERT INTO `nuke_main` VALUES ('News');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_message`
-- 

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

-- 
-- Dumping data for table `nuke_message`
-- 

INSERT INTO `nuke_message` VALUES (1, 'Welcome to DOMS NIT Trichy - Alumni Network - Alpha Version', '<br>If your an alumni of DOMS NIT Trichy - Please feel free to register your self \r\n\r\n<A href="http://www.domsnittalumni.net/portal/modules.php?name=Your_Account&op=new_user">Click Here to Register </A>\r\n<BR>', '993373194', 0, 1, 1, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_modules`
-- 

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

-- 
-- Dumping data for table `nuke_modules`
-- 

INSERT INTO `nuke_modules` VALUES (1, 'AvantGo', 'AvantGo', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (2, 'Content', 'Content', 0, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (3, 'Downloads', 'Downloads', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (4, 'Encyclopedia', 'Encyclopedia', 0, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (5, 'FAQ', 'FAQ', 0, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (6, 'Feedback', 'Feedback', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (7, 'Forums', 'Forums', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (8, 'Journal', 'Journal', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (9, 'Members_List', 'Members List', 0, 1, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (10, 'News', 'News', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (11, 'Private_Messages', 'Private Messages', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (12, 'Recommend_Us', 'Recommend Us', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (13, 'Reviews', 'Reviews', 0, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (14, 'Search', 'Search', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (15, 'Statistics', 'Statistics', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (16, 'Stories_Archive', 'Stories Archive', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (17, 'Submit_News', 'Submit News', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (18, 'Surveys', 'Surveys', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (19, 'Top', 'Top 10', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (20, 'Topics', 'Topics', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (21, 'Web_Links', 'Web Links', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (22, 'Your_Account', 'Your Account', 1, 0, 1, 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_pages`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_pages`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_pages_categories`
-- 

CREATE TABLE `nuke_pages_categories` (
  `cid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_pages_categories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_poll_check`
-- 

CREATE TABLE `nuke_poll_check` (
  `ip` varchar(20) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `pollID` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_poll_check`
-- 

INSERT INTO `nuke_poll_check` VALUES ('203.145.154.34', '1134035652', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_poll_data`
-- 

CREATE TABLE `nuke_poll_data` (
  `pollID` int(11) NOT NULL default '0',
  `optionText` char(50) NOT NULL default '',
  `optionCount` int(11) NOT NULL default '0',
  `voteID` int(11) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_poll_data`
-- 

INSERT INTO `nuke_poll_data` VALUES (1, 'Ummmm, not bad', 0, 1);
INSERT INTO `nuke_poll_data` VALUES (1, 'Cool', 1, 2);
INSERT INTO `nuke_poll_data` VALUES (1, 'Terrific', 0, 3);
INSERT INTO `nuke_poll_data` VALUES (1, 'The best one!', 0, 4);
INSERT INTO `nuke_poll_data` VALUES (1, 'what the hell is this?', 0, 5);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 6);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 7);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 8);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 9);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 10);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 11);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 12);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_poll_desc`
-- 

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

-- 
-- Dumping data for table `nuke_poll_desc`
-- 

INSERT INTO `nuke_poll_desc` VALUES (1, 'What do you think about this site?', 961405160, 1, 'english', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_pollcomments`
-- 

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

-- 
-- Dumping data for table `nuke_pollcomments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_public_messages`
-- 

CREATE TABLE `nuke_public_messages` (
  `mid` int(10) NOT NULL auto_increment,
  `content` varchar(255) NOT NULL default '',
  `date` varchar(14) default NULL,
  `who` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  KEY `mid` (`mid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_public_messages`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_queue`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_queue`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_quotes`
-- 

CREATE TABLE `nuke_quotes` (
  `qid` int(10) unsigned NOT NULL auto_increment,
  `quote` text,
  PRIMARY KEY  (`qid`),
  KEY `qid` (`qid`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `nuke_quotes`
-- 

INSERT INTO `nuke_quotes` VALUES (1, 'Nos morituri te salutamus - CBHS');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_referer`
-- 

CREATE TABLE `nuke_referer` (
  `rid` int(11) NOT NULL auto_increment,
  `url` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`)
) TYPE=MyISAM AUTO_INCREMENT=35 ;

-- 
-- Dumping data for table `nuke_referer`
-- 

INSERT INTO `nuke_referer` VALUES (1, 'http://domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (2, 'http://domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (3, 'http://domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (4, 'http://domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (5, 'http://domsnittalumni.net/portal/modules.php?name=Top');
INSERT INTO `nuke_referer` VALUES (6, 'http://www.domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (7, 'http://www.domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (8, 'http://www.domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (9, 'http://www.domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (10, 'http://www.domsnittalumni.net/portal/index.php');
INSERT INTO `nuke_referer` VALUES (11, 'http://www.domsnittalumni.net/portal/modules.php?name=Forums&file=index&sid=954ba98c97680de49ebb1f13');
INSERT INTO `nuke_referer` VALUES (12, 'http://www.domsnittalumni.net/portal/admin.php?op=messages');
INSERT INTO `nuke_referer` VALUES (13, 'http://www.domsnittalumni.net/portal/admin.php?op=modules');
INSERT INTO `nuke_referer` VALUES (14, 'http://www.domsnittalumni.net/portal/modules.php?name=Forums');
INSERT INTO `nuke_referer` VALUES (15, 'http://www.domsnittalumni.net/portal/modules.php?name=Forums');
INSERT INTO `nuke_referer` VALUES (16, 'http://www.domsnittalumni.net/portal/index.php');
INSERT INTO `nuke_referer` VALUES (17, 'http://www.domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (18, 'http://www.domsnittalumni.net/portal/admin.php?op=Configure');
INSERT INTO `nuke_referer` VALUES (19, 'http://www.domsnittalumni.net/portal/index.php');
INSERT INTO `nuke_referer` VALUES (20, 'http://www.domsnittalumni.net/portal/');
INSERT INTO `nuke_referer` VALUES (21, 'http://www.domsnittalumni.net/portal/');
INSERT INTO `nuke_referer` VALUES (22, 'http://www.domsnittalumni.net/portal/admin.php?op=adminMain');
INSERT INTO `nuke_referer` VALUES (23, 'http://www.domsnittalumni.net/portal/admin.php?op=adminMain');
INSERT INTO `nuke_referer` VALUES (24, 'http://www.domsnittalumni.net/portal/modules.php?name=Members_List');
INSERT INTO `nuke_referer` VALUES (25, 'http://www.domsnittalumni.net/portal/modules.php?name=Your_Account');
INSERT INTO `nuke_referer` VALUES (26, 'http://www.domsnittalumni.net/portal/admin.php?op=Groups');
INSERT INTO `nuke_referer` VALUES (27, 'http://www.domsnittalumni.net/portal/index.php');
INSERT INTO `nuke_referer` VALUES (28, 'http://www.domsnittalumni.net/portal/index.php');
INSERT INTO `nuke_referer` VALUES (29, 'http://www.domsnittalumni.net/portal/modules.php?name=Your_Account&op=new_user');
INSERT INTO `nuke_referer` VALUES (30, 'http://www.domsnittalumni.net/portal/admin.php?op=messages');
INSERT INTO `nuke_referer` VALUES (31, 'http://www.domsnittalumni.net/portal/admin.php?op=messages');
INSERT INTO `nuke_referer` VALUES (32, 'http://www.domsnittalumni.net/portal/modules.php?name=Web_Links');
INSERT INTO `nuke_referer` VALUES (33, 'http://www.domsnittalumni.net/portal/admin.php');
INSERT INTO `nuke_referer` VALUES (34, 'http://domsnittalumni.net/portal/admin.php?op=Configure');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_related`
-- 

CREATE TABLE `nuke_related` (
  `rid` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `url` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`),
  KEY `tid` (`tid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_related`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_reviews`
-- 

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

-- 
-- Dumping data for table `nuke_reviews`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_reviews_add`
-- 

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

-- 
-- Dumping data for table `nuke_reviews_add`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_reviews_comments`
-- 

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

-- 
-- Dumping data for table `nuke_reviews_comments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_reviews_main`
-- 

CREATE TABLE `nuke_reviews_main` (
  `title` varchar(100) default NULL,
  `description` text
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_reviews_main`
-- 

INSERT INTO `nuke_reviews_main` VALUES ('Reviews Section Title', 'Reviews Section Long Description');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_session`
-- 

CREATE TABLE `nuke_session` (
  `uname` varchar(25) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `host_addr` varchar(48) NOT NULL default '',
  `guest` int(1) NOT NULL default '0',
  KEY `time` (`time`),
  KEY `guest` (`guest`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_session`
-- 

INSERT INTO `nuke_session` VALUES ('221.134.125.2', '1134125193', '221.134.125.2', 1);
INSERT INTO `nuke_session` VALUES ('203.145.154.34', '1134128524', '203.145.154.34', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_stats_date`
-- 

CREATE TABLE `nuke_stats_date` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_stats_date`
-- 

INSERT INTO `nuke_stats_date` VALUES (2005, 1, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 1, 31, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 2, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 3, 31, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 4, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 5, 31, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 6, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 7, 31, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 8, 31, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 9, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 10, 31, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 7, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 8, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 9, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 11, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 1, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 2, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 3, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 4, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 5, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 6, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 7, 23);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 8, 255);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 9, 73);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 10, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 11, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 12, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 13, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 14, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 15, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 16, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 17, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 18, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 19, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 20, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 21, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 22, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 24, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 25, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 26, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 27, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 28, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 29, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 31, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_stats_hour`
-- 

CREATE TABLE `nuke_stats_hour` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hour` tinyint(4) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_stats_hour`
-- 

INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 7, 23, 23);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 0, 56);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 1, 47);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 2, 50);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 3, 69);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 4, 26);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 5, 3);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 8, 4);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 8, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 1, 70);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 2, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 3, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 23, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_stats_month`
-- 

CREATE TABLE `nuke_stats_month` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_stats_month`
-- 

INSERT INTO `nuke_stats_month` VALUES (2005, 1, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 2, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 3, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 4, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 5, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 6, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 7, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 8, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 9, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 10, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 11, 0);
INSERT INTO `nuke_stats_month` VALUES (2005, 12, 351);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_stats_year`
-- 

CREATE TABLE `nuke_stats_year` (
  `year` smallint(6) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `nuke_stats_year`
-- 

INSERT INTO `nuke_stats_year` VALUES (2005, 351);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_stories`
-- 

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
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `nuke_stories`
-- 

INSERT INTO `nuke_stories` VALUES (1, 0, 'admin', 'DOMS Alumni - Alpha Release', '2005-12-08 01:32:36', 'New DOMS Alumni - Alpha version of the site release of limited audience, the beta version would be release on Dec 12th', '', 0, 2, 1, 'admin', '', 0, '', 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_stories_cat`
-- 

CREATE TABLE `nuke_stories_cat` (
  `catid` int(11) NOT NULL auto_increment,
  `title` varchar(20) NOT NULL default '',
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`catid`),
  KEY `catid` (`catid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_stories_cat`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_subscriptions`
-- 

CREATE TABLE `nuke_subscriptions` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) default '0',
  `subscription_expire` varchar(50) NOT NULL default '',
  KEY `id` (`id`,`userid`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `nuke_subscriptions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_topics`
-- 

CREATE TABLE `nuke_topics` (
  `topicid` int(3) NOT NULL auto_increment,
  `topicname` varchar(20) default NULL,
  `topicimage` varchar(20) default NULL,
  `topictext` varchar(40) default NULL,
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`topicid`),
  KEY `topicid` (`topicid`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `nuke_topics`
-- 

INSERT INTO `nuke_topics` VALUES (1, 'phpnuke', 'phpnuke.gif', 'PHP-Nuke', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_users`
-- 

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
  PRIMARY KEY  (`user_id`),
  KEY `uid` (`user_id`),
  KEY `uname` (`username`),
  KEY `user_session_time` (`user_session_time`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `nuke_users`
-- 

INSERT INTO `nuke_users` VALUES (1, '', 'Anonymous', '', '', '', 'blank.gif', 'Nov 10, 2000', '', '', '', '', '', 0, 0, '', '', '', '', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 2, 0, 0, 1, 0, 0, 1, 0, 0, 0, 10, NULL, 'english', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 3, NULL, NULL, NULL, 0, '0');
INSERT INTO `nuke_users` VALUES (2, '', 'Satish1', 'satish@inmage.net', '', 'http://', 'gallery/blank.gif', 'Dec 08, 2005', '', '', '', '', '', 0, NULL, '', '', '', '72bfb409ab10f1a38901327b5148cd96', 10, '', 0, 0, 0, '', 1, '', '', 4096, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1134120768, 0, 1134120423, 10, NULL, 'english', 'D M d, Y g:i a', 0, 0, 1134120768, NULL, 1, 1, 1, 1, 1, 1, 0, 1, 0, 3, NULL, NULL, NULL, 0, '221.134.125.2');
INSERT INTO `nuke_users` VALUES (3, 'SHIVA KIRAN DEGALA', 'shivakiran', 'coordinator_2005@yahoo.co.in', 'coordinator_2005@yahoo.co.in', 'http://', 'gallery/107.gif', 'Dec 08, 2005', '', 'Business Analyst', 'Bangalore', 'Browsing', 'SHIVA KIRAN DEGALA\r\n(BATCH: 2003-2005)\r\nSYMPHONY SERVICES\r\nCELL: 94489 50440', 1, NULL, '', 'shivakirand@yahoo.co.uk', '', 'ef24da63cb7be6fc1cdcd4fa44f6d98a', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1134128496, -10, 1134120620, 10, NULL, 'english', 'D M d, Y g:i a', 0, 1, 1134120620, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 3, NULL, NULL, NULL, 0, '203.145.154.34');

-- --------------------------------------------------------

-- 
-- Table structure for table `nuke_users_temp`
-- 

CREATE TABLE `nuke_users_temp` (
  `user_id` int(10) NOT NULL auto_increment,
  `username` varchar(25) NOT NULL default '',
  `user_email` varchar(255) NOT NULL default '',
  `user_password` varchar(40) NOT NULL default '',
  `user_regdate` varchar(20) NOT NULL default '',
  `check_num` varchar(50) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  PRIMARY KEY  (`user_id`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `nuke_users_temp`
-- 

