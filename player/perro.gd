extends CharacterBody2D


@export var speed = 25
@export var treshold = 50

func _physics_process(_delta):
	if global_position.distance_to(Global.player_pos) >treshold:
		velocity = global_position.direction_to(Global.player_pos)*speed	
		p_animation(1)
		move_and_slide()
		
	else:
		p_animation(0)
		
func p_animation(movement):
	var anim = $AnimatedSprite2D
	if velocity.x > 0:
		anim.flip_h = false
	elif velocity.x < 0:
		anim.flip_h = true
	if movement == 0:
		anim.play("idle")
	elif movement == 1:
		anim.play("walk")
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(1.2,1.6)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.5)
