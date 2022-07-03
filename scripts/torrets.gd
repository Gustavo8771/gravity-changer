extends Area2D

onready var tiro = preload("res://scenes/tiro_torreta.tscn")

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	$atirar_delay.wait_time = rng.randf_range(1.5, 4)
	var tween_move = $tween_move as Tween
	var tween_scale = $tween_escala as Tween
	var tween_rotation = $tween_rotation as Tween
	if Global.secondBoss != null:
		tween_move.interpolate_property(self, "position", global_position, Vector2(rng.randf_range(30, 700), rng.randf_range(30, 300)), 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween_scale.interpolate_property(self, "scale", scale, Vector2(2, 2), 4, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween_rotation.interpolate_property(self, "rotation_degrees", rotation_degrees, 360, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween_move.start()
		tween_scale.start()
		tween_rotation.start()
	else:
		queue_free()

func _on_tween_move_tween_completed(_object: Object, _key: NodePath) -> void:
	$atirar_delay.start()

func _on_atirar_delay_timeout() -> void:
	var tiro_instance = tiro.instance()
	get_parent().add_child(tiro_instance)
	tiro_instance.global_position = global_position
	tiro_instance.mov = global_position.direction_to(Global.player.global_position)
	$atirar_delay.start()
