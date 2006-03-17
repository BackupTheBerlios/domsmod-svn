<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
	("You can't access this file directly...");
}


require_once("mainfile.php");
//FIX:DOMSNITT 
include("doms.php");
//END-OF-FIX

$module_name = basename(dirname(__FILE__));
get_lang($module_name);
$userpage = 1;

include("modules/$module_name/navbar.php");


function userCheck($username, $user_email) {
    global $stop, $user_prefix, $db;
    
    // START : HACK - ADVANCED USER MANAGER BY NUKEKOREA DEV. NET
		global $prefix;
		$useremail_domain=explode("@",$user_email); 
		$numrows = $db->sql_numrows($db->sql_query("SELECT mdomain FROM ".$prefix."_aum_mfilter WHERE mdomain='".$useremail_domain[1]."'"));
		if ($numrows)
		{
			$stop = "<center>"._AUM_DIALLOWED_EMAILDOMAIN.": <b>".$useremail_domain[1]."</b></center>";
		};
		// END : HACK - ADVANCED USER MANAGER

    
    if ((!$user_email) || ($user_email=="") || (!eregi("^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,6}$",$user_email))) $stop = "<center>"._ERRORINVEMAIL."</center><br>";
    
    if (strrpos($user_email,' ') > 0) $stop = "<center>"._ERROREMAILSPACES."</center>";
    if ((!$username) || ($username=="") || (ereg("[^a-zA-Z0-9_-]",$username))) $stop = "<center>"._ERRORINVNICK."</center><br>";
    if (strlen($username) > 25) $stop = "<center>"._NICK2LONG."</center>";
    if (eregi("^((root)|(adm)|(linux)|(webmaster)|(admin)|(god)|(administrator)|(administrador)|(nobody)|(anonymous)|(anonimo)|(anónimo)|(operator))$",$username)) $stop = "<center>"._NAMERESERVED."</center>";
    if (strrpos($username,' ') > 0) $stop = "<center>"._NICKNOSPACES."</center>";
    if ($db->sql_numrows($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE username='$username'")) > 0) $stop = "<center>"._NICKTAKEN."</center><br>";
    if ($db->sql_numrows($db->sql_query("SELECT username FROM ".$user_prefix."_users_temp WHERE username='$username'")) > 0) $stop = "<center>"._NICKTAKEN."</center><br>";
    if ($db->sql_numrows($db->sql_query("SELECT user_email FROM ".$user_prefix."_users WHERE user_email='$user_email'")) > 0) $stop = "<center>"._EMAILREGISTERED."</center><br>";
    if ($db->sql_numrows($db->sql_query("SELECT user_email FROM ".$user_prefix."_users_temp WHERE user_email='$user_email'")) > 0) $stop = "<center>"._EMAILREGISTERED."</center><br>";
    return($stop);
}

function makePass() {
    $cons = "bcdfghjklmnpqrstvwxyz";
    $vocs = "aeiou";
    for ($x=0; $x < 6; $x++) {
	mt_srand ((double) microtime() * 1000000);
	$con[$x] = substr($cons, mt_rand(0, strlen($cons)-1), 1);
	$voc[$x] = substr($vocs, mt_rand(0, strlen($vocs)-1), 1);
    }
    $makepass = $con[0] . $voc[0] .$con[2] . $con[1] . $voc[1] . $con[3] . $voc[3] . $con[4];
    return($makepass);
}
//FIX:DOMSNITT - Changed the Method signature to support more variable passing
#function confirmNewUser($username, $user_email, $user_password, $user_password2, $random_num, $gfx_check) {
function confirmNewUser($username, $user_email, $user_password, $user_password2,$usertype,$gradyear,$company,$designation,$fullname,$specialization,$random_num, $gfx_check){
//END-OF-FIX
    global $stop, $EditedMessage, $sitename, $module_name, $minpass;
    include("header.php");
    include("config.php");
    filter_text($username);
    $username = $EditedMessage;
    $user_viewemail = "0";
    userCheck($username, $user_email);
    if (!$stop) {
	$datekey = date("F j");
	$rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $_POST[random_num] . $datekey));
	$code = substr($rcode, 2, 6);
	if (extension_loaded("gd") AND $code != $gfx_check AND ($gfx_chk == 3 OR $gfx_chk == 4 OR $gfx_chk == 6 OR $gfx_chk == 7)) {
	    title(""._NEWUSERERROR."");
	    OpenTable();
	    echo "<center><b>"._SECCODEINCOR."</b><br><br>"
		.""._GOBACK."</center>";
	    CloseTable();
	    include("footer.php");
	    die();
	}
	if ($user_password == "" AND $user_password2 == "") {
	    $user_password = makepass();
	} elseif ($user_password != $user_password2) {
	    title(""._NEWUSERERROR."");
	    OpenTable();
	    echo "<center><b>"._PASSDIFFERENT."</b><br><br>"._GOBACK."</center>";
	    CloseTable();
	    include("footer.php");
	    die();
	} elseif ($user_password == $user_password2 AND strlen($user_password) < $minpass) {
	    title(""._NEWUSERERROR."");
	    OpenTable();
	    echo "<center>"._YOUPASSMUSTBE." <b>$minpass</b> "._CHARLONG."<br><br>"._GOBACK."</center>";
	    CloseTable();
	    include("footer.php");
	    die();
	}
	title("$sitename: "._USERREGLOGIN."");
	OpenTable();
	echo "<center><b>"._USERFINALSTEP."</b><br><br>$username, "._USERCHECKDATA."</center><br><br>"
	    ."<table align='center' border='0'>"
	    ."<tr><td><b>"._UUSERNAME.":</b> $username<br></td></tr>"
	    
	    //FIX:DOMSNITT - Added more Contents to be displayed to user
	    #."<tr><td><b>"._EMAIL.":</b> $user_email</td></tr></table><br><br>"
	    ."<tr><td><b>"._FULLNAME.":</b> $fullname</td></tr>"
	    ."<tr><td><b>"._EMAIL.":</b> $user_email</td></tr>"
	    ."<tr><td><b>"._REGNEWUSERTYPE.":</b> $usertype</td></tr>"
	    ."<tr><td><b>"._REGNEWUSERGRADYEAR.":</b> $gradyear</td></tr>"
	    ."<tr><td><b>"._SPECIALIZATION.":</b> $specialization</td></tr>"
	    ."<tr><td><b>"._REGNEWUSERCOMPANY.":</b> $company</td></tr>"
	    ."<tr><td><b>"._REGNEWUSERDESGN.":</b> $designation</td></tr></table><br><br>"
	    //END-OF-FIX
	   		."";
			//FIX:DOMSNITT
			// start - HACK: AutoActivate		- One Line above
			global $db, $prefix;
			$row = $db->sql_fetchrow($db->sql_query("SELECT AutoActivateMode from ".$prefix."_config"));
			$AutoActivateMode = intval($row['AutoActivateMode']);
			if (AutoActivateMode)
			{
				echo "<center><b>"._NOTE."</b> "._AUTOACTIVATE_MESSAGE."";
			}
			else
			{
				echo "<center><b>"._NOTE."</b> "._YOUWILLRECEIVE."";
			}
			// end - HACK: AutoActivate - One Line Below
			//END-OF-FIX
			echo "";
 
			echo "<form action=\"modules.php?name=$module_name\" method=\"post\">"
	    ."<input type=\"hidden\" name=\"random_num\" value=\"$random_num\">"
	    ."<input type=\"hidden\" name=\"gfx_check\" value=\"$gfx_check\">"
	    ."<input type=\"hidden\" name=\"username\" value=\"$username\">"
	    ."<input type=\"hidden\" name=\"user_email\" value=\"$user_email\">"
	    ."<input type=\"hidden\" name=\"user_password\" value=\"$user_password\">"
	    
	    //FIX:DOMSNITT -
	     ."<input type=\"hidden\" name=\"fullname\" value=\"$fullname\">"
	     ."<input type=\"hidden\" name=\"usertype\" value=\"$usertype\">"
	     ."<input type=\"hidden\" name=\"gradyear\" value=\"$gradyear\">"
	     ."<input type=\"hidden\" name=\"specialization\" value=\"$specialization\">"
	     ."<input type=\"hidden\" name=\"company\" value=\"$company\">"
	     ."<input type=\"hidden\" name=\"designation\" value=\"$designation\">"
	     
	    //FIX:DOMSNITT
	    ."<input type=\"hidden\" name=\"op\" value=\"finish\"><br><br>"
	    ."<input type=\"submit\" value=\""._FINISH."\"> &nbsp;&nbsp;"._GOBACK."</form></center>";
	CloseTable();
    } else {
	OpenTable();
	echo "<center><font class=\"title\"><b>Registration Error!</b></font><br><br>";
	echo "<font class=\"content\">$stop<br>"._GOBACK."</font></center>";
	CloseTable();
    }
    include("footer.php");
}

	//FIX:DOMSNITT
	#function finishNewUser($username, $user_email, $user_password, $random_num, $gfx_check) {
	function finishNewUser($username, $user_email, $user_password, $user_password2,$usertype,$gradyear,$company,$designation,$fullname,$specialization,$random_num, $gfx_check){
	//FIX:DOMSNITT
    global $stop, $EditedMessage, $adminmail, $sitename, $Default_Theme, $user_prefix, $db, $storyhome, $module_name, $nukeurl;
    include("header.php");
    include("config.php");
    userCheck($username, $user_email);
    $user_regdate = date("M d, Y");
    if (!isset($stop)) {
	$datekey = date("F j");
	$rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $random_num . $datekey));
	$code = substr($rcode, 2, 6);
	if (extension_loaded("gd") AND $code != $gfx_check AND ($gfx_chk == 3 OR $gfx_chk == 4 OR $gfx_chk == 6 OR $gfx_chk == 7)) {
	    Header("Location: modules.php?name=$module_name");
	    die();
	}
        mt_srand ((double)microtime()*1000000);
        $maxran = 1000000;
        $check_num = mt_rand(0, $maxran);
	$check_num = md5($check_num);
	$time = time();
	$finishlink = "$nukeurl/modules.php?name=$module_name&op=activate&username=$username&check_num=$check_num";
	$new_password = md5($user_password);
	$username = check_html($username, nohtml);
	$user_email = check_html($user_email, nohtml);
	//FIX:DOMSNITT
	$fullname=check_html($fullname, nohtml);
	$company=check_html($company, nohtml);
	$designation=check_html($designation, nohtml);
	#$result = $db->sql_query("INSERT INTO ".$user_prefix."_users_temp (user_id, username, user_email, user_password, user_regdate, check_num, time) VALUES (NULL, '$username', '$user_email', '$new_password', '$user_regdate', '$check_num', '$time')");
 	$result = $db->sql_query("INSERT INTO ".$user_prefix."_users_temp (user_id, username, user_email, user_password, user_regdate, check_num, time,usertype,gradyear,company,designation,fullname,specialization) VALUES (NULL, '$username', '$user_email', '$new_password', '$user_regdate', '$check_num', '$time','$usertype',$gradyear,'$company','$designation','$fullname','$specialization')");
	//END-OF-FIX
	if(!$result) {
	    echo ""._ERROR."<br>";
	} else {
	   //FIX:DOMSNITT
	   // start - HACK: AutoActivate
		    global $language;
			$row = $db->sql_fetchrow($db->sql_query("SELECT AutoActivateMode from ".$prefix."_config"));
			$AutoActivateMode = intval($row['AutoActivateMode']);
			if ($AutoActivateMode)
			{
				$past = time()-86400;
				$db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE time < $past");
				$sql = "SELECT * FROM ".$user_prefix."_users_temp WHERE username='$username' AND check_num='$check_num'";
				$result = $db->sql_query($sql);
				if ($db->sql_numrows($result) == 1)
				{
					$row = $db->sql_fetchrow($result);
					if ($check_num == $row[check_num])
					{
						$db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_regdate, user_lang) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', '$row[user_regdate]', '$language')");
						$db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE username='$username' AND check_num='$check_num'");
						title(""._ACTIVATIONYES."");
						echo "<center><b>$row[username]:</b> "._ACTMSG."</center>";
					}
					else
					{
						title(""._ACTIVATIONERROR."");
						echo "<center>"._ACTERROR1."</center>";
					}
				}
				else
				{
					title(""._ACTIVATIONERROR."");
					echo "<center>"._ACTERROR2."</center>";
					die();
				}
			}
			else
			{
		 // end - HACK: AutoActivate
		 //END-OF-FIX	
	   
	   $message = ""._WELCOMETO." $sitename!\n\n"._YOUUSEDEMAIL." ($user_email) "._TOREGISTER." $sitename.\n\n "._TOFINISHUSER."\n\n $finishlink\n\n "._FOLLOWINGMEM."\n\n"._UNICKNAME." $username\n"._UPASSWORD." $user_password";
	    
	    $subject = ""._ACTIVATIONSUB."";
	    
	    $from = "$adminmail";
	    mail($user_email, $subject, $message, "From: $from\nX-Mailer: PHP/" . phpversion());
	    title("$sitename: "._USERREGLOGIN."");
	    OpenTable();
	    echo "<center><b>"._ACCOUNTCREATED."</b><br><br>";
	    echo ""._YOUAREREGISTERED.""
	        ."<br><br>"
		.""._FINISHUSERCONF."<br><br>"
		.""._THANKSUSER." $sitename!</center>";
	    CloseTable();
	    //FIX:DOMSNITT   
	    // start - HACK: AutoActivate
			}
			// end - HACK: AutoActivate
	    //END-OF-FIX
	}
    } else {
	echo "$stop";
    }
    include("footer.php");
}

function activate($username, $check_num) {
    global $db, $user_prefix, $module_name, $language;
      //FIX:DOMSNITT 
    	// Changed from one day to one week.
    	$past = time()-604800;
      //END-OF-FIX
    $db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE time < $past");
    $sql = "SELECT * FROM ".$user_prefix."_users_temp WHERE username='$username' AND check_num='$check_num'";
    $result = $db->sql_query($sql);
    if ($db->sql_numrows($result) == 1) {
	$row = $db->sql_fetchrow($result);
	if ($check_num == $row[check_num]) {
	    //FIX:DOMSNITT
	    #$db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_avatar_type, user_regdate, user_lang) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', 3, '$row[user_regdate]', '$language')");
	    $db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, username, user_email, user_password, user_avatar, user_avatar_type, user_regdate, user_lang,usertype,gradyear,company,designation,name,specialization) VALUES (NULL, '$row[username]', '$row[user_email]', '$row[user_password]', 'gallery/blank.gif', 3, '$row[user_regdate]', '$language','$row[usertype]',$row[gradyear],'$row[company]','$row[designation]','$row[fullname]','$row[specialization]')");
		 //FIX:DOMSNITT
	    $db->sql_query("DELETE FROM ".$user_prefix."_users_temp WHERE username='$username' AND check_num='$check_num'");
	    include("header.php");
	    title(""._ACTIVATIONYES."");
	    OpenTable();
	    echo "<center><b>$row[username]:</b> "._ACTMSG."</center>";
	    CloseTable();
	    include("footer.php");
	    die();
	} else {
	    include("header.php");
	    title(""._ACTIVATIONERROR."");
	    OpenTable();
	    echo "<center>"._ACTERROR1."</center>";
	    CloseTable();
	    include("footer.php");
	    die();
	}
    } else {
	include("header.php");
	title(""._ACTIVATIONERROR."");
	OpenTable();
	echo "<center>"._ACTERROR2."</center>";
	CloseTable();
	include("footer.php");
	die();
    }

}

