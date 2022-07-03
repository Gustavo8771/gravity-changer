extends Area2D

var velocity = Vector2.ZERO
var speed = 150

func _physics_process(delta: float) -> void:
	look_at(Global.player.global_position)
	
	if Global.player != null:
		velocity = global_position.direction_to(Global.player.global_position)
		global_position += velocity * speed * delta

func _on_FirstBoss_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()
