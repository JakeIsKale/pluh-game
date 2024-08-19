extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false 

func _physics_process(delta):
	#Gravity for Frog
	velocity.y += gravity * delta
	if chase == true:
		$AnimateSprite2D.play("Jump")
		var direction = 1
		if direction.x > 0:
			$AnimateSprite2D.scale.x = 1
		else:
			$AnimateSprite2D.scale.x = -1
		velocity.x = direction.x * SPEED
	else:
		$AnimateSprite2D.play("Idle")
		velocity.x = 0 
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player" :
		chase = true 



func _on_player_detection_body_exited(body):
	pass # Replace with function body.
