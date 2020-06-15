extends KinematicBody2D

var money = 0
var gas = 500
var gasCost = 1
var motion = Vector2()
var jump = -400
var gravity = 100
var speed = 0
var speedCostAfterEmptyGas = 5
var stop
var endMessage



func _ready():
	endMessage = get_node("EndMessage")
	remove_child(endMessage)

func _physics_process(delta):
	print(speed)
	#seta a altura
	motion.y += gravity
	
	#lógica de pulo			
	jump(delta)
		
	#lógica para movimentação
	move(delta)
	
	#lógica para parar movimentação
	stop(delta)
				
	#lógica para manter o personagem parado caso nenhuma tecla esteja pressionada			
	no_action(delta)
	
	#lógica para quando acabar o combustível
	empty_gas(delta)
	
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

# warning-ignore:unused_argument
func empty_gas(delta) :
	if speed == 0 and gas == 0:
		add_child(endMessage)		
	pass

#não ta funcionando 				
func jump(delta):
	if Input.is_action_pressed("ui_up"):
		motion.y = jump
		
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Upgrade.tscn")
