extends Area2D

func _on_body_entered(body):
	if body.name == "square" or body.name == "rectangle" or body.name == "circle":
		get_tree().reload_current_scene()
