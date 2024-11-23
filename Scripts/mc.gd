extends CharacterBody3D

@onready var label: Label = $"../Label"

const SPEED = 8.0
const JUMP_VELOCITY = 4.5

@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var pue1 := $"../Tianguis/Puestos/puesto1/flecha1"
@onready var pue2 := $"../Tianguis/Puestos/puesto2/flecha2"
@onready var pue3 := $"../Tianguis/Puestos/puesto3/flecha3"
@onready var pue4 := $"../Tianguis/Puestos/puesto4/flecha4"
@onready var pue5 := $"../Tianguis/Puestos/puesto5/flecha5"
@onready var pue6 := $"../Tianguis/Puestos/puesto6/flecha6"
@onready var pue7 := $"../Tianguis/Puestos/puesto7/flecha7"
@onready var pue8 := $"../Tianguis/Puestos/puesto8/flecha8"
@onready var pue9 := $"../Tianguis/Puestos/puesto9/flecha9"
@onready var pue10 := $"../Tianguis/Puestos/puesto10/flecha10"
@onready var pue11 := $"../Tianguis/Puestos/puesto11/flecha11"
@onready var pue12 := $"../Tianguis/Puestos/puesto12/flecha12"
@onready var pue13 := $"../Tianguis/Puestos/puesto13/flecha13"
@onready var pue14 := $"../Tianguis/Puestos/puesto14/flecha14"
@onready var pue15 := $"../Tianguis/Puestos/puesto15/flecha15"
@onready var pue16 := $"../Tianguis/Puestos/puesto16/flecha16"

@onready var to_visit = generator()
@onready var counter = 0

func generator():
	var list = []
	for i in range(5):
		var aux = randi_range(1,16)
		if aux in list:
			while aux in list:
				aux = randi_range(1,16)
		list.append(aux)
	_load_arrows(list)
	return list
	
func _load_arrows(list):
	if 1 not in list:
		pue1.visible = false
	else:
		pue1.visible = true
	if 2 not in list:
		pue2.visible = false
	else:
		pue1.visible = true
	if 3 not in list:
		pue3.visible = false
	if 4 not in list:
		pue4.visible = false
	if 5 not in list:
		pue5.visible = false
	if 6 not in list:
		pue6.visible = false
	if 7 not in list:
		pue7.visible = false
	if 8 not in list:
		pue8.visible = false
	if 9 not in list:
		pue9.visible = false
	if 10 not in list:
		pue10.visible = false
	if 11 not in list:
		pue11.visible = false
	if 12 not in list:
		pue12.visible = false
	if 13 not in list:
		pue13.visible = false
	if 14 not in list:
		pue14.visible = false
	if 15 not in list:
		pue15.visible = false
	if 16 not in list:
		pue16.visible = false
		
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
		

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("asaltante_group"):
			label.text = "Ya te la sabes carnal..."
			await get_tree().create_timer(3.0).timeout
			label.text = "Celular y cartera..."
			await get_tree().create_timer(3.0).timeout
			get_tree().reload_current_scene()
		
		if Input.is_key_pressed(KEY_E) and collider.is_in_group("puestos_group"):
			print(to_visit)
			var name = str(collider.name)[6]
			name += str(collider.name)[7]
			if int(name) in to_visit:
				counter += 1
				to_visit.erase(int(name))
			print(collider.name)
			
			print(counter)
			
		if len(to_visit) == 0:
			label.text = "Felicidades! Has ganado!"
			await get_tree().create_timer(3.0).timeout
			to_visit = generator()

	move_and_slide()
	
