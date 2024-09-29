extends CharacterBody2D
var speed = 50 
var motion = Vector2.ZERO

func _physics_process(delta: float) -> void:
	motion = Vector2.ZERO  # Resetea el vector de movimiento cada frame
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("Walking")
		$AnimatedSprite2D.flip_h = false
		motion.x = speed
		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("Walking")
		$AnimatedSprite2D.flip_h = true #Voltea la animacion
		motion.x = -speed
		motion.y = 0
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("Walking")
		motion.y = speed
		motion.x = 0
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("Walking")
		motion.y = -speed
		motion.x = 0
	else:
		$AnimatedSprite2D.play("Idle")
		
	#Cambio de camara	
	if self.position.x < 0:
		Global.camera_pos = 2 #Determina en que cuandrante se encuentra para cambiar de camara
	else:
		Global.camera_pos = 1
	
	velocity = motion  # Asigna la velocidad del cuerpo
	move_and_collide(velocity * delta)  # Mueve al personaje, ya no se ocupa move_and_slide(), es de versiones anteriores.
