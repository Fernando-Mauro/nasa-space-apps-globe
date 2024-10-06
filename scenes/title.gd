extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_visibility_changed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_visibility_changed() -> void:
	var selectedDay = "GLOSARY_" + GlobalComputer.selected;
	$MarginContainer/Label.text = tr(selectedDay)
	
