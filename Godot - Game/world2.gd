extends Node2D

func _on_deathbutton_pressed():
	get_tree().change_scene_to_file("res://bossdying.tscn")


func _on_deathbutton_2_pressed():
	get_tree().quit()

