extends Control

func _ready() -> void:
	var currentTime = Time.get_time_dict_from_system()
	var textTime = str(currentTime.hour) + ":" + str(currentTime.minute)
	$Panel/Time/TimeLabel.text = textTime	
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		$GlobeWindow/CenterContainer/VideoStreamPlayer.play()
	
func _on_glosary_pressed() -> void:	
	var size = get_parent_area_size() - Vector2(50,200)
	$GlosaryWindow.size = size
	$GlosaryWindow.show()

func _on_glosary_window_close_requested() -> void:
	$GlosaryWindow.hide()

func _on_globe_pressed() -> void:
	var size = get_parent_area_size() - Vector2(100,100)
	$GlobeWindow.size = size
	$GlobeWindow.show()
	#$GlobeWindow/CenterContainer/VideoStreamPlayer.play()

func _on_globe_window_close_requested() -> void:
	$GlobeWindow.hide()
