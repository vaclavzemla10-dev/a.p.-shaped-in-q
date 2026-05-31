extends Node2D

var time_left = 60
var ghost_active = false
var ground_sike_2_triggered = false
var bridge_freed = false

@onready var pause_menu: Control = $pause_menu
@onready var timer: Timer = $Timer
@onready var redzone: ColorRect = $redzone
@onready var stopwatch: Label = $stopwatch
@onready var tile_map_2: TileMap = $TileMap2
@onready var click_it: Label = $"click it"
@onready var ground_sike_2: Node2D = $grounds/ground_sike_2
@onready var cache_blocks: Node2D = $grounds/cache_blocks
@onready var button_7_trigger_area: Area2D = $button_7_trigger_area
@onready var timer_bridge: Timer = $timer_bridge

@onready var collect_3: Area2D = $collects/collect3

@onready var portal_area: Area2D = $portal_area

@onready var spike_dodge: AnimationPlayer = $spike_dodge
@onready var ground_sike: AnimationPlayer = $ground_sike
@onready var ghost_blocks: Node2D = $grounds/ghost_blocks
@onready var ground_bridge: Node2D = $grounds/ground_bridge

@onready var spike: Area2D = $spikes/spike
@onready var spike_4: Area2D = $spikes/spike4
@onready var spike_2: Area2D = $spikes/spike2
@onready var spike_3: Area2D = $spikes/spike3
@onready var spike_5: Area2D = $spikes/spike5
@onready var spike_6: Area2D = $spikes/spike6
@onready var spike_7: Area2D = $spikes/spike7
@onready var spike_8: Area2D = $spikes/spike8
@onready var spike_9: Area2D = $spikes/spike9
@onready var spike_10: Area2D = $spikes/spike10
@onready var spike_17: Area2D = $spikes/spike17
@onready var spike_22: Area2D = $spikes/spike22
@onready var spike_23: Area2D = $spikes/spike23
@onready var spike_18: Area2D = $spikes/spike18
@onready var spike_19: Area2D = $spikes/spike19
@onready var spike_20: Area2D = $spikes/spike20
@onready var spike_21: Area2D = $spikes/spike21

@onready var button_1: Button = $buttons/Button1
@onready var button_2: Button = $buttons/Button2
@onready var button_3: Button = $buttons/Button3
@onready var button_4: Button = $buttons/Button4
@onready var button_5: Button = $buttons/Button5
@onready var button_6: Button = $buttons/Button6
@onready var button_7: Button = $buttons/Button7
@onready var button_8: Button = $buttons/Button8

@onready var ground_texture_1: StaticBody2D = $grounds/GroundTexture1
@onready var ground_texture_2: StaticBody2D = $grounds/GroundTexture2
@onready var ground_texture_3: StaticBody2D = $grounds/GroundTexture3
@onready var ground_texture_4: StaticBody2D = $grounds/GroundTexture4
@onready var ground_texture_5: StaticBody2D = $grounds/GroundTexture5
@onready var ground_texture_6: StaticBody2D = $grounds/GroundTexture6
@onready var ground_texture_7: StaticBody2D = $grounds/GroundTexture7
@onready var ground_texture_8: StaticBody2D = $grounds/GroundTexture8
@onready var ground_texture_9: StaticBody2D = $grounds/GroundTexture9
@onready var ground_texture_10: StaticBody2D = $grounds/GroundTexture10
@onready var ground_texture_11: StaticBody2D = $grounds/GroundTexture11
@onready var ground_texture_12: StaticBody2D = $grounds/GroundTexture12
@onready var ground_texture_13: StaticBody2D = $grounds/GroundTexture13
@onready var ground_texture_14: StaticBody2D = $grounds/GroundTexture14
@onready var ground_texture_15: StaticBody2D = $grounds/GroundTexture15
@onready var ground_texture_16: StaticBody2D = $grounds/GroundTexture16
@onready var ground_texture_17: StaticBody2D = $grounds/GroundTexture17
@onready var ground_texture_18: StaticBody2D = $grounds/GroundTexture18
@onready var ground_texture_19: StaticBody2D = $grounds/GroundTexture19
@onready var ground_texture_20: StaticBody2D = $grounds/GroundTexture20
@onready var ground_texture_21: StaticBody2D = $grounds/GroundTexture21

