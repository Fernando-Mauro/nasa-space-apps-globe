extends CharacterBody2D
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
