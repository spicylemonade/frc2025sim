# attach this script to, say, a parent node
extends Node3D

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_B):
		$AnimationPlayer.play("piston_anim")  # moves from unextended to extended
	elif Input.is_key_pressed(KEY_N):
		$AnimationPlayer.play_backwards("piston_anim")  # moves from extended to unextended
