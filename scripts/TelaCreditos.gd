extends Control

func _ready() -> void:
	Global.can_pause = false

func _on_LinkButton_pressed() -> void:
	if OS.shell_open("https://github.com/Gustavo8771") != OK:
		print("Algo deu errado!")

func _on_Button_pressed() -> void:
	if get_tree().change_scene("res://scenes/Tela Inicial.tscn") != OK:
		print("Algo deu errado!")
