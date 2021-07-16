<?php
    require_once("sambungan.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GOJEK</title>
    <link rel="stylesheet" href="tampilan.css">
</head>
<body>
    <div class="badan-utama">    
        <header>
            <h2>GOJEK</h2>
            <p>PENDAFTARAN DRIVER BARU </p>
        </header>
        <nav class="navigasi">
            <ul>
                <li><a class="active" href="#home">Home</a></li>
                <li><a href="home_pemasukan.php">Masukan Data</a></li>
                <li><a href="home_edit_data.php">Edit Data</a></li>
            </ul>
        </nav> 
        <div class="menu">
            <div class="kotak">
                <h1 align="center"> Daftar Driver Terbaru</h1>
                    <table border="1" width="650px" align="center">
                        <thead>
                            <tr>
                            <th>ID</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>No HP</th>
                                <th>No SIM</th>
                                <th>Tanggal Lahir</th>
                                <th>Kendaraan</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $ambildata=mysqli_query($koneksi, "SELECT * FROM tb_driver");
                                while($a=mysqli_fetch_array($ambildata)){
                                    ?>
                                       <tr>
                                       <td><?php echo $a['driver_id'];?></td>
                                           <td><?php echo $a['driver_name'];?></td>
                                           <td><?php echo $a['driver_email'];?></td>
                                           <td><?php echo $a['driver_nohp'];?></td>
                                           <td><?php echo $a['driver_nosim'];?></td>
                                           <td><?php echo $a['driver_ttl'];?></td>
                                           <td><?php echo $a['driver_kendaraan'];?></td>

                                       </tr>
                                <?php
                                }
                            ?>
                        </tbody>
                    </table>
            </div>
        
        <footer>
        Copyright © 2021 Abiyans Dev 
        </footer>
    </div>
</body>
</html>