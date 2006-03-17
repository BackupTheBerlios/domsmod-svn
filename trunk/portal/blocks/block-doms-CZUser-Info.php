<?php 
/**********************************************/ 
/* CZUser InfoV4 Block                        */ 
/*                                            */ 
/* Copyright (c) 2002-2004 by Telli           */ 
/* http://www.codezwiz.com                    */ 
/*                                            */ 
/**********************************************/ 
if (eregi( "block-CZUser-Info.php", $_SERVER['PHP_SELF'])) 
{ 
    die("Access Denied"); 
} 

   // Some global definitions 
   global $user, $prefix, $gfx_chk, $admin, $userinfo, $db;

$showpms = "1"; //1 to Show Private Messages data - 0 is off 
$showmost = "1"; //1 to Show Mostonline data - 0 is off 
$dopmpopup = "1"; //1 to popup - 0 to turn off 

//You can comment this out if you know its installed.
$db->sql_query("CREATE TABLE IF NOT EXISTS $prefix"._mostonline." (total int(10) NOT NULL default '0', members int(10) NOT NULL default '0', nonmembers int(10) NOT NULL default '0',PRIMARY KEY  (`total`))");

   $content = "<br />"; 


//Include the language
include("language/CZUser-Info/CZUser-Info-english.php");

//Lastuser Name
function last_user() {
    global $db, $prefix;
    $sql = "SELECT username FROM ".$prefix."_users WHERE user_active = 1 AND user_level > 0 ORDER BY user_id DESC LIMIT 1";
    list($lastuser) = $db->sql_fetchrow($db->sql_query($sql));
    return $lastuser;
}

//Total Members
function numusers() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE user_id >= 0";
    list($numrows) = $db->sql_fetchrow($db->sql_query($sql));
    return $numrows;
}
//Total Students
function numStudents() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE usertype = 'Student'";
    list($numrows) = $db->sql_fetchrow($db->sql_query($sql));
    return $numrows;
}

//Total Alumni
function numAlumni() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE usertype = 'Alumni'";
    list($numrows) = $db->sql_fetchrow($db->sql_query($sql));
    return $numrows;
}

//Total Faculty
function numFaculty() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE usertype = 'Faculty'";
    list($numrows) = $db->sql_fetchrow($db->sql_query($sql));
    return $numrows;
}

//Total Webteam
function numWebteam() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE usertype = 'Webteam'";
    list($numrows) = $db->sql_fetchrow($db->sql_query($sql));
    return $numrows;
}

//Total Others
function numOthers() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE usertype = 'Others'";
    list($numrows) = $db->sql_fetchrow($db->sql_query($sql));
    return $numrows;
}




//Total Waiting
function waiting_users() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users_temp";
    list($numrowswaiting) = $db->sql_fetchrow($db->sql_query($sql));
    return $numrowswaiting;
}

//New Users Today and Yesterday
function new_users() {
    global $prefix, $db;
    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE user_regdate='".date("M d, Y")."'";
    list($userCount[0]) = $db->sql_fetchrow($db->sql_query($sql));

    $sql = "SELECT COUNT(*) FROM ".$prefix."_users WHERE user_regdate='".date("M d, Y", time()-86400)."'";
    list($userCount[1]) = $db->sql_fetchrow($db->sql_query($sql));
    return $userCount;
}

if ($dopmpopup == 1){
 getusrinfo($user); 
    if ($userinfo['user_popup_pm'] && $userinfo['user_new_privmsg']) { 
       $content .= "<script language=\"Javascript\" type=\"text/javascript\"> 
<!-- 
        window.open('modules.php?name=Private_Messages&file=index&mode=newpm&popup=1', '', 'HEIGHT=225,resizable=yes,WIDTH=400'); 
//--> 
</script>"; 
   } 
}   
    //Registered users online
    $members = $db->sql_query("SELECT w.uname, u.user_id, u.user_level, u.user_allow_viewonline FROM ".$prefix."_session AS w LEFT JOIN ".$prefix."_users AS u ON u.username = w.uname WHERE guest = '0' ORDER by u.user_id ASC");
    $guests = $db->sql_query("SELECT uname FROM ".$prefix."_session WHERE guest ='1'");

    //Online Total data
    $online_num[0] = $db->sql_numrows($members);
    $online_num[1] = $db->sql_numrows($guests);
    $online_num[2] = $online_num[0] + $online_num[1];

    //Assemble the online registered users 
    $who_online_now = ""; 
    $i = 1; 
    while ($session = $db->sql_fetchrow($members)) {
    //Allow View?
    if ($session['user_allow_viewonline'] || is_admin($admin)) { 
    if ($i < 10) $czi = "0$i"; else $czi = $i;

     $uname = $session['uname']; 
     $ulevel = $session['user_level'];  

                 if ($ulevel == 2) {
                 $who_online_now .= "<br />$czi.&nbsp;<A HREF=\"modules.php?name=Your_Account&amp;op=userinfo&amp;username=$uname\"  title=\""._CZ_VIEW." $uname's "._CZ_VIEWPP."\">$uname</a>&nbsp;<img src=\"images/CZUser/admin.gif\">\n"; 
                 } 
                 elseif ($ulevel == 3) {
                 $who_online_now .= "<br />$czi.&nbsp;<A HREF=\"modules.php?name=Your_Account&amp;op=userinfo&amp;username=$uname\"  title=\""._CZ_VIEW." $uname's "._CZ_VIEWPP."\">$uname</a></font>&nbsp;<img src=\"images/CZUser/staff.gif\">\n"; 
                 }
                 else {
           $who_online_now .= "<br />$czi.&nbsp;<A HREF=\"modules.php?name=Your_Account&amp;op=userinfo&amp;username=$uname\" title=\""._CZ_VIEW." $uname's "._CZ_VIEWPP."\">$uname</a></font>\n"; 
          } 
      $who_online_now .= ( $i != $online_num[0] ? "" : "" ); 
      $i++; 
   
      } else {
      $hidden++;
   }
 } //Allow View
