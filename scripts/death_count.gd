extends Label

func _process(delta: float) -> void:
	text = "Deaths : " + str(score_manager.deaths)
