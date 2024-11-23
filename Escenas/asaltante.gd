extends Node3D

# Referencia al nodo del personaje
@onready var character_body_3d: CharacterBody3D = $"../../CharacterBody3D"


func _physics_process(delta):
	if character_body_3d:
		var target_position = character_body_3d.global_transform.origin
		target_position.y = global_transform.origin.y
		look_at(target_position)
