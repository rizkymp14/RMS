<?php
header('Content-Type: application/json');
include 'db.php';

if (!$conn || $conn->connect_error) {
  echo json_encode(['success' => false, 'message' => 'Koneksi database gagal: ' . $conn->connect_error]);
  exit;
}

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
  echo json_encode(['success' => false, 'message' => 'Data tidak terbaca']);
  exit;
}

if (isset($data['jenis'])) {
  if ($data['jenis'] === 'bahan') {
    $nama = trim($data['nama']);
    $satuan = trim($data['satuan']);
    $qty = (int)$data['qty'];

    if ($nama && $satuan && $qty > 0) {
      $stmt = $conn->prepare("INSERT INTO bahan (nama, satuan, qty) VALUES (?, ?, ?)");
      if ($stmt) {
        $stmt->bind_param("ssi", $nama, $satuan, $qty);
        if ($stmt->execute()) {
          echo json_encode(['success' => true]);
        } else {
          echo json_encode(['success' => false, 'message' => 'Gagal eksekusi query: ' . $stmt->error]);
        }
      } else {
        echo json_encode(['success' => false, 'message' => 'Gagal prepare: ' . $conn->error]);
      }
    } else {
      echo json_encode(['success' => false, 'message' => 'Data bahan tidak valid']);
    }
  }

  else if ($data['jenis'] === 'menu') {
    $nama = trim($data['nama']);
    $qty = (int)$data['qty'];

    if ($nama && $qty > 0) {
      $stmt = $conn->prepare("INSERT INTO stok_menu (nama, qty) VALUES (?, ?)");
      if ($stmt) {
        $stmt->bind_param("si", $nama, $qty);
        if ($stmt->execute()) {
          echo json_encode(['success' => true]);
        } else {
          echo json_encode(['success' => false, 'message' => 'Gagal eksekusi query: ' . $stmt->error]);
        }
      } else {
        echo json_encode(['success' => false, 'message' => 'Gagal prepare: ' . $conn->error]);
      }
    } else {
      echo json_encode(['success' => false, 'message' => 'Data menu tidak valid']);
    }
  }

} else {
  echo json_encode(['success' => false, 'message' => 'Jenis tidak dikenali']);
}
$conn->close();
?>
