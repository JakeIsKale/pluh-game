extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("Idle")


func _on_idle_end():
	if $AnimatedSprite2D.animation == "Idle":
		$AnimatedSprite2D.play("Death")
