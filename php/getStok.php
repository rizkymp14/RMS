<?php
// header('Content-Type: application/json');
// include 'db.php';

// $bahan = [];
// $menu = [];

// $result1 = $conn->query("SELECT * FROM bahan");
// while ($row = $result1->fetch_assoc()) {
//   $bahan[] = $row;
// }

// $result2 = $conn->query("SELECT * FROM stok_menu");
// while ($row = $result2->fetch_assoc()) {
//   $menu[] = $row;
// }

// echo json_encode([
//   'success' => true,
//   'bahan' => $bahan,
//   'menu' => $menu
// ]);

header('Content-Type: application/json');
include 'db.php';

// Cek koneksi
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

?>
