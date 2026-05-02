extends Label

@onready var animation_player: AnimationPlayer = $animation_player

func _ready() -> void:
	await animation_player.animation_finished
	queue_free()
