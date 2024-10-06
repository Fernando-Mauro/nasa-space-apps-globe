extends Control

@export var num = 1

func _ready() -> void:
	var currentTime = Time.get_time_dict_from_system()
	var textTime = str(currentTime.hour) + ":" + str(currentTime.minute)
	$Panel/Time/TimeLabel.text = textTime	
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		$GlobeWindow/Panel/CenterContainer/VBoxContainer/VideoStreamPlayer.play()
	
func _on_glosary_pressed() -> void:	
	$GlosaryWindow.show()

func _on_glosary_window_close_requested() -> void:
	$GlosaryWindow.hide()

func _on_globe_pressed() -> void:
	$GlobeWindow.show()
	$GlobeWindow/Panel/CenterContainer/VBoxContainer/VideoStreamPlayer.play()

func _on_globe_window_close_requested() -> void:
	$GlobeWindow.hide()


func _on_text_window_close_requested() -> void:
	$TextWindow.hide()


func _on_stadistics_button_pressed() -> void:
	$StadisticsWindow.show()


func _on_stadistics_window_close_requested() -> void:
	pass # Replace with function body.


func _on_globe_window_ready() -> void:
	_on_globe_pressed()


func _on_button_pause_globe_pressed() -> void:
	if $GlobeWindow/Panel/CenterContainer/VBoxContainer/VideoStreamPlayer.is_playing():
		$GlobeWindow/Panel/CenterContainer/VBoxContainer/VideoStreamPlayer.stop()
	else:
		$GlobeWindow/Panel/CenterContainer/VBoxContainer/VideoStreamPlayer.play()
