extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"VBoxContainer/start-button".text = tr("START")
	$"VBoxContainer/options-button".text = tr("OPTIONS")
	$"VBoxContainer/zapoteco-button".text = tr("Binniza")
	$"VBoxContainer/spanish-button".text = tr("Español")
	$"VBoxContainer/english-button".text = tr("English")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_startbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/journals/journal1.tscn")

func _on_options_pressed() -> void:
	print("options pressed")



func _on_zapotecobutton_pressed() -> void:
	Global.language_act = 2;
	Global.language_act=Global.language_act% Global.language_codes.size()
	
	TranslationServer.set_locale(Global.language_codes[Global.language_act])
	updateUI()
	
func _on_spanishbutton_pressed() -> void:
	Global.language_act = 0;
	Global.language_act=Global.language_act% Global.language_codes.size()
	
	TranslationServer.set_locale(Global.language_codes[Global.language_act])
	updateUI()

func _on_englishbutton_pressed() -> void:
	Global.language_act = 1;
	Global.language_act=Global.language_act% Global.language_codes.size()
	
	TranslationServer.set_locale(Global.language_codes[Global.language_act])
	updateUI()


func updateUI():
	$"VBoxContainer/start-button".text = tr("START")
	$"VBoxContainer/options-button".text = tr("OPTIONS")
