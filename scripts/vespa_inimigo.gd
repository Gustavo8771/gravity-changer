extends KinematicBody2D

onready var tiro = preload("res://scenes/vespa_shoot.tscn")

onready var tiro_position = $tiro_position
onready var teto_collider = $teto_collider
onready var chao_collider = $chao_collider

var velocity = Vector2.ZERO
export var speed = 3000
export var direction = 1

func _physics_process(delta: float) -> void:
	velocity.y = speed * delta * direction
	
	velocity = move_and_slide(velocity)
	
	if teto_collider.is_colliding():
		direction *= -1
		teto_collider.enabled = false
		chao_collider.enabled = true
	elif chao_collider.is_colliding():
		direction *= -1
		teto_collider.enabled = true
		chao_collider.enabled = false

func _on_delay_tiro_timeout() -> void:
	var tiro_instancia = tiro.instance()
	get_parent().add_child(tiro_instancia)
	tiro_instancia.global_position = tiro_position.global_position
	tiro_instancia.velocity = global_position.direction_to(Global.player.global_position)
	$delay_tiro.start()
