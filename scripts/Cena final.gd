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
