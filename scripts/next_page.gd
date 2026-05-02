extends TextureButton



func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/how_to_play_2.tscn")
