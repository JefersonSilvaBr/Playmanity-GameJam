extends Node2D

onready var player_ref = get_parent().get_node("Player") as Player

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Animated.play("normal")

func _process(delta):
	global_position = get_global_mouse_position() - Vector2(0.5,0.5)
	_animation_transit()

func _animation_transit():
	if Input.is_action_just_released("ui_attack"):
		var state_ref = player_ref.get_node("State") as State
		print($Animated.name)
		if $Animated.current_animation == "press":
			player_ref.damage = Global.damage_list[state_ref.damage]
			print("press")
			player_ref.current_state = player_ref.ATTACK
		else:
			player_ref.damage = (Global.damage_list[state_ref.damage]) / 4
			print(Global.damage_list[state_ref.damage])
			player_ref.current_state = player_ref.ATTACK
		$Animated.play("normal")
	elif Input.is_action_just_pressed("ui_attack"):
		$Animated.play("press_in")

func _on_Animated_animation_finished(anim_name):
	if anim_name == "press_in":
		$Animated.play("press")
