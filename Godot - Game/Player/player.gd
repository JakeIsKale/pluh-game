extends CharacterBody2D

class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var global = get_node("/root/Global")

@onready var coins_group = get_tree().get_nodes_in_group("coins")
var total_coins = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 1
var max_jumps = 2
var Global_lives = 3

func _ready():
	$AnimatedSprite2D.play("Idle")
	for coin in coins_group:
		total_coins += 1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if velocity.y < 0:
		$AnimatedSprite2D.play("Jump")
	if velocity.y > 0:
		$AnimatedSprite2D.play("Fall")
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		jump_count = jump_count + 1
		velocity.y = JUMP_VELOCITY

		$AnimatedSprite2D.play("Jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor() and Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.scale.x = direction
	else:
		velocity.x = direction * SPEED

	if not is_on_floor(): 
		velocity.x = lerp(velocity.x, 0.0, 0.00000001)
		
	if is_on_floor() and not direction:
		$AnimatedSprite2D.play("Idle")
		jump_count = 1
	
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()


	move_and_slide()
	
func _death(area):
	if area.has_meta("Death"):
		if Global_lives > 0:
			position = Vector2(546, 238)
			Global_lives -= 1 
		else:
			_reset()
			get_tree().reload_current_scene()
		

func _Coin():
	global.coin += 1
	
func _reset():
	global.coin = 0



func _Door(area):
	if area.has_meta("Door"):
			_reset()
			get_tree().change_scene_to_file("res://Win_screen.tscn")
			print("ye")
