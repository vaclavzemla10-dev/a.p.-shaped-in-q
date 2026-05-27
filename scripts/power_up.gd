extends Area2D

@onready var jump: Label = $"../jump"
@onready var timer: Timer = $Timer
@onready var square: CharacterBody2D = $"../character/square"
@onready var rectangle: CharacterBody2D = $"../character/rectangle"
@onready var circle: CharacterBody2D = $"../character/circle"
@onready var stopwatch: Label = $"../stopwatch"

var time_left = 3.0

func _ready() -> void:
	circle.JUMP_VELOCITY = -300
	rectangle.JUMP_VELOCITY = -250
	square.JUMP_VELOCITY = -280

func _process(delta: float) -> void:
	if timer.time_left > 0:
		stopwatch.text = str(snapped(timer.time_left, 0.1))

func _on_body_entered(body: Node2D) -> void:
	position.x += 1000
	body.JUMP_VELOCITY = body.JUMP_VELOCITY * 2
	jump.visible = true
	timer.start(3)

func _on_timer_timeout() -> void:
	stopwatch.position.x = -1067
	circle.JUMP_VELOCITY = -300
	rectangle.JUMP_VELOCITY = -250
	square.JUMP_VELOCITY = -280
