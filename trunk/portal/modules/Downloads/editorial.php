<?php

// ######################################################################
// # PHP-Nuke                                                           #
// #====================================================================#
// #  Copyright (c) 2003 - Francisco Burzi                              #
// #  http://phpnuke.org/                                               #
// #====================================================================#
// # Paladin's Downloads Modules                                        #
// #====================================================================#
// #  Copyright (c) 2003 - Darren Poulton (paladin@intaleather.com.au)  #
// #  http://paladin.intaleather.com.au/                                #
// #                                                                    #
// #  Developed from the PHP-Nuke 6.5 Standard Downloads Module         #
// #  Copyright (c) 2003 - Francisco Burzi                              #
// #  http://phpnuke.org/                                               #
// #====================================================================#
// #  Use of this program is goverened by the terms of the GNU General  #
// #     Public License (GPL - version 1 or 2) as published by the      #
// #           Free Software Foundation (http://www.gnu.org/)           #
// ######################################################################

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}

// ######################################################################
// FUNCTIONS :: START
// ######################################################################

// ######################################################################
// FUNCTION : viewdownloadeditorial($lid, $ttitle)
// ######################################################################
function viewdownloadeditorial($lid, $ttitle) {
    global $prefix, $dbi, $admin, $module_name;
    include("header.php");
    include("modules/$module_name/d_config.php");
    menu(1);

    $result=sql_query("SELECT adminid, editorialtimestamp, editorialtext, editorialtitle FROM ".$prefix."_downloads_editorials WHERE downloadid = $lid", $dbi);
    $recordexist = sql_num_rows($result, $dbi);

    $transfertitle = ereg_replace ("_", " ", $ttitle);
    $transfertitle = stripslashes($transfertitle);
    $displaytitle = $transfertitle;
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>"._DOWNLOADPROFILE.": $displaytitle</b></font><br>";
    downloadinfomenu($lid, $ttitle);
    if ($recordexist != 0) {
	while(list($adminid, $editorialtimestamp, $editorialtext, $editorialtitle)=sql_fetch_row($result, $dbi)) {
    	    $editorialtitle = stripslashes($editorialtitle); $editorialtext = stripslashes($editorialtext);
    	    ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})", $editorialtimestamp, $editorialtime);
	    $editorialtime = strftime("%F",mktime($editorialtime[4],$editorialtime[5],$editorialtime[6],$editorialtime[2],$editorialtime[3],$editorialtime[1]));
	    $date_array = explode("-", $editorialtime);
	    $timestamp = mktime(0, 0, 0, $date_array["1"], $date_array["2"], $date_array["0"]);
       	    $formatted_date = date("F j, Y", $timestamp);
	    echo "<br><br>";
   	    OpenTable2();
	    echo "<center><font class=\"option\"><b>'$editorialtitle'</b></font></center>"
		."<center><font class=\"tiny\">"._EDITORIALBY." $adminid - $formatted_date</font></center><br><br>"
		."$editorialtext";
	    CloseTable2();
   	 }
    } else {
    	echo "<br><br><center><font class=\"option\"><b>"._NOEDITORIAL."</b></font></center>";
    }
    echo "<br><br><center>";
    downloadfooter($lid,$ttitle);
    echo "</center>";
    CloseTable();
    include("footer.php");
}

?>