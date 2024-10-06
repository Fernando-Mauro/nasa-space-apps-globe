extends Node2D

@export var change_house: String = "res://scenes/home.tscn"

func _physics_process(delta: float) -> void:
	if Global.camera_pos == 1:
		$player/Camara1.make_current()
		#$Player/Camera2D3.clear_current
	elif Global.camera_pos == 2:
		$player/Camara2.make_current()
		#$Player/Camera2D3.clear_current
	$CanvasLayer/corn.text = ("= " + str(Global.numCorns)+"/20")  #Se encuentra dentro de un folder, por eso '/'
	$CanvasLayer/tomatoes.text = ("= " + str(Global.numTomatoes) +"/20")
	
	#if Global.numCorns >= 10 && Global.numTomatoes >= 10:
		#get_tree().change_scene_to_file("res://scenes/word_second.tscn")
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action_main"):
		change_scene()
			
func change_scene():
	if change_house != "":
		get_tree().change_scene_to_file(change_house)
		
