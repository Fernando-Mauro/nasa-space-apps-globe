extends StaticBody2D

var selected = false #Detecta si seleccionamos la bolsa
var seed_type = 1 #Tipo de semilla que recogimos. #1 = Carrot, #2 = Onion


func _ready() -> void:
	$AnimatedSprite2D.play("Static")


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: #Evento de reaccion
	if Input.is_action_just_pressed("click"): #Si se da click en el colider
		Global.plantSelected = seed_type
		selected = true
		
func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
		
		
func _input(event: InputEvent) -> void:  #Determina cuando dejamos de hacer click en el paquete, para reiniciar el codigo
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
