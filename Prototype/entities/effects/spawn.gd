extends Node2D

onready var simple_robot_ref = preload("res://entities/characters/enemies/simple_robot.tscn")
onready var level_ref = get_parent().get_parent() as Level

export(int) var cooldown_time
var cooldown : bool = true

func _ready():
		randomize()
		$Cooldown.wait_time = rand_range(cooldown_time/2, cooldown_time)

func _process(delta):
	if cooldown and level_ref.current_spawns < level_ref.spawns_iimit:
		level_ref.current_spawns += 1
		randomize()
		$Cooldown.wait_time = rand_range(cooldown_time/2, cooldown_time)
		var robot_instance = simple_robot_ref.instance()
		robot_instance.position.x = position.x
		robot_instance.position.y = position.y
		get_parent().get_parent().add_child(robot_instance)
		$Cooldown.start()
		cooldown = false


func _on_Cooldown_timeout():
	cooldown = true
