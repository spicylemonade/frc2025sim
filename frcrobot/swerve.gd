extends RigidBody3D

var max_speed: float = 5
var max_rotation_speed: float = 2.0

func _physics_process(delta: float) -> void:
	var forward  = 0.0
	var strafe   = 0.0
	var rotate   = 0.0

	# ----------------------------------------
	# 1) KEYBOARD (WASD for translation, Q/E for rotation)
	# ----------------------------------------
	if Input.is_key_pressed(KEY_W):
		forward += 1.0
	if Input.is_key_pressed(KEY_S):
		forward -= 1.0
	if Input.is_key_pressed(KEY_D):
		strafe += 1.0
	if Input.is_key_pressed(KEY_A):
		strafe -= 1.0

	if Input.is_key_pressed(KEY_E):
		rotate += 1.0
	if Input.is_key_pressed(KEY_Q):
		rotate -= 1.0

	# ----------------------------------------
	# 2) JOYSTICK (if present)
	# ----------------------------------------
	var joypads = Input.get_connected_joypads()
	if joypads.size() > 0:
		var joy_id = joypads[0]
		# Example assumption: 
		#  - Left stick X is axis 0 (strafe)
		#  - Left stick Y is axis 1 (forward)
		#  - Right stick X is axis 2 (rotation)
		#
		# Depending on your controller, these axis indices might differ!
		var left_stick_x = Input.get_joy_axis(joy_id, 0)   # typically strafe
		var left_stick_y = Input.get_joy_axis(joy_id, 1)   # typically forward
		var right_stick_x = Input.get_joy_axis(joy_id, 2)  # typically rotate

		# Combine joystick with keyboard input (you could replace or blend as needed)
		forward += -left_stick_y   # note: pushing stick up is typically negative Y in Godot
		strafe  += left_stick_x
		rotate  += right_stick_x   # rotate around Y

	# ----------------------------------------
	# 3) Scale to maximum speeds
	# ----------------------------------------
	forward *= max_speed
	strafe  *= max_speed
	rotate  *= max_rotation_speed

	# ----------------------------------------
	# 4) Build local velocity & convert to world space
	#    (Godot's forward is -Z, strafe is +X)
	# ----------------------------------------
	var local_velocity = Vector3(strafe, 0.0, -forward)
	var global_velocity = global_transform.basis * local_velocity

	# ----------------------------------------
	# 5) Apply velocity & angular velocity
	# ----------------------------------------
	linear_velocity = global_velocity
	angular_velocity = Vector3(0.0, rotate, 0.0)
