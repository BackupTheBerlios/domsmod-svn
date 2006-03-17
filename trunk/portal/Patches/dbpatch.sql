## Title: DOMS NITT DB Patch
## Patch Version: 1.0
## Server version: 4.0.16
## PHP Version: 4.3.11
## 
## Database: `domsnitt_p_nu1`
## 

## --------------------------------------------------------

use domsnitt_p_nu1;

# Host: localhost
# Database: domsnitt_p_nu1
# Table: `nuke_users_temp`
# 
 ALTER TABLE nuke_users_temp ADD fullname varchar(60);
 ALTER TABLE nuke_users_temp ADD usertype varchar(10);
 ALTER TABLE nuke_users_temp ADD gradyear int(4);
 ALTER TABLE nuke_users_temp ADD specialization varchar(20);
 ALTER TABLE nuke_users_temp ADD company varchar(50);
 ALTER TABLE nuke_users_temp ADD designation varchar(50);
 
 
 
# Host: localhost
# Database: domsnitt_p_nu1
# Table: `nuke_users`
# 
 
 ALTER TABLE nuke_users ADD usertype varchar(10);
 ALTER TABLE nuke_users ADD gradyear int(4);
 ALTER TABLE nuke_users ADD company varchar(50);
 ALTER TABLE nuke_users ADD designation varchar(50);
 ALTER TABLE nuke_users ADD specialization varchar(20);
 
 ALTER TABLE nuke_users ADD Company_Address_1 varchar(50);
 ALTER TABLE nuke_users ADD Company_Address_2 varchar(50);
 ALTER TABLE nuke_users ADD Company_Address_CITY varchar(30);
 ALTER TABLE nuke_users ADD Company_Address_STATE varchar(30);
 ALTER TABLE nuke_users ADD Company_Address_COUNTRY varchar(30);
 ALTER TABLE nuke_users ADD Company_Address_ZIP varchar(50);
 
 ALTER TABLE nuke_users ADD Company_Address_MOBILE varchar(30);
 ALTER TABLE nuke_users ADD Company_Address_PHONE varchar(30);
 ALTER TABLE nuke_users ADD Company_Address_FAX varchar(30);
 ALTER TABLE nuke_users ADD Company_Address_EMAIL varchar(50);
 

 ALTER TABLE nuke_users ADD PERMANENT_Address_1 varchar(50);
 ALTER TABLE nuke_users ADD PERMANENT_Address_2 varchar(50);
 ALTER TABLE nuke_users ADD PERMANENT_Address_CITY varchar(30);
 ALTER TABLE nuke_users ADD PERMANENT_Address_STATE varchar(30);
 ALTER TABLE nuke_users ADD PERMANENT_Address_COUNTRY varchar(30);
 ALTER TABLE nuke_users ADD PERMANENT_Address_ZIP varchar(30);
 
 ALTER TABLE nuke_users ADD PERMANENT_Address_MOBILE varchar(30);
 ALTER TABLE nuke_users ADD PERMANENT_Address_PHONE varchar(30);
 ALTER TABLE nuke_users ADD PERMANENT_Address_FAX varchar(30);
 ALTER TABLE nuke_users ADD PERMANENT_Address_EMAIL varchar(50);



 ALTER TABLE nuke_users ADD dasf_member tinyint(1);
 ALTER TABLE nuke_users ADD guest_lectures_ok tinyint(1);
 ALTER TABLE nuke_users ADD guest_lectures_topics varchar(150);
 ALTER TABLE nuke_users ADD summer_projects_ok tinyint(1);
 ALTER TABLE nuke_users ADD placements_ok tinyint(1);
 ALTER TABLE nuke_users ADD financial_help_ok tinyint(1);
  
 ALTER TABLE nuke_users ADD dob date default '0000-00-00';
 ALTER TABLE nuke_users ADD sex varchar(1);
 ALTER TABLE nuke_users ADD is_married tinyint(1);
  
  
  
  
 ##########################
 # AUM Related DB Patches
 ##########################   
  
