extends CharacterBody2D


@export var speed = 25
@export var treshold = 50
@export var flaco = false



func _physics_process(_delta):
	if global_position.distance_to(Global.player_pos) >treshold:
		velocity = global_position.direction_to(Global.player_pos)*speed	
		p_animation(1)
		move_and_slide()
	else:
		p_animation(0)

func p_animation(movement):
	var anim = $AnimatedSprite2D
	
	var inIdle = "idle"
	var inWalk = "walk"
	if flaco:
		inIdle+="_slim"
		inWalk+="_slim"
		
	anim.flip_h = velocity.x < 0
	
	if movement == 0:
		anim.play(inIdle)
	elif movement == 1:
		anim.play(inWalk)
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(1.2,1.6)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.5)
