extends Node2D

func _ready() -> void:
	$Player.get_node("musicaFF").autoplay = false
	$Player.get_node("musicaFF").playing = false

func _on_SecondBoss_boss_morreu() -> void:
	if get_tree().change_scene("res://levels/Voto no Lobão.tscn") != OK:
		print("Algo deu errado!")