ALTER TABLE nuke_config ADD AutoActivateMode tinyint(1) NOT NULL default '0';

CREATE TABLE nuke_aum_mfilter (
	mfid int(11) NOT NULL auto_increment,
	mdomain varchar (60) DEFAULT '' NOT NULL,
	PRIMARY KEY (mfid)
);

CREATE TABLE nuke_aum_dupconfig (
	configid int(11) NOT NULL auto_increment,
	allowSchedule tinyint (1) DEFAULT '0' NOT NULL,
	duptime int(11) default '0' NOT NULL,
	allowSendMail tinyint(1) DEFAULT '1' NOT NULL,
	duration int(11) default '0' NOT NULL,
	mbtext text NOT NULL,
	PRIMARY KEY (configid)
);

CREATE TABLE nuke_aum_pruneq (
	pqid int(11) NOT NULL auto_increment,
	user_id int(11) DEFAULT '0' NOT NULL,
	pqdue int(11) DEFAULT '0' NOT NULL,
	PRIMARY KEY (pqid)
);


ALTER TABLE nuke_downloads_categories ADD ldescription TEXT AFTER cdescription;

CREATE TABLE nuke_countrycodes (code CHAR(2),country text);
insert into nuke_countrycodes (code,country) values ('AF','Afghanistan');
insert into nuke_countrycodes (code,country) values ('AL','Albania');
insert into nuke_countrycodes (code,country) values ('DZ','Algeria');
insert into nuke_countrycodes (code,country) values ('AS','American Samoa');
insert into nuke_countrycodes (code,country) values ('AD','Andorra');
insert into nuke_countrycodes (code,country) values ('AO','Angola');
insert into nuke_countrycodes (code,country) values ('AI','Anguilla');
insert into nuke_countrycodes (code,country) values ('AQ','Antarctica');
insert into nuke_countrycodes (code,country) values ('AG','Antigua and Barbuda');
insert into nuke_countrycodes (code,country) values ('AR','Argentina');
insert into nuke_countrycodes (code,country) values ('AM','Armenia');
insert into nuke_countrycodes (code,country) values ('AW','Aruba');
insert into nuke_countrycodes (code,country) values ('AU','Australia');
insert into nuke_countrycodes (code,country) values ('AT','Austria');
insert into nuke_countrycodes (code,country) values ('AZ','Azerbaidjan');
insert into nuke_countrycodes (code,country) values ('BS','Bahamas');
insert into nuke_countrycodes (code,country) values ('BH','Bahrain');
insert into nuke_countrycodes (code,country) values ('BD','Banglades');
insert into nuke_countrycodes (code,country) values ('BB','Barbados');
insert into nuke_countrycodes (code,country) values ('BY','Belarus');
insert into nuke_countrycodes (code,country) values ('BE','Belgium');
insert into nuke_countrycodes (code,country) values ('BZ','Belize');
insert into nuke_countrycodes (code,country) values ('BJ','Benin');
insert into nuke_countrycodes (code,country) values ('BM','Bermuda');
insert into nuke_countrycodes (code,country) values ('BO','Bolivia');
insert into nuke_countrycodes (code,country) values ('BA','Bosnia-Herzegovina');
insert into nuke_countrycodes (code,country) values ('BW','Botswana');
insert into nuke_countrycodes (code,country) values ('BV','Bouvet Island');
insert into nuke_countrycodes (code,country) values ('BR','Brazil');
insert into nuke_countrycodes (code,country) values ('IO','British Indian O. Terr.');
insert into nuke_countrycodes (code,country) values ('BN','Brunei Darussalam');
insert into nuke_countrycodes (code,country) values ('BG','Bulgaria');
insert into nuke_countrycodes (code,country) values ('BF','Burkina Faso');
insert into nuke_countrycodes (code,country) values ('BI','Burundi');
insert into nuke_countrycodes (code,country) values ('BT','Buthan');
insert into nuke_countrycodes (code,country) values ('KH','Cambodia');
insert into nuke_countrycodes (code,country) values ('CM','Cameroon');
insert into nuke_countrycodes (code,country) values ('CA','Canada');
insert into nuke_countrycodes (code,country) values ('CV','Cape Verde');
insert into nuke_countrycodes (code,country) values ('KY','Cayman Islands');
insert into nuke_countrycodes (code,country) values ('CF','Central African Rep.');
insert into nuke_countrycodes (code,country) values ('TD','Chad');
insert into nuke_countrycodes (code,country) values ('CL','Chile');
insert into nuke_countrycodes (code,country) values ('CN','China');
insert into nuke_countrycodes (code,country) values ('CX','Christmas Island');
insert into nuke_countrycodes (code,country) values ('CC','Cocos (Keeling) Isl.');
insert into nuke_countrycodes (code,country) values ('CO','Colombia');
insert into nuke_countrycodes (code,country) values ('KM','Comoros');
insert into nuke_countrycodes (code,country) values ('CG','Congo');
insert into nuke_countrycodes (code,country) values ('CK','Cook Islands');
insert into nuke_countrycodes (code,country) values ('CR','Costa Rica');
insert into nuke_countrycodes (code,country) values ('HR','Croatia');
insert into nuke_countrycodes (code,country) values ('CU','Cuba');
insert into nuke_countrycodes (code,country) values ('CY','Cyprus');
insert into nuke_countrycodes (code,country) values ('CZ','Czech Republic');
insert into nuke_countrycodes (code,country) values ('CS','Czechoslovakia');
insert into nuke_countrycodes (code,country) values ('DK','Denmark');
insert into nuke_countrycodes (code,country) values ('DJ','Djibouti');
insert into nuke_countrycodes (code,country) values ('DM','Dominica');
insert into nuke_countrycodes (code,country) values ('DO','Dominican Republic');
insert into nuke_countrycodes (code,country) values ('TP','East Timor');
insert into nuke_countrycodes (code,country) values ('EC','Ecuador');
insert into nuke_countrycodes (code,country) values ('EG','Egypt');
insert into nuke_countrycodes (code,country) values ('SV','El Salvador');
insert into nuke_countrycodes (code,country) values ('GQ','Equatorial Guinea');
insert into nuke_countrycodes (code,country) values ('EE','Estonia');
insert into nuke_countrycodes (code,country) values ('ET','Ethiopia');
insert into nuke_countrycodes (code,country) values ('FK','Falkland Isl.(UK)');
insert into nuke_countrycodes (code,country) values ('FO','Faroe Islands');
insert into nuke_countrycodes (code,country) values ('FJ','Fiji');
insert into nuke_countrycodes (code,country) values ('FI','Finland');
insert into nuke_countrycodes (code,country) values ('FR','France');
insert into nuke_countrycodes (code,country) values ('FX','France (European Ter.)');
insert into nuke_countrycodes (code,country) values ('TF','French Southern Terr.');
insert into nuke_countrycodes (code,country) values ('GA','Gabon');
insert into nuke_countrycodes (code,country) values ('GM','Gambia');
insert into nuke_countrycodes (code,country) values ('GE','Georgia');
insert into nuke_countrycodes (code,country) values ('DE','Germany');
insert into nuke_countrycodes (code,country) values ('GH','Ghana');
insert into nuke_countrycodes (code,country) values ('GI','Gibraltar');
insert into nuke_countrycodes (code,country) values ('GB','Great Britain (UK)');
insert into nuke_countrycodes (code,country) values ('GR','Greece');
insert into nuke_countrycodes (code,country) values ('GL','Greenland');
insert into nuke_countrycodes (code,country) values ('GD','Grenada');
insert into nuke_countrycodes (code,country) values ('GP','Guadeloupe (Fr.)');
insert into nuke_countrycodes (code,country) values ('GU','Guam (US)');
insert into nuke_countrycodes (code,country) values ('GT','Guatemala');
insert into nuke_countrycodes (code,country) values ('GN','Guinea');
insert into nuke_countrycodes (code,country) values ('GW','Guinea Bissau');
insert into nuke_countrycodes (code,country) values ('GY','Guyana');
insert into nuke_countrycodes (code,country) values ('GF','Guyana (Fr.)');
insert into nuke_countrycodes (code,country) values ('HT','Haiti');
insert into nuke_countrycodes (code,country) values ('HM','Heard & McDonald Isl.');
insert into nuke_countrycodes (code,country) values ('HN','Honduras');
insert into nuke_countrycodes (code,country) values ('HK','Hong Kong');
insert into nuke_countrycodes (code,country) values ('HU','Hungary');
insert into nuke_countrycodes (code,country) values ('IS','Iceland');
insert into nuke_countrycodes (code,country) values ('IN','India');
insert into nuke_countrycodes (code,country) values ('ID','Indonesia');
insert into nuke_countrycodes (code,country) values ('IR','Iran');
insert into nuke_countrycodes (code,country) values ('IQ','Iraq');
insert into nuke_countrycodes (code,country) values ('IE','Ireland');
insert into nuke_countrycodes (code,country) values ('IL','Israel');
insert into nuke_countrycodes (code,country) values ('IT','Italy');
insert into nuke_countrycodes (code,country) values ('CI','Ivory Coast');
insert into nuke_countrycodes (code,country) values ('JM','Jamaica');
insert into nuke_countrycodes (code,country) values ('JP','Japan');
insert into nuke_countrycodes (code,country) values ('JO','Jordan');
insert into nuke_countrycodes (code,country) values ('KZ','Kazachstan');
insert into nuke_countrycodes (code,country) values ('KE','Kenya');
insert into nuke_countrycodes (code,country) values ('KG','Kirgistan');
insert into nuke_countrycodes (code,country) values ('KI','Kiribati');
insert into nuke_countrycodes (code,country) values ('KP','Korea (North)');
insert into nuke_countrycodes (code,country) values ('KR','Korea (South)');
insert into nuke_countrycodes (code,country) values ('KW','Kuwait');
insert into nuke_countrycodes (code,country) values ('LA','Laos');
insert into nuke_countrycodes (code,country) values ('LV','Latvia');
insert into nuke_countrycodes (code,country) values ('LB','Lebanon');
insert into nuke_countrycodes (code,country) values ('LS','Lesotho');
insert into nuke_countrycodes (code,country) values ('LR','Liberia');
insert into nuke_countrycodes (code,country) values ('LY','Libya');
insert into nuke_countrycodes (code,country) values ('LI','Liechtenstein');
insert into nuke_countrycodes (code,country) values ('LT','Lithuania');
insert into nuke_countrycodes (code,country) values ('LU','Luxembourg');
insert into nuke_countrycodes (code,country) values ('MO','Macau');
insert into nuke_countrycodes (code,country) values ('MG','Madagascar');
insert into nuke_countrycodes (code,country) values ('MW','Malawi');
insert into nuke_countrycodes (code,country) values ('MY','Malaysia');
insert into nuke_countrycodes (code,country) values ('MV','Maldives');
insert into nuke_countrycodes (code,country) values ('ML','Mali');
insert into nuke_countrycodes (code,country) values ('MT','Malta');
insert into nuke_countrycodes (code,country) values ('MH','Marshall Islands');
insert into nuke_countrycodes (code,country) values ('MQ','Martinique (Fr.)');
insert into nuke_countrycodes (code,country) values ('MR','Mauritania');
insert into nuke_countrycodes (code,country) values ('MU','Mauritius');
insert into nuke_countrycodes (code,country) values ('MX','Mexico');
insert into nuke_countrycodes (code,country) values ('FM','Micronesia');
insert into nuke_countrycodes (code,country) values ('MD','Moldavia');
insert into nuke_countrycodes (code,country) values ('MC','Monaco');
insert into nuke_countrycodes (code,country) values ('MN','Mongolia');
insert into nuke_countrycodes (code,country) values ('MS','Montserrat');
insert into nuke_countrycodes (code,country) values ('MA','Morocco');
insert into nuke_countrycodes (code,country) values ('MZ','Mozambique');
insert into nuke_countrycodes (code,country) values ('MM','Myanmar');
insert into nuke_countrycodes (code,country) values ('NA','Namibia');
insert into nuke_countrycodes (code,country) values ('NR','Nauru');
insert into nuke_countrycodes (code,country) values ('NP','Nepal');
insert into nuke_countrycodes (code,country) values ('AN','Netherland Antilles');
insert into nuke_countrycodes (code,country) values ('NL','Netherlands');
insert into nuke_countrycodes (code,country) values ('NT','Neutral Zone');
insert into nuke_countrycodes (code,country) values ('NC','New Caledonia (Fr.)');
insert into nuke_countrycodes (code,country) values ('NZ','New Zealand');
insert into nuke_countrycodes (code,country) values ('NI','Nicaragua');
insert into nuke_countrycodes (code,country) values ('NE','Niger');
insert into nuke_countrycodes (code,country) values ('NG','Nigeria');
insert into nuke_countrycodes (code,country) values ('NU','Niue');
insert into nuke_countrycodes (code,country) values ('NF','Norfolk Island');
insert into nuke_countrycodes (code,country) values ('MP','Northern Mariana Isl.');
insert into nuke_countrycodes (code,country) values ('NO','Norway');
insert into nuke_countrycodes (code,country) values ('OM','Oman');
insert into nuke_countrycodes (code,country) values ('PK','Pakistan');
insert into nuke_countrycodes (code,country) values ('PW','Palau');
insert into nuke_countrycodes (code,country) values ('PA','Panama');
insert into nuke_countrycodes (code,country) values ('PG','Papua New');
insert into nuke_countrycodes (code,country) values ('PY','Paraguay');
insert into nuke_countrycodes (code,country) values ('PE','Peru');
insert into nuke_countrycodes (code,country) values ('PH','Philippines');
insert into nuke_countrycodes (code,country) values ('PN','Pitcairn');
insert into nuke_countrycodes (code,country) values ('PL','Poland');
insert into nuke_countrycodes (code,country) values ('PF','Polynesia (Fr.)');
insert into nuke_countrycodes (code,country) values ('PT','Portugal');
insert into nuke_countrycodes (code,country) values ('PR','Puerto Rico (US)');
insert into nuke_countrycodes (code,country) values ('QA','Qatar');
insert into nuke_countrycodes (code,country) values ('RE','Reunion (Fr.)');
insert into nuke_countrycodes (code,country) values ('RO','Romania');
insert into nuke_countrycodes (code,country) values ('RU','Russian Federation');
insert into nuke_countrycodes (code,country) values ('RW','Rwanda');
insert into nuke_countrycodes (code,country) values ('LC','Saint Lucia');
insert into nuke_countrycodes (code,country) values ('WS','Samoa');
insert into nuke_countrycodes (code,country) values ('SM','San Marino');
insert into nuke_countrycodes (code,country) values ('SA','Saudi Arabia');
insert into nuke_countrycodes (code,country) values ('SN','Senegal');
insert into nuke_countrycodes (code,country) values ('SC','Seychelles');
insert into nuke_countrycodes (code,country) values ('SL','Sierra Leone');
insert into nuke_countrycodes (code,country) values ('SG','Singapore');
insert into nuke_countrycodes (code,country) values ('SK','Slovak Republic');
insert into nuke_countrycodes (code,country) values ('SI','Slovenia');
insert into nuke_countrycodes (code,country) values ('SB','Solomon Islands');
insert into nuke_countrycodes (code,country) values ('SO','Somalia');
insert into nuke_countrycodes (code,country) values ('ZA','South Africa');
insert into nuke_countrycodes (code,country) values ('SU','Soviet Union');
insert into nuke_countrycodes (code,country) values ('ES','Spain');
insert into nuke_countrycodes (code,country) values ('LK','Sri Lanka');
insert into nuke_countrycodes (code,country) values ('SH','St. Helena');
insert into nuke_countrycodes (code,country) values ('PM','St. Pierre & Miquelon');
insert into nuke_countrycodes (code,country) values ('ST','St. Tome and Principe');
insert into nuke_countrycodes (code,country) values ('KN','St.Kitts Nevis Anguilla');
insert into nuke_countrycodes (code,country) values ('VC','St.Vincent & Grenadines');
insert into nuke_countrycodes (code,country) values ('SD','Sudan');
insert into nuke_countrycodes (code,country) values ('SR','Suriname');
insert into nuke_countrycodes (code,country) values ('SJ','Svalbard & Jan Mayen Is');
insert into nuke_countrycodes (code,country) values ('SZ','Swaziland');
insert into nuke_countrycodes (code,country) values ('SE','Sweden');
insert into nuke_countrycodes (code,country) values ('CH','Switzerland');
insert into nuke_countrycodes (code,country) values ('SY','Syria');
insert into nuke_countrycodes (code,country) values ('TJ','Tadjikistan');
insert into nuke_countrycodes (code,country) values ('TW','Taiwan');
insert into nuke_countrycodes (code,country) values ('TZ','Tanzania');
insert into nuke_countrycodes (code,country) values ('TH','Thailand');
insert into nuke_countrycodes (code,country) values ('TG','Togo');
insert into nuke_countrycodes (code,country) values ('TK','Tokelau');
insert into nuke_countrycodes (code,country) values ('TO','Tonga');
insert into nuke_countrycodes (code,country) values ('TT','Trinidad & Tobago');
insert into nuke_countrycodes (code,country) values ('TN','Tunisia');
insert into nuke_countrycodes (code,country) values ('TR','Turkey');
insert into nuke_countrycodes (code,country) values ('TM','Turkmenistan');
insert into nuke_countrycodes (code,country) values ('TC','Turks & Caicos Islands');
insert into nuke_countrycodes (code,country) values ('TV','Tuvalu');
insert into nuke_countrycodes (code,country) values ('UG','Uganda');
insert into nuke_countrycodes (code,country) values ('UA','Ukraine');
insert into nuke_countrycodes (code,country) values ('AE','United Arab Emirates');
insert into nuke_countrycodes (code,country) values ('UK','United Kingdom');
insert into nuke_countrycodes (code,country) values ('US','United States');
insert into nuke_countrycodes (code,country) values ('UY','Uruguay');
insert into nuke_countrycodes (code,country) values ('UM','US Minor outlying Isl.');
insert into nuke_countrycodes (code,country) values ('UZ','Uzbekistan');
insert into nuke_countrycodes (code,country) values ('VU','Vanuatu');
insert into nuke_countrycodes (code,country) values ('VA','Vatican City State');
insert into nuke_countrycodes (code,country) values ('VE','Venezuela');
insert into nuke_countrycodes (code,country) values ('VN','Vietnam');
insert into nuke_countrycodes (code,country) values ('VG','Virgin Islands (British)');
insert into nuke_countrycodes (code,country) values ('VI','Virgin Islands (US)');
insert into nuke_countrycodes (code,country) values ('WF','Wallis & Futuna Islands');
insert into nuke_countrycodes (code,country) values ('EH','Western Sahara');
insert into nuke_countrycodes (code,country) values ('YE','Yemen');
insert into nuke_countrycodes (code,country) values ('YU','Yugoslavia');
insert into nuke_countrycodes (code,country) values ('ZR','Zaire');
insert into nuke_countrycodes (code,country) values ('ZM','Zambia');
insert into nuke_countrycodes (code,country) values ('ZW','Zimbabwe');
