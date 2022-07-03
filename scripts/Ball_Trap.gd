extends KinematicBody2D

var velocity = Vector2.ZERO
export var direction = 1
export var speed = 200

func _physics_process(_delta: float) -> void:
	if is_on_wall():
		direction *= -1
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity)

func _on_collision_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()
