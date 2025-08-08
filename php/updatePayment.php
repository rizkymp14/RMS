<?php
include "db.php";

header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

$meja = $data["meja"] ?? null;
$metode = $data["metode"] ?? null;

if (!$meja || !$metode) {
  echo json_encode(["success" => false, "message" => "Data tidak lengkap"]);
  exit;
}

$query = "UPDATE pesanan SET metode_pembayaran = ?, status = 'dibayar' WHERE meja = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("si", $metode, $meja);

if ($stmt->execute()) {
  echo json_encode(["success" => true, "message" => "Pembayaran berhasil diperbarui"]);
} else {
  echo json_encode(["success" => false, "message" => "Gagal memperbarui pembayaran"]);
}
