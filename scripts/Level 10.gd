extends Node2D

onready var portal = preload("res://scenes/portal.tscn")

func _ready() -> void:
	$FirstBoss.hide()
	$FirstBoss.set_physics_process(false)

func _on_beat_boss_timeout() -> void:
	var portal_instance = portal.instance()
	add_child(portal_instance)
	portal_instance.global_position = $portal_position.global_position
	portal_instance.path = "res://levels/Level 11.tscn"

func _on_boss_trigger_body_entered(body: Node) -> void:
	if body.name == "Player":
		$boss_trigger/CollisionShape2D.set_deferred("disabled", true)
		$beat_boss.start()
		$FirstBoss.show()
		$FirstBoss.set_physics_process(true)
