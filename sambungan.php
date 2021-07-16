<?php
$host="localhost";
$username="root";
$password="";
$database="abijek";
$koneksi=mysqli_connect($host, $username, $password, $database);
if(!$koneksi){
	echo "<SCRIPT type='text/javascript'>
	alert('SAMBUNGAN GAGAL');
	windows.location.replace(\"index.php\");
	</SCRIPT>";
}
?>
