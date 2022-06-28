extends Area2D

func _on_die_zone_body_entered(body: Node) -> void:
	if body.name == "Player":
		if get_tree().reload_current_scene() != OK:
			print("Algo deu errado!")
