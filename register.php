<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f0f2f5;
    }

    .navbar {
        background-color: #4a90e2;
    }

    .navbar-brand, .btn-outline-primary, .btn-outline-success {
        color: black;
    }

    .btn-outline-primary:hover, .btn-outline-success:hover {
        background-color: white;
        color: #4a90e2;
    }

    .card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        margin-top: 50px;
    }

    .card-body {
        padding: 2rem;
        background-color: #ffffff;
    }

    .form-control {
        border-radius: 10px;
    }

    .btn-primary {
        background-color: #4a90e2;
        border: none;
        border-radius: 10px;
        padding: 10px 0;
    }

    .btn-primary:hover {
        background-color: #357ab8;
    }

    footer {
        background-color: #4a90e2;
        color: white;
        padding: 10px;
        text-align: center;
        border-top: none;
    }
</style>

</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container">
        <a class="navbar-brand" href="index.php">Website Galeri</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav me-auto">
           
        </div>
        <a href="register.php" class="btn btn-outline-primary m-1">Daftar</a>
        <a href="login.php" class="btn btn-outline-success m-1">Masuk</a>
        </div>
    </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body bg-light">
                        <div class="text-center">
                            <h5>Daftar Aplikasi</h5>
                        </div>
                        <form action="config/aksi_register.php" method="POST">
                            <label for="">Username</label>
                            <input type="text" class="form-control" name="username" required>
                            <label for="">Password</label>
                            <input type="password" class="form-control" name="password" required>
                            <label for="">Email</label>
                            <input type="email" class="form-control" name="email" required>
                            <label for="">Nama Lengkap</label>
                            <input type="text" class="form-control" name="namalengkap" required>
                            <label for="">Alamat</label>
                            <input type="text" class="form-control" name="alamat" required>
                            <div class="d-grid mt-2 pb-3">
                                <button class="btn btn-primary" type="submit" name="kirim">Daftar</button>
                            </div>
                        </form>
                        <p>Sudah punya akun? <a href="login.php">Masuk</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="d-flex justify-content-center border-top mt-3 bg-light fixed-bottom">
        <p>&copy; UKK RPL 2024 | RoyReynaldi</p>
    </footer>

    <script type="text/javascript" href="assets/js/bootstrap.min.js"></script>
</body>
</html>