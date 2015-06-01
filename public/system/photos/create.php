<?php

/**
 * show_image.php5
 *
 * Example utility file for dynamically displaying images
 *
 * @author      Ian Selby
 * @version     1.0 (php 5 version)
 */
/*
 * RewriteCond %{REQUEST_FILENAME} !-f
   RewriteCond %{REQUEST_FILENAME} !-d
   RewriteRule ^dm_pics/thumbs/(\d{1,5}x\d{1,5}|[w|h|p]\d{1,5})/(.*)$ dm_pics/create.php?size=$1&file=$2 [QSA]
 */
$backup_dir = './thumbs/';
//include_once ('SimpleImage.php');


//**//

include_once ('easyphpthumbnail.class.php');
$outPutFileName = $backup_dir . $size . $fileName;
//**//


$fileName = $_GET ['file'];
$size = $_GET ['size'];

$thumb = new easyphpthumbnail ();
$thumb->Thumblocation = $backup_dir . $size . '/';
$thumb->Thumbprefix = '';
$thumb->Backgroundcolor = '#EFF2D3';

function CreateName($id, $idx, $ext = '.jpg') {
	return "{$id}_{$idx}{$ext}";
}

//$thumb->load ( $fileName );


if (preg_match ( '/([w|h|p])(\d{1,5})/', $size, $m )) {
	switch ($m [1]) {
		case 'w' :
			
			$thumb->Thumbwidth = $m [2];
			break;
		
		case 'h' :
			$thumb->Thumbheight = $m [2];
			break;
		
		case 'p' :
			$thumb->scale ( $m [2] );
			break;
		
		default :
			break;
	}
} else {
	list ( $w, $h ) = explode ( 'x', $size );
	
	if ($w > $h)
		$thumb->Thumbsize = $w;
	else
		$thumb->Thumbsize = $h;
		
	$thumb->RectH = $h;
	$thumb->RectW = $w;
	
	$thumb->Rect = true;
}
//chdir ( $backup_dir );
@mkdir ( $backup_dir . $size );

$thumb->Createthumb ( $fileName );
exit ();
?>