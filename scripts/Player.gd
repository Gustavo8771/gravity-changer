extends KinematicBody2D

var move_direction
var velocity = Vector2.ZERO
var speed = 150
var gravity_value = 300
var max_gravity = 350
var gravity = 1

var is_armado = false

func _ready() -> void:
	Global.player = self
	$anim.play("aparecendo")
	set_physics_process(false)

func _physics_process(_delta: float) -> void:
	velocity.y = gravity_value * gravity
	
	_get_input()

func _get_input() -> void:
	move_direction = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	if Input.is_action_just_pressed("change_gravity"):
		gravity *= -1
	
	velocity.x = speed * move_direction
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_anim_animation_finished(anim_name: String) -> void:
	if anim_name == "aparecendo":
		set_physics_process(true)
