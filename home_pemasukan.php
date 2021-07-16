<?php
    require_once("sambungan.php");
?>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
    <title>GOJEK</title>
    <link rel="stylesheet" href="tampilan.css">
</head>
<body>
<div class="badan-utama">    
        <header>
            <h2>GOJEK</h2>
            <p>MASUKAN DATA</p>
        </header>
        <nav class="navigasi">
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a class="active" href="home_pemasukan.php">Masukan Data</a></li>
                <li><a href="home_edit_data.php">Edit Data</a></li>

            </ul>
        </nav> 
        <div class="menu">
            <div class="kotak">
                <form action="insert_pemasukan.php" method="post">
                    <h2 align="center">MASUKKAN DATA</h2>
                    ID DRIVER     : <input type="text" name="id"><br>
                    NAMA          : <input type="text" name="nama"><br>
                    EMAIL         : <input type="text" name="email"><br>
                    NO HP         : <input type="text" name="nohp"><br>
                    NO SIM        : <input type="text" name="nosim"><br>
                    TANGGAL LAHIR : <input type="date" name="ttl" value = "1999-11-20" ><br>
                    KENDARAAN     : <input type="text" name="kendaraan"><br>
                    <input type="SUBMIT" value="Simpan" class="tombol">
                </form>
             </div>
        </div>
        <div class="menu">
            <div class="kotak">
                <h1 align="center"> Data Terdaftar</h1>
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
        </div>
        <footer>
        Copyright © 2021 Abiyans Dev 
        </footer>
    </div>	
</body>
</html>