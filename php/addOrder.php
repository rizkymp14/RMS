<?php
header('Content-Type: application/json');
include 'db.php'; 

$data = json_decode(file_get_contents("php://input"), true);

$meja = $data['meja'] ?? '';
$nama = $data['nama'] ?? '';
$pesanan = $data['pesanan'] ?? [];
$catatan = $data['catatan'] ?? '';
$status = "Waiting";

if (!$nama || count($pesanan) === 0) {
    echo json_encode(["success" => false, "message" => "Data tidak lengkap"]);
    exit;
}

$stmt = $conn->prepare("INSERT INTO pesanan (meja, nama, catatan, status, waktu_pesan) VALUES (?, ?, ?, 'baru', NOW())");
$stmt->bind_param("sss", $meja, $nama, $catatan);

if ($stmt->execute()) {
    $id_pesanan = $stmt->insert_id;

    $stmtItem = $conn->prepare("INSERT INTO detail_pesanan (id_pesanan, nama_menu, qty) VALUES (?, ?, ?)");
    foreach ($pesanan as $nama_menu) {
        $qty = 1; 
        $stmtItem->bind_param("isi", $id_pesanan, $nama_menu, $qty);
        $stmtItem->execute();
    }

    $response = ['success' => true, 'message' => 'Pesanan berhasil disimpan', 'order_id' => $order_id];
echo json_encode($response);


    echo json_encode(["success" => true, "message" => "Pesanan berhasil disimpan"]);
} else {
    echo json_encode(["success" => false, "message" => "Gagal menyimpan pesanan"]);
}

$conn->close();
?>