function userinfo($username, $bypass=0, $hid=0, $url=0) {
    global $articlecomm, $user, $cookie, $sitename, $prefix, $user_prefix, $db, $admin, $broadcast_msg, $my_headlines, $module_name, $subscription_url;
    $username = substr("$username", 0,25);
    $sql = "SELECT * FROM ".$prefix."_bbconfig";
    $result = $db->sql_query($sql);
    while ( $row = $db->sql_fetchrow($result) )
    {
    $board_config[$row['config_name']] = $row['config_value'];
    }
  	  
    $sql2 = "SELECT * FROM ".$user_prefix."_users WHERE username='$username'";
    $result2 = $db->sql_query($sql2);
    $num = $db->sql_numrows($result2);
    $userinfo = $db->sql_fetchrow($result2);
    if(!$bypass) cookiedecode($user);
    include("header.php");
    OpenTable();
    echo "<center>";
    if((strtolower($username) == strtolower($cookie[1])) AND ($userinfo[user_password] == $cookie[2])) {
	echo "<font class=\"option\">$username, "._WELCOMETO." $sitename!</font><br><br>";
	echo "<font class=\"content\">"._THISISYOURPAGE."</font></center><br><br>";
	nav(1);
	echo "<br><br>";
    } else {
	echo "<font class=\"title\">"._PERSONALINFO.": $username</font></center><br><br>";
    }
    if ($userinfo[user_website]) {
	if (!eregi("http://", $userinfo[user_website])) {
	    $userinfo[user_website] = "http://$userinfo[user_website]";
	}
    }
    if ($userinfo[user_avatar_type] == 1) { 
       $userinfo[user_avatar] = $board_config['avatar_path']."/".$userinfo[user_avatar]; 
       } elseif ($userinfo[user_avatar_type] == 2) { 
       $userinfo[user_avatar] = $userinfo[user_avatar]; 
       } else { 
       $userinfo[user_avatar] = $board_config[avatar_gallery_path]."/".$userinfo[user_avatar]; 
       }
    if(($num == 1) && ($userinfo[user_website] || $userinfo[femail] || $userinfo[bio] || $userinfo[user_avatar] || $userinfo[user_icq] || $userinfo[user_aim] || $userinfo[user_yim] || $userinfo[user_msnm] || $userinfo[user_location] || $userinfo[user_occ] || $userinfo[user_interests] || $userinfo[user_sig])) {
	echo "<center><font class=\"content\">";
	echo "<img src=\"$userinfo[user_avatar]\"><br><br>\n";
	if ($userinfo[user_website] != "http://" AND $userinfo[user_website] != "") { echo ""._MYHOMEPAGE." <a href=\"$userinfo[user_website]\" target=\"new\">$userinfo[user_website]</a><br>\n"; }
	
	echo "<CENTER><BR>"._FULLNAME.": $userinfo[name]"
	."<BR>"._REGNEWUSERTYPE.": $userinfo[usertype]"
	."<BR>"._REGNEWUSERGRADYEAR.": $userinfo[gradyear]"
	."<BR>"._SPECIALIZATION.": $userinfo[specialization]"
	."<BR>"._REGNEWUSERCOMPANY.": $userinfo[company]"
	."</font></center><br><br>";
	
	if ($userinfo[femail]) { echo ""._MYEMAIL." <a href=\"mailto:$userinfo[femail]\">$userinfo[femail]</a><br>\n"; }
	if ($userinfo[user_icq]) echo ""._ICQ.": $userinfo[user_icq]<br>\n";
	if ($userinfo[user_aim]) echo ""._AIM.": $userinfo[user_aim]<br>\n";
	if ($userinfo[user_yim]) echo ""._YIM.": $userinfo[user_yim]<br>\n";
	if ($userinfo[user_msnm]) echo ""._MSNM.": $userinfo[user_msnm]<br>\n";
	if ($userinfo[user_from]) echo ""._LOCATION.": $userinfo[user_from]<br>\n";
	if ($userinfo[user_occ]) echo ""._OCCUPATION.": $userinfo[user_occ]<br>\n";
	if ($userinfo[user_interests]) echo ""._INTERESTS.": $userinfo[user_interests]<br>\n";
	$userinfo[user_sig] = nl2br($userinfo[user_sig]);
	if ($userinfo[user_sig]) echo "<br><b>"._SIGNATURE.":</b><br>$userinfo[user_sig]<br>\n";
	if ($userinfo[bio]) { echo "<br><b>"._EXTRAINFO.":</b><br>$userinfo[bio]<br>\n"; }
	$sql2 = "SELECT uname FROM ".$prefix."_session WHERE uname='$username'";
	$result2 = $db->sql_query($sql2);
	$row2 = $db->sql_fetchrow($result2);
	$username_pm = $username;
	$username_online = $row2[uname];
	if ($username_online == "") {
	    $online = _OFFLINE;
	} else {
	    $online = _ONLINE;
	}
	echo ""._USERSTATUS.": <b>$online</b><br>\n";
	if (($userinfo[newsletter] == 1) AND ($username == $cookie[1]) AND ($userinfo[user_password] == $cookie[2]) OR (is_admin($admin) AND ($userinfo[newsletter] == 1))) {
	    echo "<i>"._SUBSCRIBED."</i><br>";
	} elseif (($userinfo[newsletter] == 0) AND ($username == $cookie[1]) AND ($userinfo[user_password] == $cookie[2]) OR (is_admin($admin) AND ($userinfo[newsletter] == 0))) {
	    echo "<i>"._NOTSUBSCRIBED."</i><br>";
	}
	if (is_user($user) AND $cookie[1] == "$username" OR is_admin($admin)) {
	    $numpoints = $db->sql_fetchrow($db->sql_query("SELECT points FROM ".$user_prefix."_users WHERE username='$cookie[1]'"));
	    $n_points = intval($numpoints['points']);
	    echo ""._YOUHAVEPOINTS." <b>$n_points</b><br>";
		if (paid()) {
			$row = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$cookie[0]'"));
			if ($subscription_url != "") {
				$content = "<br><center>"._YOUARE." <a href='$subscription_url'>"._SUBSCRIBER."</a> "._OF." $sitename<br>";
			} else {
				$content = "<br><center>"._YOUARE." "._SUBSCRIBER." "._OF." $sitename<br>";
			}
			$diff = $row[subscription_expire]-time();
			$yearDiff = floor($diff/60/60/24/365);
			$diff -= $yearDiff*60*60*24*365;
			if ($yearDiff < 1) {
				$diff = $row[subscription_expire]-time();
			}
			$daysDiff = floor($diff/60/60/24);
			$diff -= $daysDiff*60*60*24;
			$hrsDiff = floor($diff/60/60);
			$diff -= $hrsDiff*60*60;
			$minsDiff = floor($diff/60);
			$diff -= $minsDiff*60;
			$secsDiff = $diff;
			if ($yearDiff < 1) {
				$rest = "$daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
			} elseif ($yearDiff == 1) {
				$rest = "$yearDiff "._SBYEAR.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
			} elseif ($yearDiff > 1) {
				$rest = "$yearDiff "._SBYEARS.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
			}
			$content .= "<b>"._SUBEXPIREIN."<br><font color='#FF0000'>$rest</font></b></center>";
		} else {
			if ($subscription_url != "") {
				$content .= "<br><center>"._NOTSUB." $sitename. "._SUBFROM." <a href='$subscription_url'>"._HERE."</a> "._NOW."";
			} else {
				$content .= "<br><center>"._NOTSUB." $sitename.";
			}
		}
		echo "$content<br><br>";
		if (is_admin($admin)) {
			$subnum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$userinfo[user_id]'"));
			if ($subnum != 0) {
				echo "<center><b>"._ADMSUB."</b></center><br>";
				$row = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$userinfo[user_id]'"));
				$diff = $row[subscription_expire]-time();
				$yearDiff = floor($diff/60/60/24/365);
				$diff -= $yearDiff*60*60*24*365;
				if ($yearDiff < 1) {
					$diff = $row[subscription_expire]-time();
				}
				$daysDiff = floor($diff/60/60/24);
				$diff -= $daysDiff*60*60*24;
				$hrsDiff = floor($diff/60/60);
				$diff -= $hrsDiff*60*60;
				$minsDiff = floor($diff/60);
				$diff -= $minsDiff*60;
				$secsDiff = $diff;
				if ($yearDiff < 1) {
					$rest = "$daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
				} elseif ($yearDiff == 1) {
					$rest = "$yearDiff "._SBYEAR.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
				} elseif ($yearDiff > 1) {
					$rest = "$yearDiff "._SBYEARS.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
				}
				$content = "<b>"._ADMSUBEXPIREIN."<br><font color='#FF0000'>$rest</font></b><br><br>";
				echo "$content";
			} else {
				echo "<center><b>"._ADMNOTSUB."</b><br><br>";
			}
		}
	}
	if (is_user($user) AND $cookie[1] == "$username" OR is_admin($admin)) {
	    $numpoints = $db->sql_fetchrow($db->sql_query("SELECT points FROM ".$user_prefix."_users WHERE username='$cookie[1]'"));
	    echo ""._YOUHAVEPOINTS." <b>$numpoints[points]</b><br>";
	}
	if (is_active("Journal") AND $cookie[1] != $username) {
	    $sql3 = "SELECT jid FROM ".$prefix."_journal WHERE aid='$username' AND status='yes' ORDER BY pdate,jid DESC LIMIT 0,1";
	    $result3 = $db->sql_query($sql3);
	    $row3 = $db->sql_fetchrow($result3);
	    $jid = intval($row3[jid]);
	    if ($jid != "" AND isset($jid)) {
		echo "[ <a href=\"modules.php?name=Journal&amp;file=search&amp;bywhat=aid&amp;forwhat=$username\">"._READMYJOURNAL."</a> ]<br>";
	    }
	}
	if (is_admin($admin)) {
	    echo "<br>";
          OpenTable2();
          if ($userinfo[last_ip] != 0) {
              echo "<center>"._LASTIP." <b>$userinfo[last_ip]</b><br><br>";
	        echo "[ <a href='admin.php?op=ipban&ip=$userinfo[last_ip]'>"._BANTHIS."</a> | <a href=\"admin.php?op=modifyUser&chng_uid=$userinfo[user_id]\">"._EDITUSER."</a> ]</center>";
          } else {
	        echo "<center>[ <a href=\"admin.php?op=modifyUser&chng_uid=$userinfo[user_id]\">"._EDITUSER."</a> ]</center>";
	    }
          CloseTable2();
	}
	if (((is_user($user) AND $cookie[1] != $username) OR is_admin($admin)) AND is_active("Private_Messages")) { echo "<br>[ <a href=\"modules.php?name=Private_Messages&amp;mode=post&amp;u=$userinfo[user_id]\">"._USENDPRIVATEMSG." $username_pm</a> ]<br>\n"; }
	echo "</center></font>";
    } else {
	echo "<center>"._NOINFOFOR." $username</center>";
    }
    CloseTable();
    if ($my_headlines == 1 AND ($username == $cookie[1]) AND ($userinfo[user_password] == $cookie[2])) {
    echo "<br>";
    OpenTable();
    echo "<center><b>"._MYHEADLINES."</b><br><br>"
	.""._SELECTASITE."<br><br>"
	."<form action=\"modules.php?name=$module_name\" method=\"post\">"
	."<input type=\"hidden\" name=\"op\" value=\"userinfo\">"
	."<input type=\"hidden\" name=\"username\" value=\"$username\">"
	."<input type=\"hidden\" name=\"bypass\" value=\"$bypass\">"
	."<input type=\"hidden\" name=\"url\" value=\"0\">"
	."<select name=\"hid\" onChange='submit()'>\n"
	."<option value=\"0\">"._SELECTASITE2."</option>";
    $sql4 = "SELECT hid, sitename FROM ".$prefix."_headlines ORDER BY sitename";
    $headl = $db->sql_query($sql4);
    while($row4 = $db->sql_fetchrow($headl)) {
	$nhid = intval($row4[hid]);
	$hsitename = $row4[sitename];
	if ($hid == $nhid ) {
	    $sel = "selected";
	} else {
	    $sel = "";
	}
	echo "<option value=\"$nhid\" $sel>$hsitename</option>\n";
    }
    echo "</select></form>"
	.""._ORTYPEURL."<br><br>"
	."<form action=\"modules.php?name=$module_name\" method=\"post\">"
	."<input type=\"hidden\" name=\"op\" value=\"userinfo\">"
	."<input type=\"hidden\" name=\"username\" value=\"$username\">"
	."<input type=\"hidden\" name=\"bypass\" value=\"$bypass\">"
	."<input type=\"hidden\" name=\"hid\" value=\"0\">"
	."<input type=\"text\" name=\"url\" size=\"40\" maxlength=\"200\" value=\"http://\">&nbsp;&nbsp;"
	."<input type=\"submit\" value=\""._GO."\"></form>"
	."</center><br>";
    if ($hid != 0 OR ($hid == 0 AND $url != "0" AND $url != "http://") AND $url != "") {
	if ($hid != 0) {
    	    $sql5 = "SELECT sitename, headlinesurl FROM ".$prefix."_headlines WHERE hid='$hid'";
	    $result5 = $db->sql_query($sql5);
	    $row5 = $db->sql_fetchrow($result5);
	    $nsitename = $row5[sitename];
	    $url = $row5[headlinesurl];
	    $title = stripslashes(check_html($nsitename, "nohtml"));
	    $siteurl = eregi_replace("http://", "", $url);
	    $siteurl = explode("/", $siteurl);
	} else {
	    if (!ereg("http://", $url)) {
		$url = "http://$url";
	    }
	    $siteurl = eregi_replace("http://", "", $url);
	    $siteurl = explode("/", $siteurl);
	    $title = "http://$siteurl[0]";
	}
	$rdf = parse_url($url);
	$fp = fsockopen($rdf['host'], 80, $errno, $errstr, 15);
	if (!$fp) {
    	    $content = "<center><font class=\"content\">"._RSSPROBLEM."</font></center>";
	}
	if ($fp) {
    	    fputs($fp, "GET " . $rdf['path'] . "?" . $rdf['query'] . " HTTP/1.0\r\n");
    	    fputs($fp, "HOST: " . $rdf['host'] . "\r\n\r\n");
    	    $string	= "";
    	    while(!feof($fp)) {
		$pagetext = fgets($fp,300);
		$string .= chop($pagetext);
	    }
	    fputs($fp,"Connection: close\r\n\r\n");
	    fclose($fp);
	    $items = explode("</item>",$string);
	    $content = "<font class=\"content\">";
	    for ($i=0;$i<10;$i++) {
		$link = ereg_replace(".*<link>","",$items[$i]);
		$link = ereg_replace("</link>.*","",$link);
		$title2 = ereg_replace(".*<title>","",$items[$i]);
		$title2 = ereg_replace("</title>.*","",$title2);
		if ($items[$i] == "" AND $cont != 1) {
	    	    $content = "<center>"._RSSPROBLEM."</center>";
		} else {
	    	    if (strcmp($link,$title2) AND $items[$i] != "") {
	    		$cont = 1;
			$content .= "<img src=\"images/arrow.gif\" border=\"0\" hspace=\"5\"><a href=\"$link\" target=\"new\">$title2</a><br>\n";
		    }
		}
	    }
	}
	if ($content != "") {
	    OpenTable2();
	    echo "<center><b>"._HEADLINESFROM." <a href=\"http://$siteurl[0]\" target=\"new\">$title</a></b></center><br>";
	    echo "$content";
	    CloseTable2();
	} elseif (($cont == 0) OR ($content == "")) {
	    OpenTable2();
	    echo "<center>"._RSSPROBLEM."</center><br>";
	    CloseTable2();
	}
	echo "<br>";
    }
    CloseTable();
    }
    if ($broadcast_msg == 1 AND ($username == $cookie[1]) AND ($userinfo[user_password] == $cookie[2])) {
	echo "<br>";
	OpenTable();
	echo "<center><b>"._BROADCAST."</b><br><br>"._BROADCASTTEXT."<br><br>"
	    ."<form action=\"modules.php?name=$module_name\" method=\"post\">"
	    ."<input type=\"hidden\" name=\"who\" value=\"$username\">"
	    ."<input type=\"hidden\" name=\"op\" value=\"broadcast\">"
	    ."<input type=\"text\" size=\"60\" maxlength=\"255\" name=\"the_message\">&nbsp;&nbsp;<input type=\"submit\" value=\""._SEND."\">"
	    ."</form></center>";
	CloseTable();
    }
    if (is_active("Private_Messages") AND ($username == $cookie[1]) AND ($userinfo[user_password] == $cookie[2])) {
	echo "<br>";
	OpenTable();
	echo "<center><b>"._PRIVATEMESSAGES."</b><br><br>";
	$numrow = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_bbprivmsgs WHERE privmsgs_to_userid='$userinfo[user_id]' AND (privmsgs_type='1' OR privmsgs_type='5' OR privmsgs_type='0')"));
	if (is_active("Members_List")) {
	    $mem_list = "<a href=\"modules.php?name=Members_List\">"._BROWSEUSERS."</a>";
	} else {
	    $mem_list = "";
	}
	if (is_active("Search")) {
	    $mod_search = "<a href=\"modules.php?name=Search&amp;type=users\">"._SEARCHUSERS."</a>";
	} else {
	    $mod_search = "";
	}
	if ($mem_list != "" AND $mod_search != "") { $a = " | "; } else { $a = ""; }
	if ($mem_list != "" OR $mod_search != "") {
	    $links = "[ $mem_list $a $mod_search ]";
	} elseif ($mem_list == "" AND $mod_search == "") {
	    $links = "";
	}
	
	echo ""._YOUHAVE." <a href=\"modules.php?name=Private_Messages\"><b>$numrow</b></a> "._PRIVATEMSG."<br><br>"
	    ."<form action=\"modules.php?name=Private_Messages\" method=\"post\">"
	    .""._USENDPRIVATEMSG.": <input type=\"text\" name=\"pm_uname\" size=\"20\">&nbsp;&nbsp;$links"
	    ."<input type=\"hidden\" name=\"send\" value=\"1\">"
	    ."</form></center>";
	CloseTable();
    }
    if ($articlecomm == 1) {
	echo "<br>";
	OpenTable();
	echo "<b>"._LAST10COMMENTS." $userinfo[username]:</b><br>";
	$sql6 = "SELECT tid, sid, subject FROM ".$prefix."_comments WHERE name='$userinfo[username]' ORDER BY tid DESC LIMIT 0,10";
	$result6 = $db->sql_query($sql6);
	while($row6 = $db->sql_fetchrow($result6)) {
	$tid = intval($row6[tid]);
	$sid = intval($row6[sid]);
	$subject = stripslashes(check_html($row6[subject], "nohtml"));
    	    echo "<li><a href=\"modules.php?name=News&file=article&thold=-1&mode=flat&order=0&sid=$sid#$tid\">$subject</a><br>";
	}
	CloseTable();
    }
    echo "<br>";
    OpenTable();
    echo "<b>"._LAST10SUBMISSIONS." $userinfo[username]:</b><br>";
    $sql7 = "SELECT sid, title FROM ".$prefix."_stories WHERE informant='$userinfo[username]' ORDER BY sid DESC LIMIT 0,10";
    $result7 = $db->sql_query($sql7);
    while($row7 = $db->sql_fetchrow($result7)) {
		$sid = intval($row7[sid]);
		$title = stripslashes(check_html($row7['title'], "nohtml"));
        echo "<li><a href=\"modules.php?name=News&file=article&sid=$sid\">$title</a><br>";
    }
    CloseTable();
    include("footer.php");
}

