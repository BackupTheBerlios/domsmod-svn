## phpMyAdmin SQL Dump
## version 2.6.4-pl2
## http://www.phpmyadmin.net
## 
## Host: localhost
## Generation Time: Dec 29, 2005 at 03:58 AM
## Server version: 4.0.16
## PHP Version: 4.3.11
## 
## Database: `domsnitt_p_nu1`
## 
##CREATE DATABASE `domsnitt_p_nu1`;
USE domsnitt_p_nu1;

## 
## Dumping data for table `nuke_aum_dupconfig`
## 


## 
## Dumping data for table `nuke_aum_mfilter`
## 


## 
## Dumping data for table `nuke_aum_pruneq`
## 


## 
## Dumping data for table `nuke_authors`
## 

#INSERT INTO `nuke_authors` VALUES ('admin', 'God', 'http://', 'domsnitt@domsnittalumni.net', 'a947daa2a5822cce170e0fcc76eedada', 3, 1, 'english');
#INSERT INTO `nuke_authors` VALUES ('ContentAdmin', 'ContentAdmin', '', 'contentadmin@domsniittalumni.net', '38960ad9855343c7d028881bdce873da', 0, 0, '');
#INSERT INTO `nuke_authors` VALUES ('ShivaAdmin', 'shivaadmin', '', 'shiva@domsnittalumni.net', 'a947daa2a5822cce170e0fcc76eedada', 0, 1, '');

## 
## Dumping data for table `nuke_autonews`
## 


## 
## Dumping data for table `nuke_banned_ip`
## 


## 
## Dumping data for table `nuke_banner`
## 


## 
## Dumping data for table `nuke_bannerclient`
## 


## 
## Dumping data for table `nuke_bbauth_access`
## 


## 
## Dumping data for table `nuke_bbbanlist`
## 


## 
## Dumping data for table `nuke_bbcategories`
## 

INSERT INTO `nuke_bbcategories` VALUES (2, 'Website', 10);
INSERT INTO `nuke_bbcategories` VALUES (3, 'DASF', 20);
INSERT INTO `nuke_bbcategories` VALUES (4, 'Connect', 30);

## 
## Dumping data for table `nuke_bbconfig`
## 

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

## 
## Dumping data for table `nuke_bbdisallow`
## 


## 
## Dumping data for table `nuke_bbforum_prune`
## 

