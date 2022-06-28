extends Node2D

onready var portal = preload("res://scenes/portal.tscn")

func _on_beat_boss_timeout() -> void:
	var portal_instance = portal.instance()
	add_child(portal_instance)
	portal_instance.global_position = $portal_position.global_position
	portal_instance.path = "res://levels/Level 11.tscn"
