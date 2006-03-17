<?php

########################################################################
# PHP-Nuke Block: Total Hits v0.1                                      #
#                                                                      #
# Copyright (c) 2001 by C. Verhoef (cverhoef@gmx.net)                  #
#                                                                      #
########################################################################
# This program is free software. You can redistribute it and/or modify #
# it under the terms of the GNU General Public License as published by #
# the Free Software Foundation; either version 2 of the License.       # 
########################################################################
#         Additional security & Abstraction layer conversion           #
#                           2003 chatserv                              #
#      http://www.nukefixes.com -- http://www.nukeresources.com        #
########################################################################

if (eregi("block-Who_is_Online.php", $_SERVER['PHP_SELF'])) {
    Header("Location: index.php");
    die();
}

global $user, $cookie, $prefix, $db, $user_prefix;

cookiedecode($user);
$ip = $_SERVER["REMOTE_ADDR"];
$uname = $cookie[1];
if (!isset($uname)) {
    $uname = "$ip";
    $guest = 1;
}

$guest_online_num = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_session WHERE guest='1'"));
$member_online_num = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_session WHERE guest='0'"));

$who_online_num = $guest_online_num + $member_online_num;

$who_online = "<B>"._CURRENTLYONLINE." :$who_online_num</B><BR>"
              ._GUESTS." :$guest_online_num <br>"
              ._MEMBERS." :$member_online_num <br>";

$content = "$who_online";

$users_registered_num = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_users"));
$users_pending_num = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_users_temp"));
$users_total=$users_registered_num+$users_pending_num;

$content .= "<HR><B>"._CURRENTUSERS." :$users_total</B><BR>"
              ._USERSREGISTERD." :$users_registered_num <br>"
              ._USERSPENDING." :$users_pending_num <br>";
              
?>