extends Area2D

@onready var collectsound: AudioStreamPlayer2D = $collectsound
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "square" or body.name == "rectangle" or body.name == "circle":
		score_manager.add_score()
		collectsound.play()
		await collectsound.finished
		queue_free()
