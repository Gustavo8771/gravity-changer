extends Control

onready var tween_opacidade = $tween_brabo

func _ready() -> void:
	Global.load_game()
	if Global.zerou == true or Global.last_level == "Level 18" or Global.last_level == "Level Secreto":
		$fase_secreta.show()
	else:
		$fase_secreta.hide()
	Hud.kill_timer()
	Global.can_pause = false

func saindo_da_tela(path) -> void:
	$delay_exiting.start()
	tween_opacidade.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween_opacidade.start()
	yield(get_tree().create_timer(1), "timeout")
	if get_tree().change_scene(path) != OK:
		print("Algo deu errado!")

func _on_Jogar_pressed() -> void:
	saindo_da_tela("res://levels/Level 1.tscn")

func _on_Creditos_pressed() -> void:
	saindo_da_tela("res://scenes/TelaCreditos.tscn")

func _on_Sair_pressed() -> void:
	$delay_exiting.start()
	tween_opacidade.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween_opacidade.start()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().quit()

func _on_Carregar_pressed() -> void:
	var file = File.new()
	if file.file_exists("user://save.dat"):
		Global.load_game()
		if str(Global.data_dictionary["last_level"]) == "Null":
			OS.alert("[ERRO] Nenhum jogo salvo encontrado!", "ERRO")
			return
		saindo_da_tela("res://levels/" + str(Global.data_dictionary["last_level"]) + ".tscn")
		return
	OS.alert("[ERRO] Nenhum jogo salvo encontrado!", "ERRO")

func _on_delay_start_timeout() -> void:
	tween_opacidade.interpolate_property($VBoxContainer, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween_opacidade.start()

func _on_fase_secreta_pressed() -> void:
	if Global.zerou != true and Global.last_level != "Level 18" or Global.last_level != "Level Secreto":
		OS.alert("Derrote o chefão final primeiro!", "Aviso!")
	else:
		saindo_da_tela("res://levels/Level Secreto.tscn")
