extends AnimatedSprite2D

var dead = false

func _process(delta):
	if dead:
		return
		
		

	var parent = get_parent()
	var direction = Input.get_axis("left", "right")
	
	if direction > 0:
		flip_h = false
	elif direction < 0:
		flip_h = true
		
	if parent.is_on_floor():
		if direction == 0:
			play("idle")
		else:
			play("run")
	else:
		play("jmup")
