extends Control

func _on_LinkButton_pressed() -> void:
	OS.shell_open("https://github.com/Gustavo8771")

func _on_Button_pressed() -> void:
	if get_tree().change_scene("res://scenes/Tela Inicial.tscn") != OK:
		print("Algo deu errado!")
