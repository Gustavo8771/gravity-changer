extends Node2D

onready var troll = preload("res://levels/TrollScene.tscn")

var a = 0

func _ready() -> void:
	Global.zerou = true

func jumpscare() -> void:
	var troll_instance = troll.instance()
	add_child(troll_instance)
	troll_instance.global_position = Vector2.ZERO

func _on_jumpscare_timeout() -> void:
	$jumpscare.wait_time = .3
	$jumpscare.start()
	jumpscare()

func _on_tempo_pra_acabar_timeout() -> void:
	if get_tree().change_scene("res://levels/Cena final.tscn") != OK:
		print("Algo deu errado!")