INSERT INTO `nuke_bbforum_prune` VALUES (1, 1, 14, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (2, 3, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (3, 4, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (4, 6, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (5, 7, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (6, 8, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (7, 9, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (8, 10, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (9, 11, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (10, 12, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (11, 13, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (12, 14, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (13, 15, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (14, 16, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (15, 17, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (16, 18, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (17, 19, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (18, 20, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (19, 21, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (20, 22, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (21, 23, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (22, 24, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (23, 25, 7, 1);
INSERT INTO `nuke_bbforum_prune` VALUES (24, 26, 7, 1);

## 
## Dumping data for table `nuke_bbforums`
## 

INSERT INTO `nuke_bbforums` VALUES (1, 2, 'Support', 'Posts related Alumni Website usage', 0, 10, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (2, 3, 'Charter', 'Discussions regarding DASF Charter', 0, 10, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (3, 4, '1984', 'Class of 1984', 0, 10, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (4, 4, '1985', 'Class of 1985', 0, 20, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (5, 4, '1986', 'Class of 1986', 0, 30, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (6, 4, '1987', 'Class of 1987', 0, 40, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (7, 4, '1988', 'Class of 1988', 0, 50, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (8, 4, '1989', 'Class of 1989', 0, 60, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (9, 4, '1990', 'Class of 1990', 0, 70, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (10, 4, '1991', 'Class of 1991', 0, 80, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (11, 4, '1992', 'Class of 1992', 0, 90, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (12, 4, '1993', 'Class of 1993', 0, 100, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (13, 4, '1994', 'Class of 1994', 0, 110, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (14, 4, '1995', 'Class of 1995', 0, 120, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (15, 4, '1996', 'Class of 1996', 0, 130, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (16, 4, '1997', 'Class of 1997', 0, 140, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (17, 4, '1998', 'Class of 1998', 0, 150, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (18, 4, '1999', 'Class of 1999', 0, 160, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (19, 4, '2000', 'Class of 2000', 0, 170, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (20, 4, '2001', 'Class of 2001', 0, 180, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (21, 4, '2002', 'Class of 2002', 0, 190, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (22, 4, '2003', 'Class of 2003', 0, 200, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (23, 4, '2004', 'Class of 2004', 0, 210, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (24, 4, '2005', 'Class of 2005', 0, 220, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (25, 4, '2006', 'Class of 2006', 0, 230, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
INSERT INTO `nuke_bbforums` VALUES (26, 4, '2007', 'Class of 2007', 0, 240, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);

## 
## Dumping data for table `nuke_bbgroups`
## 

INSERT INTO `nuke_bbgroups` VALUES (1, 1, 'Anonymous', 'Personal User', 0, 1);

## 
## Dumping data for table `nuke_bbposts`
## 


## 
## Dumping data for table `nuke_bbposts_text`
## 


## 
## Dumping data for table `nuke_bbprivmsgs`
## 

INSERT INTO `nuke_bbprivmsgs` VALUES (4, 1, 'hi', 10, 8, 1135855880, 'cbc8d341', 1, 1, 1, 0);
INSERT INTO `nuke_bbprivmsgs` VALUES (3, 1, 'hi', 12, 11, 1135847567, '3b5c9e47', 1, 1, 1, 0);

## 
## Dumping data for table `nuke_bbprivmsgs_text`
## 

INSERT INTO `nuke_bbprivmsgs_text` VALUES (3, 'aa95dadc1b', ':P  :evil:  :?:  :?:  :?:  :?:  :?:');
INSERT INTO `nuke_bbprivmsgs_text` VALUES (4, 'ace7929629', 'Satish,\r\n\r\ncan this place be used as a forum where DASF members can have discussion?\r\n\r\nLalit');

## 
## Dumping data for table `nuke_bbranks`
## 

INSERT INTO `nuke_bbranks` VALUES (1, 'Site Admin', -1, -1, 1, 'modules/Forums/images/ranks/6stars.gif');
INSERT INTO `nuke_bbranks` VALUES (2, 'Newbie', 1, 0, 0, 'modules/Forums/images/ranks/1star.gif');

## 
## Dumping data for table `nuke_bbsearch_results`
## 


## 
## Dumping data for table `nuke_bbsearch_wordlist`
## 

INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x6665617475726573, 1, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x7365637572697479, 2, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x7375636b73, 3, 0);
INSERT INTO `nuke_bbsearch_wordlist` VALUES (0x74657374696e67, 4, 0);

## 
## Dumping data for table `nuke_bbsearch_wordmatch`
## 


## 
## Dumping data for table `nuke_bbsessions`
## 

INSERT INTO `nuke_bbsessions` VALUES ('0866abc94cac40f73635cabadcacff44', 1, 1135853602, 1135853602, 'dd867d02', -4, 0);
INSERT INTO `nuke_bbsessions` VALUES ('043577d282453da984a2a9abc5959224', 1, 1135855480, 1135855480, 'dd867d02', -10, 0);
INSERT INTO `nuke_bbsessions` VALUES ('e813cf9aa18277ec4b4b829d7d3c0b0e', 1, 1135857047, 1135857047, 'dd867d02', 0, 0);
INSERT INTO `nuke_bbsessions` VALUES ('29a8a931e4e2c546c64650d13c8fa83d', 1, 1135857211, 1135857211, 'dd867d02', 0, 0);
INSERT INTO `nuke_bbsessions` VALUES ('6ba8b32d464b2d6634dbda950c364ea2', 1, 1135857040, 1135857040, 'dd867d02', 0, 0);

## 
## Dumping data for table `nuke_bbsmilies`
## 

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

## 
## Dumping data for table `nuke_bbthemes`
## 

INSERT INTO `nuke_bbthemes` VALUES (1, 'subSilver', 'subSilver', 'subSilver.css', '', '0E3259', '000000', '006699', '5493B4', '', 'DD6900', 'EFEFEF', 'DEE3E7', 'D1D7DC', '', '', '', '98AAB1', '006699', 'FFFFFF', 'cellpic1.gif', 'cellpic3.gif', 'cellpic2.jpg', 'FAFAFA', 'FFFFFF', '', 'row1', 'row2', '', 'Verdana, Arial, Helvetica, sans-serif', 'Trebuchet MS', 'Courier, ''Courier New'', sans-serif', 10, 11, 12, '444444', '006600', 'FFA34F', '', '', '', NULL, NULL);

## 
## Dumping data for table `nuke_bbthemes_name`
## 

INSERT INTO `nuke_bbthemes_name` VALUES (1, 'The lightest row colour', 'The medium row color', 'The darkest row colour', '', '', '', 'Border round the whole page', 'Outer table border', 'Inner table border', 'Silver gradient picture', 'Blue gradient picture', 'Fade-out gradient on index', 'Background for quote boxes', 'All white areas', '', 'Background for topic posts', '2nd background for topic posts', '', 'Main fonts', 'Additional topic title font', 'Form fonts', 'Smallest font size', 'Medium font size', 'Normal font size (post body etc)', 'Quote & copyright text', 'Code text colour', 'Main table header text colour', '', '', '');

## 
## Dumping data for table `nuke_bbtopics`
## 


## 
## Dumping data for table `nuke_bbtopics_watch`
## 


## 
## Dumping data for table `nuke_bbuser_group`
## 

INSERT INTO `nuke_bbuser_group` VALUES (1, -1, 0);

## 
## Dumping data for table `nuke_bbvote_desc`
## 


## 
## Dumping data for table `nuke_bbvote_results`
## 


## 
## Dumping data for table `nuke_bbvote_voters`
## 


## 
## Dumping data for table `nuke_bbwords`
## 


## 
## Dumping data for table `nuke_blocks`
## 

INSERT INTO `nuke_blocks` VALUES (1, '', 'Navigation', '', '', 'l', 1, 1, 0, '', '', 'block-Modules.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (2, 'admin', 'Administration', '<strong><big>·</big></strong> <a href="admin.php">Administration</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=adminStory">NEW Story</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=create">Change Survey</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=content">Content</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=logout">Logout</a>', '', 'l', 2, 1, 0, '985591188', '', '', 2, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (3, '', 'Who''s Online', '', '', 'r', 5, 1, 0, '', '', 'block-doms-CZUser-Info.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (4, '', 'Search', '', '', 'l', 3, 0, 3600, '', '', 'block-Search.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (5, '', 'Languages', '', '', 'l', 4, 0, 3600, '', '', 'block-Languages.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (6, '', 'Random Headlines', '', '', 'l', 5, 0, 3600, '', '', 'block-Random_Headlines.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (8, 'userbox', 'User''s Custom Box', '', '', 'r', 3, 0, 0, '', '', '', 1, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (9, '', 'Categories Menu', '', '', 'r', 6, 0, 0, '', '', 'block-Categories.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (10, '', 'Survey', '', '', 'r', 4, 1, 3600, '', '', 'block-Survey.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (11, '', 'Login', '', '', 'r', 1, 1, 0, '', '', 'block-doms-Login.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (12, '', 'Big Story of Today', '', '', 'r', 2, 1, 0, '', '', 'block-Big_Story_of_Today.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (13, '', 'Old Articles', '', '', 'r', 7, 0, 3600, '', '', 'block-Old_Articles.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (14, '', 'Information', '<br><center><font class="content">\r\n<a href="http://phpnuke.org"><img src="images/powered/powered5.jpg" border="0" alt="Powered by PHP-Nuke" title="Powered by PHP-Nuke" width="88" height="31"></a>\r\n<br><br>\r\n<a href="http://validator.w3.org/check/referer"><img src="images/html401.gif" width="88" height="31" alt="Valid HTML 4.01!" title="Valid HTML 4.01!" border="0"></a>\r\n<br><br>\r\n<a href="http://jigsaw.w3.org/css-validator"><img src="images/css.gif" width="88" height="31" alt="Valid CSS!" title="Valid CSS!" border="0"></a></font></center><br>', '', 'r', 8, 0, 0, '', '', '', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (15, '', 'Forums', '', '', 'd', 1, 1, 3600, '', '', 'block-iCGstation-Forums.php', 1, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (16, '', 'Usage Policy', '', '', 'd', 2, 0, 0, '', '', 'block-Content.php', 0, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (17, '', 'Latest News', '', '', 'c', 1, 1, 0, '', '', 'block-Last_5_Articles.php', 1, '0', 'd', 0);
INSERT INTO `nuke_blocks` VALUES (20, '', 'Top Users', '', '', 'r', 9, 0, 3600, '', '', 'block-doms_user_points.php', 0, '0', 'd', 0);

## 
## Dumping data for table `nuke_comments`
## 


## 
## Dumping data for table `nuke_config`
## 

INSERT INTO `nuke_config` VALUES ('DOMS NITT Alumni Network', 'http://www.domsnittalumni.net/portal/', 'logo.bmp', '', 'Dec 2005', 'support@domsnittalumni.net', 0, 'iCGstation', '', 'All logos and trademarks in this site are property of their respective owner. The comments are property of their posters, all the rest © 2005 by DASF.', '', 4096, 'Anonymous', 5, 1, 1, 1, 1, 10, 10, 1, 30, 0, 1, 'PHP-Nuke Powered Site', 'en-us', 'english', 'en_US', 0, 0, 0, 'contentadmin@domsnittalumni.net', 'NEWS for my site', 'Hey! You got a new submission for your site.', 'webmaster', 0, 1, 1, 1000, 3, '*****', 'PHP-Nuke Copyright &copy; 2004 by Francisco Burzi. This is free software, and you may redistribute it under the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">GPL</font></a>. PHP-Nuke comes with absolutely no warranty, for details, see the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">license</font></a>.', '7.5', 0);

## 
## Dumping data for table `nuke_confirm`
## 


## 
## Dumping data for table `nuke_counter`
## 

INSERT INTO `nuke_counter` VALUES ('total', 'hits', 2226);
INSERT INTO `nuke_counter` VALUES ('browser', 'WebTV', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'Lynx', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'MSIE', 2219);
INSERT INTO `nuke_counter` VALUES ('browser', 'Opera', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'Konqueror', 0);
INSERT INTO `nuke_counter` VALUES ('browser', 'Netscape', 3);
INSERT INTO `nuke_counter` VALUES ('browser', 'Bot', 3);
INSERT INTO `nuke_counter` VALUES ('browser', 'Other', 1);
INSERT INTO `nuke_counter` VALUES ('os', 'Windows', 2220);
INSERT INTO `nuke_counter` VALUES ('os', 'Linux', 1);
INSERT INTO `nuke_counter` VALUES ('os', 'Mac', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'FreeBSD', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'SunOS', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'IRIX', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'BeOS', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'OS/2', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'AIX', 0);
INSERT INTO `nuke_counter` VALUES ('os', 'Other', 5);

## 
## Dumping data for table `nuke_countrycodes`
## 

INSERT INTO `nuke_countrycodes` VALUES ('AF', 'Afghanistan');
INSERT INTO `nuke_countrycodes` VALUES ('AL', 'Albania');
INSERT INTO `nuke_countrycodes` VALUES ('DZ', 'Algeria');
INSERT INTO `nuke_countrycodes` VALUES ('AS', 'American Samoa');
INSERT INTO `nuke_countrycodes` VALUES ('AD', 'Andorra');
INSERT INTO `nuke_countrycodes` VALUES ('AO', 'Angola');
INSERT INTO `nuke_countrycodes` VALUES ('AI', 'Anguilla');
INSERT INTO `nuke_countrycodes` VALUES ('AQ', 'Antarctica');
INSERT INTO `nuke_countrycodes` VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `nuke_countrycodes` VALUES ('AR', 'Argentina');
INSERT INTO `nuke_countrycodes` VALUES ('AM', 'Armenia');
INSERT INTO `nuke_countrycodes` VALUES ('AW', 'Aruba');
INSERT INTO `nuke_countrycodes` VALUES ('AU', 'Australia');
INSERT INTO `nuke_countrycodes` VALUES ('AT', 'Austria');
INSERT INTO `nuke_countrycodes` VALUES ('AZ', 'Azerbaidjan');
INSERT INTO `nuke_countrycodes` VALUES ('BS', 'Bahamas');
INSERT INTO `nuke_countrycodes` VALUES ('BH', 'Bahrain');
INSERT INTO `nuke_countrycodes` VALUES ('BD', 'Banglades');
INSERT INTO `nuke_countrycodes` VALUES ('BB', 'Barbados');
INSERT INTO `nuke_countrycodes` VALUES ('BY', 'Belarus');
INSERT INTO `nuke_countrycodes` VALUES ('BE', 'Belgium');
INSERT INTO `nuke_countrycodes` VALUES ('BZ', 'Belize');
INSERT INTO `nuke_countrycodes` VALUES ('BJ', 'Benin');
INSERT INTO `nuke_countrycodes` VALUES ('BM', 'Bermuda');
INSERT INTO `nuke_countrycodes` VALUES ('BO', 'Bolivia');
INSERT INTO `nuke_countrycodes` VALUES ('BA', 'Bosnia-Herzegovina');
INSERT INTO `nuke_countrycodes` VALUES ('BW', 'Botswana');
INSERT INTO `nuke_countrycodes` VALUES ('BV', 'Bouvet Island');
INSERT INTO `nuke_countrycodes` VALUES ('BR', 'Brazil');
INSERT INTO `nuke_countrycodes` VALUES ('IO', 'British Indian O. Terr.');
INSERT INTO `nuke_countrycodes` VALUES ('BN', 'Brunei Darussalam');
INSERT INTO `nuke_countrycodes` VALUES ('BG', 'Bulgaria');
INSERT INTO `nuke_countrycodes` VALUES ('BF', 'Burkina Faso');
INSERT INTO `nuke_countrycodes` VALUES ('BI', 'Burundi');
INSERT INTO `nuke_countrycodes` VALUES ('BT', 'Buthan');
INSERT INTO `nuke_countrycodes` VALUES ('KH', 'Cambodia');
INSERT INTO `nuke_countrycodes` VALUES ('CM', 'Cameroon');
INSERT INTO `nuke_countrycodes` VALUES ('CA', 'Canada');
INSERT INTO `nuke_countrycodes` VALUES ('CV', 'Cape Verde');
INSERT INTO `nuke_countrycodes` VALUES ('KY', 'Cayman Islands');
INSERT INTO `nuke_countrycodes` VALUES ('CF', 'Central African Rep.');
INSERT INTO `nuke_countrycodes` VALUES ('TD', 'Chad');
INSERT INTO `nuke_countrycodes` VALUES ('CL', 'Chile');
INSERT INTO `nuke_countrycodes` VALUES ('CN', 'China');
INSERT INTO `nuke_countrycodes` VALUES ('CX', 'Christmas Island');
INSERT INTO `nuke_countrycodes` VALUES ('CC', 'Cocos (Keeling) Isl.');
INSERT INTO `nuke_countrycodes` VALUES ('CO', 'Colombia');
INSERT INTO `nuke_countrycodes` VALUES ('KM', 'Comoros');
INSERT INTO `nuke_countrycodes` VALUES ('CG', 'Congo');
INSERT INTO `nuke_countrycodes` VALUES ('CK', 'Cook Islands');
INSERT INTO `nuke_countrycodes` VALUES ('CR', 'Costa Rica');
INSERT INTO `nuke_countrycodes` VALUES ('HR', 'Croatia');
INSERT INTO `nuke_countrycodes` VALUES ('CU', 'Cuba');
INSERT INTO `nuke_countrycodes` VALUES ('CY', 'Cyprus');
INSERT INTO `nuke_countrycodes` VALUES ('CZ', 'Czech Republic');
INSERT INTO `nuke_countrycodes` VALUES ('CS', 'Czechoslovakia');
INSERT INTO `nuke_countrycodes` VALUES ('DK', 'Denmark');
INSERT INTO `nuke_countrycodes` VALUES ('DJ', 'Djibouti');
INSERT INTO `nuke_countrycodes` VALUES ('DM', 'Dominica');
INSERT INTO `nuke_countrycodes` VALUES ('DO', 'Dominican Republic');
INSERT INTO `nuke_countrycodes` VALUES ('TP', 'East Timor');
INSERT INTO `nuke_countrycodes` VALUES ('EC', 'Ecuador');
INSERT INTO `nuke_countrycodes` VALUES ('EG', 'Egypt');
INSERT INTO `nuke_countrycodes` VALUES ('SV', 'El Salvador');
INSERT INTO `nuke_countrycodes` VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `nuke_countrycodes` VALUES ('EE', 'Estonia');
INSERT INTO `nuke_countrycodes` VALUES ('ET', 'Ethiopia');
INSERT INTO `nuke_countrycodes` VALUES ('FK', 'Falkland Isl.(UK)');
INSERT INTO `nuke_countrycodes` VALUES ('FO', 'Faroe Islands');
INSERT INTO `nuke_countrycodes` VALUES ('FJ', 'Fiji');
INSERT INTO `nuke_countrycodes` VALUES ('FI', 'Finland');
INSERT INTO `nuke_countrycodes` VALUES ('FR', 'France');
INSERT INTO `nuke_countrycodes` VALUES ('FX', 'France (European Ter.)');
INSERT INTO `nuke_countrycodes` VALUES ('TF', 'French Southern Terr.');
INSERT INTO `nuke_countrycodes` VALUES ('GA', 'Gabon');
INSERT INTO `nuke_countrycodes` VALUES ('GM', 'Gambia');
INSERT INTO `nuke_countrycodes` VALUES ('GE', 'Georgia');
INSERT INTO `nuke_countrycodes` VALUES ('DE', 'Germany');
INSERT INTO `nuke_countrycodes` VALUES ('GH', 'Ghana');
INSERT INTO `nuke_countrycodes` VALUES ('GI', 'Gibraltar');
INSERT INTO `nuke_countrycodes` VALUES ('GB', 'Great Britain (UK)');
INSERT INTO `nuke_countrycodes` VALUES ('GR', 'Greece');
INSERT INTO `nuke_countrycodes` VALUES ('GL', 'Greenland');
INSERT INTO `nuke_countrycodes` VALUES ('GD', 'Grenada');
INSERT INTO `nuke_countrycodes` VALUES ('GP', 'Guadeloupe (Fr.)');
INSERT INTO `nuke_countrycodes` VALUES ('GU', 'Guam (US)');
INSERT INTO `nuke_countrycodes` VALUES ('GT', 'Guatemala');
INSERT INTO `nuke_countrycodes` VALUES ('GN', 'Guinea');
INSERT INTO `nuke_countrycodes` VALUES ('GW', 'Guinea Bissau');
INSERT INTO `nuke_countrycodes` VALUES ('GY', 'Guyana');
INSERT INTO `nuke_countrycodes` VALUES ('GF', 'Guyana (Fr.)');
INSERT INTO `nuke_countrycodes` VALUES ('HT', 'Haiti');
INSERT INTO `nuke_countrycodes` VALUES ('HM', 'Heard & McDonald Isl.');
INSERT INTO `nuke_countrycodes` VALUES ('HN', 'Honduras');
INSERT INTO `nuke_countrycodes` VALUES ('HK', 'Hong Kong');
INSERT INTO `nuke_countrycodes` VALUES ('HU', 'Hungary');
INSERT INTO `nuke_countrycodes` VALUES ('IS', 'Iceland');
INSERT INTO `nuke_countrycodes` VALUES ('IN', 'India');
INSERT INTO `nuke_countrycodes` VALUES ('ID', 'Indonesia');
INSERT INTO `nuke_countrycodes` VALUES ('IR', 'Iran');
INSERT INTO `nuke_countrycodes` VALUES ('IQ', 'Iraq');
INSERT INTO `nuke_countrycodes` VALUES ('IE', 'Ireland');
INSERT INTO `nuke_countrycodes` VALUES ('IL', 'Israel');
INSERT INTO `nuke_countrycodes` VALUES ('IT', 'Italy');
INSERT INTO `nuke_countrycodes` VALUES ('CI', 'Ivory Coast');
INSERT INTO `nuke_countrycodes` VALUES ('JM', 'Jamaica');
INSERT INTO `nuke_countrycodes` VALUES ('JP', 'Japan');
INSERT INTO `nuke_countrycodes` VALUES ('JO', 'Jordan');
INSERT INTO `nuke_countrycodes` VALUES ('KZ', 'Kazachstan');
INSERT INTO `nuke_countrycodes` VALUES ('KE', 'Kenya');
INSERT INTO `nuke_countrycodes` VALUES ('KG', 'Kirgistan');
INSERT INTO `nuke_countrycodes` VALUES ('KI', 'Kiribati');
INSERT INTO `nuke_countrycodes` VALUES ('KP', 'Korea (North)');
INSERT INTO `nuke_countrycodes` VALUES ('KR', 'Korea (South)');
INSERT INTO `nuke_countrycodes` VALUES ('KW', 'Kuwait');
INSERT INTO `nuke_countrycodes` VALUES ('LA', 'Laos');
INSERT INTO `nuke_countrycodes` VALUES ('LV', 'Latvia');
INSERT INTO `nuke_countrycodes` VALUES ('LB', 'Lebanon');
INSERT INTO `nuke_countrycodes` VALUES ('LS', 'Lesotho');
INSERT INTO `nuke_countrycodes` VALUES ('LR', 'Liberia');
INSERT INTO `nuke_countrycodes` VALUES ('LY', 'Libya');
INSERT INTO `nuke_countrycodes` VALUES ('LI', 'Liechtenstein');
INSERT INTO `nuke_countrycodes` VALUES ('LT', 'Lithuania');
INSERT INTO `nuke_countrycodes` VALUES ('LU', 'Luxembourg');
INSERT INTO `nuke_countrycodes` VALUES ('MO', 'Macau');
INSERT INTO `nuke_countrycodes` VALUES ('MG', 'Madagascar');
INSERT INTO `nuke_countrycodes` VALUES ('MW', 'Malawi');
INSERT INTO `nuke_countrycodes` VALUES ('MY', 'Malaysia');
INSERT INTO `nuke_countrycodes` VALUES ('MV', 'Maldives');
INSERT INTO `nuke_countrycodes` VALUES ('ML', 'Mali');
INSERT INTO `nuke_countrycodes` VALUES ('MT', 'Malta');
INSERT INTO `nuke_countrycodes` VALUES ('MH', 'Marshall Islands');
INSERT INTO `nuke_countrycodes` VALUES ('MQ', 'Martinique (Fr.)');
INSERT INTO `nuke_countrycodes` VALUES ('MR', 'Mauritania');
INSERT INTO `nuke_countrycodes` VALUES ('MU', 'Mauritius');
INSERT INTO `nuke_countrycodes` VALUES ('MX', 'Mexico');
INSERT INTO `nuke_countrycodes` VALUES ('FM', 'Micronesia');
INSERT INTO `nuke_countrycodes` VALUES ('MD', 'Moldavia');
INSERT INTO `nuke_countrycodes` VALUES ('MC', 'Monaco');
INSERT INTO `nuke_countrycodes` VALUES ('MN', 'Mongolia');
INSERT INTO `nuke_countrycodes` VALUES ('MS', 'Montserrat');
INSERT INTO `nuke_countrycodes` VALUES ('MA', 'Morocco');
INSERT INTO `nuke_countrycodes` VALUES ('MZ', 'Mozambique');
INSERT INTO `nuke_countrycodes` VALUES ('MM', 'Myanmar');
INSERT INTO `nuke_countrycodes` VALUES ('NA', 'Namibia');
INSERT INTO `nuke_countrycodes` VALUES ('NR', 'Nauru');
INSERT INTO `nuke_countrycodes` VALUES ('NP', 'Nepal');
INSERT INTO `nuke_countrycodes` VALUES ('AN', 'Netherland Antilles');
INSERT INTO `nuke_countrycodes` VALUES ('NL', 'Netherlands');
INSERT INTO `nuke_countrycodes` VALUES ('NT', 'Neutral Zone');
INSERT INTO `nuke_countrycodes` VALUES ('NC', 'New Caledonia (Fr.)');
INSERT INTO `nuke_countrycodes` VALUES ('NZ', 'New Zealand');
INSERT INTO `nuke_countrycodes` VALUES ('NI', 'Nicaragua');
INSERT INTO `nuke_countrycodes` VALUES ('NE', 'Niger');
INSERT INTO `nuke_countrycodes` VALUES ('NG', 'Nigeria');
INSERT INTO `nuke_countrycodes` VALUES ('NU', 'Niue');
INSERT INTO `nuke_countrycodes` VALUES ('NF', 'Norfolk Island');
INSERT INTO `nuke_countrycodes` VALUES ('MP', 'Northern Mariana Isl.');
INSERT INTO `nuke_countrycodes` VALUES ('NO', 'Norway');
INSERT INTO `nuke_countrycodes` VALUES ('OM', 'Oman');
INSERT INTO `nuke_countrycodes` VALUES ('PK', 'Pakistan');
INSERT INTO `nuke_countrycodes` VALUES ('PW', 'Palau');
INSERT INTO `nuke_countrycodes` VALUES ('PA', 'Panama');
INSERT INTO `nuke_countrycodes` VALUES ('PG', 'Papua New');
INSERT INTO `nuke_countrycodes` VALUES ('PY', 'Paraguay');
INSERT INTO `nuke_countrycodes` VALUES ('PE', 'Peru');
INSERT INTO `nuke_countrycodes` VALUES ('PH', 'Philippines');
INSERT INTO `nuke_countrycodes` VALUES ('PN', 'Pitcairn');
INSERT INTO `nuke_countrycodes` VALUES ('PL', 'Poland');
INSERT INTO `nuke_countrycodes` VALUES ('PF', 'Polynesia (Fr.)');
INSERT INTO `nuke_countrycodes` VALUES ('PT', 'Portugal');
INSERT INTO `nuke_countrycodes` VALUES ('PR', 'Puerto Rico (US)');
INSERT INTO `nuke_countrycodes` VALUES ('QA', 'Qatar');
INSERT INTO `nuke_countrycodes` VALUES ('RE', 'Reunion (Fr.)');
INSERT INTO `nuke_countrycodes` VALUES ('RO', 'Romania');
INSERT INTO `nuke_countrycodes` VALUES ('RU', 'Russian Federation');
INSERT INTO `nuke_countrycodes` VALUES ('RW', 'Rwanda');
INSERT INTO `nuke_countrycodes` VALUES ('LC', 'Saint Lucia');
INSERT INTO `nuke_countrycodes` VALUES ('WS', 'Samoa');
INSERT INTO `nuke_countrycodes` VALUES ('SM', 'San Marino');
INSERT INTO `nuke_countrycodes` VALUES ('SA', 'Saudi Arabia');
INSERT INTO `nuke_countrycodes` VALUES ('SN', 'Senegal');
INSERT INTO `nuke_countrycodes` VALUES ('SC', 'Seychelles');
INSERT INTO `nuke_countrycodes` VALUES ('SL', 'Sierra Leone');
INSERT INTO `nuke_countrycodes` VALUES ('SG', 'Singapore');
INSERT INTO `nuke_countrycodes` VALUES ('SK', 'Slovak Republic');
INSERT INTO `nuke_countrycodes` VALUES ('SI', 'Slovenia');
INSERT INTO `nuke_countrycodes` VALUES ('SB', 'Solomon Islands');
INSERT INTO `nuke_countrycodes` VALUES ('SO', 'Somalia');
INSERT INTO `nuke_countrycodes` VALUES ('ZA', 'South Africa');
INSERT INTO `nuke_countrycodes` VALUES ('SU', 'Soviet Union');
INSERT INTO `nuke_countrycodes` VALUES ('ES', 'Spain');
INSERT INTO `nuke_countrycodes` VALUES ('LK', 'Sri Lanka');
INSERT INTO `nuke_countrycodes` VALUES ('SH', 'St. Helena');
INSERT INTO `nuke_countrycodes` VALUES ('PM', 'St. Pierre & Miquelon');
INSERT INTO `nuke_countrycodes` VALUES ('ST', 'St. Tome and Principe');
INSERT INTO `nuke_countrycodes` VALUES ('KN', 'St.Kitts Nevis Anguilla');
INSERT INTO `nuke_countrycodes` VALUES ('VC', 'St.Vincent & Grenadines');
INSERT INTO `nuke_countrycodes` VALUES ('SD', 'Sudan');
INSERT INTO `nuke_countrycodes` VALUES ('SR', 'Suriname');
INSERT INTO `nuke_countrycodes` VALUES ('SJ', 'Svalbard & Jan Mayen Is');
INSERT INTO `nuke_countrycodes` VALUES ('SZ', 'Swaziland');
INSERT INTO `nuke_countrycodes` VALUES ('SE', 'Sweden');
INSERT INTO `nuke_countrycodes` VALUES ('CH', 'Switzerland');
INSERT INTO `nuke_countrycodes` VALUES ('SY', 'Syria');
INSERT INTO `nuke_countrycodes` VALUES ('TJ', 'Tadjikistan');
INSERT INTO `nuke_countrycodes` VALUES ('TW', 'Taiwan');
INSERT INTO `nuke_countrycodes` VALUES ('TZ', 'Tanzania');
INSERT INTO `nuke_countrycodes` VALUES ('TH', 'Thailand');
INSERT INTO `nuke_countrycodes` VALUES ('TG', 'Togo');
INSERT INTO `nuke_countrycodes` VALUES ('TK', 'Tokelau');
INSERT INTO `nuke_countrycodes` VALUES ('TO', 'Tonga');
INSERT INTO `nuke_countrycodes` VALUES ('TT', 'Trinidad & Tobago');
INSERT INTO `nuke_countrycodes` VALUES ('TN', 'Tunisia');
INSERT INTO `nuke_countrycodes` VALUES ('TR', 'Turkey');
INSERT INTO `nuke_countrycodes` VALUES ('TM', 'Turkmenistan');
INSERT INTO `nuke_countrycodes` VALUES ('TC', 'Turks & Caicos Islands');
INSERT INTO `nuke_countrycodes` VALUES ('TV', 'Tuvalu');
INSERT INTO `nuke_countrycodes` VALUES ('UG', 'Uganda');
INSERT INTO `nuke_countrycodes` VALUES ('UA', 'Ukraine');
INSERT INTO `nuke_countrycodes` VALUES ('AE', 'United Arab Emirates');
INSERT INTO `nuke_countrycodes` VALUES ('UK', 'United Kingdom');
INSERT INTO `nuke_countrycodes` VALUES ('US', 'United States');
INSERT INTO `nuke_countrycodes` VALUES ('UY', 'Uruguay');
INSERT INTO `nuke_countrycodes` VALUES ('UM', 'US Minor outlying Isl.');
INSERT INTO `nuke_countrycodes` VALUES ('UZ', 'Uzbekistan');
INSERT INTO `nuke_countrycodes` VALUES ('VU', 'Vanuatu');
INSERT INTO `nuke_countrycodes` VALUES ('VA', 'Vatican City State');
INSERT INTO `nuke_countrycodes` VALUES ('VE', 'Venezuela');
INSERT INTO `nuke_countrycodes` VALUES ('VN', 'Vietnam');
INSERT INTO `nuke_countrycodes` VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO `nuke_countrycodes` VALUES ('VI', 'Virgin Islands (US)');
INSERT INTO `nuke_countrycodes` VALUES ('WF', 'Wallis & Futuna Islands');
INSERT INTO `nuke_countrycodes` VALUES ('EH', 'Western Sahara');
INSERT INTO `nuke_countrycodes` VALUES ('YE', 'Yemen');
INSERT INTO `nuke_countrycodes` VALUES ('YU', 'Yugoslavia');
INSERT INTO `nuke_countrycodes` VALUES ('ZR', 'Zaire');
INSERT INTO `nuke_countrycodes` VALUES ('ZM', 'Zambia');
INSERT INTO `nuke_countrycodes` VALUES ('ZW', 'Zimbabwe');

## 
## Dumping data for table `nuke_downloads_categories`
## 

INSERT INTO `nuke_downloads_categories` VALUES (1, 'DASF', 'DASF', NULL, 0);

## 
## Dumping data for table `nuke_downloads_downloads`
## 


## 
## Dumping data for table `nuke_downloads_editorials`
## 


## 
## Dumping data for table `nuke_downloads_modrequest`
## 


## 
## Dumping data for table `nuke_downloads_newdownload`
## 


## 
## Dumping data for table `nuke_downloads_votedata`
## 


## 
## Dumping data for table `nuke_encyclopedia`
## 


## 
## Dumping data for table `nuke_encyclopedia_text`
## 


## 
## Dumping data for table `nuke_faqanswer`
## 

INSERT INTO `nuke_faqanswer` VALUES (1, 1, 'How do I register with website', '<ol>\r\n<li>Click on Register Here Link, You shall be taken to registration form\r\n\r\n<li>Please fill-up the form, please don''t forget to fill-up the all the details requested for.\r\n\r\n<li>On submission, a confirmation mail shall be sent your email account provided during the registration. The mail might be delayed owing to network traffic and site level traffic.\r\n\r\n<li>Click on the confirmation link provided to activate your account\r\n\r\n<li>Login with nick name and password provided during the registration\r\n\r\n<li>For any further help contact: support@domsnittalumni.net  \r\n</ol> ');
INSERT INTO `nuke_faqanswer` VALUES (2, 1, 'How do I change my password', '<ol>\r\n<li> Logon to the website\r\n<li> Click on Your Account\r\n<li> Click on Your Info\r\n<li> Goto bottom of the list and enter the new password\r\n<li>submit the information\r\n</ol>');
INSERT INTO `nuke_faqanswer` VALUES (3, 1, 'How do I create content,faq,surveys, etc...', 'You need to be a content admin to create or post the following items. \r\n<ul>\r\n<li>Content</li>\r\n<li>Downloads</li>\r\n<li>Encyclopedia</li>\r\n<li>F.A.Q.</li>\r\n<li>News</li>\r\n<li>Reviews</li>\r\n<li>Survey / Polls</li>\r\n<li>Topics</li>\r\n<li>Web Links</li>\r\n</ul>\r\n\r\nSend a mail requesting for Content Administrator Account to support@domsnittalumni.net <BR>\r\n\r\n<p>The request will be processed with-in 24-48 hours by the website team, the request would be approved or disapproved after a due diligence process and the mail informing the same shall be sent.</P>\r\n');
INSERT INTO `nuke_faqanswer` VALUES (4, 1, 'How do I logon using my Content Administrator Account', '<ol>\r\n<li> Go to Home Page </li>\r\n<li>Please click on Lock icon displayed in Login Box </li>\r\n<li>Login using your Content Administrator Account and password </li>\r\n</ol>');
INSERT INTO `nuke_faqanswer` VALUES (5, 1, 'How do I get support for this website', 'There are multiple ways to get support for this website\r\n\r\n<ul>\r\n<li>You can mail to support@domsnittalumni.net</li>\r\n\r\n<li>You can use <A href="http://www.domsnittalumni.net/portal/modules.php?name=Forums&file=viewforum&f=1">support website forum</A></li>\r\n\r\n</ul>\r\n');
INSERT INTO `nuke_faqanswer` VALUES (6, 1, 'why site doesn''t support uploading of the files in the download section', '<p>As part of the security measure aginst virus and trojan propogation, the site doesn''t support uploading of the files.</p>\r\n\r\nWe are working towards providing this support in future');
INSERT INTO `nuke_faqanswer` VALUES (7, 1, 'How do I create a forum', '<p>Currently the site doesn''t permit creating of forums for normal users and content administrators</P>\r\n\r\nHowever, you can request for the same by mailing to support@domsnittalumni.net\r\n');
INSERT INTO `nuke_faqanswer` VALUES (8, 1, 'Why does some of the posts made to forums vanish', '\r\nSome of the reasons could be:-\r\n\r\n<ul>\r\n\r\n<li>For some of the forums listed under few categories like connect are pruned automatically after certain duration</li>\r\n\r\n<li>Some of the posts are pruned by moderators as they don''t comply to the site usage policy </li>\r\n\r\n</ul>\r\n');
INSERT INTO `nuke_faqanswer` VALUES (9, 1, 'I had submitted news, but I don''t see it appearing on the homepage or news archives', 'Website has built-in workflows,The submitted news needs to be aproved by the administrator, before it can get published.');

## 
## Dumping data for table `nuke_faqcategories`
## 

INSERT INTO `nuke_faqcategories` VALUES (1, 'Website', '');

## 
## Dumping data for table `nuke_groups`
## 

INSERT INTO `nuke_groups` VALUES (1, 'WebsiteAdmins', 'Administrators and Moderators of the website', 0);

## 
## Dumping data for table `nuke_groups_points`
## 

INSERT INTO `nuke_groups_points` VALUES (1, 1);
INSERT INTO `nuke_groups_points` VALUES (2, 1);
INSERT INTO `nuke_groups_points` VALUES (3, 4);
INSERT INTO `nuke_groups_points` VALUES (4, 4);
INSERT INTO `nuke_groups_points` VALUES (5, 1);
INSERT INTO `nuke_groups_points` VALUES (6, 2);
INSERT INTO `nuke_groups_points` VALUES (7, 1);
INSERT INTO `nuke_groups_points` VALUES (8, 4);
INSERT INTO `nuke_groups_points` VALUES (9, 1);
INSERT INTO `nuke_groups_points` VALUES (10, 1);
INSERT INTO `nuke_groups_points` VALUES (11, 1);
INSERT INTO `nuke_groups_points` VALUES (12, 1);
INSERT INTO `nuke_groups_points` VALUES (13, 0);
INSERT INTO `nuke_groups_points` VALUES (14, 1);
INSERT INTO `nuke_groups_points` VALUES (15, 1);
INSERT INTO `nuke_groups_points` VALUES (16, 1);
INSERT INTO `nuke_groups_points` VALUES (17, 1);
INSERT INTO `nuke_groups_points` VALUES (18, 1);
INSERT INTO `nuke_groups_points` VALUES (19, 1);
INSERT INTO `nuke_groups_points` VALUES (20, 1);
INSERT INTO `nuke_groups_points` VALUES (21, 1);

## 
## Dumping data for table `nuke_headlines`
## 

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

## 
## Dumping data for table `nuke_journal`
## 


## 
## Dumping data for table `nuke_journal_comments`
## 


## 
## Dumping data for table `nuke_journal_stats`
## 


## 
## Dumping data for table `nuke_links_categories`
## 

INSERT INTO `nuke_links_categories` VALUES (1, 'DOMS', 'Links Related DOMS', 0);

## 
## Dumping data for table `nuke_links_editorials`
## 


## 
## Dumping data for table `nuke_links_links`
## 

INSERT INTO `nuke_links_links` VALUES (1, 0, 0, 'NIIT Home Page', 'http://www.nitt.edu', 'NITT Homepage', '2005-12-14 01:28:26', '', '', 0, 'satish1', 0.0000, 0, 0);
INSERT INTO `nuke_links_links` VALUES (2, 1, 0, 'NIIT Home Page', 'http://www.nitt.edu/', 'NITT Home page', '2005-12-14 01:31:52', '', '', 4, '', 0.0000, 0, 0);
INSERT INTO `nuke_links_links` VALUES (3, 1, 0, 'DOMS Home Page', 'http://www.nitt.edu/departments/mba/', 'DOMS Home Page', '2005-12-14 01:34:29', '', '', 4, 'satish1', 0.0000, 0, 0);
INSERT INTO `nuke_links_links` VALUES (4, 1, 0, 'NITT Offical Alumni Page', 'http://recal.nitt.edu/', 'NITT Official Alumni page hosted in the campus', '2005-12-27 07:56:54', '', '', 1, 'satish', 0.0000, 0, 0);

## 
## Dumping data for table `nuke_links_modrequest`
## 


## 
## Dumping data for table `nuke_links_newlink`
## 


## 
## Dumping data for table `nuke_links_votedata`
## 


## 
## Dumping data for table `nuke_main`
## 

INSERT INTO `nuke_main` VALUES ('News');

## 
## Dumping data for table `nuke_message`
## 

INSERT INTO `nuke_message` VALUES (1, 'Welcome to DOMS NIT Trichy - Alumni Network - Alpha Version', '<br>If you are an alumni,faculty and student of DOMS NIT Trichy - Please register your self <A href="modules.php?name=Your_Account&op=new_user">Click Here to Register </A>\r\n\r\n<p> Having trouble registering check out <a href="modules.php?name=FAQ&myfaq=yes&id_cat=1&categories=Website"><b>FAQ</b></a></p>\r\n\r\n<p><b>Check out the usage policy. <A href="modules.php?name=Content&pa=showpage&pid=1">Usage Policy</A></b></p>\r\n<BR>', '993373194', 0, 1, 1, '');

## 
## Dumping data for table `nuke_modules`
## 

INSERT INTO `nuke_modules` VALUES (1, 'AvantGo', 'AvantGo', 0, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (2, 'Content', 'Content', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (3, 'Downloads', 'Downloads', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (4, 'Encyclopedia', 'Encyclopedia', 0, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (5, 'FAQ', 'FAQ', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (6, 'Feedback', 'Feedback', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (7, 'Forums', 'Forums', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (8, 'Journal', 'Journal', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (9, 'Members_List', 'Members List', 1, 1, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (10, 'News', 'News', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (11, 'Private_Messages', 'Private Messages', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (12, 'Recommend_Us', 'Recommend Us', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (13, 'Reviews', 'Reviews', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (14, 'Search', 'Search', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (15, 'Statistics', 'Statistics', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (16, 'Stories_Archive', 'Stories Archive', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (17, 'Submit_News', 'Submit News', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (18, 'Surveys', 'Surveys', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (19, 'Top', 'Top 10', 1, 0, 1, 0, '');
INSERT INTO `nuke_modules` VALUES (20, 'Topics', 'Topics', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (21, 'Web_Links', 'Web Links', 1, 0, 1, 0, 'ContentAdmin,');
INSERT INTO `nuke_modules` VALUES (22, 'Your_Account', 'Your Account', 1, 0, 1, 0, '');

## 
## Dumping data for table `nuke_mostonline`
## 

INSERT INTO `nuke_mostonline` VALUES (6, 2, 4);

## 
## Dumping data for table `nuke_optimize_gain`
## 

INSERT INTO `nuke_optimize_gain` VALUES (15.665);

## 
## Dumping data for table `nuke_pages`
## 

INSERT INTO `nuke_pages` VALUES (1, 3, 'Usage Policy', '<B>TERMS AND CONDITIONS - Version 1.0</B>', 1, '<p>TERMS OF USE FOR:THE DOMS,NITT ALUMNI ASSOCIATION WEB SITE</p>', '<p> \r\nThe DOMS, NITT Alumni Association Website is provided by the DASF is designed to facilitate communication among alumni, students and faculty for College-related purposes.</p>\r\n\r\n<b>I. Privacy and Security</b>\r\n<p>\r\nThe Alumni Association and the College have not, do not and will never sell alumni information to anyone. All alumni information is strictly guarded for use by individual Alumni and the Alumni Association for personal and College-related purposes only. </P>\r\n\r\n<p>The Alumni Association has taken all reasonable precautions to secure the personal information available through the online community. The DOMS, NITT Alumni Association Online Community is password protected to allow access by registered College Alumni, Current Students and Faculty only. Although this precaution should effectively protect any personal information available through the DOMS, NITT Alumni Association Online Community from abuse or outside interference, a certain degree of privacy risk is faced any time information is shared over the Internet. Therefore, through the Online Directory feature of the DOMS, NITT Alumni Association Online Community, you have the ability to hide your information from being viewed by other community members. </P>\r\n \r\n<b>II. Policy and Guidelines for Proper Use</b>\r\n<p>\r\nTo safeguard the operation of the DOMS, NITT Alumni Association Web Site, the Alumni Association has adopted many guidelines and policies that are used by the College to govern conduct, particularly conduct that occurs in an Online environment. </P>\r\n\r\n<i>Usage Policy</I><p>\r\nThis web site and all portions of the online community is for official Alumni Association use, as well as for individual communication of a personal nature between members listed herein. Use of this site or community information for any other purpose, including but not limited to reproducing and storing in a retrieval system by any means, electronic or mechanical, photocopying, or use of the names, addresses or other information contained in this web site or online community for any mailing (electronic or postal), is strictly prohibited without advance written permission of the DOMS, NITT Alumni Association.</P>\r\n\r\n<p>To contact the DOMS, NITT Alumni Association,  mailto:support@domsnittalumni.net </P>\r\n<p>\r\n\r\n<p>In addition to the Alumni Association and College''s policies and guidelines, users of the DOMS, NITT Alumni Association Web Site must abide by the following specific rules and regulations: <p>\r\n\r\n<p>A. Unauthorized copying, reproduction, republishing, uploading, downloading, posting, transmitting or duplicating any of the material or data is prohibited. You may download or copy any downloadable materials displayed on the DOMS, NITT Alumni Association Web Site and Online Community for home, noncommercial and personal in nature use only; provided, however, that you maintain all copyright, trademark and other notices contained in such material and you agree to abide by all additional copyright notices or restrictions contained in any material accessed through the DOMS, NITT Alumni Association Web Site. \r\nUsers shall not copy, download or otherwise use the information contained in the DOMS, NITT Alumni Association Web Site to send any commercial, public or political email. This includes SPAM.</P>\r\n\r\n<p>B. Use of information or communications available through the DOMS, NITT Alumni Association Web Site for any commercial, public or political purposes is strictly prohibited. Prohibited activities include, but are not limited to, solicitations for services, cold-calling of any kind or mass-mailings for any purposes. Information available through the DOMS, NITT Alumni Association Web Site may be used for communications of personal nature and official College-related purposes only. </p>\r\n\r\n<p>C. Users shall not restrict nor inhibit any other user from enjoying any service on the DOMS, NITT Alumni Association Web Site. Posting of obscene materials or use of obscene language, posting of vulgar materials, or use of vulgar language, or use of abusive, defamatory, profane, or threatening language of any kind, will constitute a violation of these policies governing the use of the DOMS, NITT Alumni Association Web Site Community. \r\nUsers shall not copy, download or otherwise use the information contained in the DOMS, NITT Alumni Association Web Site to send any commercial, public or political email. This includes SPAM.\r\nAdditionally, users shall not upload, transmit, distribute or otherwise publish any materials containing a virus or any other harmful component. \r\n</p>\r\n<p>D. All aliases adopted by DOMS, NITT Alumni Association Web Site users are subject to approval by the C the Alumni Association to ensure that the proper image is associated with the institution. \r\nNeither the College nor the Alumni Association is responsible for screening communications in advance, and neither the College nor the Association will actively monitor the use of the DOMS, NITT Alumni Association Web Site. For this reason, it is essential that the Alumni users of the DOMS, NITT Alumni Association Web Site report any abuses or misuse of the DOMS, NITT Alumni Association Web Site to the Alumni Association. If the Alumni Association determines that a user''s participation in the DOMS, NITT Alumni Association Web Site an creates a liability for the Alumni Association or that the user has violated the policies set forth herein, the Alumni Association reserves the right, in its sole discretion, to take actions against the user. The Alumni Association reserves the right to expel a user and deny a user further access to the DOMS, NITT Alumni Association Web Site if such user violates these policies or any applicable laws or regulations. </p>\r\n\r\n<b>III. Liability and Indemnity </b>\r\n\r\n<p>The reliability of the information available through the DOMS, NITT Alumni Association Web Site is largely dependent upon the actions of community registrants. The Alumni Association can make no representations about the accuracy, reliability, completeness, or timeliness of this information. </p>\r\n\r\n<p>The Alumni Association does not warrant that the DOMS, NITT Alumni Association Web Site web site and services provided will operate error-free or that the site and its server are free of computer viruses or other harmful material. To the fullest extent permitted by the law, the Alumni Association disclaims all warranties, including the warranties of merchantability, non-infringement, and fitness for particular purpose. In no event shall the Alumni Association or the College be liable for any damages whatsoever, including, without limitation, incidental, consequential, or punitive damages, resulting from the use of or inability to use information, materials or services available on the DOMS, NITT Alumni Association Web Site. </p>\r\n\r\n<p>By using the DOMS, NITT Alumni Association Web Site, you agree to indemnify, defend, and hold harmless the Alumni Association, the College, and their respective agents from and against any and all losses, claims, damages, costs, and expenses that may arise from your use of the DOMS, NITT Alumni Association Web Site  or your breach of these policies. The Alumni Association will provide notice to you of any such action or claim, and reserves the right to participate, at our expense, in the investigation, settlement, and defense of any such action or claim. </p>\r\n\r\n<p>Please note that the Alumni Association may revise these policies and your continued use of the site constitutes your agreement to comply with such modifications. You should review the policies periodically to ensure that you are familiar with them. </p>\r\n\r\n<p>Participation in the DOMS, NITT Alumni Association Web Site is a privilege. By using this web site, community and services provided therein, you agree to abide by the DOMS, NITT Alumni Association Web Site policies outlined herein.</p>\r\n', 'Thanks\r\nDASF Team', '', '2005-12-18 23:01:11', 21, 'english');
INSERT INTO `nuke_pages` VALUES (2, 2, 'DASF Charter', '', 1, 'DOMS Alumni Student Faculty (DASF) board.', '<b>Objectives</b>\r\n<ol>\r\n<li>Purpose Networking</li>\r\n<li>Placements</li>\r\n<li>Fund raising</li>\r\n<li>Summer projects</li>\r\n<li>Guest lectures</li>\r\n<li>Upgradation of curriculum</li>\r\n<li>Participation in seminars</li>\r\n<li>Selection process</li>\r\n</ol>', '', '', '2005-12-26 09:52:31', 4, 'english');
INSERT INTO `nuke_pages` VALUES (3, 2, 'DASF Board Members', '', 1, '', 'Mr.Tenzing (1988)\r\nMr.Satish (1997)\r\nMr.Subramaniam (1998)\r\nMr.Sunder Rajan (1999)\r\nMs.Madalasa (2000)\r\nMr.Abdul Mateen (2002)\r\nMr.Bharath Upadhaya (2003)\r\nMr Hariharasudhan (2004)\r\nMr.Shiva Kiran (2005)\r\nMr.Thangadurai (2006)\r\nMr.Prem Kumar (2007)\r\n\r\nUnfinished Structure of DASF Board\r\nbusiness Mode of operation of DASF \r\n', '', '', '2005-12-26 11:11:15', 3, 'english');
INSERT INTO `nuke_pages` VALUES (4, 1, 'Contact Address', '', 1, 'Contact Address', '<p>\r\n<b>The Head of the Department</b><br>\r\nDepartment of Management Studies,<br>\r\nNational Institute of Technology,<br>\r\nTiruchirapalli - 620 015<br>\r\nEmail : mba@nitt.edu<br>  \r\nTelex : 455-294 RECTIN<br>  \r\nPhone : (0431) 2500281(3 lines)<br> \r\nFax : 91-431-2500133<br> \r\n</p>\r\n \r\n\r\n  \r\n ', '', '', '2005-12-27 08:14:07', 1, 'english');

## 
## Dumping data for table `nuke_pages_categories`
## 

INSERT INTO `nuke_pages_categories` VALUES (1, 'DOMS', 'Content Related DOMS');
INSERT INTO `nuke_pages_categories` VALUES (2, 'DASF', 'Content related to DASF');
INSERT INTO `nuke_pages_categories` VALUES (3, 'Website', 'Website Related Content');

## 
## Dumping data for table `nuke_poll_check`
## 

INSERT INTO `nuke_poll_check` VALUES ('203.129.195.138', '1135850532', 1);

## 
## Dumping data for table `nuke_poll_data`
## 

INSERT INTO `nuke_poll_data` VALUES (1, 'Ummmm, not bad', 0, 1);
INSERT INTO `nuke_poll_data` VALUES (1, 'Good', 3, 2);
INSERT INTO `nuke_poll_data` VALUES (1, 'Terrific', 2, 3);
INSERT INTO `nuke_poll_data` VALUES (1, 'What the hell is this?', 0, 4);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 5);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 6);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 7);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 8);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 9);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 10);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 11);
INSERT INTO `nuke_poll_data` VALUES (1, '', 0, 12);

## 
## Dumping data for table `nuke_poll_desc`
## 

INSERT INTO `nuke_poll_desc` VALUES (1, 'What do you think about this site?', 961405160, 5, 'english', 0);

## 
## Dumping data for table `nuke_pollcomments`
## 


## 
## Dumping data for table `nuke_public_messages`
## 


## 
## Dumping data for table `nuke_queue`
## 


## 
## Dumping data for table `nuke_quotes`
## 

INSERT INTO `nuke_quotes` VALUES (1, 'Nos morituri te salutamus - CBHS');

## 
## Dumping data for table `nuke_referer`
## 

INSERT INTO `nuke_referer` VALUES (43, 'http://www.whois.sc/domsnittalumni.net');
INSERT INTO `nuke_referer` VALUES (44, 'http://domsnittalumni.net/portal/modules.php?name=Your_Account&op=userinfo&bypass=1&username=lalit');
INSERT INTO `nuke_referer` VALUES (45, 'http://us.f354.mail.yahoo.com/ym/ShowLetter?MsgId=6746_9474225_59179_1851_779_0_43809_3244_433333941');
INSERT INTO `nuke_referer` VALUES (46, 'http://domsnittalumni.net/portal/modules.php?name=Your_Account&op=userinfo&bypass=1&username=lalit');
INSERT INTO `nuke_referer` VALUES (47, 'http://domsnittalumni.net/portal/modules.php?name=Private_Messages&file=index&sid=a48da9b0f360fa356b');
INSERT INTO `nuke_referer` VALUES (48, 'http://domsnittalumni.net/portal/modules.php?name=Forums&file=profile&mode=viewprofile&u=12&sid=fdf5');
INSERT INTO `nuke_referer` VALUES (49, 'http://us.f368.mail.yahoo.com/ym/ShowLetter?MsgId=3289_145723_15690_2968_3235_0_13841_12580_16521042');
INSERT INTO `nuke_referer` VALUES (50, 'http://domsnittalumni.net/portal/modules.php?name=Your_Account&op=userinfo&bypass=1&username=lalit');
INSERT INTO `nuke_referer` VALUES (51, 'http://mail.nitt.edu/horde/imp/message.php?index=276');
INSERT INTO `nuke_referer` VALUES (52, 'http://domsnittalumni.net/portal/modules.php?name=Members_List');
INSERT INTO `nuke_referer` VALUES (53, 'http://www.google.co.in/search?hl=en&q=domsnittalumni&meta=');

## 
## Dumping data for table `nuke_related`
## 


## 
## Dumping data for table `nuke_reviews`
## 


## 
## Dumping data for table `nuke_reviews_add`
## 


## 
## Dumping data for table `nuke_reviews_comments`
## 


## 
## Dumping data for table `nuke_reviews_main`
## 

INSERT INTO `nuke_reviews_main` VALUES ('Reviews Section Title', 'Reviews Section Long Description');

## 
## Dumping data for table `nuke_session`
## 

INSERT INTO `nuke_session` VALUES ('221.134.125.2', '1135857218', '221.134.125.2', 1);
INSERT INTO `nuke_session` VALUES ('203.200.211.65', '1135856239', '203.200.211.65', 1);

## 
## Dumping data for table `nuke_stats_date`
## 

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
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 9, 137);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 10, 33);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 11, 73);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 12, 52);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 13, 38);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 14, 119);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 15, 12);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 16, 10);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 17, 2);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 18, 58);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 19, 331);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 20, 177);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 21, 9);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 22, 41);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 23, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 24, 16);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 25, 9);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 26, 297);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 27, 93);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 28, 113);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 29, 327);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 30, 0);
INSERT INTO `nuke_stats_date` VALUES (2005, 12, 31, 0);

## 
## Dumping data for table `nuke_stats_hour`
## 

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
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 6, 7);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 7, 27);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 8, 16);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 9, 9, 14);
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
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 7, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 9, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 13, 10);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 14, 5);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 16, 13);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 22, 3);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 10, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 1, 16);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 7, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 22, 36);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 11, 23, 20);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 0, 7);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 1, 20);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 3, 4);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 7, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 8, 19);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 12, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 1, 19);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 4, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 7, 16);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 9, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 21, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 13, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 0, 9);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 1, 89);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 3, 6);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 4, 13);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 9, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 14, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 0, 10);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 2, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 3, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 15, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 3, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 4, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 8, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 9, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 12, 3);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 16, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 6, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 17, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 19, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 20, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 21, 6);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 22, 13);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 18, 23, 37);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 0, 14);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 1, 76);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 2, 19);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 3, 28);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 4, 10);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 5, 81);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 6, 82);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 8, 6);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 10, 5);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 11, 9);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 16, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 19, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 0, 9);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 4, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 7, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 8, 67);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 9, 43);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 10, 29);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 20, 23, 26);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 8, 8);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 21, 23, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 1, 4);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 3, 31);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 22, 6);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 22, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 0, 16);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 24, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 16, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 21, 8);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 25, 23, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 2, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 5, 48);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 6, 14);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 7, 6);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 8, 10);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 9, 110);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 10, 65);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 11, 28);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 15, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 17, 2);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 20, 6);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 21, 5);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 26, 23, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 3, 21);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 6, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 7, 29);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 8, 40);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 20, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 27, 23, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 0, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 1, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 2, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 3, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 19, 1);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 22, 73);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 28, 23, 39);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 0, 93);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 1, 67);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 2, 94);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 3, 73);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 4, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 5, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 6, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 7, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 8, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 9, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 10, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 11, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 12, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 13, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 14, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 15, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 16, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 17, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 18, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 19, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 20, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 21, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 22, 0);
INSERT INTO `nuke_stats_hour` VALUES (2005, 12, 29, 23, 0);

