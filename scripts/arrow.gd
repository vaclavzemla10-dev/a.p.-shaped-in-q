extends Area2D

@onready var timer: Timer = $Timer
var next_level_number = 1

func _on_body_entered(body):
	if body.name == "square" or body.name == "rectangle" or body.name == "circle":
		var current = get_tree().current_scene.scene_file_path
		var level_num = int(current.get_basename().right(1))
		next_level_number = level_num +1
		timer.start(0.5)


func _timeout() -> void:
	var next_level_path = "res://scenes/level_" + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
