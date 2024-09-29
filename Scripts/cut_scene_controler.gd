extends Node2D

var current_cutscene = "none" #none. New forming zone 

func _process(delta: float) -> void:
	Global.current_coutscenee = current_cutscene #Hacemos uso de la variable global
	if  Global.newFarmingZone == true:
		if current_cutscene == "none":
			current_cutscene = "newFarmingZone"