## 
## Dumping data for table `nuke_stats_month`
## 

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
INSERT INTO `nuke_stats_month` VALUES (2005, 12, 2225);

## 
## Dumping data for table `nuke_stats_year`
## 

INSERT INTO `nuke_stats_year` VALUES (2005, 2225);

## 
## Dumping data for table `nuke_stories`
## 

INSERT INTO `nuke_stories` VALUES (1, 2, 'admin', 'DOMS Alumni - Alpha Release', '2005-12-08 01:32:36', 'New DOMS Alumni - Alpha version of the site release of limited audience, the beta version would be release on Dec 20th', '', 0, 17, 2, 'admin', '', 1, '', 0, 0, 0, 0, 0, '2-');
INSERT INTO `nuke_stories` VALUES (2, 1, 'admin', 'Bangalore Chapter Meet - 11th Dec', '2005-12-19 03:46:11', 'There was an informal meet of the alumni in Bangalore to foster the activities of the DASF. <br />\r\n<br />\r\n<br />\r\nThe out comes of the meet are:<br />\r\n<br />\r\n<UL>\r\n<b>Funding</b><br />\r\n<br />\r\n\r\n<li>There needs to be a fund base of rupees 2lakhs+ every year for activities like …<br />\r\n<br />\r\nGuest Lectures: 1 lakh<br />\r\n<br />\r\nLibrary fund:         40 k<br />\r\n<br />\r\nWorkshops:          50 k<br />\r\n<br />\r\nAlumni (Annual meet): 30k<br />\r\n<br />\r\nRegional alumni chapter meets can be self funded by the alumni.<br />\r\n<br />\r\n            <br />\r\n<br />\r\n<b>Collection of funds</b><br />\r\n<br />\r\n<li>500 per head for the first year. Thinking of having a life time fee which will become the main corpus for the DASF Activities. (Can any one calculate how much it can be - ??)<br />\r\n<br />\r\n<li>An account needs to be opened in ICICI (As it gives flexibility of e-pay) on the Alumni Association name. <br />\r\n<br />\r\n<li>Funds can be transferred to the account directly on the name of alumni association.<br />\r\n<br />\r\n<li>The account will be maintained by one alumnus, one faculty and one student.<br />\r\n<br />\r\n            <br />\r\n<br />\r\n<b>DASF</b><br />\r\n<br />\r\n<li>It needs to be registered legally.<br />\r\n<br />\r\n                                    <br />\r\n<br />\r\n<b>Guest Lectures</b> <br />\r\n<br />\r\n<li>The faculty will be requested to give the list of curriculum on which they want the alumni to generate guest lectures. Approximately we calculated around 10 hours of guest lectures on each of the course. There are around 36 courses (both for first and second years included in a year). If say half of that is funded by dept with their regular funding for GLs, then the remaining hours of GLs can be taken care by DASF.<br />\r\n<br />\r\n<li>Traveling and accommodation needs to be taken care by the dept. Apart from it there can be payment on usual norms to the Guest Faculty. <br />\r\n<br />\r\n <br />\r\n<br />\r\n<b>Networking</b><br />\r\n<br />\r\n<li>The issues of alumni data base maintenance and networking can be addressed by the upcoming website.<br />\r\n<br />\r\n <br />\r\n<br />\r\n<b>Alumni meet</b><br />\r\n<br />\r\nA yearly all alumni annual meet. (Funded by DASF)<br />\r\n<br />\r\nA half yearly meet at city level.(Self funded)<br />\r\n<br />\r\n</ul>', '', 0, 12, 3, 'shivakiran', '', 1, '', 0, 0, 0, 0, 0, '3-');
INSERT INTO `nuke_stories` VALUES (3, 1, 'admin', 'Alumni Meet Bangalore', '2005-12-19 03:46:56', 'MINUTES OF LIGATURE’05(ALUMNI MEET)<br />\r\nNOVEMBER 13, 2005, ASHRAYA INTERNATIONAL<br />\r\nBANGLORE<br />\r\n<br />\r\n<br />\r\n<br />\r\nHead of Dept’s                      The department’s developments in curriculum <br />\r\n Welcome address        	 upgradation, infrastructure,placements etc<br />\r\n	Call for alumni fund for the betterment of the department.<br />\r\n	Inaugration of fund by donating Rs 5000<br />\r\n<br />\r\n<br />\r\nPresentation by	Mission of DOMS<br />\r\nVinod	Various achievements like 100% placement, shifting to        <br />\r\n	 trimester pattern etc.<br />\r\n	Alumni’s generous contribution in times of need.<br />\r\n	Purpose and constitution of DOMS Alumni Student Faculty  <br />\r\n	 (DASF) board.<br />\r\n<br />\r\nAlumni’s	Urgent requirement of complete alumni database.<br />\r\nWords	Placement aid by provision of leads and in any other way <br />\r\n	 possible.<br />\r\n	Acceptance to share corporate and academic knowledge in <br />\r\n	 the form of guest lectures<br />\r\n	Willingness to contribute generously for the betterment of <br />\r\n	 the dept.<br />\r\n	Idea of selling the image of DOMS as DOMS but not NITT.<br />\r\n	Focus on dept’s expertise in systems and data analytics.<br />\r\n	Provision of consultancy services to small scale industries in <br />\r\n	 Trichy.<br />\r\n	Installation of loyalty in minds of student which helps in lower attrition rate which in turn develops the image of the college<br />\r\n	<br />\r\n<br />\r\nDASF<br />\r\nBOARD<br />\r\nPurpose	Networking.<br />\r\n	Placements<br />\r\n                                                Fund raising<br />\r\n	Summer projects<br />\r\n	Guest lectures<br />\r\n	Upgradation of curriculum<br />\r\n	Participation in seminars<br />\r\n	Selection process<br />\r\n<br />\r\n  Members 	Mr.Tenzing (1988)<br />\r\n  elected	Mr.Satish (1997)<br />\r\n	Mr.Subramaniam (1998)<br />\r\n	Mr.Sunder Rajan (1999)<br />\r\n	Ms.Madalasa (2000)<br />\r\n	Mr.Abdul Mateen (2002)<br />\r\n	Mr.Bharath Upadhaya (2003)<br />\r\n	Mr Hariharasudhan (2004)<br />\r\n	Mr.Shiva Kiran (2005)<br />\r\n	Mr.Thangadurai (2006)<br />\r\n	Mr.Prem Kumar (2007)<br />\r\n<br />\r\nUnfinished	Structure of DASF Board<br />\r\n business	Mode of operation of DASF <br />\r\n<br />\r\n The meet was adjourned at 2 p.m.<br />\r\n', '', 0, 11, 3, 'shivakiran', '', 1, '', 0, 0, 0, 0, 0, '3-');

