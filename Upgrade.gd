extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/KinematicBody2d").money = 700
	
	verifyMoney()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")


func _on_Play_pressed():
	get_tree().change_scene("res://main.tscn")


func _on_QuantityUpgrade1Button_pressed():
	get_node("/root/KinematicBody2d").money -= 100
	get_node("/root/KinematicBody2d").gas += 100
	verifyMoney()
	
# Função que atualiza o money da screen main
func verifyMoney():
	get_node("Money").text = '$ ' + str(get_node("/root/KinematicBody2d").money)
	if get_node("/root/KinematicBody2d").money >= 100 and (get_node("/root/KinematicBody2d").gas / 100) - 5 < 6:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer/QuantityUpgrade1Button").visible = true
	else:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer/QuantityUpgrade1Button").visible = false
	
	get_node("VBoxContainer/VBoxContainer/HBoxContainer/QuantityUpgrade1").text = str(((get_node("/root/KinematicBody2d").gas / 100) - 5))  + '/6   '
