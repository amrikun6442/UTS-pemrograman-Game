extends Area3D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	# Mengecek apakah yang menyentuh apel adalah Player yang punya fungsi tambah_hp
	if body.has_method("tambah_hp"):
		body.tambah_hp(1)
		queue_free() # Menghapus apel dari scene setelah diambil
