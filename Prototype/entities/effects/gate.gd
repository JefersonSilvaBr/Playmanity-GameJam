extends StaticBody2D
class_name Gate

onready var player_ref = get_parent().get_node("Player") as Player

func _process(delta):
	if player_ref.kill >= get_parent().spawns_iimit:
		$Sprite.play("open")
		$Collider.disabled = true
		$TransitionArea/Collider.disabled = false
	


func _on_TransitionArea_area_entered(area):
	print("transition")
