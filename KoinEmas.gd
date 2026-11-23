class_name KoinEmas
extends Area3D

# Signal untuk memberi tahu World/UI tanpa mereferensikan UI secara langsung
signal koin_diambil(nilai_skor: int)

@export var poin: int = 10
@export var kecepatan_putar: float = 2.5

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	rotate_y(kecepatan_putar * delta)

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player" or body.is_in_group("player"):
		koin_diambil.emit(poin)
		queue_free()
