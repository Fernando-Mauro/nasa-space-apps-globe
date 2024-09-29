extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $letterDisplayTimer

const MAX_WIDTH = 256

var text = ""
var letter_index = 0

@export var letter_t = 0.03
@export var space_t  = 0.06
@export var symbol_time = 0.02  

signal finished_display()


func display_text(text_i: String):
	text = text_i
	label.text = text_i
	
	await  resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await  resized
		custom_minimum_size.y = size.y
		
	global_position.x -= size.x/2
	global_position.y -= size.y+24
	
	label.text =""
	_display_letter()
	
func _display_letter():
	label.text += text[letter_index]
	letter_index+=1
	if letter_index >= text.length():
		finished_display.emit()
		return
	match text[letter_index]:
		"¡","!",".",",",":","¿","?":
			timer.start(symbol_time)
		" ":
			timer.start(space_t)
		_:
			timer.start(letter_t)
	


func _on_letter_display_timer_timeout():
	_display_letter()
