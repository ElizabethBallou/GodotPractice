extends KinematicBody2D

# this was created using a basic Godot tutorial: https://www.youtube.com/watch?v=wETY5_9kFtA

var motion = Vector2()

const UP = Vector2(0, -1)

const SPEED = 200

const GRAVITY = 20

const JUMP_HEIGHT = -500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_key_pressed(KEY_D):
		motion.x = SPEED
	elif Input.is_key_pressed(KEY_A):
		motion.x = -SPEED
	else:
		motion.x = 0	
		
	if is_on_floor():
		# print("on floor")
		if Input.is_key_pressed(KEY_W):
			motion.y = JUMP_HEIGHT
				
	motion = move_and_slide(motion, UP)
	pass