$db->sql_freeresult($members);

   //Mostonline data
   $sql = "SELECT total, members, nonmembers FROM ".$prefix."_mostonline";
   $result = $db->sql_query($sql);
   $row = $db->sql_fetchrow($result);
   $total = $row[total];
   $members = $row[members];
   $nonmembers = $row[nonmembers];
   $db->sql_freeresult($result);

   //Break Mostonline Total?
   if ($total < $online_num[2]) {
   $db->sql_query("DELETE FROM ".$prefix."_mostonline WHERE total='$total' LIMIT 1");
   $db->sql_query("INSERT INTO ".$prefix."_mostonline VALUES ('$online_num[2]','$online_num[0]','$online_num[1]')");
   }



      //Greet User
      global $user, $userinfo, $cookie,$admin;
      cookiedecode($user);
      $urname = $cookie[1];
      $date = date ("H");
      if ($date < 11) {
      $gr = ""._CZ_GOODMORNINGUSER."$urname\n";
      } else if ($date < 17) {
      $gr = ""._CZ_GOODAFTERNOONUSER."$urname\n";
      } else if ($date < 23) {
      $gr = ""._CZ_GOODEVENINGUSER."$urname\n";
      } else { 
      $gr = ""._CZ_GOODMORNINGUSER."$urname\n";
   }

      //Greet Guest
      if ($date < 11) {
      $grg = ""._CZ_GOODMORNINGGUEST."\n";
      } else if ($date < 17) {
      $grg = ""._CZ_GOODAFTERNOONGUEST."\n";
      } else if ($date < 23) {
      $grg = ""._CZ_GOODEVENINGGUEST."\n";
      } else { 
      $grg = ""._CZ_GOODMORNINGGUEST."\n";
   }


   // Info for users who are logged in AND Guests 
      $last = new_users();
      $lastuser = last_user();

   $content .= "<img src=\"images/CZUser/group-2.gif\">\n";
   $content .= "<u><b>"._CZ_MEMBERSHIP."</u></b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TODAY."<b>".$last[0]."</b><br />\n"; 
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_YESTERDAY."<b>".$last[1]."</b></b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_WAITING."<b>".waiting_users()."</b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALMEMBERS."<b>".numusers()."</b><br />\n";

	$content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALALUMNI."<b>".numAlumni()."</b><br />\n";
	$content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALFACULTY."<b>".numFaculty()."</b><br />\n";

	$content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALSTUDENTS."<b>".numStudents()."</b><br />\n";

	$content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALWEBTEAM."<b>".numWebteam()."</b><br />\n";
   
	$content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALOTHERS."<b>".numOthers()."</b><br />\n";

   
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_LATEST."\n";
   $content .= "<a href=\"modules.php?name=Your_Account&amp;op=userinfo&amp;username=$lastuser\"><b>$lastuser</b></a><br />\n";

   //Line to separate
   $content .= "<hr noShade>";

   //Mostonline
   if ($showmost==1) {
   $content .= "<img src=\"images/CZUser/group-1.gif\">\n";
   $content .= "<u><b>"._CZ_MOSTONLINE."</u></b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_VISITORS."<b>$nonmembers</b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_MEMBERS."<b>$members</b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALONLINE."<b>$total</b><br />\n";

   //Line to separate
   $content .= "<hr noShade>";

  }//Show Most
 
   //Total Online
   $content .= "<img src=\"images/CZUser/group-3.gif\">\n";
   $content .= "<u><b>"._CZ_ONLINEINFO."</u></b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_VISITORS."<b>".$online_num[1]."</b><br />\n";
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_MEMBERS."<b>".$online_num[0]."</b><br />\n";
  if ($hidden ==""){ $hidden = "0"; }
  if ($hidden == 0) {
   } else { 
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_HIDDENUSERS."<b>$hidden</b><br />\n";
} 
   $content .= "<img src=\"images/CZUser/li.gif\"> "._CZ_TOTALONLINE."<b>".$online_num[2]."</b><br />\n";

   //Users Online List 
   if (is_user($user) || is_admin($admin)) {

   //Line to separate
   $content .= "<hr noShade>";
 
   $content .= "<img src=\"images/CZUser/online.gif\">\n";
   $content .= "<b><u>"._CZ_ONLINELIST."</b></u>$who_online_now\n"; 
   } 
?>