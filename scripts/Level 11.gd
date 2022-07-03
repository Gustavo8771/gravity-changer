extends Node2D

var troll_counter = 0

var portal_intance

onready var troll = preload("res://levels/TrollScene.tscn")
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
		portal_intance = portal.instance()
		call_deferred("add_child", portal_intance)
		portal_intance.global_position = $portals_position/portal2_position.global_position

func _on_area_troll_2_body_entered(body: Node) -> void:
	if body.name == "Player":
		var troll_scene_instance = troll.instance()
		call_deferred("add_child", troll_scene_instance)
		$Player.set_physics_process(false)
		portal_intance.queue_free()
		yield(get_tree().create_timer(2), "timeout")
		$Player.set_physics_process(true)
		$area_troll_2/CollisionShape2D.set_deferred("disabled", true)
		$timer_pos_jumpscare.start()

func _on_timer_pos_jumpscare_timeout() -> void:
	$tilemap.queue_free()
	$Spike.queue_free()
	$Player.can_jump = false
	$Player.gravity = 1
	$timer_pos_jumpscare.queue_free()

func _on_proxima_cena_body_entered(body: Node) -> void:
	if body.name == "Player":
		if get_tree().change_scene("res://levels/Level 12.tscn") != OK:
			print("Algo deu errado!")
