extends Area2D



func _on_Spike_body_entered(body: Node) -> void:
	if body.name == "Player":
		if get_tree().reload_current_scene() != OK:
			print("Algo deu errado!")
