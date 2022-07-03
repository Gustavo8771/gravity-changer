extends Node2D

func _ready() -> void:
	$Player.can_jump = false

func _on_zona_can_jump_body_entered(body: Node) -> void:
	if body.name == "Player":
		$Player.can_jump = true
