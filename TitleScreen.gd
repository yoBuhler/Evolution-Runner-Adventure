extends Control



func _on_Play_pressed():
	get_tree().change_scene("res://Upgrade.tscn")


func _on_Sobre_pressed():
	get_tree().change_scene("res://Sobre.tscn")


func _on_Crditos_pressed():
	get_tree().change_scene("res://Créditos.tscn")


func _on_Button_pressed():
	get_tree().quit()
