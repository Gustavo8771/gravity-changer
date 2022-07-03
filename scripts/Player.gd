extends KinematicBody2D

onready var runFx = $runFx

var move_direction
var velocity = Vector2.ZERO
var speed = 150
var gravity_value = 300
var gravity = 1

var pegou_estrela = false
var can_jump = true

func _ready() -> void:
	Global.data_dictionary["last_level"] = get_tree().get_current_scene().get_name()
	Global.last_level = get_tree().get_current_scene().get_name()
	Global.save_data()
	Global.player = self
	Global.can_pause = true
	$anim.play("aparecendo")
	set_physics_process(false)

func _exit_tree() -> void:
	Global.seconds = Hud.segundos
	Global.minutes = Hud.minutos
	Global.save_data()

func _physics_process(_delta: float) -> void:
	velocity.y = gravity_value * gravity
	
	_get_input()
	
	if !is_on_floor():
		runFx.hide()
	else:
		runFx.show()
	runFx.position.x *= move_direction
	runFx.scale.x = move_direction

func _get_input() -> void:
	move_direction = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	if move_direction != 0 and is_on_floor():
		runFx.scale.x = move_direction
		runFx.emitting = true
	
	if Input.is_action_just_pressed("change_gravity") and can_jump:
		gravity *= -1
	
	velocity.x = speed * move_direction
	velocity = move_and_slide(velocity, Vector2.UP)

func die() -> void:
	$anim.play("morrendo")
	$col.set_deferred("disable", true)
	Global.mortes += 1
	if pegou_estrela == true:
		Global.estrelas -= 1
	set_physics_process(false)

func _on_anim_animation_finished(anim_name: String) -> void:
	if anim_name == "aparecendo":
		set_physics_process(true)
	if anim_name == "morrendo":
		if get_tree().reload_current_scene() != OK:
			print("Algo deu errado!")
