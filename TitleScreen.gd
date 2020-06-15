extends Control

func _ready():
	get_node("/root/Singleton").gas = 500
	#get_node("/root/Singleton").gas = 500 if get_node("/root/Singleton").gas == null else get_node("/root/Singleton").gas
	get_node("/root/Singleton").money = 0
	#get_node("/root/Singleton").money = 0 if get_node("/root/Singleton").money == null else get_node("/root/Singleton").money
	get_node("/root/Singleton").acceleration = 5
	#get_node("/root/Singleton").acceleration = 5 if get_node("/root/Singleton").acceleration == null else get_node("/root/Singleton").acceleration
	get_node("/root/Singleton").topSpeed = 500
	#get_node("/root/Singleton").topSpeed = 500 if get_node("/root/Singleton").topSpeed == null else get_node("/root/Singleton").topSpeed
	

func _on_Play_pressed():
	get_tree().change_scene("res://Upgrade.tscn")


func _on_Sobre_pressed():
	get_tree().change_scene("res://Sobre.tscn")


func _on_Crditos_pressed():
	get_tree().change_scene("res://Créditos.tscn")


func _on_Button_pressed():
	get_tree().quit()
