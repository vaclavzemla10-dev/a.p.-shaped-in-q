extends CanvasLayer

func _ready():
	visible = false

func toggle():
	visible = !visible
	get_tree().paused = visible
	

func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_exit_pressed() -> void:
	get_tree().quit()
