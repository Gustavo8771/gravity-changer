extends Area2D

onready var tiro = preload("res://scenes/shoot.tscn")

export var direction = -1
export var timer_tiro_duration: float = 1

func _ready() -> void:
	$timer_tiro.wait_time = timer_tiro_duration
	$timer_tiro.start()

func _on_timer_tiro_timeout() -> void:
	var tiro_intance = tiro.instance()
	tiro_intance.position = $position_shoot.position
	tiro_intance.direction = direction
	self.add_child(tiro_intance)
	$timer_tiro.start()
