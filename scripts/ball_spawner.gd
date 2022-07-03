extends Node2D

export var cooldown_balls: float
export var autostart: bool

func _ready() -> void:
	$timer_spawner.wait_time = cooldown_balls
	$timer_spawner.autostart = autostart

func start_timer() -> void:
	$timer_spawner.start()
