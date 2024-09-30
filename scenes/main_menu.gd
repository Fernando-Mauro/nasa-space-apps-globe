extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"VBoxContainer/start-button".text = tr("START")
	$"VBoxContainer/options-button".text = tr("OPTIONS")
	$"VBoxContainer/exit-button".text = tr("EXIT")
	$"VBoxContainer/language-button".text = tr("LANGUAGE")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	print("start pressed")


func _on_options_pressed() -> void:
	print("options pressed")


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_language_pressed():
	if Global.language_act >= Global.language_codes.size()-1:
		Global.language_act = 0
	else:
		Global.language_act+=1
	TranslationServer.set_locale(Global.language_codes[Global.language_act])
	updateUI()

func updateUI():
	$"VBoxContainer/start-button".text = tr("START")
	$"VBoxContainer/options-button".text = tr("OPTIONS")
	$"VBoxContainer/exit-button".text = tr("EXIT")
	$"VBoxContainer/language-button".text = tr("LANGUAGE")