function main($user) {
    global $stop, $module_name, $redirect, $mode, $t, $f, $gfx_chk;
    if(!is_user($user)) {
	include("header.php");
	if ($stop) {
	    OpenTable();
	    echo "<center><font class=\"title\"><b>"._LOGININCOR."</b></font></center>\n";
	    CloseTable();
	    echo "<br>\n";
	} else {
	    OpenTable();
	    echo "<center><font class=\"title\"><b>"._USERREGLOGIN."</b></font></center>\n";
	    CloseTable();
	    echo "<br>\n";
	}
	if (!is_user($user)) {
	    OpenTable();
	    mt_srand ((double)microtime()*1000000);
	    $maxran = 1000000;
	    $random_num = mt_rand(0, $maxran);
	    echo "<form action=\"modules.php?name=$module_name\" method=\"post\">\n"
		."<b>"._USERLOGIN."</b><br><br>\n"
		."<table border=\"0\"><tr><td>\n"
		.""._NICKNAME.":</td><td><input type=\"text\" name=\"username\" size=\"15\" maxlength=\"25\"></td></tr>\n"
		."<tr><td>"._PASSWORD.":</td><td><input type=\"password\" name=\"user_password\" size=\"15\" maxlength=\"20\"></td></tr>\n";
	    if (extension_loaded("gd") AND ($gfx_chk == 2 OR $gfx_chk == 4 OR $gfx_chk == 5 OR $gfx_chk == 7)) {
		echo "<tr><td colspan='2'>"._SECURITYCODE.": <img src='?gfx=gfx&random_num=$random_num' border='1' alt='"._SECURITYCODE."' title='"._SECURITYCODE."'></td></tr>\n"
		    ."<tr><td colspan='2'>"._TYPESECCODE.": <input type=\"text\" NAME=\"gfx_check\" SIZE=\"7\" MAXLENGTH=\"6\"></td></tr>\n"
		    ."<input type=\"hidden\" name=\"random_num\" value=\"$random_num\">\n";
	    }
	    echo "</table><input type=\"hidden\" name=\"redirect\" value=$redirect>\n"
		."<input type=\"hidden\" name=\"mode\" value=$mode>\n"
		."<input type=\"hidden\" name=\"f\" value=$f>\n"
		."<input type=\"hidden\" name=\"t\" value=$t>\n"
		."<input type=\"hidden\" name=\"op\" value=\"login\">\n"
		."<input type=\"submit\" value=\""._LOGIN."\"></form><br>\n\n"
		."<center><font class=\"content\">[ <a href=\"modules.php?name=$module_name&amp;op=pass_lost\">"._PASSWORDLOST."</a> | <a href=\"modules.php?name=$module_name&amp;op=new_user\">"._REGNEWUSER."</a> ]</font></center>\n";
	    CloseTable();
	}
	include("footer.php");
    } elseif (is_user($user)) {
        global $cookie;
        cookiedecode($user);
        userinfo($cookie[1]);
    }
}

function new_user() {
    global $my_headlines, $module_name, $db, $gfx_chk;
    
    if (!is_user($user)) {
			mt_srand ((double)microtime()*1000000);
			$maxran = 1000000;
			$random_num = mt_rand(0, $maxran);
			include("header.php");
			OpenTable();
				echo "<center><font class=\"title\"><b>"._USERREGLOGIN."</b></font></center>\n";
			CloseTable();
				echo "<br>\n";
			OpenTable();
			echo "<form action=\"modules.php?name=$module_name\" method=\"post\">\n"
    	   ."<b>"._REGNEWUSER."</b> ("._ALLREQUIRED.")<br><br>\n"
	   		."<table cellpadding=\"0\" cellspacing=\"10\" border=\"0\">\n"
	    	."<tr><td>"._NICKNAME.":</td><td><input type=\"text\" name=\"username\" size=\"30\" maxlength=\"25\"></td></tr>\n"
    		//FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
    		
    		."<tr><td>"._FULLNAME.":</td><td><input type=\"text\" name=\"fullname\" size=\"50\" maxlength=\"50\"></td></tr>\n"
    		
    		//END-OF-FIX 
    		
    		."<tr><td>"._EMAIL.":</td><td><input type=\"text\" name=\"user_email\" size=\"50\" maxlength=\"255\"></td></tr>\n"
	    	."<tr><td>"._PASSWORD.":</td><td><input type=\"password\" name=\"user_password\" size=\"11\" maxlength=\"40\"></td></tr>\n"
	    	."<tr><td>"._RETYPEPASSWORD.":</td><td><input type=\"password\" name=\"user_password2\" size=\"11\" maxlength=\"40\"><br><font class=\"tiny\">("._BLANKFORAUTO.")</font></td></tr>\n"
	   
	    //FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
	    	."<tr><td>"._REGNEWUSERTYPE."</td><td><select name=\"usertype\" size=1>" 
	    	.getUserTypesOptions() 
	    	."</select></td></tr>\n"
	    	
	    	."<tr><td>"._REGNEWUSERGRADYEAR."</td><td><select name=\"gradyear\" size=1>" 
	    	.getGraduationYears("default") 
			  ."</select></td></tr>\n"
			
				."<tr><td>"._SPECIALIZATION."</td><td><select name=\"specialization\" size=1>" 
	    	.getSpecializationOptions() 
			  ."</select></td></tr>\n"
			
			
				."<tr><td>"._REGNEWUSERCOMPANY."</td><td><input type=\"text\" name=\"company\" size=\"50\" maxlength=\"50\"></td></tr>\n"
				."<tr><td>"._REGNEWUSERDESGN."</td><td><input type=\"text\" name=\"designation\" size=\"50\" maxlength=\"50\"></td></tr>\n";
	    //END-OF-FIX 
	    
	if (extension_loaded("gd") AND ($gfx_chk == 3 OR $gfx_chk == 4 OR $gfx_chk == 6 OR $gfx_chk == 7)) {
	    echo "<tr><td>"._SECURITYCODE.":</td><td><img src='?gfx=gfx&random_num=$random_num' border='1' alt='"._SECURITYCODE."' title='"._SECURITYCODE."'></td></tr>\n"
	        ."<tr><td>"._TYPESECCODE.":</td><td><input type=\"text\" NAME=\"gfx_check\" SIZE=\"7\" MAXLENGTH=\"6\"></td></tr>\n"
	        ."<input type=\"hidden\" name=\"random_num\" value=\"$random_num\">\n";
	}
	echo "<tr><td colspan='2'>\n"
	    ."<input type=\"hidden\" name=\"op\" value=\"new user\">\n"
    	    ."<input type=\"submit\" value=\""._NEWUSER."\">\n"
    	    ."</td></tr></table>\n"
	    ."</form>\n"
	    ."<br>\n"
    	    .""._YOUWILLRECEIVE."<br><br>\n"
    	    .""._COOKIEWARNING."<br>\n"
    	    
    	    //FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
    	    .""._USAGENOTICE."<br>\n";
    	    /*
    	    .""._ASREGUSER."<br>\n"
	    		."<ul>\n"
    	    ."<li>"._ASREG1."\n"
    	    ."<li>"._ASREG2."\n"
    	    ."<li>"._ASREG3."\n"
    	    ."<li>"._ASREG4."\n"
    	    ."<li>"._ASREG5."\n";
    	    */
    	    
    	    //END-OF-FIX 
			$handle=opendir('themes');
	    while ($file = readdir($handle)) {
	    if ((!ereg("[.]",$file) AND file_exists("themes/$file/theme.php"))) {
		$thmcount++;
	    }
	}
	closedir($handle);
    	if ($thmcount > 1) {
	    //FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
	    //echo "<li>"._ASREG6."\n";
	    //END-OF-FIX
	}
	$sql = "SELECT custom_title FROM ".$prefix."_modules WHERE active='1' AND view='1' AND inmenu='1'";
	$result = $db->sql_query($sql);
	while ($row = $db->sql_fetchrow($result)) {
	    $custom_title = stripslashes(check_html($row[custom_title], "nohtml"));
	    if ($custom_title != "") {
		echo "<li>"._ACCESSTO." $custom_title\n";
	    }
	}
	$sql = "SELECT title FROM ".$prefix."_blocks WHERE active='1' AND view='1'";
	$result = $db->sql_query($sql);
	while ($row = $db->sql_fetchrow($result)) {
	    $b_title = stripslashes(check_html($row[title], "nohtml"));
	    if ($b_title != "") {
		echo "<li>"._ACCESSTO." $b_title\n";
	    }
	}
	if (is_active("Journal")) {
	    //FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
	    //echo "<li>"._CREATEJOURNAL."\n";
	    //END-OF-FIX 
	}
	if ($my_headlines == 1) {
	    //FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
	    //echo "<li>"._READHEADLINES."\n";
	    //END-OF-FIX 
	}
    	//FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
    	//echo "<li>"._ASREG7."\n"
    	//."</ul>\n"
    	//.""._REGISTERNOW."<br>\n"
    	echo ""._REGISTERNOW."<br>\n"
    	// .""._WEDONTGIVE."<br><br>\n"
    	//END-OF-FIX - One Below LIne
     
    	
	    ."<center><font class=\"content\">[ <a href=\"modules.php?name=$module_name\">"._USERLOGIN."</a> | <a href=\"modules.php?name=$module_name&amp;op=pass_lost\">"._PASSWORDLOST."</a> ]</font></center>\n";
			CloseTable();
	include("footer.php");
    } elseif (is_user($user)) {
	global $cookie;
	cookiedecode($user);
	userinfo($cookie[1]);
    }
}

