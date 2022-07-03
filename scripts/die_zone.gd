extends Area2D

func _on_die_zone_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()
