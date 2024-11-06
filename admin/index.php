<?php
session_start();
require_once("../config/koneksi.php");

if (!isset($_SESSION['userid']) || $_SESSION['status'] != 'login') {
    echo "<script>
        alert('Anda belum login');
        location.href='../index.php';
    </script>";
    exit();
}

$userid = $_SESSION['userid'];
$is_admin = $_SESSION['is_admin'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ffafbd 0%, #ffc3a0 100%);
            background-attachment: fixed;
            background-size: cover;
            color: #333;
        }
        .navbar {
            background-color: rgba(255, 255, 255, 0.6);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand, .nav-link, .btn-outline-danger {
            color: #333 !important;
            font-weight: 500;
        }
        .navbar-toggler-icon {
            background-color: black;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease;
            background-color: rgba(255, 255, 255, 0.9);
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card img {
            height: 200px;
            object-fit: cover;
            width: 100%;
            transition: transform 0.3s ease;
        }
        .card img:hover {
            transform: scale(1.05);
        }
        .card-footer {
            background-color: #4a90e2;
            color: white;
            text-align: center;
        }
        .modal-content {
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.modal-header {
    border-bottom: none;
    background-color: rgba(255, 255, 255, 0.8);
}

.modal-title {
    font-weight: bold;
    color: #333;
}

.modal-body {
    background-color: rgba(255, 255, 255, 0.9);
}

.card {
    border: none;
}

.btn-outline-primary {
    background-color: #4a90e2;
    color: white;
}

.btn-outline-primary:hover {
    background-color: #007bff;
    color: white;
}

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="index.php">Website Galeri</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav me-auto">
                <a href="home.php" class="nav-link">Home</a>
                <a href="album.php" class="nav-link">Album</a>
                <a href="foto.php" class="nav-link">Foto</a>
            </div>
            <a href="../config/aksi_logout.php" class="btn btn-outline-danger m-1">Keluar</a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <?php
            $query = mysqli_query($koneksi, "SELECT * FROM foto INNER JOIN user ON foto.id_user=user.id_user INNER JOIN album ON foto.id_album=album.id_album");
            
            if (!$query) {
                die("Query Error: " . mysqli_error($koneksi));
            }

            if (mysqli_num_rows($query) == 0) {
                echo "<p class='text-center'>Tidak ada foto yang ditemukan.</p>";
            } else {
                while ($data = mysqli_fetch_array($query)) {
                    $fotoid = $data['id_foto'];
                    $imgPath = "../assets/img/" . $data['lokasi_file'];
                    if (!file_exists($imgPath)) {
                        continue;
                    }
        ?>
        
        <div class="col-md-3 mb-4">   
    <a type="button" data-bs-toggle="modal" data-bs-target="#komentar<?php echo $data['id_foto'] ?>">
        <div class="card">
            <img src="<?php echo $imgPath; ?>" title="<?php echo htmlspecialchars($data['judul_foto']); ?>" class="img-fluid rounded">
            <div class="card-footer text-center">
                <?php echo htmlspecialchars($data['judul_foto']); ?>
                
                <!-- Like Feature -->
                <?php 
                    $fotoid = $data['id_foto'];
                    $ceksuka = mysqli_query($koneksi, "SELECT * FROM like_foto WHERE id_foto='$fotoid' AND id_user='$userid'");
                    if(mysqli_num_rows($ceksuka) == 1) { ?>
                        <a href="../config/proses_like.php?fotoid=<?php echo $data['id_foto'] ?>" class="btn btn-link p-0"><i class="fa fa-heart"></i></a>
                    <?php } else { ?>
                        <a href="../config/proses_like.php?fotoid=<?php echo $data['id_foto'] ?>" class="btn btn-link p-0"><i class="fa fa-heart-o"></i></a>
                    <?php } ?>
                <?php 
                    $like = mysqli_query($koneksi, "SELECT * FROM like_foto WHERE id_foto='$fotoid'");
                    echo mysqli_num_rows($like) . ' Suka';
                ?>
            </div>
        </div>
    </a>
    <?php if ($_SESSION['is_admin']) { ?>
        <!-- Delete Button (same width as card footer) -->
        <form action="../config/aksi_foto.php" method="POST" class="w-100">
            <input type="hidden" name="fotoid" value="<?php echo $data['id_foto']; ?>">
            <button type="submit" class="btn btn-danger w-100 mt-2" name="hapus">Hapus Data</button>
        </form>
    <?php } ?>
</div>


        <!-- Modal Komentar -->
        <div class="modal fade" id="komentar<?php echo $fotoid ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><?php echo htmlspecialchars($data['judul_foto']); ?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8">
                        <img src="<?php echo $imgPath; ?>" title="<?php echo htmlspecialchars($data['judul_foto']); ?>" class="img-fluid rounded">
                    </div>
                    <div class="col-md-4">
                        <div class="m-2">
                            <p><?php echo htmlspecialchars($data['deskripsi_foto']); ?></p>
                            <hr>
                            <h5>Komentar:</h5>
                            <?php 
                                $komentar = mysqli_query($koneksi, "SELECT komentar_foto.*, user.nama_lengkap 
                                                                    FROM komentar_foto 
                                                                    JOIN user ON komentar_foto.id_user = user.id_user 
                                                                    WHERE id_foto = '$fotoid'");
                                while ($row = mysqli_fetch_array($komentar)) {
                            ?>
                                <p>
                                    <strong><?php echo htmlspecialchars($row['nama_lengkap']); ?>:</strong> 
                                    <?php echo htmlspecialchars($row['isi_komentar']); ?>
                                    <?php if ($is_admin) { ?>
                                        <a href="../config/proses_hapus_komentar.php?id_komentar=<?php echo $row['id_komentar']; ?>&id_foto=<?php echo $fotoid; ?>" 
                                           onclick="return confirm('Apakah Anda yakin ingin menghapus komentar ini?');" 
                                           class="text-danger ms-2">
                                            Hapus
                                        </a>
                                    <?php } ?>
                                </p>
                            <?php } ?>
                            <hr>
                            <form action="../config/proses_komentar.php" method="POST">
                                <input type="hidden" name="id_foto" value="<?php echo $fotoid; ?>">
                                <div class="input-group">
                                    <input type="text" name="isi_komentar" class="form-control" placeholder="Tambah komentar">
                                    <button type="submit" name="kirimkomentar" class="btn btn-outline-primary">Kirim</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


        <?php
                } // End of while
            } // End of else
        ?>
    </div>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
