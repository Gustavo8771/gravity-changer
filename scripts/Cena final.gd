extends Node2D

onready var tween_opacity = $tween_opacity

func _ready() -> void:
	Hud.kill_timer()
	Global.save_data()
	Global.can_pause = false
	
	$Control/VBoxContainer/mortes.text = "Mortes: " + str(Global.mortes)
	
	if Global.mortes == 0:
		$Control/VBoxContainer/mortes.text += " (mito)"
	
	$Control/VBoxContainer/estrelas.text = "Estrelas: " + str(Global.estrelas)
	
	$Control/VBoxContainer/tempo.text = "Tempo: " + str(Global.time)

func _on_delay_timeout() -> void:
	tween_opacity.interpolate_property($Control, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 4, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween_opacity.start()

func _on_voltar_pressed() -> void:
	tween_opacity.interpolate_property($Control, "modulate", $Control.modulate, Color(1, 1, 1, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween_opacity.start()
	yield(get_tree().create_timer(1), "timeout")
	if get_tree().change_scene("res://scenes/Tela Inicial.tscn") != OK:
		print("Algo deu errado!")
