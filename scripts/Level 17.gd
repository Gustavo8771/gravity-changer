extends Node2D

var portal = preload("res://scenes/portal.tscn")

func _on_SecondBoss_boss_morreu() -> void:
	var portal_instance = portal.instance()
	call_deferred("add_child", portal_instance)
	portal_instance.global_position = Vector2(41, 21)
	portal_instance.path = "res://levels/Level 18.tscn"
