document.querySelectorAll('.menu-item').forEach(item => {
  item.addEventListener('click', () => {
    const imgSrc = item.querySelector('img').src;
    const nama = item.querySelector('h3').innerText;
    const harga = item.querySelector('p').innerText;
    const desc = "Paket lengkap berisi ayam goreng renyah, nasi hangat sambal pedas khas, lalapan segar, dan tempe goreng gurih"; // nanti ambil dari DB

    document.getElementById('popupImage').src = imgSrc;
    document.getElementById('popupDesc').innerText = desc;
    document.getElementById('popupHarga').innerText = harga;
    document.getElementById('popupQty').innerText = 1;
    document.getElementById('popupCatatan').value = "";

    document.getElementById('rincianPopup').classList.remove('hidden');
  });
});

document.getElementById('closePopup').addEventListener('click', () => {
  document.getElementById('rincianPopup').classList.add('hidden');
});

document.getElementById('kurangBtn').addEventListener('click', () => {
  let qty = parseInt(document.getElementById('popupQty').innerText);
  if (qty > 1) {
    document.getElementById('popupQty').innerText = qty - 1;
  }
});
document.getElementById('tambahBtn').addEventListener('click', () => {
  let qty = parseInt(document.getElementById('popupQty').innerText);
  document.getElementById('popupQty').innerText = qty + 1;
});
