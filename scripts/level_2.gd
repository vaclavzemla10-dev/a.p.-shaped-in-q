extends Node2D

@onready var spike5: Area2D = $spikes/spike5
@onready var portal: Area2D = $portal
@onready var character: Node2D = $character
@onready var spike_fall: Area2D = $spikes/spike_fall
@onready var fall_detect: Area2D = $spikes/spike_fall/fall_detect
@onready var fall_detect_coll: CollisionShape2D = $spikes/spike_fall/fall_detect/fall_detect_coll
@onready var animationplayer: AnimationPlayer = $spikes/spike_fall/animationplayer
@onready var collect_2: Area2D = $cellects/collect2
@onready var collect_3: Area2D = $cellects/collect3
@onready var collect_4: Area2D = $cellects/collect4
@onready var q_tut_label: Label = $q_tut_label
@onready var animation_player: AnimationPlayer = $q_tut_label/animation_player
@onready var q_tut: Area2D = $q_tut
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	q_tut_label.position.x = -1000
	portal.visible = false
	character.position.y = -209
	character.position.x = -209
	score_manager.reset()

func _process(delta: float) -> void:
	if score_manager.score == 4:
		spike5.position.x += 1000



func _on_portal_body_entered(body: Node2D) -> void:
	portal.queue_free()
	collect_2.position.y = 14
	collect_3.position.y = 14
	collect_4.position.y = 14
	
	

func _on_fall_detect_body_entered(body: Node2D) -> void:
	animationplayer.play("fall_anim")
	await animationplayer.animation_finished
	spike_fall.queue_free()
	portal.visible = true


func _on_q_tut_body_entered(body: Node2D) -> void:
	q_tut_label.position.x = -50
	animation_player.play("q_tut_anim")
	await animation_player.animation_finished
	q_tut.queue_free()
	timer.start(5)
	

func timeout() -> void:
	q_tut_label.position.x = -1000
