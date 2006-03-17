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

if (!eregi("admin.php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }
$module_name = "Your_Account";
include_once("modules/$module_name/admin/language/lang-".$currentlang.".php");

switch($op) {
   //FIX:DOMSNITT   
  	case "advancedUserManager":
		case "advancedUserMangerViewUser":
		case "advacnedUserManagerDel":
		case "modifyLastVisit":
		case "modifyLastVisitSave":
		case "aumInactiveRegList":
		case "aumActivateTempUser":
		case "aumActivateTempUserConfirm":
		case "aumResendEmail":
		case "aumResendEmailConfirm":
		case "aumDelInactiveRegUser":
		case "aumDelInactiveRegUserConfirm":
		case "aumViewInactiveRegUser":
		case "aumInactiveRegUserManager":
		case "viewUser":
		case "aumMailDomainFilter":
		case "aumMDFilterAdd":
		case "aumMDFilterDelete":
		case "aumDUPConfig":
		case "aumDUPConfigSave":
		case "aumPruneQRemove":
		case "aumUserTempRemove":
		case "aumDeadUserList":
		case "aumDeadUserRemove":
		case "aumPruneQList":
		case "aumPruneQListDelete":
	//END-OF-FIX    
    case "mod_users":
    case "modifyUser":
    case "updateUser":
    case "delUser":
    case "delUserConf":
    case "addUser":
    include("modules/$module_name/admin/index.php");
    break;

}

?>