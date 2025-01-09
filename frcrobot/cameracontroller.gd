extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if Input.is_key_pressed(KEY_0):
		$Camera3D.make_current()
	# Press V to rotate "down"
	if Input.is_key_pressed(KEY_1):
		$Camera3D2.make_current()
	if Input.is_key_pressed(KEY_2):
		$Camera3D3.make_current()
