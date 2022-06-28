extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 500
export var direction = -1

func _physics_process(_delta: float) -> void:
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity)

func _on_shoot_body_entered(body: Node) -> void:
	if body.name == "Player":
		if get_tree().reload_current_scene() != OK:
			print("Alguma coisa deu errado!")
		queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_shoot_area_entered(area: Area2D) -> void:
	if area.name != "trap_atiradora": queue_free()
