extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false 
func _physics_process(delta):
	#Gravity for Frog
	velocity.y += gravity * delta
	if chase:
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			print(str(player.global_position))
			velocity.x = direction.x * SPEED
		else: 
			print("Left")
			velocity.x = direction.x * SPEED
		move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player" :
		player = body
		chase = true 


func _on_player_detection_body_exited(body):
	pass # Replace with function body.
