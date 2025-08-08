<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

include 'db.php';

$kategori = $_GET['kategori'] ?? '';

$sql = "SELECT kode_menu, nama_menu, harga, kategori, deskripsi
        FROM menu
        WHERE status_ketersediaan = TRUE AND kategori = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $kategori);
$stmt->execute();
$result = $stmt->get_result();

$menus = [];

while ($row = $result->fetch_assoc()) {
    $menus[] = [
        'kode' => $row['kode_menu'],
        'nama' => $row['nama_menu'],
        'harga' => (float)$row['harga'], 
        'kategori' => $row['kategori'],
        'deskripsi' => $row['deskripsi'],
        // Menggunakan 'nama_menu' untuk membuat nama file gambar
        'gambar' => strtolower(str_replace(' ', '-', $row['nama_menu'])) . '.jpg'
    ];
}

echo json_encode([
    'success' => true,
    'data' => $menus
]);

$conn->close();
?>