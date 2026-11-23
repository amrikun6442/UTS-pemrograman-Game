extends Node3D

@onready var label_skor: Label = $CanvasLayer/LabelSkor

var total_skor: int = 0

func _ready() -> void:
	update_hud()
	for child in get_children():
		if child is KoinEmas:
			child.koin_diambil.connect(_on_koin_diambil)

func _on_koin_diambil(nilai_skor: int) -> void:
	total_skor += nilai_skor
	update_hud()

func update_hud() -> void:
	label_skor.text = "Skor: " + str(total_skor)
