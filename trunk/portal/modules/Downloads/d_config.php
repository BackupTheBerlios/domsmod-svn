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

// ######################################################################
// # Downloads Preferences
// ######################################################################
// #
// # $perpage:      	    		How many downloads to show on each page?
// # $popular:      	    		How many hits need a download to be listed as popular?
// # $newdownloads:     	    	How many downloads to display in the New Downloads Page?
// # $topdownloads:     	    	How many downloads to display in The Best Downloads Page? (Most Popular)
// # $downloadsresults: 	    	How many downloads to display on each search result page?
// # $downloads_anonadddownloadlock:Lock Unregistered users from Suggesting New Downloads? (1=Yes 0=No)
// # $anonwaitdays:        			Number of days anonymous users need to wait to vote on a download
// # $outsidewaitdays:     			Number of days outside users need to wait to vote on a download (checks IP)
// # $useoutsidevoting:        		Allow Webmasters to put vote downloads on their site (1=Yes 0=No)
// # $anonweight:          			How many Unregistered User vote per 1 Registered User Vote?
// # $outsideweight:       			How many Outside User vote per 1 Registered User Vote?
// # $detailvotedecimal:       		Let Detailed Vote Summary Decimal out to N places. (no max)
// # $mainvotedecimal:     			Let Main Vote Summary Decimal show out to N places. (max 4)
// # $topdownloadspercentrigger:   	1 to Show Top Downloads as a Percentage (else # of downloads)
// # $topdownloads:            		Either # of downloads OR percentage to show (percentage as whole number. #/100)
// # $mostpopdownloadspercentrigger:1 to Show Most Popular Downloads as a Percentage (else # of downloads)
// # $mostpopdownloads:        		Either # of downloads OR percentage to show (percentage as whole number. #/100)
// # $featurebox:          			1 to Show Feature Download Box on downloads Main Page? (1=Yes 0=No)
// # $downloadvotemin:         		Number votes needed to make the 'top 10' list
// # $blockunregmodify:        		Block unregistered users from suggesting downloads changes? (1=Yes 0=No)
// # $show_links_num:              	Show the number of links for each category? (1=Yes 0=No)
// # $viewrightblocks:				1 to Show Right Blocks (1=Yes 0=No)
// # $show_links_info:				1 to Show Latest and Top Links (1=Yes 0=No)
// # $show_links_inum:				Number of Latest and Top Links to Show
// #
// ######################################################################

$perpage = 10;
$popular = 500;
$anonwaitdays = 1;
$outsidewaitdays = 1;
$useoutsidevoting = 1;
$anonweight = 10;
$outsideweight = 20;
$detailvotedecimal = 2;
$mainvotedecimal = 1;
$featurebox = 1;
$blockunregmodify = 0;
$newdownloads = 10;
$topdownloads = 25;
$downloadsresults = 10;
$downloads_anonadddownloadlock = 0;
$user_adddownload = 1;
$topdownloadspercentrigger = 0;
$topdownloads = 25;
$mostpopdownloadspercentrigger = 0;
$mostpopdownloads = 25;
$downloadvotemin = 1;
$viewrightblocks = 1;
$show_links_num = 1;
$show_links_info = 1;
$show_links_inum = 10;

?>