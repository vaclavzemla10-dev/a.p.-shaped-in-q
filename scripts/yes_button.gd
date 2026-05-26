extends Button

@onready var pause_menu: Control = $"../.."

func _on_yes_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pause_menu.visible = false


func _on_no_pressed() -> void:
	pause_menu.visible = false
