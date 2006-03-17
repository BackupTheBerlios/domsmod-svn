DROP TABLE IF EXISTS x7chat_users;
DROP TABLE IF EXISTS x7chat_rooms;
DROP TABLE IF EXISTS x7chat_online;
DROP TABLE IF EXISTS x7chat_messages;
DROP TABLE IF EXISTS x7chat_settings;
DROP TABLE IF EXISTS x7chat_ignore;
DROP TABLE IF EXISTS x7chat_bans;
DROP TABLE IF EXISTS x7chat_filter;
DROP TABLE IF EXISTS x7chat_permissions;
DROP TABLE IF EXISTS x7chat_pmsessions;
DROP TABLE IF EXISTS x7chat_bandwidth;


CREATE TABLE x7chat_users(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(60) NOT NULL,
	password VARCHAR(60) NOT NULL,
	email VARCHAR(90) NOT NULL,
	level INT NOT NULL,
	avatar VARCHAR(60) NOT NULL,
	realname VARCHAR(60) NOT NULL,
	location VARCHAR(60) NOT NULL,
	hobbies VARCHAR(60) NOT NULL,
	bio VARCHAR(60) NOT NULL,
	status VARCHAR(60) NOT NULL,
	voice INT NOT NULL,
	time INT NOT NULL,
	settings TEXT NOT NULL
);


CREATE TABLE x7chat_rooms(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	type INT NOT NULL,
	encrypted INT NOT NULL,
	ban TEXT NOT NULL,
	moderated INT NOT NULL,
	topic VARCHAR(90) NOT NULL,
	password VARCHAR(60) NOT NULL,
	maxusers INT NOT NULL,
	time INT NOT NULL
);


CREATE TABLE x7chat_online(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(60) NOT NULL,
	ip VARCHAR(30) NOT NULL,
	roomname VARCHAR(60) NOT NULL,
	time INT NOT NULL
);


CREATE TABLE x7chat_messages(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	room VARCHAR(60) NOT NULL,
	user VARCHAR(60) NOT NULL,
	time INT NOT NULL,
	type INT NOT NULL,
	body TEXT NOT NULL
);


CREATE TABLE x7chat_settings (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(60) NOT NULL,
        value TEXT NOT NULL
);


CREATE TABLE x7chat_ignore(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user VARCHAR(60) NOT NULL,
	toignore VARCHAR(60) NOT NULL,
	timeset INT NOT NULL,
	length INT NOT NULL
);


CREATE TABLE x7chat_bans(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	room VARCHAR(60) NOT NULL,
	name VARCHAR(60) NOT NULL,
	ip VARCHAR(60) NOT NULL,
	timeset INT NOT NULL,
	length INT NOT NULL
);


CREATE TABLE x7chat_filter (
	id int(11) NOT NULL auto_increment,
	type int(11) NOT NULL default '0',
	code varchar(100) NOT NULL default '',
	image varchar(100) NOT NULL default '',
	PRIMARY KEY (id)
);


CREATE TABLE x7chat_permissions (
	id int(11) NOT NULL auto_increment,
        user varchar(255) NOT NULL default '',
        CreateRoom int(11) NOT NULL default '0',
        CR_NeverExpire int(11) NOT NULL default '0',
        CR_Private int(11) NOT NULL default '0',
        CR_Moderated int(11) NOT NULL default '0',
        Make_Admins int(11) NOT NULL default '0',
        Give_Ops_Own int(11) NOT NULL default '0',
        Give_Ops_All int(11) NOT NULL default '0',
        Lookup_Ips int(11) NOT NULL default '0',
        Kick int(11) NOT NULL default '0',
        Ban int(11) NOT NULL default '0',
        Server_Ban int(11) NOT NULL default '0',
        Send_Sys_Message int(11) NOT NULL default '0',
        Edit_Settings int(11) NOT NULL default '0',
        Edit_Styles int(11) NOT NULL default '0',
        Edit_Permissions int(11) NOT NULL default '0',
        Edit_Users int(11) NOT NULL default '0',
        Edit_Room int(11) NOT NULL default '0',
        Edit_Smilies int(11) NOT NULL default '0',
        Edit_Filter int(11) NOT NULL default '0',
	Edit_Bandwidth int(11) NOT NULL default '0',
        PRIMARY KEY (id)
);


CREATE TABLE x7chat_pmsessions (
	id int(11) NOT NULL auto_increment,
	user varchar(255) NOT NULL default '',
	fromuser varchar(255) NOT NULL default '',
	time int(11) NOT NULL default '0',
	isopen int(11) NOT NULL default '0',
	PRIMARY KEY (id)
);


