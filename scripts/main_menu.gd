extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
