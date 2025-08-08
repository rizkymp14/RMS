<?php
header('Content-Type: application/json');
include 'db.php';

// Ambil semua pesanan dengan status_pesanan = 'baru'
$sql = "SELECT p.id_pesanan AS id, p.catatan, p.status_pesanan, m.nama_menu
        FROM pesanan p
        JOIN menu m ON p.kode_menu = m.kode_menu
        WHERE p.status_pesanan = 'baru'
        ORDER BY p.id_pesanan DESC";

$result = $conn->query($sql);

$groupedOrders = [];

while ($row = $result->fetch_assoc()) {
    $id = $row['id'];
    if (!isset($groupedOrders[$id])) {
        $groupedOrders[$id] = [
            'id' => $id,
            'pesanan' => [],
            'catatan' => $row['catatan'],
            'status' => 'masuk'
        ];
    }
    $groupedOrders[$id]['pesanan'][] = $row['nama_menu'];
}

echo json_encode([
    'success' => true,
    'data' => array_values($groupedOrders)
]);

$conn->close();
?>
