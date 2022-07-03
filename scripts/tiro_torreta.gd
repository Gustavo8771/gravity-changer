extends Area2D

var mov = Vector2.ZERO
var speed = 600
var direction

func _ready() -> void:
	if Global.player != null:
		direction = Global.player.global_position

func _physics_process(delta: float) -> void:
	if Global.player != null:
		global_position += mov * speed * delta

func _on_tiro_torreta_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.die()
	queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
