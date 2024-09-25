extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	print("start pressed")


func _on_options_pressed() -> void:
	print("options pressed")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_computer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/computer.tscn")
