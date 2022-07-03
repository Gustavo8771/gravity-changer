extends Node2D

func _on_SecondBoss_boss_morreu() -> void:
	if get_tree().change_scene("res://levels/Voto no Lobão.tscn") != OK:
		print("Algo deu errado!")
