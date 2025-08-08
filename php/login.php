<?php
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);
include 'db.php';

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

// Validasi input
if (empty($username) || empty($password)) {
    echo json_encode([
        "success" => false,
        "message" => "Username dan password wajib diisi"
    ]);
    exit;
}

// Daftar tabel dan rolenya
$roles = [
    'kasir' => 'kasir',
    'koki' => 'koki',
    'pelayan' => 'pelayan',
    'owner' => 'owner',
    'so' => 'stok_opname'
];

$loginSuccess = false;
foreach ($roles as $role => $table) {
    // Query username dari tabel
    $query = $conn->prepare("SELECT password FROM $table WHERE username = ?");
    if (!$query) continue; // Skip jika query gagal

    $query->bind_param("s", $username);
    $query->execute();
    $result = $query->get_result();

    if ($result && $result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if ($password === $user['password']) {  // Ganti password_verify jika hash
            echo json_encode([
                "success" => true,
                "message" => "Login berhasil",
                "role" => $role
            ]);
            $loginSuccess = true;
            break;
        }
    }
}

if (!$loginSuccess) {
    echo json_encode([
        "success" => false,
        "message" => "Username atau password salah"
    ]);
}

$conn->close();
?>
