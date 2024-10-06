extends Node


var player_pos:Vector2


var language_act = 0
var language_codes = ["es","en"]

#--------Plants-----------#
var plantSelected = 1 #Selecciona un numero identificador para cada planta. #1 = Carrot, #2 = Onion.
var numCorns = 0 #Contador de frutas
var numTomatoes = 0
const animation_names = ["Error","Corn","Tomato"]#Arreglo de animaciones para paquete de semillas

#--------------Camera-------------#
var camera_pos:int
