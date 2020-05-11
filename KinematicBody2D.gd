extends KinematicBody2D

var gas = 500
var gasCost = 1
var motion = Vector2()
var jump = 10
var speed = 0
var speedCostAfterEmptyGas = 5
var stop

func _physics_process(delta):
	
	#seta a altura
	motion.y = jump
	
	#lógica de pulo			
	jump(delta)
	
	#lógica para movimentação
	move(delta)
	
	#lógica para parar movimentação
	stop(delta)
				
	#lógica para manter o personagem parado caso nenhuma tecla esteja pressionada			
	no_action(delta)
				
	#mover camera de acordo com o player
# warning-ignore:return_value_discarded
	move_and_slide(motion)
	pass
	
# warning-ignore:unused_argument
func move(delta):
	#verifica se o jogador esta pressionando pra andar
	if Input.is_action_pressed("ui_right"):
		
		#seta a velocidade
		motion.x = speed
		
		#aumenta a velocidade no inicio até 500
		if speed < 500 and gas > 0 :
			speed += 5;
		
		#lógica de diminuição de gas	
		#lógica de inércia de velocidade quando o gás acabar		
		if speed > 0:
			if gas > 0:
				gas -= gasCost	
			else:
				speed -= speedCostAfterEmptyGas	
	pass
				
# warning-ignore:function_conflicts_variable
# warning-ignore:unused_argument
# warning-ignore:function_conflicts_variable
func stop(delta):
	#verifica se o jogador esta pressionando pra andar
	if Input.is_action_pressed("ui_left"):
		
		#seta a velocidade
		motion.x = speed
		
		#diminui velocidade de movimento até chegar a zero
		if speed > 0 :
			speed -= 20
		else:
			speed = 0	
			
	pass
				
# warning-ignore:unused_argument
func no_action(delta) :
	if !Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left") :				
		motion.x = speed
		
		if speed > 0 :
			speed -= 10
		else:
			speed = 0
		
	pass

#não ta funcionando 				
func jump(delta):
	if Input.is_action_pressed("ui_up"):			
		jump = 100
	
	pass
