extends CharacterBody2D
@export var v_speed = 200
@export var h_speed = 200


func _ready():
	$AnimatedSprite2D.play("front_idle")
	
func _physics_process(delta):
	player_movement(delta)
	player_action(delta)

func player_action(delta):
	
	if Input.is_action_pressed("action"):
		$AnimatedSprite2D.play("action")
		
func player_movement(delta):
	
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
	

func p_animation(movement):
	var anim = $AnimatedSprite2D
	
	if velocity.x > 0 :
		anim.flip_h = false
	elif velocity.x < 0:
		anim.flip_h = true
	if velocity.x == 0 and velocity.y == 0:
		anim.play("side_idle")
	else:
		anim.play("side_walk")
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(.8,1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.4)
		
		
