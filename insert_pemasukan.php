<?php
	require_once("sambungan.php");
	$driverid=$_POST['id'];
	$drivernama=$_POST['nama'];
	$driveremail=$_POST['email'];
	$drivernohp=$_POST['nohp'];
	$drivernosim=$_POST['nosim'];
	$driverttl=$_POST['ttl'];
	$driverkendaraan=$_POST['kendaraan'];
	$insert="INSERT INTO tb_driver (driver_id, driver_name, driver_email, driver_nohp, driver_nosim, driver_ttl, driver_kendaraan) 
	values 
	('$driverid','$drivernama','$driveremail','$drivernohp','$drivernosim','$driverttl','$driverkendaraan')";
	$insertq=mysqli_query($koneksi,$insert) or trigger_error(mysqli_error($koneksi));
	$pesan=((mysqli_affected_rows($koneksi))?"Berhasil menambahkan":"Ada kesalahan".mysqli_error($koneksi));

	if($insertq){
		header('location:home_pemasukan.php');
	}else{
		echo "<SCRIPT type='text/javascript'>
		alert('GAGAL MENAMBAHKAN DATA');
		windows.location.replace(\"/index.php\");
		</SCRIPT>";
	}
?>