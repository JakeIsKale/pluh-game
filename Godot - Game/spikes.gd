extends Sprite2D

func _on_body_entered(body):
	if body.name == "player": 
		body.die() 

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_area_2d_area_entered(area):
	if body.name == "Player":
		reset_scene()

func reset_scene():
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()
