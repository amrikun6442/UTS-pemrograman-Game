extends CharacterBody3D
signal hp_berubah(hp_sekarang: int, max_hp: int)

var _hp: int = 3
const MAX_HP: int = 5

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var camera_pivot: Node3D

@export_range(0.0, 0.5) var camera_sensitivity_h: float = 0.05
@export_range(0.0, 0.5) var camera_sensitivity_v: float = 0.05

var max_spring_rotation: Vector3 = Vector3(30, 30, 0)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		rotation.y = lerp_angle(rotation.y, atan2(velocity.x, velocity.z), 0.15)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _ready():
	var body: Node3D
	var rotation: Vector3
	# Access nodes we'll need from our scene here
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	camera_pivot = get_node("CameraPivot")
	body = $Body
	rotation = body.rotation
	
func _input(event):
	if event is InputEventMouseMotion:
		camera_pivot.rotate_y(deg_to_rad(-event.relative.x * camera_sensitivity_h))
		camera_pivot.rotate_x(deg_to_rad(-event.relative.y * camera_sensitivity_v))
		camera_pivot.rotation = camera_pivot.rotation.clamp(-max_spring_rotation, max_spring_rotation)

func convert_degrees_to_radian(num: float) -> float:
	return num * (PI / 180.0)
func get_hp() -> int:
	return _hp

func tambah_hp(jumlah: int) -> void:
	_hp = clamp(_hp + jumlah, 0, MAX_HP)
	hp_berubah.emit(_hp, MAX_HP)
	if has_node("AudioStreamPlayer"):
		$AudioStreamPlayer.play()
