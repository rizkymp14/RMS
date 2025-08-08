<?php
header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'db.php';  // Pastikan koneksi database benar

// Ambil data JSON dari fetch()
$data = json_decode(file_get_contents('php://input'), true);

// Validasi struktur data
if (!$data || !isset($data['cart']) || !is_array($data['cart']) || count($data['cart']) === 0) {
    echo json_encode(['success' => false, 'message' => 'Data tidak valid']);
    exit;
}

$cart = $data['cart'];
$catatan = $data['catatan'] ?? '';

try {
    // Mulai transaksi database
    $conn->begin_transaction();

    // Siapkan query INSERT untuk tabel pesanan
    $stmt = $conn->prepare("INSERT INTO pesanan (id_pelanggan, kode_menu, jumlah, catatan, status_pesanan) VALUES (?, ?, ?, ?, ?)");

    foreach ($cart as $item) {
        // Validasi item minimal: harus ada kode dan qty
        if (!isset($item['kode']) || !isset($item['qty'])) {
            throw new Exception("Data item tidak lengkap: kode dan qty diperlukan");
        }

        $id_pelanggan = null; // Bisa NULL jika belum ada id pelanggan
        $kode_menu = $item['kode'];
        $jumlah = (int)$item['qty'];
        $itemCatatan = $catatan;  // Gunakan catatan global (atau ganti per item jika ada)
        $status_pesanan = 'pending';

        $stmt->bind_param("isiss", $id_pelanggan, $kode_menu, $jumlah, $itemCatatan, $status_pesanan);

        if (!$stmt->execute()) {
            throw new Exception("Gagal mengeksekusi query: " . $stmt->error);
        }
    }

    $stmt->close();
    $conn->commit();

    echo json_encode(['success' => true, 'message' => 'Pesanan berhasil disimpan']);

} catch (Exception $e) {
    $conn->rollback();
    echo json_encode([
        'success' => false,
        'message' => 'Gagal menyimpan pesanan',
        'error' => $e->getMessage()  // Bisa hapus di produksi
    ]);
} finally {
    $conn->close();
}
?>
