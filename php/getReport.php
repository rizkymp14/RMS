<?php
header("Content-Type: application/json");
include "db.php"; 

$jenis = $_GET['jenis'] ?? '';

$sql = "SELECT * FROM laporan_keuangan WHERE jenis = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $jenis);
$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
  $data[] = [
    "id" => $row["id"],
    "tanggal" => date("d - m - Y", strtotime($row["tanggal"])),
    "transaksi" => (int)$row["jumlah_transaksi"],
    "pendapatan" => "Rp. " . number_format($row["pendapatan"], 0, ',', ' ')
  ];
}

echo json_encode(["success" => true, "data" => $data]);
