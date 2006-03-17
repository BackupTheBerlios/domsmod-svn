<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* Upload Module From www.YourCodes.com                                 */
/* Mike Koenig                                                          */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}

require_once("mainfile.php");


include("header.php");

OpenTable();

include("upload.php");

CloseTable();

echo ("<br>");

OpenTable();

/*  echo "Developed By ";
  echo "<a href='http://tech.tailoredweb.com' target='_blank'>TailoredWeb.com</a>";
  echo ("<br>");
  echo "Mod By ";
  echo "<a href='http://yourcodes.com/index/index.php' target='_blank'>YourCodes.com</a>"; */
  
CloseTable();


include("footer.php");

?>