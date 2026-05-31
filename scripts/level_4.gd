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
@onready var zigzag_4: AnimationPlayer = $"3/zigzag_4"
@onready var zigzag_5: AnimationPlayer = $"3/zigzag_5"
@onready var zigzag_6: AnimationPlayer = $"3/zigzag_6"
@onready var zigzag_7: AnimationPlayer = $"3/zigzag_7"
@onready var zigzag_8: AnimationPlayer = $"3/zigzag_8"
@onready var zigzag_9: AnimationPlayer = $"3/zigzag_9"
@onready var label_2: Label = $"4/Label2"
@onready var area_label_2: Area2D = $"4/area_label_2"
@onready var label_3: Label = $"4/Label3"
@onready var arrow: Area2D = $arrow
@onready var spike_27: Area2D = $spikes/spike27
@onready var area_spike: Area2D = $"4/area_spike"
@onready var arrow_area: Area2D = $"5/arrow_area"

func _ready() -> void:
	spike_27.position.x = 1167
	arrow.position.x = 1067
	label_3.visible = false
	label_2.visible = false
	zigzag_1.play("zigzag_1")
	zigzag_2.play("zigzag_2")
	zigzag_4.play("zigazg_4")
	zigzag_5.play("zigzag_5")
	zigzag_6.play("zigzag_6")
	zigzag_7.play("zigzag_7")
	zigzag_8.play("zigzag_8")
	zigzag_9.play("zigzag_9")
	score_manager.reset()
	pause_menu.visible = false

func _process(delta: float) -> void:
	if score_manager.score > 6:
		score_manager.score = 6
	if score_manager.score == 6:
		arrow.position.x = -243
		arrow.position.y = 84
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

func _on_area_label_2_body_entered(body: Node2D) -> void:
	label_2.visible = true

func _on_area_label_3_body_entered(body: Node2D) -> void:
	label_3.visible = true

func _on_area_spike_body_entered(body: Node2D) -> void:
	spike_27.position.x = 392

func _on_arrow_area_body_entered(body: Node2D) -> void:
	arrow.position.x = 460
