# UTS Pemrograman Game - Bagian B

* **Nama:** Satria Amri Pamungkas
* **NIM:** [52304110020, digit terakhir 0]
* **Varian Tugas:** Digit 0 (Collectible: Koin Emas, Efek: HP +1 maks 5, HUD: Label "HP: n/5" di pojok kiri atas)

## Kontrol Permainan
* **W, A, S, D / Tombol Panah:** Menggerakkan karakter
* **Spasi:** Melompat
* **Mouse:** Menggerakkan kamera
* **Slider (Pojok Kanan Atas):** Mengatur volume audio bus SFX

## Daftar Script (`.gd`) yang Ditambahkan / Diubah
1. **`apel.gd`** *(Ditambahkan)* — Mendeteksi tabrakan (*collision*) antara Player dengan objek collectible Apel, memanggil fungsi penambahan HP pada Player, dan menghapus objek apel (`queue_free()`).
2. **`player.gd`** *(Diubah)* — Menambahkan variabel status terenkapsulasi `_hp`, fungsi getter/setter (`get_hp()`, `tambah_hp()`), pemancaran signal `hp_berubah`, serta pemutaran efek suara melalui `AudioStreamPlayer` pada bus `"SFX"`.
3. **`hud.gd`** *(Ditambahkan)* — Menghubungkan signal `hp_berubah` dari Player untuk memperbarui tampilan label `HP: n/5` secara dinamis serta menghubungkan `HSlider` untuk mengatur volume bus audio `"SFX"`.
