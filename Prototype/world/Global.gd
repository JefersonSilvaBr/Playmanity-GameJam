extends Node

var kill = 0

var life_level_save
var speed_level_save
var current_life_save
var damage_level_save
var cooldown_level_save
var arrow_capacity_level_save

var life_level_preload = 0
var current_life_preload = 2
var speed_level_preload = 0
var damage_level_preload = 0
var cooldown_level_preload = 0
var arrow_capacity_level_preload = 0

var life_list : Array = [2, 3, 4]
var speed_list : Array = [60, 70, 80]
var damage_list : Array = [4, 8, 16]
var cooldown_list : Array = [0.9, 0.4, 0.1]
var arrow_capacity_list : Array = [1, 2, 3]

func _save():
	life_level_save = life_level_preload
	current_life_save = current_life_preload
	speed_level_save = speed_level_preload
	damage_level_save = damage_level_preload
	cooldown_level_save = cooldown_level_preload
	arrow_capacity_level_save = arrow_capacity_level_preload