@onready var collision_shape_2d_1: CollisionShape2D = $grounds/GroundTexture13/CollisionShape2D1
@onready var collision_shape_2d_2: CollisionShape2D = $grounds/GroundTexture14/CollisionShape2D2
@onready var collision_shape_2d_3: CollisionShape2D = $grounds/GroundTexture15/CollisionShape2D3
@onready var collision_shape_2d_4: CollisionShape2D = $grounds/GroundTexture16/CollisionShape2D4
@onready var fall_after_dodge_area: Area2D = $fall_after_dodge_area
@onready var ground_sike_1_area: Area2D = $ground_sike_1_area
@onready var ground_sike_2_area: Area2D = $ground_sike_2_area

@onready var buzzer: AudioStreamPlayer2D = $sfx/buzzer
@onready var correct: AudioStreamPlayer2D = $sfx/correct
@onready var click: AudioStreamPlayer2D = $sfx/click
@onready var fail: AudioStreamPlayer2D = $sfx/fail
@onready var lets_go: AudioStreamPlayer2D = $"sfx/lets go"

@onready var show_1: Area2D = $show_1

func _ready() -> void:
	spike_17.visible = false
	spike_18.visible = false
	spike_19.visible = false
	spike_20.visible = false
	spike_21.visible = false
	spike_22.visible = false
	spike_23.visible = false
	cache_blocks.visible = false
	spike_6.rotation = 0
	ghost_blocks.visible = false
	ground_sike_2.visible = false
	spike_5.visible = false
	spike_5.position.x = -40
	spike_5.position.y = -168
	spike_6.visible = false
	spike_7.visible = false
	spike_8.visible = false
	spike_9.visible = false
	spike_10.visible = false
	collect_3.position.x = 1667
	ground_texture_5.visible = false
	ground_texture_6.visible = false
	ground_texture_7.visible = false
	ground_texture_8.visible = false
	ground_texture_9.visible = false
	ground_texture_10.visible = false
	ground_texture_11.visible = false
	ground_texture_12.visible = false
	ground_texture_13.visible = false
	ground_texture_14.visible = false
	ground_texture_15.visible = false
	ground_texture_16.visible = false
	ground_texture_17.visible = false
	ground_texture_18.visible = false
	ground_texture_20.visible = false
	ground_texture_21.visible = false
	ground_texture_19.visible = false
	spike.visible = false
	spike_2.visible = false
	spike_3.visible = false
	spike_4.visible = false
	button_6.visible = false
	click_it.visible = false
	tile_map_2.visible = false
	button_5.position.x = 1567
	timer.start(60)
	button_5.visible = false
	redzone.position.y = 288
	score_manager.reset()
	pause_menu.visible = false

func _process(delta: float) -> void:
	if score_manager.score == 3 and not ghost_active:
		ghost_active = true
		collision_shape_2d_1.queue_free()
		collision_shape_2d_2.queue_free()
		collision_shape_2d_3.queue_free()
		collision_shape_2d_4.queue_free()
		collect_3.position.x = -14
	if timer.time_left > 0:
		stopwatch.text = str(snapped(timer.time_left, 0.1))
	if Input.is_action_just_pressed("esc"):
		pause_menu.visible = true

func killzone():
	var tween = create_tween()
	tween.tween_property(redzone, "position:y", -826, 0.5)
	await tween.finished
	score_manager.add_death()
	get_tree().reload_current_scene()

func move_ground_sike_2():
	var tween = create_tween()
	tween.tween_property(ground_sike_2, "position:x", -48, 0.2)

func _on_timer_timeout() -> void:
	fail.play()
	await get_tree().create_timer(fail.stream.get_length()).timeout
	get_tree().reload_current_scene()

func _on_button_1_pressed() -> void:
	button_1.disabled = true
	button_5.position.x = 89
	correct.play()
	score_manager.add_score()
	click.play()
	await click.finished
	ground_texture_1.queue_free()
	ground_texture_2.queue_free()
	button_2.queue_free()
	button_3.queue_free()
	button_4.queue_free()
	button_1.queue_free()

