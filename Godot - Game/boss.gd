extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false 
var direction = 1

func _physics_process(delta):
	#Gravity for Frog
	velocity.y += gravity * delta

	if chase:
		$AnimateSprite2D.play("Jump")
		if player.global_position.x < global_position.x:
			direction = -1
		elif player.global_position.x > global_position.x:
			direction = 1
		if direction > 0:
			$AnimateSprite2D.scale.x = -1
		else:
			$AnimateSprite2D.scale.x = 1
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
 
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player" :
		player = body
		chase = true 



func _on_player_detection_body_exited(body):
	if body.name == "Player" :
		$AnimateSprite2D.play("Idle")
		velocity.x = 0
		player = body
		chase = false

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		$AnimateSprite2D.play("Death")
		body.velocity.y = -100
		self.queue_free()

