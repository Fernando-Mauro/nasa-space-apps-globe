extends Node2D
@export var journalTitle = ""
@export var journalArticle1 = ""
@export var journalArticle2 = ""
@export var journalArticle3 = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$JournalTitle.text = journalTitle
	$JournalArticle1.text = journalArticle1
	$JournalArticle2.text = journalArticle2
	$JournalArticle3.text = journalArticle3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file("res://scenes/home.tscn")