func _on_button_2_pressed() -> void:
	click.play()
	await click.finished
	killzone()
	buzzer.play()

func _on_button_3_pressed() -> void:
	click.play()
	await click.finished
	killzone()
	buzzer.play()

func _on_button_4_pressed() -> void:
	click.play()
	await click.finished
	killzone()
	buzzer.play()

func _on_button_5_pressed() -> void:
	spike_17.visible = true
	spike_18.visible = true
	spike_19.visible = true
	spike_20.visible = true
	spike_21.visible = true
	spike_22.visible = true
	spike_23.visible = true
	cache_blocks.visible = true
	ghost_blocks.visible = true
	ground_sike_2.visible = true
	button_5.disabled = true
	ground_texture_13.visible = true
	ground_texture_14.visible = true
	ground_texture_15.visible = true
	ground_texture_16.visible = true
	ground_texture_5.visible = true
	ground_texture_6.visible = true
	ground_texture_17.visible = true
	ground_texture_18.visible = true
	ground_texture_19.visible = true
	ground_texture_20.visible = true
	ground_texture_21.visible = true
	spike.visible = true
	spike_2.visible = true
	spike_3.visible = true
	spike_4.visible = true
	button_6.visible = true
	ground_texture_7.visible = true
	ground_texture_8.visible = true
	ground_texture_9.visible = true
	ground_texture_10.visible = true
	ground_texture_11.visible = true
	ground_texture_12.visible = true
	tile_map_2.visible = true
	click.play()
	await click.finished
	lets_go.play()
	await lets_go.finished
	click_it.queue_free()
	ground_texture_3.queue_free()
	ground_texture_4.queue_free()
	button_5.queue_free()

func _on_show_1_body_entered(body: Node2D) -> void:
	spike.visible = false
	spike_2.visible = false
	spike_3.visible = false
	spike_4.visible = false
	button_6.visible = false
	click_it.visible = true
	button_5.visible = true
	show_1.queue_free()

func _on_button_6_pressed() -> void:
	spike_5.visible = true
	spike_6.visible = true
	spike_7.visible = true
	spike_8.visible = true
	spike_9.visible = true
	spike_10.visible = true
	ground_texture_7.queue_free()
	ground_texture_8.queue_free()
	ground_texture_9.queue_free()
	ground_texture_10.queue_free()
	ground_texture_11.queue_free()
	ground_texture_12.queue_free()
	button_6.queue_free()

func _on_area_dodge_body_entered(body: Node2D) -> void:
	spike_dodge.play("dodging")

func _on_fall_after_dodge_area_body_entered(body: Node2D) -> void:
	spike_dodge.play("fall_after_dodge")
	fall_after_dodge_area.queue_free()
	await spike_dodge.animation_finished
	spike_5.queue_free()

func _on_ground_sike_1_area_body_entered(body: Node2D) -> void:
	ground_sike.play("ground_sike_1")
	ground_sike_1_area.queue_free()

func _on_ground_sike_2_area_body_entered(body: Node2D) -> void:
	if ground_sike_2_triggered:
		return
	ground_sike.play("ground_sike_2")
	move_ground_sike_2()
	if is_instance_valid(ghost_blocks):
		ghost_blocks.queue_free()
	await ground_sike.animation_finished
	ground_sike_2_area.queue_free()
	spike_6.queue_free()

func _on_portal_area_body_entered(body: Node2D) -> void:
	body.get_parent().global_position = Vector2(950, -350)

func _on_button_7_pressed() -> void:
	button_7.disabled = true
	button_8.visible = true
	cache_blocks.queue_free()
	button_7.queue_free()

func _on_button_7_trigger_area_body_entered(body: Node2D) -> void:
	button_7.visible = true
	button_7_trigger_area.queue_free()

func _on_button_8_pressed() -> void:
	button_8.disabled = true
	var tween = create_tween()
	tween.tween_property(ground_bridge, "position:y", 0, 0.1)
	ground_bridge.global_position.y = -232
	timer_bridge.start(1.25)

func _on_timer_bridge_timeout() -> void:
	if bridge_freed:
		return
	bridge_freed = true
	ground_bridge.queue_free()
	button_8.queue_free()
