extends Node


func _on_The_Waking_pressed():
	print_debug("I'm getting clicked")
	get_tree().change_scene("res://TheodoreRoethkePoem.tscn")


func _on_December_18_For_M_pressed():
	print_debug("I'm getting clicked")
	get_tree().change_scene("res://LindaPastanPoem.tscn")
