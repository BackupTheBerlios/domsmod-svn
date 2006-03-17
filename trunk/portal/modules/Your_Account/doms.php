<?php

/*
 * Created on Dec 10, 2005
 */

//FIX:DOMSNITT
define("_FULLNAME","Full Name");
define("_REGNEWUSERTYPE","You are a");
define("_REGNEWUSERGRADYEAR","Graduation Year[Year of Passing]");
define("_REGNEWUSERCOMPANY","Current Company");
define("_REGNEWUSERDESGN","Current Designation");
define("_SPECIALIZATION","Specialization");

define("_DOB","Date of Birth(YYYY-MM-DD)");
define("_SEX","SEX");
define("_MARTIALSTATUS","I am Married");


define("_DASFMEMBER","I am a DASF Board Member");
define("_GUESTLECTURESOK","You can contact me for guest lectures");
define("_GUESTLECTURESTOPICS","My Guest lecture topics would be");
define("_SUMMERPROJECTSOK","You can contact me for summer projects");
define("_PLACEMENTSOK","You contact me for placements");
define("_FINANCIALAID","You contact me for financial contributions");
define("_COMPANYADDRESS","Company Address");
define("_PERMANENTADDRESS","Permanent Address");


define("_ADDRESS1","Street");
define("_ADDRESS2","Area");
define("_CITY","City");
define("_STATE","State");
define("_COUNTRY","Country");
define("_ZIP","Zip");
define("_MOBILE","Mobile");
define("_PHONE","Phone");
define("_FAX","Fax");
define("_EMAIL","Email");
  
define("_ALUMNIPREFERENCES","Alumni Involvement Level");
define("_PERSONALPREFERENCES","Website Settings");  
define("_USAGENOTICE","Notice: By registering you would be accepting DOMSNIITALUMNI.net Usage Policy");

//END-OF-FIX


 /**
  *Function: Get User Types
  */
function getUserTypes() {
	$usertypes = array ();
	$usertypes["Alumni"] = "Alumni";
	$usertypes["Faculty"] = "Faculty";
	$usertypes["Student"] = "Student";
	$usertypes["WebTeam"] = "WebTeam";
	$usertypes["Other"] = "Other";
	return $usertypes;
}
 /**
  *Function: Get User Type Options
  */
function getUserTypesOptions() {
	$usertypes = getUserTypes();
	$keys = array_keys($usertypes);
	$optString;
	foreach ($keys as $okey) {
		$optString = $optString."<option value=$okey>$usertypes[$okey]</option>";
	}
	return $optString;
}
 /**
  *Function: Get User Type Options with Selected Keys
  */
function getUserTypesOptionsWithSelected($skey) {
	$usertypes = getUserTypes();
	$keys = array_keys($usertypes);
	$optString;
	foreach ($keys as $okey) {
		if (strcasecmp($okey, $skey) == 0) {
			$optString = $optString."<option value=\"$okey\" selected>$usertypes[$okey]</option>";
		} else {
			$optString = $optString."<option value=\"$okey\">$usertypes[$okey]</option>";
		}
	}
	return $optString;
}
 /**
  *Function: Get Graduation year options
  */
function getGraduationYears($yr) {
	$upto = date("Y", time()) + 2;
	if (strcasecmp($yr, "default") == 0) {
		$stryears = "<option value=\"0\" selected>NA</option>";
		$yr = 0;
	} else {
		$stryears = "<option value=\"0\">NA</option>";
	}
	for ($i = 1984; $i <= $upto; $i ++) {
		if ($yr == $i) {
			$stryears = $stryears."<option value=\"$i\" selected>$i</option>";
		} else {
			$stryears = $stryears."<option value=\"$i\">$i</option>";
		}
	}
	return $stryears;
}

	
 /**
  *Function: Get Specialization
  */
 
  function getSpecialization()
  {
  		$specialization = array ();
			$specialization["Finance"] = "Finance";
			$specialization["HR"] = "HR";
			$specialization["Production"] = "Production";
			$specialization["Marketing"] = "Marketing";
			$specialization["Systems"] = "Systems";
			$specialization["General"] = "General";
			$specialization["Others"] = "Others";
			
			 return $specialization;
  }
 /**
  *Function: Get Specialization Options
  */
function getSpecializationOptions() {
	$specialization = getSpecialization();
	$keys = array_keys($specialization);
	$optString;
	foreach ($keys as $okey) {
		$optString = $optString."<option value=$okey>$specialization[$okey]</option>";
	}
	return $optString;
}

 /**
  *Function: Get Specialization Options with Selected Key
  */
function getSpecializationOptionsWithSelected($skey) {
	$specialization = getSpecialization();
	$keys = array_keys($specialization);
	$optString;
	foreach ($keys as $okey) {
		if (strcasecmp($okey, $skey) == 0) {
			$optString = $optString."<option value=\"$okey\" selected>$specialization[$okey]</option>";
		} else {
			$optString = $optString."<option value=\"$okey\">$specialization[$okey]</option>";
		}
	}
	return $optString;
}

/***
 * Function: To show Country codes
 */

function getCountryOptions(){
	global $db, $user_prefix, $module_name, $language;
	$sql="Select * from ".$user_prefix."_countrycodes";
	$result = $db->sql_query($sql);
 	while ($row = $db->sql_fetchrow($result)){
 		$optString = $optString."<option value=$row[code]>$row[country]</option>";
 	}
  return $optString;
}

/***
 * Function: To show Country codes with Selected Options
 */
function getCountryOptionsWithSelectedOption($code)
{
	global $db, $user_prefix, $module_name, $language;
	
	$sql="Select * from ".$user_prefix."_countrycodes";
	$result = $db->sql_query($sql);
	$optString ="";
  while ( $row = $db->sql_fetchrow($result) ){
    if (strcasecmp($row["code"], $code) == 0) {
  	  $optString = $optString."<option value=$row[code] selected>$row[country]</option>";
  	}
  	else{
  		$optString = $optString."<option value=$row[code]>$row[country]</option>";
  	}
  }
	return $optString;
}


function getSexTypes()
{
	$sexTypes = array ();
	$sexTypes["M"] = "Male";
	$sexTypes["F"] = "Female";
	return $sexTypes;
}

 /**
  *Function: Get Sex Type Options
  */
function getSexTypesOptions() {
	$sextypes = getSexTypes();
	$keys = array_keys($sextypes);
	$optString;
	foreach ($keys as $okey) {
		$optString = $optString."<option value=$okey>$sextypes[$okey]</option>";
	}
	return $optString;
}
 
 /**
  *Function: Get Sex Type Options with Selected Keys
  */
function getSexTypesOptionsWithSelected($skey) {
	$sextypes = getSexTypes();
	$keys = array_keys($sextypes);
	$optString;
	foreach ($keys as $okey) {
		if (strcasecmp($okey, $skey) == 0) {
			$optString = $optString."<option value=\"$okey\" selected>$sextypes[$okey]</option>";
		} else {
			$optString = $optString."<option value=\"$okey\">$sextypes[$okey]</option>";
		}
	}
	return $optString;
}

	/***
 	 * Function: To Log
 	 */
 	function toLog($msg)
 	{
 	  if (!$DBFile = fopen("PortalDebug.txt", "a")) {
      echo "Cannot open file ($DBGFileName)";
      exit;
  	 }
 	 // Write $somecontent to our opened file.
   if (fwrite($DBFile, "\n".$msg) === FALSE) {
       echo "Cannot write to file ($DBGFileName)";
       exit;
   }
    fclose($DBFile);
  }
 
 
 

?>

