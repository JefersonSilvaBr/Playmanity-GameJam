extends KinematicBody2D
class_name Player

var velocity : Vector2 = Vector2.ZERO
var kill = 0
var damage = 0

onready var arrow_ref = preload("res://entities/effects/arrow.tscn")
var cooldown : bool = true
var shoot_angle : float
var dir : Vector2

var current_state : int = 0
enum{IDLE, RUN, AIMING, ATTACK, HURT}

func _process(delta):
	match current_state:
		IDLE:
			_idle()
		RUN:
			_run()
		AIMING:
			_aiming()
		ATTACK:
			_attack()
		HURT:
			pass
	$Arch.look_at(get_global_mouse_position())
	_verify_life()


func _idle():
	velocity = Vector2(0,0)
	_moves()
	_move_slide()
	_idle_check()

func _run():
	_moves()
	_move_slide()
	_run_check()

func _aiming():
	_moves()
	_move_slide()
	cooldown = false
	$cooldown.wait_time = Global.cooldown_list[$State.cooldown]
	$cooldown.start()

func _attack():
	var arrow_instance = arrow_ref.instance()
	get_parent().add_child(arrow_instance)
	arrow_instance.damage = damage
	arrow_instance.look_at(get_global_mouse_position())
	arrow_instance.position.x = $Arch/position_attack.global_position.x
	arrow_instance.position.y = $Arch/position_attack.global_position.y
	current_state = IDLE


func _idle_check():
	if Input.is_action_pressed("ui_attack") and cooldown:
		current_state = AIMING
	elif not Input.is_action_pressed("moves"):
		current_state = IDLE
	else:
		current_state = RUN

func _run_check():
	if Input.is_action_pressed("ui_attack") and cooldown:
		current_state = AIMING
	elif Input.is_action_pressed("moves"):
		current_state = RUN
	elif not Input.is_action_pressed("moves"):
		current_state = IDLE


func _verify_life():
	if $State.current_life <= 0:
		get_tree().change_scene("res://world/cenes2.tscn")

func _moves():
	if Input.is_action_pressed("ui_up"):
		velocity.y = -Global.speed_list[$State.speed]
	elif Input.is_action_pressed("ui_down"):
		velocity.y = Global.speed_list[$State.speed]
	else:
		velocity.y = 0
	
	if Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		velocity.x = -Global.speed_list[$State.speed]
	elif Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		velocity.x = Global.speed_list[$State.speed]
	else: 
		velocity.x =0

func _move_slide():
	velocity = move_and_slide(velocity)


func _on_cooldown_timeout():
	cooldown = true

func _on_HurtBox_area_entered(area):
	$State.current_life -= 1
