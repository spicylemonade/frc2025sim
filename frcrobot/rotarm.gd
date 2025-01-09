extends Node3D

var rotate_speed := 45.0

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_C):
		rotation_degrees.x -= rotate_speed * delta
	if Input.is_key_pressed(KEY_V):
		rotation_degrees.x += rotate_speed * delta
