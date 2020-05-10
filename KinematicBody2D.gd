extends KinematicBody2D

var gas = 600
var gasCost = 1
var motion = Vector2()
var speed = 500
var speedCostAfterEmptyGas = 1

func _process(delta):
	motion.y += 10
	
	if Input.is_action_pressed("ui_right") && speed > 0:
		motion.x = speed
		if gas > 0:
			gas -= gasCost	
		else:
			speed -= speedCostAfterEmptyGas
	else:
		motion.x = 0
	
	move_and_slide(motion)
	pass
