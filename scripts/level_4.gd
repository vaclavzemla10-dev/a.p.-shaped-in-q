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

func _ready() -> void:
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
