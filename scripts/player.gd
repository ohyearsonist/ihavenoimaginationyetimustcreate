extends CharacterBody2D

@export var speed = 50.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("player_down"):
		direction.y = 1
		$AnimatedSprite2D.play("walk_front")
	elif Input.is_action_pressed("player_up"):
		direction.y = -1.0
		$AnimatedSprite2D.play("walk_back")	
	elif Input.is_action_pressed("player_left"):
		direction.x = -1.0
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("player_right"):
		direction.x = 1.0
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = false
	else:
		direction.y = 0.0
		direction.x = 0.0
	
	if $AnimatedSprite2D.animation == "walk_right" and direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle_right")
	elif $AnimatedSprite2D.animation == "walk_front" and direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle_front")
	elif $AnimatedSprite2D.animation == "walk_back" and direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle_back")
	
	velocity.x = direction.x * speed
	velocity.y = direction.y * speed
	
	move_and_slide()
