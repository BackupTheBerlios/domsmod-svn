 <?php
 	
 /***************************************************************
 *					HTTP HANDLER LAYER For PHP												 *	
 *																														 *		
 ***************************************************************/
 	global $DBGFileName,$DBFile;
  $DBGFileName = "HTTPHandlerDebug.txt";
  	
 	// MAIN LOGIC
 	echo "<HTML><BODY>";
 	 
 	$keys = array_keys($_POST);
 	foreach($keys as $key)
 	{
  	
  	toLog("\n" . $key . " => "  . $_POST[$key]);
 	}
 	echo "</BODY></HTML>";
 	
  	
 	  
 	
 	// FUNCTIONS
 	
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
   if (fwrite($DBFile, $msg,strlen($msg)) === FALSE) {
       echo "Cannot write to file ($DBGFileName)";
       exit;
   }
 	  echo "<BR> -->  " . $msg;	
    fclose($DBFile);
  }
 	
 ?>