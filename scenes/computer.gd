extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var currentTime = Time.get_time_dict_from_system()
	var textTime = str(currentTime.hour) + ":" + str(currentTime.minute)
	$Panel/Time/TimeLabel.text = textTime
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_glosary_pressed() -> void:
	var size = get_parent_area_size() - Vector2(100,100)
	
	$GlosaryWindow.size = size
	$GlosaryWindow.show()


func _on_glosary_window_close_requested() -> void:
	$GlosaryWindow.hide()
