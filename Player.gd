extends KinematicBody2D

var motion = Vector2()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y += 10
	
	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
		motion.x = 100
	elif Input.is_mouse_button_pressed(BUTTON_LEFT):
		motion.x = -100
	else:
		motion.x = 0	
	move_and_slide(motion)
	pass
