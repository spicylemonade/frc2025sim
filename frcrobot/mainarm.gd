extends CSGBox3D

var rotate_speed := 45.0 # degrees per second, for example

func _process(delta: float) -> void:
	# Press C to rotate "up"
	if Input.is_key_pressed(KEY_C):
		rotation_degrees.x -= rotate_speed * delta
		
	# Press V to rotate "down"
	if Input.is_key_pressed(KEY_V):
		rotation_degrees.x += rotate_speed * delta
