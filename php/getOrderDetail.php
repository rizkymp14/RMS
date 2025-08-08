<?php
header('Content-Type: application/json');
include 'db.php';

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$sql = "SELECT o.nama_pelanggan, o.total, o.waktu_pesan, d.nama_menu, d.qty 
        FROM pesanan o 
        JOIN detail_pesanan d ON o.id = d.id_pesanan 
        WHERE o.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

$nama = "";
$total = 0;
$pesanan = [];

while ($row = $result->fetch_assoc()) {
  $nama = $row['nama_pelanggan'];
  $total = $row['total'];
  $pesanan[] = [
    'nama' => $row['nama_menu'],
    'qty' => $row['qty']
  ];
}

echo json_encode([
  'success' => true,
  'data' => [
    'nama' => $nama,
    'total' => $total,
    'pesanan' => $pesanan
  ]
]);

$conn->close();
