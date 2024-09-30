extends Sprite2D
@export var keyToPress:int


# Called when the node enters the scene tree for the first time.
func _ready():
	frame = keyToPress
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
