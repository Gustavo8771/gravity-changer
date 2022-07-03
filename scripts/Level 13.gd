extends Node2D

onready var portal = preload("res://scenes/portal.tscn")

func _on_chave_body_entered(body: Node) -> void:
	if body.name == "Player":
		var portal_instance = portal.instance()
		call_deferred("add_child", portal_instance)
		portal_instance.global_position = $portal_position.global_position
		portal_instance.path = "res://levels/Level 14.tscn"
		$chave.queue_free()