function pass_lost() {
    global $user, $module_name;
    if (!is_user($user)) {
	include("header.php");
	OpenTable();
	echo "<center><font class=\"title\"><b>"._USERREGLOGIN."</b></font></center>\n";
	CloseTable();
	echo "<br>\n";
	OpenTable();
	echo "<b>"._PASSWORDLOST."</b><br><br>\n"
    	    .""._NOPROBLEM."<br><br>\n"
	    ."<form action=\"modules.php?name=$module_name\" method=\"post\">\n"
	    ."<table border=\"0\"><tr><td>\n"
    	    .""._NICKNAME.":</td><td><input type=\"text\" name=\"username\" size=\"15\" maxlength=\"25\"></td></tr>\n"
    	    ."<tr><td>"._CONFIRMATIONCODE.":</td><td><input type=\"text\" name=\"code\" size=\"11\" maxlength=\"10\"></td></tr></table><br>\n"
    	    ."<input type=\"hidden\" name=\"op\" value=\"mailpasswd\">\n"
    	    ."<input type=\"submit\" value=\""._SENDPASSWORD."\"></form><br>\n"
	    ."<center><font class=\"content\">[ <a href=\"modules.php?name=$module_name\">"._USERLOGIN."</a> | <a href=\"modules.php?name=$module_name&amp;op=new_user\">"._REGNEWUSER."</a> ]</font></center>\n";
	CloseTable();
	include("footer.php");
    } elseif(is_user($user)) {
	global $cookie;
	cookiedecode($user);
	userinfo($cookie[1]);
    }
}

function logout() {
    global $prefix, $db, $user, $cookie, $redirect;
    cookiedecode($user);
    $r_uid = $cookie[0];
    $r_username = $cookie[1];
    setcookie("user");
    $db->sql_query("DELETE FROM ".$prefix."_session WHERE uname='$r_username'");
    $db->sql_query("DELETE FROM ".$prefix."_bbsessions WHERE session_user_id='$r_uid'");
    $user = "";
    include("header.php");
    OpenTable();
    if ($redirect != "") {
        echo "<META HTTP-EQUIV=\"refresh\" content=\"3;URL=modules.php?name=$redirect\">";
    } else {
        echo "<META HTTP-EQUIV=\"refresh\" content=\"3;URL=index.php\">";
    }
    echo "<center><font class=\"option\"><b>"._YOUARELOGGEDOUT."</b></font></center>";
    CloseTable();
    include("footer.php");
}

function mail_password($username, $code) {
    global $sitename, $adminmail, $nukeurl, $user_prefix, $db, $module_name;
    $username = substr($username, 0, 25);
    $sql = "SELECT user_email, user_password FROM ".$user_prefix."_users WHERE username='$username'";
    $result = $db->sql_query($sql);
    if(!$result) {
		include("header.php");
		OpenTable();
		echo "<center>"._SORRYNOUSERINFO."</center>";
		CloseTable();
		include("footer.php");
    } else {
		$host_name = $_SERVER["REMOTE_ADDR"];
		$row = $db->sql_fetchrow($result);
		$user_email = htmlentities($row['user_email']);
		$user_password = $row[user_password];
		$areyou = substr($user_password, 0, 10);
		if ($areyou==$code) {
		    $newpass=makepass();
		    $message = ""._USERACCOUNT." '$username' "._AT." $sitename "._HASTHISEMAIL."  "._AWEBUSERFROM." $host_name "._HASREQUESTED."\n\n"._YOURNEWPASSWORD." $newpass\n\n "._YOUCANCHANGE." $nukeurl/modules.php?name=$module_name\n\n"._IFYOUDIDNOTASK."";
		    $subject = ""._USERPASSWORD4." $username";
		    mail($user_email, $subject, $message, "From: $adminmail\nX-Mailer: PHP/" . phpversion());
		    /* Next step: add the new password to the database */
		    $cryptpass = md5($newpass);
		    $query = "UPDATE ".$user_prefix."_users SET user_password='$cryptpass' WHERE username='$username'";
		    if (!$db->sql_query($query)) {
		    	echo ""._UPDATEFAILED."";
		    }
		    include ("header.php");
		    OpenTable();
		    echo "<center>"._PASSWORD4." $username "._MAILED."<br><br>"._GOBACK."</center>";
		    CloseTable();
		    include ("footer.php");
		/* If no Code, send it */
		} else {
		    $sql = "SELECT user_email, user_password FROM ".$user_prefix."_users WHERE username='$username'";
		    $result = $db->sql_query($sql);
		    if(!$result) {
				include ("header.php");
				OpenTable();
		        echo "<center>"._SORRYNOUSERINFO."</center>";
				CloseTable();
				include ("footer.php");
		    } else {
		        $host_name = $_SERVER["REMOTE_ADDR"];
				$row = $db->sql_fetchrow($result);
		        $user_email = $row[user_email];
				$user_password = $row[user_password];
		        $areyou = substr($user_password, 0, 10);
	    		$message = ""._USERACCOUNT." '$username' "._AT." $sitename "._HASTHISEMAIL." "._AWEBUSERFROM." $host_name "._CODEREQUESTED."\n\n"._YOURCODEIS." $areyou \n\n"._WITHTHISCODE." $nukeurl/modules.php?name=$module_name&op=pass_lost\n"._IFYOUDIDNOTASK2."";
				$subject=""._CODEFOR." $username";
				mail($user_email, $subject, $message, "From: $adminmail\nX-Mailer: PHP/" . phpversion());
				include ("header.php");
				OpenTable();
				echo "<center>"._CODEFOR." $username "._MAILED."<br><br>"._GOBACK."</center>";
				CloseTable();
				include ("footer.php");
	    	}
		}
    }
}

function docookie($setuid, $setusername, $setpass, $setstorynum, $setumode, $setuorder, $setthold, $setnoscore, $setublockon, $settheme, $setcommentmax) {
    $info = base64_encode("$setuid:$setusername:$setpass:$setstorynum:$setumode:$setuorder:$setthold:$setnoscore:$setublockon:$settheme:$setcommentmax");
    //FIX:DOMSNITT - Code added for DOMS ALUMNI Network Site
    //setcookie("user","$info",time()+2592000);
   	 setcookie("user","$info");
    //END-OF-FIX 
    
}

function login($username, $user_password, $redirect, $mode, $f, $t, $random_num, $gfx_check) {
    global $setinfo, $user_prefix, $db, $module_name, $pm_login, $prefix;
    include("config.php");
    $sql = "SELECT user_password, user_id, storynum, umode, uorder, thold, noscore, ublockon, theme, commentmax FROM ".$user_prefix."_users WHERE username='$username'";
    $result = $db->sql_query($sql);
    $setinfo = $db->sql_fetchrow($result);
    $forward = ereg_replace("redirect=", "", "$redirect");
    if (ereg("privmsg", $forward)) {
        $pm_login = "active";
    }
    if (($db->sql_numrows($result)==1) AND ($setinfo[user_id] != 1) AND ($setinfo[user_password] != "")) {
	$dbpass=$setinfo[user_password];
	$non_crypt_pass = $user_password;
  	$old_crypt_pass = crypt($user_password,substr($dbpass,0,2));
	$new_pass = md5($user_password);
	if (($dbpass == $non_crypt_pass) OR ($dbpass == $old_crypt_pass)) {
	    $db->sql_query("UPDATE ".$user_prefix."_users SET user_password='$new_pass' WHERE username='$username'");
	    $sql = "SELECT user_password FROM ".$user_prefix."_users WHERE username='$username'";
	    $result = $db->sql_query($sql);
	    $row = $db->sql_fetchrow($result);
	    $dbpass = $row[user_password];
	}
	if ($dbpass != $new_pass) {
            Header("Location: modules.php?name=$module_name&stop=1");
    	    return;
	}
	$datekey = date("F j");
	$rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $random_num . $datekey));
	$code = substr($rcode, 2, 6);
	if (extension_loaded("gd") AND $code != $gfx_check AND ($gfx_chk == 2 OR $gfx_chk == 4 OR $gfx_chk == 5 OR $gfx_chk == 7)) {
	    Header("Location: modules.php?name=$module_name&stop=1");
	    die();
	} else {
	    docookie($setinfo[user_id], $username, $new_pass, $setinfo[storynum], $setinfo[umode], $setinfo[uorder], $setinfo[thold], $setinfo[noscore], $setinfo[ublockon], $setinfo[theme], $setinfo[commentmax]);
	    $uname = $_SERVER["REMOTE_ADDR"];
	    $db->sql_query("DELETE FROM ".$prefix."_session WHERE uname='$uname' AND guest='1'");
          $db->sql_query("UPDATE ".$prefix."_users SET last_ip='$uname' WHERE username='$username'");
	}
	if ($pm_login != "") {
            Header("Location: modules.php?name=Private_Messages&file=index&folder=inbox");
	    exit;
	}
        if ($redirect == "" ) {
           // Header("Location: modules.php?name=Your_Account&op=userinfo&bypass=1&username=$username");
           Header("Location:");
        } else if ($mode == "") {
            Header("Location: modules.php?name=Forums&file=$forward");
        } else if ($t !="")  {
            Header("Location: modules.php?name=Forums&file=$forward&mode=$mode&t=$t");
        } else {
            Header("Location: modules.php?name=Forums&file=$forward&mode=$mode&f=$f");
	}
    } else {
	Header("Location: modules.php?name=$module_name&stop=1");
    }
}

