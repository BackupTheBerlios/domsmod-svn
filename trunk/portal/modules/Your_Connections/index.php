<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* My Connections: www.domsnittalumni.net                               */
/* Satish Kumar                                                         */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}

require_once("mainfile.php");



global $admin, $user,$cookie, $prefix, $dbi, $user_prefix;
cookiedecode($user);
$ip = $_SERVER["REMOTE_ADDR"];
$uname = $cookie[1];
	



include("header.php");



if (is_user($user)) {
	
	// Your Batch Mates
	OpenTable();	
	$query="select a.name,a.username,a.gradyear,a.company from nuke_users a ,nuke_users b where a.gradyear=b.gradyear and b.username='$uname' and a.username!= '$uname'";
  printDetails($query,"Batch Mates");
  CloseTable();  
  
  // Your Immediate Juniors

	echo "<BR>";
	OpenTable();	
	$query="select a.name,a.username,a.gradyear,a.company from nuke_users a ,nuke_users b where a.gradyear=(b.gradyear-1) and b.username='$uname'";
  printDetails($query,"Immediate Juniors");
  CloseTable();  
 
   // Your Immediate Seniors 
  echo "<BR>";
  OpenTable();	
	$query="select a.name,a.username,a.gradyear,a.company from nuke_users a ,nuke_users b where a.gradyear=(b.gradyear+1) and b.username='$uname'";
  printDetails($query,"Immediate Seniors");
  CloseTable();  
  
}




function printDetails($query,$type)
{
  global $admin, $user,$cookie, $prefix, $dbi, $user_prefix;
  $result = sql_query($query, $dbi);
  $numrows = sql_num_rows($result, $dbi);
  echo "<Br><B>Your " . $type . " : " . $numrows . "</B><HR>";
  echo "<table width=\"60%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
   . "<tr><td bgcolor=\"#000000\"><table width=\"100%\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\">"
   . "</tr><tr>"
   . "<th height=\"25\" colspan=\"1\" align=\"center\" wrap><font color=\"#28313C\"><strong>Name</strong></font></th>"
   . "<th height=\"15\" colspan=\"1\" align=\"center\" wrap><font color=\"#28313C\"><strong>UserId</strong></font></th>"
   . "<th height=\"10\" colspan=\"1\" align=\"center\" wrap><font color=\"#28313C\"><strong>Year</strong></font></th>"
   . "<th height=\"10\" colspan=\"1\" align=\"center\" wrap><font color=\"#28313C\"><strong>Company</strong></font></th>"
   
   . "</tr>";
  while(list($name,$username,$gradyear,$company) = sql_fetch_row($result, $dbi)) {
  
  
   $username = "<a href='http://localhost/modules.php?name=Your_Account&op=userinfo&username=$username'>" . $username . "</a>";
   
   echo "<tr><td class=\"row1\">" . $name . "</td>"
   . "<td  class=\"row2\">" . $username . "</td>"
   . "<td  class=\"row1\">" . $gradyear . "</td>"
   . "<td  class=\"row2\">" . $company . "</td>"
   
   . "</tr>";
   //echo    $name . " [" . $username . "]" . "<BR>";
  
  }
  echo "</table>";

}

include("footer.php");

?>