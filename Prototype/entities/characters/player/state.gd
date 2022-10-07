extends Node2D
class_name State

export(int) var life
export(int) var speed
export(float) var damage
export(float) var cooldown
export(int) var arrow_capacity

var current_life : int = 2

func _ready():
	life = Global.life_level_preload
	current_life = Global.current_life_preload
	speed = Global.speed_level_preload
	damage = Global.damage_level_preload
	cooldown = Global.cooldown_level_preload
	arrow_capacity = Global.arrow_capacity_level_preload

func _process(delta):
	var text_life = get_parent().get_parent().get_node("UI/life") as Label
	text_life.text = str("HP: ",current_life)

func _preload():
	Global.life_level_preload = life
	Global.current_life_preload = current_life
	Global.speed_level_preload = speed
	Global.damage_level_preload = damage
	Global.cooldown_level_preload = cooldown
	Global.arrow_capacity_level_preload = arrow_capacity

func _update_levels(type:String):
	match type:
		"life":
			if life < 2:
				life += 1
				current_life = Global.life_list[life]
			else:
				pass
		"speed":
			if speed < 2:
				speed += 1
			else:
				pass
		"damage":
			if damage < 2:
				damage += 1
			else:
				pass
		"cooldown":
			if cooldown < 2:
				cooldown += 1
			else:
				pass
		"arrows":
			if arrow_capacity < 2:
				arrow_capacity += 1
			else:
				pass
	_preload()
