extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	verifyMoney()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")


func _on_Play_pressed():
	get_tree().change_scene("res://main.tscn")


func _on_QuantityUpgrade1Button_pressed():
	get_node("/root/Singleton").money -= 100
	get_node("/root/Singleton").gas += 100
	verifyMoney()
	
# Função que atualiza o money da screen main
func verifyMoney():
	get_node("Money").text = '$ ' + str(get_node("/root/Singleton").money)
	
	if get_node("/root/Singleton").money >= 100 and (get_node("/root/Singleton").gas / 100) - 5 < 6:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer/QuantityUpgrade1Button").visible = true
	else:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer/QuantityUpgrade1Button").visible = false
	
	if get_node("/root/Singleton").money >= 50 and (get_node("/root/Singleton").acceleration / 5) <= 6:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer2/QuantityUpgrade2Button").visible = true
	else:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer2/QuantityUpgrade2Button").visible = false
	
	if get_node("/root/Singleton").money >= 50 and (get_node("/root/Singleton").topSpeed / 100) - 5 < 6:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer3/QuantityUpgrade3Button").visible = true
	else:
		get_node("VBoxContainer/VBoxContainer/HBoxContainer3/QuantityUpgrade3Button").visible = false
	
	get_node("VBoxContainer/VBoxContainer/HBoxContainer/QuantityUpgrade1").text = str(((get_node("/root/Singleton").gas / 100) - 5))  + '/6   '
	get_node("VBoxContainer/VBoxContainer/HBoxContainer2/QuantityUpgrade2").text = str((get_node("/root/Singleton").acceleration / 5) - 1)  + '/6   '
	get_node("VBoxContainer/VBoxContainer/HBoxContainer3/QuantityUpgrade3").text = str((get_node("/root/Singleton").topSpeed / 100) - 5)  + '/6   '


func _on_QuantityUpgrade2Button_pressed():
	get_node("/root/Singleton").money -= 100
	get_node("/root/Singleton").acceleration += 5
	verifyMoney()


func _on_QuantityUpgrade3Button_pressed():
	get_node("/root/Singleton").money -= 100
	get_node("/root/Singleton").topSpeed += 100
	verifyMoney()
