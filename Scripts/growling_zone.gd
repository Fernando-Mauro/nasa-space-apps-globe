extends StaticBody2D

var plant = Global.plantSelected
var plantGrowling = false
var plant_grown =  false

func _physics_process(delta: float) -> void:
	#print(Global.plantSelected) #Actualiza el contador, siempre y cuando no haya una planta en la zona
	if plantGrowling == false:
		plant = Global.plantSelected
	
	
#Determina cuando el paquete de semillas entra a la zona y activa la animacion de crecimiento a su par verifica cual fue
# el ultimo paquete seleccionado y determina cual animacion empezar, si ya se plnato algo, imprime un mensaje de error
func _on_area_2d_area_entered(area: Area2D) -> void: 
	if not plantGrowling:
		if plant == 1:
			plantGrowling = true
			$carrotGrowTimer.start()
			$Plant.play("carrotGrowling")
		if plant == 2:
			plantGrowling = true
			$onionGrowTimer.start()
			$Plant.play("onionGrowling")	
	else:
		print("Ya existe una planta creciendo aqui") 




#Enlazamos el  tiempo de espera de la zanahoria y de la cebolla respectivamente para actualizar los frames de la animacion

func _on_carrot_grow_timer_timeout() -> void:
	var carrot_plant = $Plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrotGrowTimer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true #La planta ha madurado, por lo que se queda en el ultimo frame
		

func _on_onion_grow_timer_timeout() -> void:
	var onion_plant = $Plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$onionGrowTimer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grown = true
	

#Recoge la el cultivo que ya crecio
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.numCarrots += 1
				plantGrowling = false #Ya no existen plantas creciendo ahi
				plant_grown = false #No existe una planta madura ahi
				$Plant.play("none") #Activamos la animacion que no existe nada creciendo ahi
			if plant == 2:
				Global.numOnions += 1
				plantGrowling = false
				plant_grown = false
				$Plant.play("none")
			else:
				pass #Para evitar errores de un cultivo erroneo (Que se modifique el valor de "plant" a un numero diferente de '1'  o '2'
			
			print("Zanahorias: " + str(Global.numCarrots)) #Imprime la cantidad de cultivos cosechados de cierto tipo
			print("Cebollas: " + str(Global.numOnions))
