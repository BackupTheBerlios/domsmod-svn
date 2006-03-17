<?php
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
//   You may change maxsize, and allowable upload file types.
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//Mmaximum file size. You may increase or decrease.
$MAX_SIZE = 2 * 1024 * 1024;
                            
//Allowable file Mime Types. Add more mime types if you want
$FILE_MIMES = array('image/jpeg','image/jpg','image/gif'
                   ,'image/png','application/msword','application/powerpoint','application/pdf','application/excel'  );

//Allowable file ext. names. you may add more extension names.            
$FILE_EXTS  = array('.zip','.jpg','.png','.gif', '.rar', '.mp3', '.wav' ,'.mpeg', '.avi','.doc','.xls','.pdf','.ppt'); 

//Allow file delete? no, if only allow upload only
$DELETABLE  = true;                               


//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
//   Do not touch the below if you are not confident.
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
/************************************************************
 *     Setup variables
 ************************************************************/
$site_name = $_SERVER['HTTP_HOST'];
$url_dir = "http://".$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF']);
$url_this =  "http://".$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];

$upload_dir = "uploads/";
$upload_url = $url_dir."/uploads/";
$message ="";

/************************************************************
 *     Create Upload Directory
 ************************************************************/
if (!is_dir("files")) {
  /*
  if (!mkdir($upload_dir))
  	//die ("upload_files directory doesn't exist and creation failed");
  if (!chmod($upload_dir,0755))
  	die ("change permission to 755 failed.");
  	*/
}

/************************************************************
 *     Process User's Request
 ************************************************************/
if ($_REQUEST[del] && $DELETABLE)  {
  
  $resource = fopen("log.txt","a");
  fwrite($resource,date("Ymd h:i:s")."DELETE - $_SERVER[REMOTE_ADDR]"."$_REQUEST[del]\n");
  fclose($resource);
 
  
  if (strpos($_REQUEST[del],"/.") == false)                 
   {
   		
   		if(strpos($_REQUEST[del],$upload_dir) == false)  
  		{
  		
  			if (substr($_REQUEST[del],0,8)==$upload_dir) {
     				 unlink($_REQUEST[del]);
    				$message =  $_REQUEST[del] > " deleted successfully";
    				print "<script>window.location.href='$url_this?name=UploadIt&message=deleted successfully'</script>";
  			}
  	  }	 
  }
}
else if ($_FILES['userfile']) {
  $resource = fopen("log.txt","a");
  fwrite($resource,date("Ymd h:i:s")."UPLOAD - $_SERVER[REMOTE_ADDR]"
            .$_FILES['userfile']['name']." "
            .$_FILES['userfile']['type']."\n");
  fclose($resource);

	$file_type = $_FILES['userfile']['type']; 
  $file_name = $_FILES['userfile']['name'];
  $file_ext = strtolower(substr($file_name,strrpos($file_name,".")));

  //File Size Check
  if ( $_FILES['userfile']['size'] > $MAX_SIZE) 
     $message = "The file size is over " . $MAX_SIZE/(1024*1024) . " MB";
  //File Type/Extension Check
  else if (!in_array($file_type, $FILE_MIMES) 
          && !in_array($file_ext, $FILE_EXTS) )
     $message = "Sorry, File Extension is not allowed to be uploaded.";
  else
     $message = do_upload($upload_dir, $upload_url);
     $message = "File Uploaded";
  	
  print "<script>window.location.href='$url_this?name=UploadIt&message=$message'</script>";
}
else if (!$_FILES['userfile']);
else 
	$message = "Invalid File Specified.";

/************************************************************
 *     List Files
 ************************************************************/
$handle=opendir($upload_dir);
$filelist = "";
while ($file = readdir($handle)) {
	 //$message .=$file;
	 
   if(!dir_exists($file) && !is_link($file)) {
  // if(!is_dir($file) && !is_link($file)) {
      $filelist .= "<a href='$upload_dir$file'>".$file."</a>";
      if ($DELETABLE)
        $filelist .= " <a href='?name=UploadIt&del=$upload_dir".urlencode($file)."' title='delete'>x</a>";
      $filelist .= "<sub><small><small><font color=blue>  ".date("d-m H:i", filemtime($upload_dir.$file))
                   ."</font></small></small></sub>";
      $filelist .="<br>";
   }
}

function do_upload($upload_dir, $upload_url) {
	$temp_name = $_FILES['userfile']['tmp_name'];
	$file_name = $_FILES['userfile']['name']; 
  $file_name = str_replace("\\","",$file_name);
  $file_name = str_replace("'","",$file_name);
	$file_path = $upload_dir.$file_name;

	//File Name Check
  if ( $file_name =="") { 
  	$message = "Invalid File Name Specified";
  	return $message;
  }

  $result  =  move_uploaded_file($temp_name, $file_path);
  if (!chmod($file_path,0777))
   	$message = "change permission to 777 failed.";
  else
		//$message=$file_name . " Uploaded Successfully"; 
		header( 'Location: modules.php?name=UploadIt') ;
   }


function dir_exists($file) {
     
      
    if(is_dir($file)==false)
    {
    	 
    	 if(@readdir($file)==false)
    	 {
    	    if($file=="articles")
    	    {
    	    	return true;
    	    }
    	    else
    	    {
    	    	return false;	
    	    }
	    	}
  	  	else
    		{
    			 return true;
    		}
    }
    else
    {
    	return true;
    }
}

?>

<center>
   <font color=red><?=$_REQUEST[message]?></font>
   <font color=red><?=$message?></font>
   <br>

   <form name="upload" id="upload" ENCTYPE="multipart/form-data" method="post">
     Upload File <input type="file" id="userfile" name="userfile">
     <input type="submit" name="upload" value="Upload"><br><br>
     </center>
     <p align="left">
     <hr>
     <ul align="left">
     <li>We only allow these file-types: .jpg, .gif, .png, .zip, .rar, .mp3, .mpeg, .wav, .avi, .doc, .xls, .pdf, .ppt</li>
     <li>Max Upload File Size Permitted <?= $MAX_SIZE/(1024*1024) . " MB" ?></li>
     <li>Relative Path: uploads/fileXXXname.xxx [for Hyperlinking with in the content]</li>
     <li>Full Path: http://www.domsnittalumni.net/portal/uploads/fileXXXname.xxx</li> 
     <li><font color=red>Please check for virus before uploading the files.</font></li></ul>
     </P>
   </form>

   <center>
   <br><b>Uploaded Files</b>
   <hr width=50%>
   <?=$filelist?>
   <hr width=50%>
</center>
 