function edituser() {
    global $prefix, $db, $user, $userinfo, $cookie, $module_name, $bgcolor2, $bgcolor3;
    cookiedecode($user);
    getusrinfo($user);
    
    if ((is_user($user)) AND (strtolower($userinfo['username']) == strtolower($cookie[1])) AND ($userinfo['user_password'] == $cookie[2])) {
	include("header.php");
	OpenTable();
	echo "<center><font class=\"title\"><b>"._PERSONALINFO."</b></font></center>";
	CloseTable();
	echo "<br>";    
	OpenTable();
	nav();
	CloseTable();
	echo "<br>";
	if (!eregi("http://",$userinfo[user_website])) {
	    $userinfo[user_website] = "http://$userinfo[user_website]";
	}
	OpenTable();
	echo "<table class=forumline cellpadding=\"3\" border=\"0\" width='100%'>"
	     ."<form name=\"Register\" action=\"modules.php?name=$module_name\" method=\"POST\">"
	    //."<form name=\"Register\" action=\"HTTPHandler.php\" method=\"POST\">"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._USRNICKNAME."</b>:</td><td bgcolor='$bgcolor3'><b>$userinfo[username]</b></td></tr>"
	    
	    //FIX:DOMSNITT
	    #."<tr><td bgcolor='$bgcolor2'><b>"._UREALNAME."</b>:<br>"._OPTIONAL."</td><td bgcolor='$bgcolor3'>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._UREALNAME."</b>:<br>"._REQUIRED."</td><td bgcolor='$bgcolor3'>"
	    
	    //END-OF-FIX 
	    
	    ."<input type=\"text\" name=\"realname\" value=\"$userinfo[name]\" size=\"50\" maxlength=\"60\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._UREALEMAIL.":</b><br>"._REQUIRED."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_email\" value=\"$userinfo[user_email]\" size=\"50\" maxlength=\"255\"><br>"._EMAILNOTPUBLIC."</td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._UFAKEMAIL.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"femail\" value=\"$userinfo[femail]\" size=\"50\" maxlength=\"255\"><br>"._EMAILPUBLIC."</td></tr>"
	    
	    
	    //FIX:DOMSNITT
	    
	    ."<tr><td bgcolor='$bgcolor2'><b>"._REGNEWUSERTYPE.":</b><br>"._REQUIRED."</td>"
	    
	    
	    ."<td bgcolor='$bgcolor3'><select name=\"usertype\" size=1>" 
	    .getUserTypesOptionsWithSelected($userinfo[usertype]) 
	    ."</select></td></tr>" 
	    
	    ."<tr><td bgcolor='$bgcolor2'><b>"._REGNEWUSERGRADYEAR.":</b><br>"._REQUIRED."</td>";
	    echo "<td bgcolor='$bgcolor3'><select name=\"gradyear\" size=1>"  
			.getGraduationYears($userinfo[gradyear])
			."</select></td></tr>\n"
			
			."<tr><td bgcolor='$bgcolor2'><b>"._SPECIALIZATION.":</b><br>"._REQUIRED."</td>";
	    echo "<td bgcolor='$bgcolor3'><select name=\"specialization\" size=1>"  
			.getSpecializationOptions($userinfo[specialization])
			."</select></td></tr>\n"
			
				
				."<tr><td bgcolor='$bgcolor2'><b>"._SEX.":</b><br>"._OPTIONAL."</td>";
	    echo "<td bgcolor='$bgcolor3'><select name=\"sex\" size=1>"  
			.getSexTypesOptionsWithSelected($userinfo[sex])
			."</select></td></tr>\n"
				
				."<tr><td bgcolor='$bgcolor2'><b>"._DOB.":</b><br>"._OPTIONAL."</td>"
			."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"dob\" value=\"$userinfo[dob]\" size=\"12\" maxlength=\"10\"></td></tr>\n";
				
				
		// is Married
	  echo "<tr><td bgcolor='$bgcolor2'><b>"._MARTIALSTATUS."</b></td><td bgcolor='$bgcolor3'>";
		if ($userinfo[is_married] == 1) {
	 	   echo "<input type=\"radio\" name=\"is_married\" value=\"1\" checked>"._YES." &nbsp;";
			 echo "<input type=\"radio\" name=\"is_married\" value=\"0\">"._NO."";
		} else {
	  	 echo  "<input type=\"radio\" name=\"is_married\" value=\"1\">"._YES." &nbsp;";
			 echo "<input type=\"radio\" name=\"is_married\" value=\"0\" checked>"._NO."";
		}
		echo "</td></tr>";
	
				
			echo ""	
			."<tr><td bgcolor='$bgcolor2'><b>"._REGNEWUSERCOMPANY.":</b><br>"._REQUIRED."</td>"
			."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"company\" value=\"$userinfo[company]\" size=\"50\" maxlength=\"50\"></td></tr>\n" 
			
			."<tr><td bgcolor='$bgcolor2'><b>"._REGNEWUSERDESGN.":</b><br>"._REQUIRED."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"designation\" value=\"$userinfo[designation]\" size=\"50\" maxlength=\"50\"></td></tr>\n"
	    
	    ."<tr><td bgcolor='$bgcolor2' colspan=2 align='center'><b>"._COMPANYADDRESS.":</b></tr>\n"
	    
	    ."<tr><td bgcolor='$bgcolor2'><b>"._ADDRESS1.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_1\" value=\"$userinfo[Company_Address_1]\" size=\"50\" maxlength=\"50\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._ADDRESS2.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_2\" value=\"$userinfo[Company_Address_2]\" size=\"50\" maxlength=\"50\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._CITY.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_CITY\" value=\"$userinfo[Company_Address_CITY]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
			."<tr><td bgcolor='$bgcolor2'><b>"._STATE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_STATE\" value=\"$userinfo[Company_Address_STATE]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._COUNTRY.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><select name=\"Company_Address_COUNTRY\" size=1>"  
			.getCountryOptionsWithSelectedOption($userinfo[Company_Address_COUNTRY])
			."</select></td></tr>\n"
	    
	    ."<tr><td bgcolor='$bgcolor2'><b>"._ZIP.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_ZIP\" value=\"$userinfo[Company_Address_ZIP]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._MOBILE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_MOBILE\" value=\"$userinfo[Company_Address_MOBILE]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._PHONE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_PHONE\" value=\"$userinfo[Company_Address_PHONE]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	   
	    ."<tr><td bgcolor='$bgcolor2'><b>"._FAX.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_FAX\" value=\"$userinfo[Company_Address_FAX]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	   
	    ."<tr><td bgcolor='$bgcolor2'><b>"._EMAIL.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"Company_Address_EMAIL\" value=\"$userinfo[Company_Address_EMAIL]\" size=\"50\" maxlength=\"50\"></td></tr>\n"
	     
	     
	    ."<tr><td bgcolor='$bgcolor2' colspan=2 align='center'><b>"._PERMANENTADDRESS.":</b></tr>\n"
	   
	   ."<tr><td bgcolor='$bgcolor2'><b>"._ADDRESS1.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_1\" value=\"$userinfo[PERMANENT_Address_1]\" size=\"50\" maxlength=\"50\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._ADDRESS2.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_2\" value=\"$userinfo[PERMANENT_Address_2]\" size=\"50\" maxlength=\"50\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._CITY.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_CITY\" value=\"$userinfo[PERMANENT_Address_CITY]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
			."<tr><td bgcolor='$bgcolor2'><b>"._STATE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_STATE\" value=\"$userinfo[PERMANENT_Address_STATE]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
	   
	   	."<tr><td bgcolor='$bgcolor2'><b>"._COUNTRY.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><select name=\"PERMANENT_Address_COUNTRY\" size=1>"  
			.getCountryOptionsWithSelectedOption($userinfo[PERMANENT_Address_COUNTRY])
			."</select></td></tr>\n"
	   
	    
	    ."<tr><td bgcolor='$bgcolor2'><b>"._ZIP.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_ZIP\" value=\"$userinfo[PERMANENT_Address_ZIP]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._MOBILE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_MOBILE\" value=\"$userinfo[PERMANENT_Address_MOBILE]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	     
	    ."<tr><td bgcolor='$bgcolor2'><b>"._PHONE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_PHONE\" value=\"$userinfo[PERMANENT_Address_PHONE]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	   
	    ."<tr><td bgcolor='$bgcolor2'><b>"._FAX.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_FAX\" value=\"$userinfo[PERMANENT_Address_FAX]\" size=\"50\" maxlength=\"30\"></td></tr>\n"
	   
	    ."<tr><td bgcolor='$bgcolor2'><b>"._EMAIL.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"PERMANENT_Address_EMAIL\" value=\"$userinfo[PERMANENT_Address_EMAIL]\" size=\"50\" maxlength=\"50\"></td></tr>\n"
	     
	    
	    . "<tr><td bgcolor='$bgcolor2'><b>"._YICQ.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_icq\" value=\"$userinfo[user_icq]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YAIM.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_aim\" value=\"$userinfo[user_aim]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YYIM.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_yim\" value=\"$userinfo[user_yim]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YMSNM.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_msnm\" value=\"$userinfo[user_msnm]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    	    	   
	   ."<tr><td bgcolor='$bgcolor2' colspan=2 align='center'><b>"._ALUMNIPREFERENCES.":</b></tr>\n";
	  
		// DASF Membership
		 echo "<tr><td bgcolor='$bgcolor2'><b>"._DASFMEMBER."</b></td><td bgcolor='$bgcolor3'>";
		if ($userinfo[dasf_member] == 1) {
	 	   echo "<input type=\"radio\" name=\"dasf_member\" value=\"1\" checked>"._YES." &nbsp;"
			."<input type=\"radio\" name=\"dasf_member\" value=\"0\">"._NO."";
		} else {
	  	  echo "<input type=\"radio\" name=\"dasf_member\" value=\"1\">"._YES." &nbsp;"
				."<input type=\"radio\" name=\"dasf_member\" value=\"0\" checked>"._NO."";
		}
		echo "</td></tr>";

	 // GUESTLECTURESOK
	  echo "<tr><td bgcolor='$bgcolor2'><b>"._GUESTLECTURESOK."</b></td><td bgcolor='$bgcolor3'>";
		if ($userinfo[guest_lectures_ok] == 1) {
	 	   echo "<input type=\"radio\" name=\"guest_lectures_ok\" value=\"1\" checked>"._YES." &nbsp;"
			."<input type=\"radio\" name=\"guest_lectures_ok\" value=\"0\">"._NO."";
		} else {
	  	  echo "<input type=\"radio\" name=\"guest_lectures_ok\" value=\"1\">"._YES." &nbsp;"
				."<input type=\"radio\" name=\"guest_lectures_ok\" value=\"0\" checked>"._NO."";
		}
		echo "</td></tr>";

		// GUEST LECTURE TOPICS
	 echo "<tr><td bgcolor='$bgcolor2'><b>"._GUESTLECTURESTOPICS.":</b><br>"._OPTIONAL."</td>"
	 ."<td bgcolor='$bgcolor3'><textarea wrap=\"virtual\" cols=\"50\" rows=\"3\" name=\"guest_lectures_topics\">$userinfo[guest_lectures_topics]</textarea><br>150 characters max</td></tr>";


		// SUMMERPROJECTSOK
		 echo "<tr><td bgcolor='$bgcolor2'><b>"._SUMMERPROJECTSOK."</b></td><td bgcolor='$bgcolor3'>";
		if ($userinfo[summer_projects_ok] == 1) {
	 	   echo "<input type=\"radio\" name=\"summer_projects_ok\" value=\"1\" checked>"._YES." &nbsp;"
			."<input type=\"radio\" name=\"summer_projects_ok\" value=\"0\">"._NO."";
		} else {
	  	  echo "<input type=\"radio\" name=\"summer_projects_ok\" value=\"1\">"._YES." &nbsp;"
				."<input type=\"radio\" name=\"summer_projects_ok\" value=\"0\" checked>"._NO."";
		}
		echo "</td></tr>";


		//PLACEMENTSOK 
		
		 echo "<tr><td bgcolor='$bgcolor2'><b>"._PLACEMENTSOK."</b></td><td bgcolor='$bgcolor3'>";
		if ($userinfo[placements_ok] == 1) {
	 	   echo "<input type=\"radio\" name=\"placements_ok\" value=\"1\" checked>"._YES." &nbsp;"
			."<input type=\"radio\" name=\"placements_ok\" value=\"0\">"._NO."";
		} else {
	  	  echo "<input type=\"radio\" name=\"placements_ok\" value=\"1\">"._YES." &nbsp;"
				."<input type=\"radio\" name=\"placements_ok\" value=\"0\" checked>"._NO."";
		}
		echo "</td></tr>";
		
		//FINANCIALAID 
		
		 echo "<tr><td bgcolor='$bgcolor2'><b>"._FINANCIALAID."</b></td><td bgcolor='$bgcolor3'>";
		if ($userinfo[placements_ok] == 1) {
	 	   echo "<input type=\"radio\" name=\"financial_help_ok\" value=\"1\" checked>"._YES." &nbsp;"
			."<input type=\"radio\" name=\"financial_help_ok\" value=\"0\">"._NO."";
		} else {
	  	  echo "<input type=\"radio\" name=\"financial_help_ok\" value=\"1\">"._YES." &nbsp;"
				."<input type=\"radio\" name=\"financial_help_ok\" value=\"0\" checked>"._NO."";
		}
		echo "</td></tr>";
	

	   
	  echo "<tr><td bgcolor='$bgcolor2' colspan=2 align='center'><b>"._PERSONALPREFERENCES.":</b></tr>\n"
	   
	   
	    //END-OF-FIX
	    
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YOURHOMEPAGE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_website\" value=\"$userinfo[user_website]\" size=\"50\" maxlength=\"255\"></td></tr>";
			//FIX:DOMSNITT
			/*
			echo "<tr><td bgcolor='$bgcolor2'><b>"._YICQ.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_icq\" value=\"$userinfo[user_icq]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YAIM.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_aim\" value=\"$userinfo[user_aim]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YYIM.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_yim\" value=\"$userinfo[user_yim]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YMSNM.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_msnm\" value=\"$userinfo[user_msnm]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    
	    
	    
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YLOCATION.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_from\" value=\"$userinfo[user_from]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YOCCUPATION.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_occ\" value=\"$userinfo[user_occ]\" size=\"30\" maxlength=\"100\"></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._YINTERESTS.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><input type=\"text\" name=\"user_interests\" value=\"$userinfo[user_interests]\" size=\"30\" maxlength=\"100\"></td></tr>";
	  */
	//FIX:DOMSNITT
	    
	echo "<tr><td bgcolor='$bgcolor2'><b>"._RECEIVENEWSLETTER."</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[newsletter] == 1) {
	    echo "<input type=\"radio\" name=\"newsletter\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"newsletter\" value=\"0\">"._NO."";
	} elseif ($userinfo[newsletter] == 0) {
	    echo "<input type=\"radio\" name=\"newsletter\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"newsletter\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._ALWAYSSHOWEMAIL.":</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_viewemail] == 1) {
	    echo "<input type=\"radio\" name=\"user_viewemail\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_viewemail\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_viewemail] == 0) {
	    echo "<input type=\"radio\" name=\"user_viewemail\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_viewemail\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._HIDEONLINE.":</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_allow_viewonline] == 1) {
	    echo "<input type=\"radio\" name=\"user_allow_viewonline\" value=\"0\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allow_viewonline\" value=\"1\" checked>"._NO."";
	} elseif ($userinfo[user_allow_viewonline] == 0) {
	    echo "<input type=\"radio\" name=\"user_allow_viewonline\" value=\"0\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allow_viewonline\" value=\"1\">"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._REPLYNOTIFY.":</b><br>"._REPLYNOTIFYMSG."</td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_notify] == 1) {
	    echo "<input type=\"radio\" name=\"user_notify\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_notify\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_notify] == 0) {
	    echo "<input type=\"radio\" name=\"user_notify\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_notify\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._PMNOTIFY.":</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_notify_pm] == 1) {
	    echo "<input type=\"radio\" name=\"user_notify_pm\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_notify_pm\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_notify_pm] == 0) {
	    echo "<input type=\"radio\" name=\"user_notify_pm\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_notify_pm\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._POPPM.":</b><br>"._POPPMMSG."</td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_popup_pm] == 1) {
	    echo "<input type=\"radio\" name=\"user_popup_pm\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_popup_pm\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_popup_pm] == 0) {
	    echo "<input type=\"radio\" name=\"user_popup_pm\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_popup_pm\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._ATTACHSIG.":</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_attachsig] == 1) {
	    echo "<input type=\"radio\" name=\"user_attachsig\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_attachsig\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_attachsig] == 0) {
	    echo "<input type=\"radio\" name=\"user_attachsig\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_attachsig\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._ALLOWBBCODE."</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_allowbbcode] == 1) {
	    echo "<input type=\"radio\" name=\"user_allowbbcode\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allowbbcode\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_allowbbcode] == 0) {
	    echo "<input type=\"radio\" name=\"user_allowbbcode\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allowbbcode\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._ALLOWHTMLCODE."</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_allowhtml] == 1) {
	    echo "<input type=\"radio\" name=\"user_allowhtml\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allowhtml\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_allowhtml] == 0) {
	    echo "<input type=\"radio\" name=\"user_allowhtml\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allowhtml\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._ALLOWSMILIES."</b></td><td bgcolor='$bgcolor3'>";
	if ($userinfo[user_allowsmile] == 1) {
	    echo "<input type=\"radio\" name=\"user_allowsmile\" value=\"1\" checked>"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allowsmile\" value=\"0\">"._NO."";
	} elseif ($userinfo[user_allowsmile] == 0) {
	    echo "<input type=\"radio\" name=\"user_allowsmile\" value=\"1\">"._YES." &nbsp;"
		."<input type=\"radio\" name=\"user_allowsmile\" value=\"0\" checked>"._NO."";
	}
	echo "</td></tr>";

	echo "<tr><td bgcolor='$bgcolor2'><b>"._FORUMSTIME."</b></td><td bgcolor='$bgcolor3'>";
	echo "<select name='user_timezone'>";
	for ($i=-12; $i<13; $i++) {
	    if ($i == 0) {
		$dummy = "GMT";
	    } else {
		if (!ereg("-", $i)) {
		    $i = "+$i";
		}
		$dummy = "GMT $i "._HOURS."";
	    }
	    if ($userinfo[user_timezone] == $i) {
	    	echo "<option name=\"user_timezone\" value=\"$i\" selected>$dummy</option>";
	    } else {
		echo "<option name=\"user_timezone\" value=\"$i\">$dummy</option>";
	    }
	    
	}
	echo "</select>";
	echo "</td></tr>";
	echo "<tr><td bgcolor='$bgcolor2'><b>"._FORUMSDATE.":</b><br>"._FORUMSDATEMSG."</b></td><td bgcolor='$bgcolor3'>";
	echo "<input size='15' maxlength='14' type=\"text\" name=\"user_dateformat\" value=\"$userinfo[user_dateformat]\">";
	echo "</td></tr>";
	echo "<tr><td bgcolor='$bgcolor2'><b>"._SIGNATURE.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><textarea wrap=\"virtual\" cols=\"50\" rows=\"5\" name=\"user_sig\">$userinfo[user_sig]</textarea><br>"._255CHARMAX."</td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._EXTRAINFO.":</b><br>"._OPTIONAL."</td>"
	    ."<td bgcolor='$bgcolor3'><textarea wrap=\"virtual\" cols=\"50\" rows=\"5\" name=\"bio\">$userinfo[bio]</textarea><br>"._CANKNOWABOUT."</td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>"._PASSWORD."</b>:</td><br>"
	    ."<td bgcolor='$bgcolor3'><input type=\"password\" name=\"user_password\" size=\"22\" maxlength=\"20\">&nbsp;&nbsp;&nbsp;<input type=\"password\" name=\"vpass\" size=\"22\" maxlength=\"20\"><br>"._TYPENEWPASSWORD."</td></tr>"
	    ."<tr><td bgcolor='$bgcolor3' colspan='2' align='center'>"
	    ."<input type=\"hidden\" name=\"username\" value=\"$userinfo[username]\">"
	    ."<input type=\"hidden\" name=\"user_id\" value=\"$userinfo[user_id]\">"
	    ."<input type=\"hidden\" name=\"op\" value=\"saveuser\">"
	    ."<input class=button type=\"submit\" value=\""._SAVECHANGES."\">"
	    ."</form></td></tr>";
        $avatar_category = ( !empty($HTTP_POST_VARS['avatarcategory']) ) ? $HTTP_POST_VARS['avatarcategory'] : '';
        $direktori = "modules/Forums/images/avatars"; 
        $dir = @opendir($direktori);
        $avatar_images = array();
        while( $file = @readdir($dir) )
        {
                if( $file != '.' && $file != '..' && !is_file($direktori . '/' . $file) && !is_link($direktori . '/' . $file) )
                {
                        $sub_dir = @opendir($direktori . '/' . $file);
                        $avatar_row_count = 0;
                        $avatar_col_count = 0;
                        while( $sub_file = @readdir($sub_dir) )
                        {
                                if( preg_match('/(\.gif$|\.png$|\.jpg|\.jpeg)$/is', $sub_file) )
                                {
                                        $avatar_images[$file][$avatar_row_count][$avatar_col_count] = $file . '/' . $sub_file;
                                        $avatar_name[$file][$avatar_row_count][$avatar_col_count] = ucfirst(str_replace("_", " ", preg_replace('/^(.*)\..*$/', '\1', $sub_file)));
                                        $avatar_col_count++;
                                        if( $avatar_col_count == 5 )
                                        {
                                                $avatar_row_count++;
                                                $avatar_col_count = 0;
                                        }
                                }
                        }
                }
        }
        @closedir($dir);
        @ksort($avatar_images);
        @reset($avatar_images);
        if( empty($category) )
        {
                list($category, ) = each($avatar_images);
        }
        @reset($avatar_images);
        $s_categories = '<select name="avatarcategory">';
        while( list($key) = each($avatar_images) )
        {
                $selected = ( $key == $category ) ? ' selected="selected"' : '';
                if( count($avatar_images[$key]) )
                {
                        $s_categories .= '<option value="' . $key . '"' . $selected . '>' . ucfirst($key) . '</option>';
                }
        }
        $s_categories .= '</select>';
        $sql = "SELECT * FROM ".$prefix."_bbconfig";
        $result = $db->sql_query($sql);
        while ( $row = $db->sql_fetchrow($result) )
        {
        $board_config[$row['config_name']] = $row['config_value'];
        }
    if ($userinfo[user_avatar_type] == 1) { 
       $userinfo[user_avatar] = $board_config['avatar_path']."/".$userinfo[user_avatar]; 
       } elseif ($userinfo[user_avatar_type] == 2) { 
       $userinfo[user_avatar] = $userinfo[user_avatar]; 
       } else { 
       $userinfo[user_avatar] = $board_config[avatar_gallery_path]."/".$userinfo[user_avatar]; 
       }
	    echo "<tr><td bgcolor='$bgcolor3' colspan='2' align='center'>"
	    ."<BR><b><h5>Avatar control panel</h5></b>"
	    ."<tr><td bgcolor='$bgcolor2'>Displays a small graphic image below your details in forum posts and on your profile. Only one image can be displayed at a time, its width can be no greater than ".$board_config['avatar_max_width']." pixels, the height no greater than ".$board_config['avatar_max_height']." pixels, and the file size no more than ".CoolSize($board_config['avatar_filesize']).".</td>";
	    echo "<td bgcolor='$bgcolor3' align=center>Current Avatar<BR><IMG alt=\"\" src=\"$userinfo[user_avatar]\" width=\"40\" height=\"50\"></td></tr><BR>";
	    if ($board_config['allow_avatar_local']) {
	    echo "<form action=\"modules.php?name=Your_Account&op=avatarlist\" method=\"post\">"
	    ."<tr><td bgcolor='$bgcolor2'><b>Select Avatar from gallery:</b></td>"
	    ."<td bgcolor='$bgcolor3'>".$s_categories."&nbsp;<img src=\"images/right.gif\" align=middle>&nbsp;<INPUT class=button type=submit value=\"Show Gallery\"></td></tr>"
	    ."</form>";
	    } else {
	    echo "<tr><td bgcolor='$bgcolor2'><b>Select Avatar from gallery:</b></td>"
	    ."<td bgcolor='$bgcolor3'><b>Gallery Avatars Currently Disabled</b></td></tr>";
            }
	    if ($board_config['allow_avatar_upload']) {
	    echo "<tr><td bgcolor='$bgcolor2'><b>Upload Avatar from your machine:</b></td>"
	    ."<td bgcolor='$bgcolor3'><a href=\"modules.php?name=Forums&file=profile&mode=editprofile\"><b>Upload Through Forum Profile</b></a></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>Upload Avatar from a URL:</b><br><SPAN class=gensmall>Enter the URL of the location containing the Avatar image and click on the submit button below, the Avatar image will be copied to this site.</SPAN></td>"
	    ."<td bgcolor='$bgcolor3'><a href=\"modules.php?name=Forums&file=profile&mode=editprofile\"><b>Upload Through Forum Profile</b></a></td></tr>";
	    } else {
	    echo "<tr><td bgcolor='$bgcolor2'><b>Upload Avatar from your machine:</b></td>"
	    ."<td bgcolor='$bgcolor3'><b>Currently Disabled</b></td></tr>"
	    ."<tr><td bgcolor='$bgcolor2'><b>Upload Avatar from a URL:</b><br><SPAN class=gensmall>Enter the URL of the location containing the Avatar image and click on the submit button below, the Avatar image will be copied to this site.</SPAN></td>"
	    ."<td bgcolor='$bgcolor3'><b>Currently Disabled</b></td></tr>";
	    }
	    if ($board_config['allow_avatar_remote']) {
	    echo "<form action=\"modules.php?name=Your_Account&op=avatarlinksave\" method=\"post\">"
	    ."<tr><td bgcolor='$bgcolor2'><b>Link to off-site Avatar:</b><br><SPAN class=gensmall>Enter the URL of the location containing the Avatar image you wish to link to and click on the submit button below.</SPAN></td>"
	    ."<td bgcolor='$bgcolor3'><INPUT class=post style=\"WIDTH: 200px\" size=40 name=avatar></td></tr>";
	    } else {
	    echo "<tr><td bgcolor='$bgcolor2'><b>Link to off-site Avatar:</b><br><SPAN class=gensmall>Enter the URL of the location containing the Avatar image you wish to link to and click on the submit button below.</SPAN></td>"
	    ."<td bgcolor='$bgcolor3'><b>Currently Disabled</b></td></tr>";
	    }
	    echo "<tr><td bgcolor='$bgcolor3' colspan='2' align='center'>"
	    ."<INPUT class=mainoption type=submit value=Submit>"
	    ."</form></TD></TR></TABLE>";
	CloseTable();
	include("footer.php");
    } else {
	main($user);
    }
}

