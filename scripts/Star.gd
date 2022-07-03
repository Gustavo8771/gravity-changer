extends Area2D

func _on_Star_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.estrelas += 1
		body.pegou_estrela = true
		Global.save_data()
		queue_free()
