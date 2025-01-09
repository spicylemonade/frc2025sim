extends Node3D

func _process(delta: float) -> void:
	# Press B to play the "pextend" animation
	if Input.is_key_pressed(KEY_B):
		$AnimationPlayer.play("pextend")
		
	# Press N to play the "pdetract" animation
	if Input.is_key_pressed(KEY_N):
		$AnimationPlayer.play("pdetract")
