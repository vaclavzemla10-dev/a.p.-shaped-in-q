extends Node2D

@onready var pause_menu: Control = $pause_menu
@onready var animation_player: AnimationPlayer = $spikes/AnimationPlayer
@onready var area_2d: Area2D = $Area2D
@onready var area_2d_2: Area2D = $Area2D2
@onready var animation_player_2: AnimationPlayer = $spikes/AnimationPlayer2
@onready var area_2d_3: Area2D = $Area2D3
@onready var animation_player_3: AnimationPlayer = $spikes/AnimationPlayer3
@onready var collision_shape_2d: CollisionShape2D = $"1/Area2D/CollisionShape2D"
@onready var collision_shape_2d_2: CollisionShape2D = $"1/Area2D2/CollisionShape2D2"
@onready var collision_shape_2d_3: CollisionShape2D = $"1/Area2D3/CollisionShape2D3"
@onready var area_rush: Area2D = $"2/area_rush"
@onready var spikes_rush: AnimationPlayer = $"2/spikes_rush"
@onready var area_coll: CollisionShape2D = $"2/area_rush/area_coll"
@onready var zigzag_1: AnimationPlayer = $"3/zigzag_1"
@onready var zigzag_2: AnimationPlayer = $"3/zigzag_2"
@onready var zigzag_3: AnimationPlayer = $"3/zigzag_3"
@onready var spike_joke_1: Area2D = $"3/spike_joke_1"
@onready var _1_coll: CollisionShape2D = $"3/spike_joke_1/1_coll"
@onready var animation_player_4: AnimationPlayer = $spikes/AnimationPlayer4
@onready var zigzag_4: AnimationPlayer = $"3/zigzag_4"
@onready var zigzag_5: AnimationPlayer = $"3/zigzag_5"

func _ready() -> void:
	zigzag_1.play("zigzag_1")
	zigzag_2.play("zigzag_2")
	zigzag_3.play("zigzag_3")
	zigzag_4.play("zigazg_4")
	zigzag_5.play("zigzag_5")
	score_manager.reset()
	pause_menu.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		pause_menu.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	animation_player.play("spikes_moves")
	collision_shape_2d.set_deferred("disabled", true)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	animation_player_2.play("spikes_moving")
	collision_shape_2d_2.set_deferred("disabled", true)

func _on_area_2d_3_body_entered(body: Node2D) -> void:
	animation_player_3.play("spikes_lifting")
	collision_shape_2d_3.set_deferred("disabled", true)

func _on_area_rush_body_entered(body: Node2D) -> void:
	spikes_rush.play("spikes_rush")
	await spikes_rush.animation_finished
	area_coll.set_deferred("disabled", true)

func _on_spike_joke_1_body_entered(body: Node2D) -> void:
	animation_player_4.play("spikes_jokes")
	_1_coll.set_deferred("disabled", true)