function saveuser($realname, $user_email, $femail, $user_website, $user_icq, $user_aim, $user_yim, $user_msnm, $user_from, $user_occ, $user_interests, $newsletter, $user_viewemail, $user_allow_viewonline, $user_notify, $user_notify_pm, $user_popup_pm, $user_attachsig, $user_allowbbcode, $user_allowhtml, $user_allowsmile, $user_timezone, $user_dateformat, $user_sig, $bio, $user_password, $vpass, $username, $user_id,$usertype,$gradyear,$company,$designation,$specialization,$Company_Address_1,$Company_Address_2,$Company_Address_CITY,$Company_Address_STATE,$Company_Address_COUNTRY,$Company_Address_ZIP,$Company_Address_MOBILE,$Company_Address_PHONE,$Company_Address_FAX,$Company_Address_EMAIL,$PERMANENT_Address_1,$PERMANENT_Address_2,$PERMANENT_Address_CITY,$PERMANENT_Address_STATE,$PERMANENT_Address_COUNTRY,$PERMANENT_Address_ZIP,$PERMANENT_Address_MOBILE,$PERMANENT_Address_PHONE,$PERMANENT_Address_FAX,$PERMANENT_Address_EMAIL,$dasf_member,$guest_lectures_ok,$guest_lectures_topics,$summer_projects_ok,$placements_ok,$financial_help_ok,$sex,$dob,$is_married) {
    
    
    global $user, $cookie, $userinfo, $EditedMessage, $user_prefix, $db, $module_name, $minpass;
    cookiedecode($user);
    $check = $cookie[1];
    $check2 = $cookie[2];
    $sql = "SELECT user_id, user_password FROM ".$user_prefix."_users WHERE username='$check'";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $vuid = intval($row[user_id]);
    $ccpass = $row[user_password];
    $user_sig = htmlspecialchars($user_sig);
    $user_email = check_html($user_email, nohtml);
    $femail = check_html($femail, nohtml);
    $user_website = check_html($user_website, nohtml);
    $bio = check_html($bio, nohtml);
    $user_icq = check_html($user_icq, nohtml);
    $user_aim = check_html($user_aim, nohtml);
    $user_yim = check_html($user_yim, nohtml);
    $user_msnm = check_html($user_msnm, nohtml);
    $user_occ = check_html($user_occ, nohtml);
    $user_from = check_html($user_from, nohtml);
    $user_interests = check_html($user_interests, nohtml);
    $realname = check_html($realname, nohtml);
    $user_avatar = "$user_avatar";
    
    //FIX:DOMSNITT
    $company=check_html($company, nohtml);
    $designation=check_html($designation, nohtml);
    //END-OF-FIX
    
    
    if (($user_id == $vuid) AND ($check2 == $ccpass)) {
				
				if (!eregi("http://", $user_website)) {
	    			$user_website = "http://$user_website";
				}
				if ((isset($user_password)) && ("$user_password" != "$vpass")) {
	    				echo "<center>"._PASSDIFFERENT."</center>";
	    				
				} elseif (($user_password != "") && (strlen($user_password) < $minpass)) {
	    				echo "<center>"._YOUPASSMUSTBE." <b>$minpass</b> "._CHARLONG."</center>";
				} else {

	    			if ($bio) { filter_text($bio); $bio = $EditedMessage; $bio = FixQuotes($bio); }
	    			if ($user_password != "") {
						 	cookiedecode($user);
							$db->sql_query("LOCK TABLES ".$user_prefix."_users WRITE");
							$user_password = md5($user_password);
							$newsletter = intval($newsletter);
							$user_allow_viewonline = intval($user_allow_viewonline);
							$user_notify = intval($user_notify);
							$user_notify_pm = intval($user_notify_pm);
							$user_popup_pm = intval($user_popup_pm);
							$user_allowbbcode = intval($user_allowbbcode);
							$user_allowhtml = intval($user_allowhtml);
							$user_allowsmile = intval($user_allowsmile);
							$user_id = intval($user_id);
							//FIX:DOMSNITT
							$gradyear=intval($gradyear);
							//$db->sql_query("UPDATE ".$user_prefix."_users SET name='$realname', user_email='$user_email', femail='$femail', user_website='$user_website', user_password='$user_password', bio='$bio', user_icq='$user_icq', user_occ='$user_occ', user_from='$user_from', user_interests='$user_interests', user_sig='$user_sig', user_aim='$user_aim', user_yim='$user_yim', user_msnm='$user_msnm', newsletter='$newsletter', user_viewemail='$user_viewemail', user_allow_viewonline='$user_allow_viewonline', user_notify='$user_notify', user_notify_pm='$user_notify_pm', user_popup_pm='$user_popup_pm', user_attachsig='$user_attachsig', user_allowbbcode='$user_allowbbcode', user_allowhtml='$user_allowhtml', user_allowsmile='$user_allowsmile', user_timezone='$user_timezone', user_dateformat='$user_dateformat' WHERE user_id='$user_id'");
					$query="UPDATE ".$user_prefix."_users SET name='$realname', user_email='$user_email', femail='$femail', user_website='$user_website', user_password='$user_password', bio='$bio', user_icq='$user_icq', user_occ='$user_occ', user_from='$user_from', user_interests='$user_interests', user_sig='$user_sig', user_aim='$user_aim', user_yim='$user_yim', user_msnm='$user_msnm', newsletter='$newsletter', user_viewemail='$user_viewemail', user_allow_viewonline='$user_allow_viewonline', user_notify='$user_notify', user_notify_pm='$user_notify_pm', user_popup_pm='$user_popup_pm', user_attachsig='$user_attachsig', user_allowbbcode='$user_allowbbcode', user_allowhtml='$user_allowhtml', user_allowsmile='$user_allowsmile', user_timezone='$user_timezone', user_dateformat='$user_dateformat',usertype='$usertype',gradyear=$gradyear,company='$company',designation='$designation',specialization='$specialization',Company_Address_1='$Company_Address_1',Company_Address_2='$Company_Address_2',Company_Address_CITY='$Company_Address_CITY',Company_Address_STATE='$Company_Address_STATE',Company_Address_COUNTRY='$Company_Address_COUNTRY',Company_Address_ZIP='$Company_Address_ZIP',Company_Address_MOBILE='$Company_Address_MOBILE',Company_Address_PHONE='$Company_Address_PHONE',Company_Address_FAX='$Company_Address_FAX',Company_Address_EMAIL='$Company_Address_EMAIL',PERMANENT_Address_1='$PERMANENT_Address_1',PERMANENT_Address_2='$PERMANENT_Address_2',PERMANENT_Address_CITY='$PERMANENT_Address_CITY',PERMANENT_Address_STATE='$PERMANENT_Address_STATE',PERMANENT_Address_COUNTRY='$PERMANENT_Address_COUNTRY',PERMANENT_Address_ZIP='$PERMANENT_Address_ZIP',PERMANENT_Address_MOBILE='$PERMANENT_Address_MOBILE',PERMANENT_Address_PHONE='$PERMANENT_Address_PHONE',PERMANENT_Address_FAX='$PERMANENT_Address_FAX',PERMANENT_Address_EMAIL='$PERMANENT_Address_EMAIL',dasf_member='$dasf_member',guest_lectures_ok='$guest_lectures_ok',guest_lectures_topics='$guest_lectures_topics',summer_projects_ok='$summer_projects_ok',placements_ok='$placements_ok',financial_help_ok='$financial_help_ok',sex='$sex',is_married='$is_married',dob=DATE_FORMAT('$dob', '%Y-%m-%d') WHERE user_id='$user_id'";
						  
						  $db->sql_query($query);
		 				
						 //END-OF-FIX
		
						 $sql = "SELECT user_id, username, user_password, storynum, umode, uorder, thold, noscore, ublockon, theme FROM ".$user_prefix."_users WHERE username='$username' AND user_password='$user_password'";
						 $result = $db->sql_query($sql);
						 if ($db->sql_numrows($result) == 1) {
		    		 $userinfo = $db->sql_fetchrow($result);
		    					docookie($userinfo[user_id],$userinfo[username],$userinfo[user_password],$userinfo[storynum],$userinfo[umode],$userinfo[uorder],$userinfo[thold],$userinfo[noscore],$userinfo[ublockon],$userinfo[theme],$userinfo[commentmax]);
							} else {
		    				echo "<center>"._SOMETHINGWRONG."</center><br>";
								}
						$db->sql_query("UNLOCK TABLES");
	    } 
	    else {
					//FIX:DOMSNITT
						$company=check_html($company, nohtml);
    				$designation=check_html($designation, nohtml);
    				$gradyear=intval($gradyear);
												
						//$db->sql_query("UPDATE ".$user_prefix."_users SET name='$realname', user_email='$user_email', 		femail='$femail', user_website='$user_website', bio='$bio', user_icq='$user_icq', user_occ='$user_occ', user_from='$user_from', user_interests='$user_interests', user_sig='$user_sig', user_aim='$user_aim', user_yim='$user_yim', user_msnm='$user_msnm', newsletter='$newsletter', user_viewemail='$user_viewemail', user_allow_viewonline='$user_allow_viewonline', user_notify='$user_notify', user_notify_pm='$user_notify_pm', user_popup_pm='$user_popup_pm', user_attachsig='$user_attachsig', user_allowbbcode='$user_allowbbcode', user_allowhtml='$user_allowhtml', user_allowsmile='$user_allowsmile', user_timezone='$user_timezone', user_dateformat='$user_dateformat' WHERE user_id='$user_id'");
						$query="UPDATE ".$user_prefix."_users SET name='$realname', user_email='$user_email', femail='$femail', user_website='$user_website', bio='$bio', user_icq='$user_icq', user_occ='$user_occ', user_from='$user_from', user_interests='$user_interests', user_sig='$user_sig', user_aim='$user_aim', user_yim='$user_yim', user_msnm='$user_msnm', newsletter='$newsletter', user_viewemail='$user_viewemail', user_allow_viewonline='$user_allow_viewonline', user_notify='$user_notify', user_notify_pm='$user_notify_pm', user_popup_pm='$user_popup_pm', user_attachsig='$user_attachsig', user_allowbbcode='$user_allowbbcode', user_allowhtml='$user_allowhtml', user_allowsmile='$user_allowsmile', user_timezone='$user_timezone', user_dateformat='$user_dateformat' ,usertype='$usertype',gradyear=$gradyear,company='$company',designation='$designation',specialization='$specialization',Company_Address_1='$Company_Address_1',Company_Address_2='$Company_Address_2',Company_Address_CITY='$Company_Address_CITY',Company_Address_STATE='$Company_Address_STATE',Company_Address_COUNTRY='$Company_Address_COUNTRY',Company_Address_ZIP='$Company_Address_ZIP',Company_Address_MOBILE='$Company_Address_MOBILE',Company_Address_PHONE='$Company_Address_PHONE',Company_Address_FAX='$Company_Address_FAX',Company_Address_EMAIL='$Company_Address_EMAIL',PERMANENT_Address_1='$PERMANENT_Address_1',PERMANENT_Address_2='$PERMANENT_Address_2',PERMANENT_Address_CITY='$PERMANENT_Address_CITY',PERMANENT_Address_STATE='$PERMANENT_Address_STATE',PERMANENT_Address_COUNTRY='$PERMANENT_Address_COUNTRY',PERMANENT_Address_ZIP='$PERMANENT_Address_ZIP',PERMANENT_Address_MOBILE='$PERMANENT_Address_MOBILE',PERMANENT_Address_PHONE='$PERMANENT_Address_PHONE',PERMANENT_Address_FAX='$PERMANENT_Address_FAX',PERMANENT_Address_EMAIL='$PERMANENT_Address_EMAIL',dasf_member='$dasf_member',guest_lectures_ok='$guest_lectures_ok',guest_lectures_topics='$guest_lectures_topics',summer_projects_ok='$summer_projects_ok',placements_ok='$placements_ok',financial_help_ok='$financial_help_ok' ,sex='$sex',is_married='$is_married',dob=DATE_FORMAT('$dob', '%Y-%m-%d')  WHERE user_id='$user_id'";
							
						
							$db->sql_query($query);
						
						
						//END-OF-FIX
						
	    }
	    Header("Location: modules.php?name=$module_name");
	}
    }
}

