extends CharacterBody3D

@onready var label: Label = $"../Label"
@onready var puntuacion: Label = $"../Puntuacion"

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
@onready var pue17 := $"../Tianguis/Puestos2/puesto1/flecha1"
@onready var pue18 := $"../Tianguis/Puestos2/puesto2/flecha2"
@onready var pue19 := $"../Tianguis/Puestos2/puesto3/flecha3"
@onready var pue20 := $"../Tianguis/Puestos2/puesto4/flecha4"
@onready var pue21 := $"../Tianguis/Puestos2/puesto5/flecha5"
@onready var pue22 := $"../Tianguis/Puestos2/puesto6/flecha6"
@onready var pue23 := $"../Tianguis/Puestos2/puesto7/flecha7"
@onready var pue24 := $"../Tianguis/Puestos2/puesto8/flecha8"
@onready var pue25 := $"../Tianguis/Puestos2/puesto9/flecha9"
@onready var pue26 := $"../Tianguis/Puestos2/puesto10/flecha10"
@onready var pue27 := $"../Tianguis/Puestos2/puesto11/flecha11"
@onready var pue28 := $"../Tianguis/Puestos2/puesto12/flecha12"
@onready var pue29 := $"../Tianguis/Puestos2/puesto13/flecha13"
@onready var pue30 := $"../Tianguis/Puestos2/puesto14/flecha14"
@onready var pue31 := $"../Tianguis/Puestos2/puesto15/flecha15"
@onready var pue32 := $"../Tianguis/Puestos2/puesto16/flecha16"
@onready var pue33 := $"../Tianguis/Puestos3/puesto1/flecha1"
@onready var pue34 := $"../Tianguis/Puestos3/puesto2/flecha2"
@onready var pue35 := $"../Tianguis/Puestos3/puesto3/flecha3"
@onready var pue36 := $"../Tianguis/Puestos3/puesto4/flecha4"
@onready var pue37 := $"../Tianguis/Puestos3/puesto5/flecha5"
@onready var pue38 := $"../Tianguis/Puestos3/puesto6/flecha6"
@onready var pue39 := $"../Tianguis/Puestos3/puesto7/flecha7"
@onready var pue40 := $"../Tianguis/Puestos3/puesto8/flecha8"
@onready var pue41 := $"../Tianguis/Puestos3/puesto9/flecha9"
@onready var pue42 := $"../Tianguis/Puestos3/puesto10/flecha10"
@onready var pue43 := $"../Tianguis/Puestos3/puesto11/flecha11"
@onready var pue44 := $"../Tianguis/Puestos3/puesto12/flecha12"
@onready var pue45 := $"../Tianguis/Puestos3/puesto13/flecha13"
@onready var pue46 := $"../Tianguis/Puestos3/puesto14/flecha14"
@onready var pue47 := $"../Tianguis/Puestos3/puesto15/flecha15"
@onready var pue48 := $"../Tianguis/Puestos3/puesto16/flecha16"

@onready var over := $"../GameOver"

@onready var to_visit = generator()
@onready var counter = 0

