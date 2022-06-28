extends Area2D

onready var tiro = preload("res://scenes/shoot.tscn")

export var timer_tiro_duration = 1

func _ready() -> void:
	$timer_tiro.wait_time = timer_tiro_duration

func _physics_process(_delta: float) -> void:
	pass

func _on_timer_tiro_timeout() -> void:
	var tiro_intance = tiro.instance()
	tiro_intance.position = $position_shoot.position
	self.add_child(tiro_intance)
	$timer_tiro.start()
