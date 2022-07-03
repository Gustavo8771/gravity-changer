extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 15000

func _physics_process(delta: float) -> void:
	velocity.y = speed * delta
	
	velocity = move_and_slide(velocity)
