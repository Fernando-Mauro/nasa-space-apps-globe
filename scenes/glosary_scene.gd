extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ph_container_gui_input(event: InputEvent, selected) -> void:
	if (event is InputEventMouseButton) and event.is_pressed():
		#print(selected)
		GlobalComputer.selected = selected
		get_parent().get_parent().get_parent().get_child(5).show()
		
	pass
