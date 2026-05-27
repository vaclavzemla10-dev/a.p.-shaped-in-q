extends Area2D

@onready var diesound: AudioStreamPlayer2D = $diesound
@onready var character: Node2D = $"."
@onready var timer: Timer = $Timer

var is_dead = false

func _on_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	if body.name == "square" or body.name == "rectangle" or body.name == "circle":
		is_dead = true
		body.get_node("texture").visible = false
		var anim = body.get_node("player_anim")
		anim.dead = true
		anim.play("die_explode")
		diesound.play()
		body.get_node("coll").queue_free()
		score_manager.add_death()
		timer.start(1)

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