func generator():
	var list = []
	for i in range(10):
		var aux = randi_range(1,48)
		if aux in list:
			while aux in list:
				aux = randi_range(1,48)
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
		pue2.visible = true
	if 3 not in list:
		pue3.visible = false
	else:
		pue3.visible = true
	if 4 not in list:
		pue4.visible = false
	else:
		pue4.visible = true
	if 5 not in list:
		pue5.visible = false
	else:
		pue5.visible = true
	if 6 not in list:
		pue6.visible = false
	else:
		pue6.visible = true
	if 7 not in list:
		pue7.visible = false
	else:
		pue7.visible = true
	if 8 not in list:
		pue8.visible = false
	else:
		pue8.visible = true
	if 9 not in list:
		pue9.visible = false
	else:
		pue9.visible = true
	if 10 not in list:
		pue10.visible = false
	else:
		pue10.visible = true
	if 11 not in list:
		pue11.visible = false
	else:
		pue11.visible = true
	if 12 not in list:
		pue12.visible = false
	else:
		pue12.visible = true
	if 13 not in list:
		pue13.visible = false
	else:
		pue13.visible = true
	if 14 not in list:
		pue14.visible = false
	else:
		pue14.visible = true
	if 15 not in list:
		pue15.visible = false
	else:
		pue15.visible = true
	if 16 not in list:
		pue16.visible = false
	else:
		pue16.visible = true
	if 17 not in list:
		pue17.visible = false
	else:
		pue17.visible = true
	if 18 not in list:
		pue18.visible = false
	else:
		pue18.visible = true
	if 19 not in list:
		pue19.visible = false
	else:
		pue19.visible = true
	if 20 not in list:
		pue20.visible = false
	else:
		pue20.visible = true
	if 21 not in list:
		pue21.visible = false
	else:
		pue21.visible = true
	if 22 not in list:
		pue22.visible = false
	else:
		pue22.visible = true
	if 23 not in list:
		pue23.visible = false
	else:
		pue23.visible = true
	if 24 not in list:
		pue24.visible = false
	else:
		pue24.visible = true
	if 25 not in list:
		pue25.visible = false
	else:
		pue25.visible = true
	if 26 not in list:
		pue26.visible = false
	else:
		pue26.visible = true
	if 27 not in list:
		pue27.visible = false
	else:
		pue27.visible = true
	if 28 not in list:
		pue28.visible = false
	else:
		pue28.visible = true
	if 29 not in list:
		pue29.visible = false
	else:
		pue29.visible = true
	if 30 not in list:
		pue30.visible = false
	else:
		pue30.visible = true
	if 31 not in list:
		pue31.visible = false
	else:
		pue31.visible = true
	if 32 not in list:
		pue32.visible = false
	else:
		pue32.visible = true
	if 33 not in list:
		pue33.visible = false
	else:
		pue33.visible = true
	if 34 not in list:
		pue34.visible = false
	else:
		pue34.visible = true
	if 35 not in list:
		pue35.visible = false
	else:
		pue35.visible = true
	if 36 not in list:
		pue36.visible = false
	else:
		pue36.visible = true
	if 37 not in list:
		pue37.visible = false
	else:
		pue37.visible = true
	if 38 not in list:
		pue38.visible = false
	else:
		pue38.visible = true
	if 39 not in list:
		pue39.visible = false
	else:
		pue39.visible = true
	if 40 not in list:
		pue40.visible = false
	else:
		pue40.visible = true
	if 41 not in list:
		pue41.visible = false
	else:
		pue41.visible = true
	if 42 not in list:
		pue42.visible = false
	else:
		pue42.visible = true
	if 43 not in list:
		pue43.visible = false
	else:
		pue43.visible = true
	if 44 not in list:
		pue44.visible = false
	else:
		pue44.visible = true
	if 45 not in list:
		pue45.visible = false
	else:
		pue45.visible = true
	if 46 not in list:
		pue46.visible = false
	else:
		pue46.visible = true
	if 47 not in list:
		pue47.visible = false
	else:
		pue47.visible = true
	if 48 not in list:
		pue48.visible = false
	else:
		pue48.visible = true
	

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
			over.visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		if Input.is_key_pressed(KEY_E) and collider.is_in_group("puestos_group"):
			print(to_visit)
			var name = str(collider.name)[6]
			name += str(collider.name)[7]
			if int(name) in to_visit:
				print(name)
				if name == "01":
					pue1.visible = false
				if name == "02":
					pue2.visible = false
				if name == "03":
					pue3.visible = false
				if name == "04":
					pue4.visible = false
				if name == "05":
					pue5.visible = false
				if name == "06":
					pue6.visible = false
				if name == "07":
					pue7.visible = false
				if name == "08":
					pue8.visible = false
				if name == "09":
					pue9.visible = false
				if name == "10":
					pue10.visible = false
				if name == "11":
					pue11.visible = false
				if name == "12":
					pue12.visible = false
				if name == "13":
					pue13.visible = false
				if name == "14":
					pue14.visible = false
				if name == "15":
					pue15.visible = false
				if name == "16":
					pue16.visible = false
				counter += 1
				to_visit.erase(int(name))
				puntuacion.text = str(counter)
			print(collider.name)
			
			print(counter)
		
		if Input.is_key_pressed(KEY_E) and collider.is_in_group("puestos2_group"):
			print(to_visit)
			var name = str(collider.name)[6]
			name += str(collider.name)[7]
			if int(name) + 16 in to_visit:
				print(name)
				if name == "01":
					pue17.visible = false
				if name == "02":
					pue18.visible = false
				if name == "03":
					pue19.visible = false
				if name == "04":
					pue20.visible = false
				if name == "05":
					pue21.visible = false
				if name == "06":
					pue22.visible = false
				if name == "07":
					pue23.visible = false
				if name == "08":
					pue24.visible = false
				if name == "09":
					pue25.visible = false
				if name == "10":
					pue26.visible = false
				if name == "11":
					pue27.visible = false
				if name == "12":
					pue28.visible = false
				if name == "13":
					pue29.visible = false
				if name == "14":
					pue30.visible = false
				if name == "15":
					pue31.visible = false
				if name == "16":
					pue32.visible = false
				counter += 1
				to_visit.erase(int(name) + 16)
				puntuacion.text = str(counter)
			print(collider.name)
			
			print(counter)
		
		if Input.is_key_pressed(KEY_E) and collider.is_in_group("puestos3_group"):
			print(to_visit)
			var name = str(collider.name)[6]
			name += str(collider.name)[7]
			if int(name) + 32 in to_visit:
				print(name)
				if name == "01":
					pue33.visible = false
				if name == "02":
					pue34.visible = false
				if name == "03":
					pue35.visible = false
				if name == "04":
					pue36.visible = false
				if name == "05":
					pue37.visible = false
				if name == "06":
					pue38.visible = false
				if name == "07":
					pue39.visible = false
				if name == "08":
					pue40.visible = false
				if name == "09":
					pue41.visible = false
				if name == "10":
					pue42.visible = false
				if name == "11":
					pue43.visible = false
				if name == "12":
					pue44.visible = false
				if name == "13":
					pue45.visible = false
				if name == "14":
					pue46.visible = false
				if name == "15":
					pue47.visible = false
				if name == "16":
					pue48.visible = false
				counter += 1
				to_visit.erase(int(name) + 32)
				puntuacion.text = str(counter)
			print(collider.name)
			
			print(counter)
			
		if len(to_visit) == 0:
			label.text = "Felicidades! Has ganado! Y no te dejaste llevar por la tentación"
			await get_tree().create_timer(3.0).timeout
			label.text = ""
			to_visit = generator()

	move_and_slide()
	


func _on_reiniciar_pressed() -> void:
	get_tree().reload_current_scene()