function edithome() {
    global $user, $userinfo, $Default_Theme, $cookie, $broadcast_msg, $user_news, $storyhome, $module_name;
    cookiedecode($user);
    getusrinfo($user);
    if ((is_user($user)) AND (strtolower($userinfo['username']) == strtolower($cookie[1])) AND ($userinfo['user_password'] == $cookie[2])) {
    include ("header.php");
    OpenTable();
    echo "<center><font class=\"title\"><b>"._HOMECONFIG."</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    nav();
    CloseTable();
    echo "<br>";
    if($userinfo[theme]=="") {
        $userinfo[theme] = "$Default_Theme";
    }
    OpenTable();
    echo "<form action=\"modules.php?name=$module_name\" method=\"post\">";
    if ($user_news == 1) {
	echo "<b>"._NEWSINHOME."</b> "._MAX127." "
	    ."<input type=\"text\" name=\"storynum\" size=\"4\" maxlength=\"3\" value=\"$userinfo[storynum]\">"
	    ."<br><br>";
    } else {
	echo "<input type=\"hidden\" name=\"storynum\" value=\"$storyhome\">";
    }
    if ($userinfo[ublockon]==1) {
        $sel = "checked";
    }
    if ($broadcast_msg == 1) {
	if ($userinfo[broadcast] == 1) {
	    $sel1 = "checked";
	    $sel2 = "";
	} elseif ($userinfo[broadcast] == 0) {
	    $sel1 = "";
	    $sel2 = "checked";
	}
	echo "<b>"._MESSAGEACTIVATE."</b> <input type=\"radio\" name=\"broadcast\" value=\"1\" $sel1> "._YES." &nbsp;&nbsp;<input type=\"radio\" name=\"broadcast\" value=\"0\" $sel2>"._NO."<br><br>";
    } else {
	echo "<input type=\"hidden\" name=\"broadcast\" value=\"1\">";
    }
    echo "<input type=\"checkbox\" name=\"ublockon\" $sel>"
	." <b>"._ACTIVATEPERSONAL."</b>"
	."<br>"._CHECKTHISOPTION.""
	."<br>"._YOUCANUSEHTML."<br>"
	."<textarea cols=\"55\" rows=\"5\" name=\"ublock\">$userinfo[ublock]</textarea>"
	."<br><br>"
	."<input type=\"hidden\" name=\"username\" value=\"$userinfo[username]\">"
	."<input type=\"hidden\" name=\"user_id\" value=\"$userinfo[user_id]\">"
	."<input type=\"hidden\" name=\"op\" value=\"savehome\">"
	."<input type=\"submit\" value=\""._SAVECHANGES."\">"
	."</form>";
    CloseTable();
    include ("footer.php");
    } else {
	main($user);
    }
}

function chgtheme() {
    global $user, $userinfo, $Default_Theme, $cookie, $module_name;
    cookiedecode($user);
    getusrinfo($user);
    if ((is_user($user)) AND (strtolower($userinfo['username']) == strtolower($cookie[1])) AND ($userinfo['user_password'] == $cookie[2])) {
    include ("header.php");
    OpenTable();
    echo "<center><font class=\"title\"><b>"._THEMESELECTION."</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    nav();
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center>"
	."<form action=\"modules.php?name=$module_name\" method=\"post\">"
	."<b>"._SELECTTHEME."</b><br>"
	."<select name=\"theme\">";
    $handle=opendir('themes');
    while ($file = readdir($handle)) {
	if ( (!ereg("[.]",$file) AND file_exists("themes/$file/theme.php")) ) {
		$themelist .= "$file ";
	}
    }
    closedir($handle);
    $themelist = explode(" ", $themelist);
    sort($themelist);
    for ($i=0; $i < sizeof($themelist); $i++) {
    	if($themelist[$i]!="") {
    	    echo "<option value=\"$themelist[$i]\" ";
	    if((($userinfo[theme]=="") && ($themelist[$i]=="$Default_Theme")) || ($userinfo[theme]==$themelist[$i])) echo "selected";
	    echo ">$themelist[$i]\n";
	}
    }
    if($userinfo[theme]=="") $userinfo[theme] = "$Default_Theme";
    echo "</select><br>"
	.""._THEMETEXT1."<br>"
	.""._THEMETEXT2."<br>"
	.""._THEMETEXT3."<br><br>"
	."<input type=\"hidden\" name=\"user_id\" value=\"$userinfo[user_id]\">"
	."<input type=\"hidden\" name=\"op\" value=\"savetheme\">"
	."<input type=\"submit\" value=\""._SAVECHANGES."\">"
	."</form>";
    CloseTable();
    include ("footer.php");
    } else {
	main($user);
    }
}


function savehome($user_id, $username, $storynum, $ublockon, $ublock, $broadcast) {
    global $user, $cookie, $userinfo, $user_prefix, $db, $module_name;
    cookiedecode($user);
    $check = $cookie[1];
    $check2 = $cookie[2];
    $sql = "SELECT user_id, user_password FROM ".$user_prefix."_users WHERE username='$check'";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $vuid = intval($row[user_id]);
    $ccpass = $row[user_password];
    if (($user_id == $vuid) AND ($check2 == $ccpass)) {
	if(isset($ublockon)) $ublockon=1; else $ublockon=0;
	$ublock = FixQuotes($ublock);
	$db->sql_query("UPDATE ".$user_prefix."_users SET storynum='$storynum', ublockon='$ublockon', ublock='$ublock', broadcast='$broadcast' WHERE user_id='$user_id'");
	getusrinfo($user);
	docookie($userinfo[user_id],$userinfo[username],$userinfo[user_password],$userinfo[storynum],$userinfo[umode],$userinfo[uorder],$userinfo[thold],$userinfo[noscore],$userinfo[ublockon],$userinfo[theme],$userinfo[commentmax]);
	Header("Location: modules.php?name=$module_name");
    }
}

function savetheme($user_id, $theme) {
    global $user, $cookie, $userinfo, $user_prefix, $db, $module_name;
    cookiedecode($user);
    $check = $cookie[1];
    $check2 = $cookie[2];
    $theme_error = "";
    $sql = "SELECT user_id, user_password FROM ".$user_prefix."_users WHERE username='$check'";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $vuid = intval($row[user_id]);
    $ccpass = $row[user_password];
    if (($user_id == $vuid) AND ($check2 == $ccpass)) {
	$db->sql_query("UPDATE ".$user_prefix."_users SET user_style='$theme_id' WHERE user_id='$user_id'");
	$db->sql_query("UPDATE ".$user_prefix."_users SET theme='$theme' WHERE user_id='$user_id'");
	getusrinfo($user);
	docookie($userinfo[user_id],$userinfo[username],$userinfo[user_password],$userinfo[storynum],$userinfo[umode],$userinfo[uorder],$userinfo[thold],$userinfo[noscore],$userinfo[ublockon],$userinfo[theme],$userinfo[commentmax]);
	Header("Location: modules.php?name=$module_name&theme=$theme");
    }
}

function editcomm() {
    global $user, $userinfo, $cookie, $module_name;
    cookiedecode($user);
    getusrinfo($user);
	if ((is_user($user)) AND (strtolower($userinfo['username']) == strtolower($cookie[1])) AND ($userinfo['user_password'] == $cookie[2])) {
    include ("header.php");
    OpenTable();
    echo "<center><font class=\"title\"><b>"._COMMENTSCONFIG."</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    nav();
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<table cellpadding=\"8\" border=\"0\"><tr><td>"
	."<form action=\"modules.php?name=$module_name\" method=\"post\">"
	."<b>"._DISPLAYMODE."</b>"
	."<select name=\"umode\">";
    ?>
    <option value="nocomments" <?php if ($userinfo[umode] == 'nocomments') { echo "selected"; } ?>><?php echo _NOCOMMENTS ?>
    <option value="nested" <?php if ($userinfo[umode] == 'nested') { echo "selected"; } ?>><?php echo _NESTED ?>
    <option value="flat" <?php if ($userinfo[umode] == 'flat') { echo "selected"; } ?>><?php echo _FLAT ?>
    <option value="thread" <?php if (!isset($userinfo[umode]) || ($userinfo[umode]=="") || $userinfo[umode]=='thread') { echo "selected"; } ?>><?php echo _THREAD ?>
    </select>
    <br><br>
    <b><?php echo _SORTORDER ?></b>
    <select name="uorder">
    <option value="0" <?php if (!$userinfo[uorder]) { echo "selected"; } ?>><?php echo _OLDEST ?>
    <option value="1" <?php if ($userinfo[uorder]==1) { echo "selected"; } ?>><?php echo _NEWEST ?>
    <option value="2" <?php if ($userinfo[uorder]==2) { echo "selected"; } ?>><?php echo _HIGHEST ?>
    </select>
    <br><br>
    <b><?php echo _THRESHOLD ?></b>
    <?php echo _COMMENTSWILLIGNORED ?><br>
    <select name="thold">
    <option value="-1" <?php if ($userinfo[thold]==-1) { echo "selected"; } ?>>-1: <?php echo _UNCUT ?>
    <option value="0" <?php if ($userinfo[thold]==0) { echo "selected"; } ?>>0: <?php echo _EVERYTHING ?>
    <option value="1" <?php if ($userinfo[thold]==1) { echo "selected"; } ?>>1: <?php echo _FILTERMOSTANON ?>
    <option value="2" <?php if ($userinfo[thold]==2) { echo "selected"; } ?>>2: <?php echo _USCORE ?> +2
    <option value="3" <?php if ($userinfo[thold]==3) { echo "selected"; } ?>>3: <?php echo _USCORE ?> +3
    <option value="4" <?php if ($userinfo[thold]==4) { echo "selected"; } ?>>4: <?php echo _USCORE ?> +4
    <option value="5" <?php if ($userinfo[thold]==5) { echo "selected"; } ?>>5: <?php echo _USCORE ?> +5
    </select><br>
    <i><?php echo _SCORENOTE ?></i>
    <br><br>
    <INPUT type="checkbox" name="noscore" <?php if ($userinfo[noscore]==1) { echo "checked"; } ?>><b> <?php echo _NOSCORES ?></b> <?php echo _HIDDESCORES ?>
    <br><br>
    <b><?php echo _MAXCOMMENT ?></b> <?php echo _TRUNCATES ?><br>
    <input type="text" name="commentmax" value="<?php echo $userinfo[commentmax] ?>" size=11 maxlength=11> <?php echo _BYTESNOTE ?>
    <br><br>
    <input type="hidden" name="username" value="<?php echo"$userinfo[username]"; ?>">
    <input type="hidden" name="user_id" value="<?php echo"$userinfo[user_id]"; ?>">
    <input type="hidden" name="op" value="savecomm">
    <input type="submit" value="<?php echo _SAVECHANGES ?>">
    </form></td></tr></table>
    <?php
    CloseTable();
    echo "<br><br>";
    include ("footer.php");
    } else {
	main($user);
    }
}