## 
## Dumping data for table `nuke_stories_cat`
## 

INSERT INTO `nuke_stories_cat` VALUES (1, 'DASF', 3);
INSERT INTO `nuke_stories_cat` VALUES (2, 'Website', 0);

## 
## Dumping data for table `nuke_subscriptions`
## 


## 
## Dumping data for table `nuke_topics`
## 

INSERT INTO `nuke_topics` VALUES (2, 'Website News', 'phpnuke.gif', 'Website', 0);
INSERT INTO `nuke_topics` VALUES (3, 'DOMS News', 'phpnuke.gif', 'DOMS NEWS', 0);

## 
## Dumping data for table `nuke_users`
## 

INSERT INTO `nuke_users` VALUES (9, 'Sundara Rajan G', 'Sundar', 'g.sundararajan@iflexsolutions.com', '', '', 'gallery/004.gif', 'Dec 28, 2005', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '21873f3df81642e13eb8e688fc09a477', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135838480, 0, 1135837898, 10, NULL, 'english', 'D M d, Y g:i a', 0, 0, 1135837727, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, NULL, NULL, NULL, 4, '59.145.67.22', 'Alumni', 1999, 'i-flex solutions', 'Consultant', 'Systems', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL);
INSERT INTO `nuke_users` VALUES (8, 'Satish Kumar', 'satish', 'avsk71@yahoo.com', 'satish@nothing.com', 'http://', 'gallery/048.gif', 'Dec 26, 2005', 'satish71', '', '', '', 'Satish Kumar A.V.', 0, NULL, '', 'avsk71', '', '72bfb409ab10f1a38901327b5148cd96', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1135855877, 0, 1135855492, 5, NULL, 'english', 'D M d, Y g:i a', 1, 0, 1135855880, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, NULL, NULL, NULL, 1, '221.134.125.2', 'Alumni', 1997, 'InMage Systems', 'VP Product Delivery & Principal Architect', 'Finance', '301,Shristi Towers', 'Madhapur', 'Hyderabad', 'AP', 'IN', '09885067235', '040 55848013', '040 55848016', 'satish@inmage.in', 'B 24/1', 'Rukminipuri,ECIL Post', 'Hyderabad', 'AP', 'IN', '09849029685', '040 27123276', '', 'avsk71@yahoo.com', 0, 0, '', 1, 1, 1, '500081', '500062', '1971-01-15', 'M', 1);
INSERT INTO `nuke_users` VALUES (10, 'Lalit Mohan Balooni', 'Lalit', 'baloonilalit@rediffmail.com', '', 'http://', 'gallery/046.gif', 'Dec 28, 2005', '', '', '', '', 'Lalit Mohan\r\n(2003-05 batch)\r\n\r\nSatyam Computers Service\r\nHyderabad\r\nIndia', 0, NULL, '', '', '', '6aa18194456b8021dd2657a4a5b2f8f0', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135856122, -10, 1135855756, 10, 1, 'english', 'D M d, Y g:i a', 0, 0, 1135855800, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, 'dc171a8b04', '', NULL, 7, '203.200.211.65', 'Alumni', 2005, 'Satyam Computer Services Ltd', 'Business Analyst(CRM Practice)', 'Finance', '', '', '', '', 'AF', '', '', '', '', '', '', '', '', 'AF', '', '', '', '', 0, 0, '', 0, 0, 0, '', '', '0000-00-00', 'M', 0);
INSERT INTO `nuke_users` VALUES (12, 'Arun Raghavan', 'bewada', 'arunrags@yahoo.com', '', '', 'gallery/blank.gif', 'Dec 29, 2005', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '9083609d9e941bcddd5b418a53acbdb1', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135847599, 0, 1135847567, 10, NULL, 'english', 'D M d, Y g:i a', 0, 0, 1135847490, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, NULL, NULL, NULL, 1, '59.92.158.71', 'Alumni', 1998, 'IBM Global services', 'Manager', 'Production', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL);
INSERT INTO `nuke_users` VALUES (11, 'Madalasa Venkataraman', 'Madhu', 'vmadalasa@yahoo.com', '', '', 'gallery/103.gif', 'Dec 29, 2005', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '719d1229abb759e3a091cd36441dd540', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1135843807, 0, 1135843807, 10, NULL, 'english', 'D M d, Y g:i a', 1, 0, 1135847567, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, NULL, NULL, NULL, 0, '164.164.81.4', 'Alumni', 2000, 'IIM B', 'Fellow Student', 'Finance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, NULL);

## 
## Dumping data for table `nuke_users_temp`
## 

INSERT INTO `nuke_users_temp` VALUES (14, 'Subbu', 'nesubramanian@lycos.com', '61be360905cecd0e96e31c9d575283b1', 'Dec 29, 2005', '49760bb522db987b555be98055f6b404', '1135849182', 'Alumni', 1998, 'Saint Gobain Vetrotex India Ltd.', 'Manager - Specialty Products', 'N E Subramanian', 'Marketing');
INSERT INTO `nuke_users_temp` VALUES (13, 'Shiva_Gopal', 'shiva_gopal@gmail.com', '7b8748028f4be28352d0f13a06c4cd05', 'Dec 29, 2005', '4e70f5a00eed4312d3e999b290dd3764', '1135844613', 'Alumni', 2005, 'Satyam Computer Services Ltd.', 'Business Analyst (CRM)', 'Shiva Ilengo Gopal', 'Marketing');
INSERT INTO `nuke_users_temp` VALUES (15, 'selvan', 'selvan@nitt.edu', '9155816afb84f1574221b42a22620996', 'Dec 29, 2005', '5260bfb89b19eb27b70147b50be5afef', '1135850630', 'Faculty', 1992, 'NATIONAL INSTITUTE OF TECHNOLOGY', 'LECTURER', 'THAMARAISELVAN', 'Marketing');
