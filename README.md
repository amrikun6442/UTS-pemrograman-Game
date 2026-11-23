# UTS Pemrograman Game - Bagian B

* **Nama:** Satria Amri Pamungkas
* **NIM:** [52304110020, digit terakhir 0]
* **Varian Tugas:** Digit 0 (Collectible: Koin Emas, Efek: Skor +10, HUD: Label "Skor : N" di pojok kanan atas)

Kontrol Permainan

W, A, S, D / Tombol Panah: Menggerakkan karakter ke depan, kiri, belakang, dan kanan

Spasi: Melompat

Daftar Script (.gd) yang Ditambahkan / Diubah

KoinEmas.gd (Ditambahkan) — Mengatur animasi rotasi koin emas, mendeteksi tabrakan (collision) dengan Player melalui signal body_entered, memancarkan custom signal koin_diambil(10) tanpa mereferensikan UI secara langsung, serta menghapus koin dari scene tree (queue_free()).

World.gd (Ditambahkan) — Menghubungkan signal koin_diambil dari seluruh instance KoinEmas di arena permainan, menghitung akumulasi skor (+10 per koin), dan memperbarui tampilan teks HUD LabelSkor ("Skor: N") di pojok kanan atas secara dinamis.

Player.gd (Ditambahkan / Diubah) — Mengatur pergerakan dasar karakter 3D (CharacterBody3D), gravitasi, lompatan, serta rotasi arah hadap karakter mengikuti input tombol gerakan.
