extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var currentTime = Time.get_time_dict_from_system()
	var textTime = str(currentTime.hour) + ":" + str(currentTime.minute)
	$Panel/Time/TimeLabel.text = textTime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
