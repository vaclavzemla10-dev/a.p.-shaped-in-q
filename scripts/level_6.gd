extends Node2D

@onready var pause_menu: Control = $pause_menu
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	await animation_player.animation_finished
	get_tree().quit()
