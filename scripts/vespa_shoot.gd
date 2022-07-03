extends Area2D

var velocity = Vector2.ZERO
var speed = 500

func _physics_process(delta: float) -> void:
	if Global.player != null:
		global_position += velocity * speed * delta

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_vespa_shoot_body_entered(body: Node) -> void:
	if body.name == "tilemap":
		queue_free()
	elif body.name == "Player":
		body.die()
