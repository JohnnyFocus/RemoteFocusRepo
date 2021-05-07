extends KinematicBody2D

export var direction = -1 
var velocity = Vector2()
const gravity = 20
export var detects_cliffs = true



func _ready():
	if direction == 1: 
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	$AnimatedSprite.play("walking")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	
	velocity.y += gravity
	velocity.x = 30 * direction 
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_top_checker_body_entered(body):
	$AnimatedSprite.play("death")
	
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$sides_checker.set_collision_layer_bit(4,false)
	$sides_checker.set_collision_mask_bit(0,false)
	$Timer.start()
	body.bounce()
	
func _on_Timer_timeout():
	queue_free() # Replace with function body.

func _on_sides_checker_body_entered(body):
	body.ouch(position.x)
