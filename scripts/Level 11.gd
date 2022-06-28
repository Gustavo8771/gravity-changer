extends Node2D

var troll_counter = 0

onready var portal = preload("res://scenes/portal.tscn")

func _ready() -> void:
	$area_troll_2/CollisionShape2D.set_deferred("disabled", true)

func _on_area_troll_1_body_entered(body: Node) -> void:
	if body.name == "Player":
		if troll_counter == 0:
			$portal.queue_free()
			$area_troll_2/CollisionShape2D.set_deferred("disabled", false)
		troll_counter += 1
	if troll_counter == 1:
		var portal_intance = portal.instance()
		call_deferred("add_child", portal_intance)
		portal_intance.global_position = $portals_position/portal2_position.global_position

func _on_area_troll_2_body_entered(body: Node) -> void:
	if body.name == "Player":
		if get_tree().change_scene("res://levels/TrollScene.tscn") != OK:
			print("Algo deu errado")
