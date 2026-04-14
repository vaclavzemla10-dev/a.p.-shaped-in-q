extends Node2D

@onready var square = $square
@onready var rectangle = $rectangle
@onready var circle = $circle

var current = 0

func _ready():
	activate_shape(0)

func _process(delta):
	if Input.is_action_just_pressed("change_shape"):
		var current_node = get_current_shape()
		var pos = current_node.global_position
		
		current += 1
		if current > 2:
			current = 0
		
		activate_shape(current)
		
		var new_node = get_current_shape()
		new_node.global_position = pos

func activate_shape(index):
	for shape in [square, rectangle, circle]:
		shape.visible = false
		shape.set_physics_process(false)
		shape.get_node("coll").disabled = true
		shape.get_node("Camera2D").enabled = false

	var active = get_shape_by_index(index)
	active.visible = true
	active.set_physics_process(true)
	active.get_node("coll").disabled = false
	active.get_node("Camera2D").enabled = true

func get_current_shape():
	return get_shape_by_index(current)

func get_shape_by_index(index):
	if index == 0:
		return square
	elif index == 1:
		return rectangle
	else:
		return circle
