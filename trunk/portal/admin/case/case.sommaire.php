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

if (!eregi("admin.php", $PHP_SELF)) { die ("Acc&egrave;s Refus&eacute;"); }

switch($op) {

    case "sommaire":
  //  case "deletecat":
  //  case "send":
  //  case "upgrade":

    include("admin/modules/sommaire.php");
    break;

}

?>
