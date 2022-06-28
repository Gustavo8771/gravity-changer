extends Control

func _ready() -> void:
	Hud.kill_timer()

func _on_Jogar_pressed() -> void:
	if get_tree().change_scene("res://levels/Level 1.tscn") != OK:
		print("Algo deu errado!")

func _on_Creditos_pressed() -> void:
	if get_tree().change_scene("res://scenes/TelaCreditos.tscn") != OK:
		print("Algo deu errado!")

func _on_Sair_pressed() -> void:
	get_tree().quit()
