extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("Idle")


func _on_idle_end():
	if $AnimatedSprite2D.animation == "Idle":
		$AnimatedSprite2D.play("Death")



func _on_playagain_pressed():
	get_tree().change_scene_to_file("res://world.tscn")



func _on_quit_pressed():
	get_tree().quit()
