<?php

/************************************************************************/
/* PHP-NUKE: Advanced Content Management System                         */
/* ============================================                         */
/*                                                                      */
/* Block/Ban users based on their IP number                             */
/*                                                                      */
/* Copyright (c) 2004 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (!eregi("admin.php", $PHP_SELF)) { die ("Access Denied"); }

switch($op) {
    case "ipban":
    include("admin/modules/ipban.php");
    break;

    case "save_banned":
    include("admin/modules/ipban.php");
    break;

    case "ipban_delete":
    include("admin/modules/ipban.php");
    break;

}

?>