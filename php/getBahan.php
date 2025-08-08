<?php
header('Content-Type: application/json');
include 'db.php';

if (!$conn || $conn->connect_error) {
  echo json_encode(['success' => false, 'message' => 'Koneksi DB gagal']);
  exit;
}

$query = "SELECT nama, satuan, qty FROM bahan ORDER BY id DESC";
$result = $conn->query($query);

$data = [];

if ($result && $result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $data[] = $row;
  }
}

echo json_encode(['success' => true, 'data' => $data]);
$conn->close();
