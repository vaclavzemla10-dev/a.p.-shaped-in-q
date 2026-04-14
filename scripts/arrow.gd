extends Area2D


const FILE_BEGIN = "res://scenes/Level_"

func _on_body_entered(body):
	get_tree().quit()
