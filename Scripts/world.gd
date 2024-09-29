extends Node2D

const camera_Pos1x = 232
const camera_Pos1y = 104

const camera_Pos2x = -232
const camera_Pos2y = 104

# Indica y actualiza la cantidad de zanahooriaas y cebollas recogidas
func _physics_process(delta: float) -> void: 
	$FolderText/CarrotText.text = ("= " + str(Global.numCarrots))  #Se encuentra dentro de un folder, por eso '/'
	$FolderText/OnionText.text = ("= " + str(Global.numOnions))
	$FolderText/CarrotText2.text = ("= " + str(Global.numCarrots))  #Se encuentra dentro de un folder, por eso '/'
	$FolderText/OnionText2.text = ("= " + str(Global.numOnions))
	
	if Global.camera_pos == 1:
		$Camera2D.position.x = camera_Pos1x
		$Camera2D.position.y = camera_Pos1y
	else:
		$Camera2D.position.x = camera_Pos2x
		$Camera2D.position.y = camera_Pos2y 
	

#Indica cuando alguien entra a la nueva zona
func _on_open_farming_zone_body_entered(body: Node2D) -> void:
	if body.has_method("Player"): # Cuando el "Player atravieza cierta zona
		pass  
