<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

$catatan = $data['catatan'];
$items = $data['items'];

$conn->begin_transaction();

try {
    foreach ($items as $item) {
        $kode_menu = $item['kode'];  // Sesuaikan key-nya
        $qty = $item['jumlah'];      // Sesuaikan key-nya
        $status = 'baru';            // Untuk ditampilkan ke koki

        $stmt = $conn->prepare("INSERT INTO pesanan (kode_menu, jumlah, catatan, status_pesanan) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("siss", $kode_menu, $qty, $catatan, $status);
        $stmt->execute();
    }

    $conn->commit();
    echo json_encode(["success" => true]);
} catch (Exception $e) {
    $conn->rollback();
    echo json_encode(["success" => false, "error" => $e->getMessage()]);
}

?>
