extends KinematicBody2D

const speed = 120
const gravity = 20
const jump_power = -350
const BOMB = preload("res://bomb.tscn")

var velocity = Vector2()
var on_ground = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.play("running")
		$AnimatedSprite.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.play("running")
		$AnimatedSprite.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else: 
		
		if on_ground == true:
			$AnimatedSprite.play("idle")
		
	velocity.x = lerp(velocity.x,0,0.2)
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
			velocity.y = jump_power
			$sound_jump.play()
			on_ground = false
			
	if Input.is_action_just_pressed("ui_accept"):
		var bomb = BOMB.instance()
		
		if sign($Position2D.position.x) == 1:
			bomb.set_fireball_direction(1)
		else:
			bomb.set_fireball_direction(-1)
			
		get_parent().add_child(bomb)
		bomb.position = $Position2D.global_position
		
	velocity.y += gravity 
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		else: 
			$AnimatedSprite.play("fall")
	
	velocity = move_and_slide(velocity, Vector2.UP)



func _on_Fall_Zone_body_entered(body):
	get_tree().change_scene("res://DeathScreen.tscn")
	$fall_death.play()
func _ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = jump_power *0.7
	
	if position.x < enemyposx:
		velocity.x = -500
	elif position.x > enemyposx:
		velocity.x = 500
	
	Input.action_release("ui_left")
	Input.action_release("ui_right")
	
	$Timer.start()
	
func _bounce():
	velocity.y = jump_power *0.8


func _on_Timer_timeout():
	pass
	#get_tree().change_scene("res://Stage 1.tscn")
