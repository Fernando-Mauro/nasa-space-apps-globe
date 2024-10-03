extends Node2D

func _physics_process(delta: float) -> void:
	if Global.camera_pos == 1:
		$player/Camara1.make_current()
		#$Player/Camera2D3.clear_current
	elif Global.camera_pos == 2:
		$player/Camara2.make_current()
		#$Player/Camera2D3.clear_current
