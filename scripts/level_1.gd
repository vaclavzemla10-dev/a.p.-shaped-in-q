extends Node2D

@onready var pause_menu: Control = $pause_menu

func _ready() -> void:
	score_manager.reset()
	pause_menu.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		pause_menu.visible = true
	if Input.is_action_just_pressed("reset"):
		score_manager.add_death()
