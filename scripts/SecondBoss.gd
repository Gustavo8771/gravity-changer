extends KinematicBody2D

signal boss_morreu

var velocity = Vector2.ZERO
var speed = 100
export var life = 6

func _ready() -> void:
	$life_label.text = str(life)

func _physics_process(delta: float) -> void:
	if Global.player != null:
		look_at(Global.player.global_position)
		velocity = global_position.direction_to(Global.player.global_position)
		global_position += velocity * speed * delta

func take_damage() -> void:
	life -= 1
	$texture.modulate = Color(1, 1, 1, 1)
	if life <= 0:
		$texture.modulate = Color(0.87, 0.17, 0.17, 1)
		queue_free()
		$dieFx.emitting = true
		$dieTimer.start()
		$life_label.text = "0"
		set_physics_process(false)
		emit_signal("boss_morreu")
		return
	$damage_timer.start()
	$life_label.text = str(life)

func _on_collision_body_entered(body: Node) -> void:
	if body.name == "SecondBoss":
		return
	
	if body.name != "Player" and body.name != "tilemap":
		take_damage()
	
	if body.name == "Player":
		body.die()

func _on_damage_timer_timeout() -> void:
	$texture.modulate = Color(0.87, 0.17, 0.17, 1)

func _on_dieTimer_timeout() -> void:
	queue_free()
