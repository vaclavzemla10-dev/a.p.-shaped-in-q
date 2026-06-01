extends Node2D

@onready var arrow: Area2D = $arrow
@onready var pause_menu: Control = $pause_menu
@onready var jump: Label = $jump
@onready var power_up: Area2D = $power_up
@onready var area_2d: Area2D = $Area2D
@onready var animation_player: AnimationPlayer = $spikes/AnimationPlayer
@onready var timer: Timer = $Timer
@onready var spike_11: Area2D = $spikes/spike11
@onready var spike_12: Area2D = $spikes/spike12
@onready var spike_8: Area2D = $spikes/spike8
@onready var spike_9: Area2D = $spikes/spike9
@onready var spike_10: Area2D = $spikes/spike10
@onready var ghost_1: Sprite2D = $ghosts/ghost_1
@onready var ghost_2: Sprite2D = $ghosts/ghost_2
@onready var ghost_3: Sprite2D = $ghosts/ghost_3
@onready var ghost_4: Sprite2D = $ghosts/ghost_4
@onready var area_2d_2: Area2D = $Area2D2
@onready var ghosts_anim: AnimationPlayer = $ghosts/ghosts_anim

func _ready() -> void:
	arrow.position.x = -400
	arrow.position.y = -230
	power_up.position.x = 400
	score_manager.reset()
	pause_menu.visible = false
	jump.visible = false

func _process(delta: float) -> void:
	if score_manager.score == 5:
		arrow.position.x = -188
		arrow.position.y = -215
	if Input.is_action_just_pressed("esc"):
		pause_menu.visible = true
	if Input.is_action_just_pressed("reset"):
		score_manager.add_death()

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("move_spikes")
	await animation_player.animation_finished
	timer.start(1)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	ghosts_anim.play("ghosts_move")
	await ghosts_anim.animation_finished

func _on_timer_timeout() -> void:
	spike_11.position.x = 900
	spike_12.position.x = 800
