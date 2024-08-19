extends Area2D

var next_scene=("res://world2.tscn")



func _on_body_entered(body):
	if "Player" in body.name: 
		get_tree().change_scene_to_file(next_scene)
