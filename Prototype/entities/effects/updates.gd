extends Area2D
onready var player_ref = get_parent().get_node("Player") as Player
var stat : bool

func _process(delta):
	if player_ref.kill >= get_parent().spawns_iimit:
		visible = true
		$Collider.disabled = false
	
	if visible and stat and  Input.is_action_just_pressed("ui_interaction"):
		$up.visible = !$up.visible
	if Input.is_action_just_pressed("r") and $up.visible:
		var player_ref = get_parent().get_node("Player/State") as State
		player_ref._update_levels("life")
		player_ref._preload()
		$up.visible = !$up.visible
		get_tree().change_scene("res://world/cenes2.tscn")
	elif Input.is_action_just_pressed("t") and $up.visible:
		var player_ref = get_parent().get_node("Player/State") as State
		player_ref._update_levels("cooldown")
		player_ref._preload()
		$up.visible = !$up.visible
		get_tree().change_scene("res://world/cenes2.tscn")
	elif Input.is_action_just_pressed("y") and $up.visible:
		var player_ref = get_parent().get_node("Player/State") as State
		player_ref._update_levels("damage")
		player_ref._preload()
		$up.visible = !$up.visible
		get_tree().change_scene("res://world/cenes2.tscn")

func _on_Updates_body_entered(body):
	stat = true

func _on_Updates_body_exited(body):
	stat = false
