extends CanvasLayer

@onready var label_hp: Label = $Control/LabelHP
@onready var slider_sfx: HSlider = $Control/SliderSFX
@onready var player: Node = get_parent().get_node("Player")

func _ready() -> void:
	if player and player.has_signal("hp_berubah"):
		player.hp_berubah.connect(_on_hp_berubah)
		_on_hp_berubah(player.get_hp(), 5)
	
	if slider_sfx:
		slider_sfx.value_changed.connect(_on_slider_sfx_changed)

func _on_hp_berubah(hp_sekarang: int, max_hp: int) -> void:
	label_hp.text = "HP: %d/%d" % [hp_sekarang, max_hp]

func _on_slider_sfx_changed(nilai: float) -> void:
	var sfx_index := AudioServer.get_bus_index("SFX")
	if sfx_index != -1:
		AudioServer.set_bus_volume_db(sfx_index, linear_to_db(nilai))
