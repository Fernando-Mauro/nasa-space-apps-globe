extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_panel_container_gui_input(event: InputEvent) -> void:
	#TODO: MAKE RETURN BUTTON
	if (event is InputEventMouseButton) and event.is_pressed():
		var firstScene = get_parent().get_child(0);
		get_parent().get_child(1).show();
		get_parent().remove_child(firstScene);
		
	pass
