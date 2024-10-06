extends CharacterBody2D

@export var v_speed = 70	
@export var h_speed = 115

# Asegúrate de que el archivo sea una escena válida (.tscn)
@export var change_exterior: String = "res://scenes/world.tscn"
@export var change_comp: String = "res://scenes/computer.tscn"
	
func _ready():
	$AnimatedSprite2D.play("side_idle")
	
func _physics_process(_delta):
	player_movement()
	camera_location()
	
func player_movement():
	var x_movement: float = (-Input.get_action_strength("move_up") + Input.get_action_strength("move_down"))
	var y_movement: float = (-Input.get_action_strength("move_left") + Input.get_action_strength("move_right"))
	velocity.y = x_movement * v_speed
	velocity.x = y_movement * h_speed
	
	if velocity.y == 0 or velocity.x == 0:
		p_animation(0)
	else:
		p_animation(1)
	
	move_and_slide()
	Global.player_pos = global_position
	
func camera_location():
	# Cambio de cámara    
	if self.position.x >= 0:
		Global.camera_pos = 1 # Determina en qué cuadrante se encuentra para cambiar de cámara
	elif self.position.x < 0:
		Global.camera_pos = 2
		
func p_animation(_movement):
	var anim = $AnimatedSprite2D
	
	if velocity.x == 0 and velocity.y == 0:
		anim.play("side_idle")
	else:
		if velocity.x > 0:
			anim.flip_h = false
		else:
			anim.flip_h = true
		anim.play("side_walk")
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(.8,1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.4)
			
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action_main"):
		change_scene()
	if Input.is_action_just_pressed("computer"):
		change_computer()
			
func change_scene():
	# Verifica si la variable change_exterior no está vacía
	if change_exterior != "":
		get_tree().change_scene_to_file(change_exterior)
func change_computer():
	if change_comp != "":
		get_tree().change_scene_to_file(change_comp)




"""extends CharacterBody2D
@export var v_speed = 70	
@export var h_speed = 115




func _ready():
	$AnimatedSprite2D.play("side_idle")
	
func _physics_process(_delta):
	player_movement()
	camera_location()
	
func player_movement():
	
	var x_movement: float = (-Input.get_action_strength("move_up")+ Input.get_action_strength("move_down"))
	var y_movement: float = (-Input.get_action_strength("move_left")+Input.get_action_strength("move_right"))
	velocity.y = x_movement*v_speed
	velocity.x = y_movement*h_speed
	
	if velocity.y == 0 or velocity.x == 0:
		p_animation(0)
	else:
		p_animation(1)
	
	move_and_slide()
	Global.player_pos = global_position
	
func camera_location():
	#Cambio de camara    
	if self.position.x >= 0:
		Global.camera_pos = 1 #Determina en que cuandrante se encuentra para cambiar de camara
	elif self.position.x < 0:
		Global.camera_pos = 2
		
func p_animation(_movement):
	var anim = $AnimatedSprite2D
	
	anim.flip_h = velocity.x < 0
	if velocity.x == 0 and velocity.y == 0:
		anim.play("side_idle")
	else:
		anim.play("side_walk")
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(.8,1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.4)
			
			

"""
	
	
	
"""
extends CharacterBody2D

@export var v_speed = 70
@export var h_speed = 115

@export var change_house: String = "res://scenes/home.tscn"
@export var change_exterior: String = "res://scenes/world.tscn"

var is_near_house: bool = false  # Indica si el jugador está cerca de la casa


# Detectar cuando el jugador entra en la zona de la casa
func _on_home_collision_body_entered(body: Node2D) -> void:
	if body == self:
		is_near_house = true  # El jugador está cerca de la casa

# Detectar cuando el jugador sale de la zona de la casa
func _on_home_collision_body_exited(body: Node2D) -> void:
	if body == self:
		is_near_house = false  # El jugador se aleja de la casa

# Permitir el cambio de escena solo cuando el jugador esté cerca de la casa
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action_main") and is_near_house:
		change_scene()

# Función para cambiar de escena
func change_scene() -> void:
	if change_house != "":
		get_tree().change_scene_to_file(change_house)

func _ready() -> void:
	$AnimatedSprite2D.play("side_idle")
	# Conectar las señales del Area2D
	$homeCollision.connect("body_entered", Callable(self, "_on_home_collision_body_entered"))
	$homeCollision.connect("body_exited", Callable(self, "_on_home_collision_body_exited"))

func _physics_process(_delta: float) -> void:
	player_movement()
	camera_location()

func player_movement() -> void:
	var x_movement: float = (-Input.get_action_strength("move_up") + Input.get_action_strength("move_down"))
	var y_movement: float = (-Input.get_action_strength("move_left") + Input.get_action_strength("move_right"))
	velocity.y = x_movement * v_speed
	velocity.x = y_movement * h_speed
	
	if velocity.y == 0 or velocity.x == 0:
		p_animation(0)
	else:
		p_animation(1)
	
	move_and_slide()
	Global.player_pos = global_position

func camera_location() -> void:
	# Cambio de cámara    
	if self.position.x >= 0:
		Global.camera_pos = 1  # Determina en qué cuadrante se encuentra para cambiar de cámara
	elif self.position.x < 0:
		Global.camera_pos = 2

func p_animation(_movement: int) -> void:
	var anim = $AnimatedSprite2D
	
	anim.flip_h = velocity.x < 0
	if velocity.x == 0 and velocity.y == 0:
		anim.play("side_idle")
	else:
		anim.play("side_walk")
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(.8, 1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.4)
"""