function savecomm($user_id, $username, $umode, $uorder, $thold, $noscore, $commentmax) {
    global $user, $cookie, $userinfo, $user_prefix, $db, $module_name;
    cookiedecode($user);
    $check = $cookie[1];
    $check2 = $cookie[2];
    $sql = "SELECT user_id, user_password FROM ".$user_prefix."_users WHERE username='$check'";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $vuid = intval($row[user_id]);
    $ccpass = $row[user_password];
    if (($user_id == $vuid) AND ($check2 == $ccpass)) {
	if(isset($noscore)) $noscore=1; else $noscore=0;
	$db->sql_query("UPDATE ".$user_prefix."_users SET umode='$umode', uorder='$uorder', thold='$thold', noscore='$noscore', commentmax='$commentmax' WHERE user_id='$user_id'");
	getusrinfo($user);
	docookie($userinfo[user_id],$userinfo[username],$userinfo[user_password],$userinfo[storynum],$userinfo[umode],$userinfo[uorder],$userinfo[thold],$userinfo[noscore],$userinfo[ublockon],$userinfo[theme],$userinfo[commentmax]);
	Header("Location: modules.php?name=$module_name");
    }
}

function avatarlist($avatarcategory) {
    global $module_name;
    include("header.php");
$avatarcatname = ereg_replace ("_", "&nbsp;", $avatarcategory);
    title("".$avatarcategory." Avatar Gallery");
    Opentable();
    nav();
    CloseTable();
    Opentable();
    echo "<center><font class=\"title\"><b>"._AVAILABLEAVATARS." on category ".$avatarcatname."</b></font><br><br>"; 
  echo "<b>To Select Your Avatar Click On It</b><br><br></center>";
    Opentable2();
  echo "<center>";
$d = dir("modules/Forums/images/avatars/$avatarcategory");
$temcount = 1;
while (false !== ($entry = $d->read())) {
if( preg_match('/(\.gif$|\.png$|\.jpg|\.jpeg)$/is', $entry) ) {
if( $entry != '.' && $entry != '..' ) {
$patterns[0] = "/\.gif/";
$patterns[1] = "/\.png/";
$patterns[2] = "/\.jpg/";
$patterns[3] = "/\.jpeg/";
$patterns[4] = "/-/";
$patterns[5] = "/_/";
$replacements[5] = "";
$replacements[4] = "&nbsp;";
$replacements[3] = "";
$replacements[2] = "";
$replacements[1] = "";
$replacements[0] = "";
ksort($patterns);
ksort($replacements);
$entryname =  preg_replace($patterns, $replacements, $entry);
$a=1;
echo "<a href=\"modules.php?name=$module_name&op=avatarsave&category=$avatarcategory&avatar=$entry\"><img src=\"modules/Forums/images/avatars/$avatarcategory/$entry\" border=\"0\" alt=\"$entryname\" title=\"$entryname\" hspace=\"10\" vspace=\"10\"></a>";
 }
	    if ($temcount == 10) {
		echo "<br>";
		$temcount -= 10;
	    }
	    $temcount ++;
	}
    }
  echo "</center>";
    CloseTable2();
    echo "<center><br>"
	.""._GOBACK.""
	."<br></center>";
$d->close();
    CloseTable();
    include("footer.php");
}

function avatarsave($avatar, $category) {
    global $user_prefix, $db, $module_name, $user, $cookie;
	if (is_user($user)) {
        getusrinfo($user);
	cookiedecode($user);
	include("header.php");
	title("Avatar Selection Successful!");
	OpenTable();
	nav();
	CloseTable();
	OpenTable();
	$newavatar=$category."/".$avatar;
	$db->sql_query("UPDATE ".$user_prefix."_users SET user_avatar='$newavatar', user_avatar_type='3' WHERE username='$cookie[1]'");
	echo "<center><font class=\"content\">Avatar for ".$cookie[1]." Saved!</center></font><br><br>";
	if (ereg("(http)", $newavatar)) { echo "<center>Your New Avatar:<br><br><IMG alt=\"\" src=\"$newavatar\"><br><br> [ <a href=\"modules.php?name=$module_name&op=edituser\">Back to Profile</a> | <a href=\"modules.php?name=$module_name\">Done</a> ]<br><br></center>"; } elseif ($newavatar) { echo "<center>Your New Avatar:<br><br><IMG alt=\"\" src=\"modules/Forums/images/avatars/$newavatar\"><br><br>[ <a href=\"modules.php?name=$module_name&op=edituser\">Back to Profile</a> | <a href=\"modules.php?name=$module_name\">Done</a> ]<br><br></center>"; }
	CloseTable();
	include("footer.php");
    }
}

function avatarlinksave($avatar) {
    global $user_prefix, $db, $module_name, $user, $cookie;
	if (is_user($user)) {
        getusrinfo($user);
	cookiedecode($user);
	include("header.php");
	title("Avatar Selection Successful!");
	OpenTable();
	nav();
	CloseTable();
	OpenTable();
	$db->sql_query("UPDATE ".$user_prefix."_users SET user_avatar='$avatar', user_avatar_type='2' WHERE username='$cookie[1]'");
	echo "<center><font class=\"content\">Avatar for ".$cookie[1]." Saved!</center></font><br><br>";
	if (ereg("(http)", $avatar)) { echo "<center>Your New Avatar:<br><br><IMG alt=\"\" src=\"$avatar\"><br><br>[ <a href=\"modules.php?name=$module_name&op=edituser\">Back to Profile</a> | <a href=\"modules.php?name=$module_name\">Done</a> ]<br><br></center>"; } elseif ($avatar) { echo "<center>Your New Avatar:<br><br><IMG alt=\"\" src=\"modules/Forums/images/avatars/$avatar\"><br><br>[ <a href=\"modules.php?name=$module_name&op=edituser\">Back to Profile</a> | <a href=\"modules.php?name=$module_name\">Done</a> ]<br><br></center>"; }
	CloseTable();
	include("footer.php");
    }
}

function broadcast($the_message, $who) {
	global $prefix, $db, $broadcast_msg, $module_name, $cookie, $user, $userinfo;
    cookiedecode($user);
    getusrinfo($user);
    if ((is_user($user)) AND (strtolower($who) == strtolower($cookie[1])) AND (strtolower($userinfo['username']) == strtolower($cookie[1])) AND ($userinfo['user_password'] == $cookie[2])) {
    	$who = $cookie[1];
    	$the_message = htmlentities($the_message);
    	if ($broadcast_msg == 1) {
			include("header.php");
			title(""._BROADCAST."");
			OpenTable();
			$numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_public_messages WHERE who='$who'"));
			$the_message = FixQuotes(filter_text($the_message, "nohtml"));
			if ($the_message != "" AND $numrows == 0) {
			    $the_time = time();
			    $who = htmlspecialchars(stripslashes($who));
			    $db->sql_query("INSERT INTO ".$prefix."_public_messages VALUES (NULL, '$the_message', '$the_time', '$who')");
			    update_points(20);
			    echo "<center>"._BROADCASTSENT."<br><br>[ <a href=\"modules.php?name=$module_name\">"._RETURNPAGE."</a> ]</center>";
			} else {
			    echo "<center>"._BROADCASTNOTSENT."<br><br>[ <a href=\"modules.php?name=$module_name\">"._RETURNPAGE."</a> ]</center>";
			}
			CloseTable();
			include("footer.php");
		} else {
			echo "I don't like you...";
		}
    }
}

function my_headlines($hid, $url=0) {
    global $prefix, $db;
    $hid = intval($hid);
    $sql = "SELECT headlinesurl FROM ".$prefix."_headlines WHERE hid='$hid'";
    $result = $db->sql_query($sql);
    $row = $db->sql_fetchrow($result);
    $url = $row[headlinesurl];
    $rdf = parse_url($url);
    $fp = fsockopen($rdf['host'], 80, $errno, $errstr, 15);
    if (!$fp) {
        $content = "<font class=\"content\">Problema!</font>";
        return;
    }
    if ($fp) {
        fputs($fp, "GET " . $rdf['path'] . "?" . $rdf['query'] . " HTTP/1.0\r\n");
        fputs($fp, "HOST: " . $rdf['host'] . "\r\n\r\n");
        $string	= "";
        while(!feof($fp)) {
	    $pagetext = fgets($fp,300);
	    $string .= chop($pagetext);
	}
	fputs($fp,"Connection: close\r\n\r\n");
	fclose($fp);
	$items = explode("</item>",$string);
	$content = "<font class=\"content\">";
	for ($i=0;$i<10;$i++) {
	    $link = ereg_replace(".*<link>","",$items[$i]);
	    $link = ereg_replace("</link>.*","",$link);
	    $title2 = ereg_replace(".*<title>","",$items[$i]);
	    $title2 = ereg_replace("</title>.*","",$title2);
	    if ($items[$i] == "") {
	        $content = "";
	        return;
	    } else {
	        if (strcmp($link,$title)) {
	    	    $cont = 1;
		    $content .= "<img src=\"images/arrow.gif\" border=\"0\" hspace=\"5\"><a href=\"$link\" target=\"new\">$title2</a><br>\n";
		}
	    }
	}
    }
    echo "$content";
}

function CoolSize($size) {
    $mb = 1024*1024;
    if ( $size > $mb ) {
        $mysize = sprintf ("%01.2f",$size/$mb) . " MB";
    } elseif ( $size >= 1024 ) {
        $mysize = sprintf ("%01.2f",$size/1024) . " Kb";
    } else {
        $mysize = $size . " bytes";
    }
    return $mysize;
}


/* MAIN LOGIC */

//echo "<BR>-->Operation:" . $op; 

switch($op) {

  case "logout":
		logout();
		break;

  case "avatarsave":
		avatarsave($avatar, $category);
		break;

  case "avatarlinksave":
		avatarlinksave($avatar);
		break;

  case "broadcast":
		broadcast($the_message, $who);
		break;

    case "lost_pass":
			lost_pass();
			break;

    case "new user":
 			
 			//FIX:DOMSNITT
 				#confirmNewUser($username, $user_email, $user_password, $user_password2, $random_num, $gfx_check);
 				 confirmNewUser($username, $user_email, $user_password, $user_password2,$usertype,$gradyear,$company,$designation,$fullname,$specialization,$random_num, $gfx_check);	
 			//END-OF-FIX	
			break;

    case "finish":
			//FIX:DOMSNITT
			#finishNewUser($username, $user_email, $user_password, $random_num, $gfx_check);
			finishNewUser($username, $user_email, $user_password, $user_password2,$usertype,$gradyear,$company,$designation,$fullname,$specialization, $random_num, $gfx_check);
			//END-OF-FIX
			break;

    case "mailpasswd":
			mail_password($username, $code);
			break;

    case "userinfo":
			userinfo($username, $bypass, $hid, $url);
			break;

    case "login":
			login($username, $user_password, $redirect, $mode, $f, $t, $random_num, $gfx_check);
			break;

    case "edituser":
			edituser();
			break;

    case "saveuser":
    		  
   		    saveuser($realname, $user_email, $femail, $user_website, $user_icq, $user_aim, $user_yim, $user_msnm, $user_from, $user_occ, $user_interests, $newsletter, $user_viewemail, $user_allow_viewonline, $user_notify, $user_notify_pm, $user_popup_pm, $user_attachsig, $user_allowbbcode, $user_allowhtml, $user_allowsmile, $user_timezone, $user_dateformat, $user_sig, $bio, $user_password, $vpass, $username, $user_id,$usertype,$gradyear,$company,$designation,$specialization,$Company_Address_1,$Company_Address_2,$Company_Address_CITY,$Company_Address_STATE,$Company_Address_COUNTRY,$Company_Address_ZIP,$Company_Address_MOBILE,$Company_Address_PHONE,$Company_Address_FAX,$Company_Address_EMAIL,$PERMANENT_Address_1,$PERMANENT_Address_2,$PERMANENT_Address_CITY,$PERMANENT_Address_STATE,$PERMANENT_Address_COUNTRY,$PERMANENT_Address_ZIP,$PERMANENT_Address_MOBILE,$PERMANENT_Address_PHONE,$PERMANENT_Address_FAX,$PERMANENT_Address_EMAIL,$dasf_member,$guest_lectures_ok,$guest_lectures_topics,$summer_projects_ok,$placements_ok,$financial_help_ok,$sex,$dob,$is_married);
			break;

    case "edithome":
			edithome();
			break;
	
    case "chgtheme":
			chgtheme();
			break;
	
    case "savehome":
			savehome($user_id, $username, $storynum, $ublockon, $ublock, $broadcast);
			break;

    case "savetheme":
			savetheme($user_id, $theme);
			break;

    case "avatarlist":
			avatarlist($avatarcategory);
			break;

    case "editcomm":
			editcomm();
			break;

    case "savecomm":
			savecomm($user_id, $username, $umode, $uorder, $thold, $noscore, $commentmax);
			break;
		
    case "pass_lost":
			pass_lost();
			break;

    case "new_user":
        new_user();
        break;

    case "my_headlines":
			my_headlines($hid, $url);
			break;

    case "gfx":
			gfx($random_num);
			break;

    case "activate":
			activate($username, $check_num);
			break;

    case "CoolSize":
			CoolSize($size);
			break;

    default:
			main($user);
			break;

}

?>
