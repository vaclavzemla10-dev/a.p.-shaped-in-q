extends Label

@onready var next_level: Label = $"."
@onready var arrow: Area2D = $"../../arrow"
var activated = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow.position.x += 1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score_manager.score == 2 and not activated:
		activated = true
		arrow.position.x -= 1000
		animation_player.play("next_level")
