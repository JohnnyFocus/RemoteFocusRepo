extends Area2D

const speed = 180
var velocity = Vector2()
var direction = 1 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_fireball_direction(dir):
	direction = dir
	
	if dir == -1:
		$AnimatedSprite.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = speed * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_FireBall_body_entered(body):
	queue_free()
