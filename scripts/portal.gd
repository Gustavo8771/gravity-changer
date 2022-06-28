extends Area2D

export var path: String

func _on_portal_body_entered(body: Node) -> void:
	if body.name == "Player":
		if get_tree().change_scene(path) != OK:
			print("Algo deu errado!")
