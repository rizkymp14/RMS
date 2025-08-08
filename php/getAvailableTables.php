<?php
header('Content-Type: application/json');
include 'db.php'; 

$sql = "SELECT * FROM meja WHERE status = 'kosong'";
$result = $conn->query($sql);

$meja = [];

while ($row = $result->fetch_assoc()) {
  $meja[] = [
    'nomor' => (int)$row['nomor_meja'],
    'kapasitas' => (int)$row['kapasitas'],
    'status' => $row['status_ketersediaan']
  ];
}

echo json_encode([
  'success' => true,
  'data' => $meja
]);

$conn->close();
