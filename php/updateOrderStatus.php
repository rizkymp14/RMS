<?php
header('Content-Type: application/json');
include 'config/db.php';

$data = json_decode(file_get_contents("php://input"), true);
$id = $data["id"];
$status = $data["status"];

$sql = "UPDATE orders SET status = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $status, $id);

if ($stmt->execute()) {
  echo json_encode(["success" => true, "message" => "Status diperbarui"]);
} else {
  echo json_encode(["success" => false, "message" => "Gagal memperbarui status"]);
}
?>