CREATE TABLE x7chat_bandwidth (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user VARCHAR(255) NOT NULL,
	month VARCHAR(15) NOT NULL,
	bandwidth VARCHAR(255) NOT NULL,
	allowed VARCHAR(255) NOT NULL
);


INSERT INTO x7chat_rooms VALUES('0','General Chat','1','0','null','0','Welcome to X7 Chat','','100','0');
INSERT INTO x7chat_users VALUES('0','%admin_user%','%admin_password%','admin','5','','','','','','','1','0','14000,5000,1,1,0,3,1,0,0,1');

INSERT INTO x7chat_filter VALUES('0','1',':)','../images/smiley/happy.gif');
INSERT INTO x7chat_filter VALUES('0','1','\\\\[confused\\\\]','../images/smiley/confused.gif');
INSERT INTO x7chat_filter VALUES('0','1','8)','../images/smiley/cool.gif');
INSERT INTO x7chat_filter VALUES('0','1','\\\\~\\\\(','../images/smiley/cry.gif');
INSERT INTO x7chat_filter VALUES('0','1',':!:','../images/smiley/explaim.gif');
INSERT INTO x7chat_filter VALUES('0','1','\\\\[question\\\\]','../images/smiley/question.gif');
INSERT INTO x7chat_filter VALUES('0','1',':\\\\|','../images/smiley/straight.gif');
INSERT INTO x7chat_filter VALUES('0','1','!)','../images/smiley/surprised.gif');
INSERT INTO x7chat_filter VALUES('0','1',':\\\\(','../images/smiley/unhappy.gif');
INSERT INTO x7chat_filter VALUES('0','1',';)','../images/smiley/wink.gif');


INSERT INTO x7chat_permissions VALUES(1, 'DEFAULT_1', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0);
INSERT INTO x7chat_permissions VALUES(2, 'DEFAULT_4', 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,1);

INSERT INTO x7chat_settings VALUES('0','ed_sounds','0');
INSERT INTO x7chat_settings VALUES('0','ed_chat','0');
INSERT INTO x7chat_settings VALUES('0','ed_registration','0');
INSERT INTO x7chat_settings VALUES('0','ed_newroom','0');
INSERT INTO x7chat_settings VALUES('0','ed_newroomprivate','0');
INSERT INTO x7chat_settings VALUES('0','ed_avatars','0');
INSERT INTO x7chat_settings VALUES('0','exp_room','600');
INSERT INTO x7chat_settings VALUES('0','exp_user','600');
INSERT INTO x7chat_settings VALUES('0','exp_msg','600');
INSERT INTO x7chat_settings VALUES('0','max_inrooms','100');
INSERT INTO x7chat_settings VALUES('0','max_rooms','100');
INSERT INTO x7chat_settings VALUES('0','max_total','500');
INSERT INTO x7chat_settings VALUES('0','max_idletime','240');
INSERT INTO x7chat_settings VALUES('0','max_mps','3');
INSERT INTO x7chat_settings VALUES('0','ed_links','0');
INSERT INTO x7chat_settings VALUES('0','ed_style','0');
INSERT INTO x7chat_settings VALUES('0','ed_smile','0');
INSERT INTO x7chat_settings VALUES('0','style_winbg1','#FFFFFF');
INSERT INTO x7chat_settings VALUES('0','style_winbg2','#b3b3b3');
INSERT INTO x7chat_settings VALUES('0','style_cs1','#cdcdcd');
INSERT INTO x7chat_settings VALUES('0','style_cs3','#cdcdcd');
INSERT INTO x7chat_settings VALUES('0','style_cs2','#000000');
INSERT INTO x7chat_settings VALUES('0','style_msgboxbg','#b3b3b3');
INSERT INTO x7chat_settings VALUES('0','style_ltfont','#000000');
INSERT INTO x7chat_settings VALUES('0','style_dkfont','#000000');
INSERT INTO x7chat_settings VALUES('0','style_deffont','#000000');
INSERT INTO x7chat_settings VALUES('0','bgimage','');
INSERT INTO x7chat_settings VALUES('0','news','');
INSERT INTO x7chat_settings VALUES('0','maxlog','1048576');
INSERT INTO x7chat_settings VALUES('0','defband','0');
INSERT INTO x7chat_settings VALUES('0','style_sysmsg','#ff0000');
INSERT INTO x7chat_settings VALUES('0','style_otherusers','#ff0000');
INSERT INTO x7chat_settings VALUES('0','style_youruser','#001068');
INSERT INTO x7chat_settings VALUES('0','serveroffset','0');
