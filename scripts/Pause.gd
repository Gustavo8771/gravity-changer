extends CanvasLayer

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause") and Global.can_pause == true:
		get_tree().paused = !get_tree().paused
		$Control.visible = !$Control.visible

func _on_continuar_pressed() -> void:
	get_tree().paused = false
	$Control.hide()

func _on_menu_pressed() -> void:
	if get_tree().change_scene("res://scenes/Tela Inicial.tscn") != OK:
		print("Algo deu errado!")
	get_tree().paused = false
	$Control.hide()
