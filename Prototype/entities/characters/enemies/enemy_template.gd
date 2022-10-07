extends KinematicBody2D
class_name EnemyTemplate

onready var player_ref = get_parent().get_node("Player") as Player

var velocity : Vector2 = Vector2.ZERO

func _ready():
	print(player_ref)

func _moves():
	if global_position.x > player_ref.global_position.x:
		velocity.x = -$State.speed
	elif global_position.x < player_ref.global_position.x:
		velocity.x = $State.speed
	if global_position.y > player_ref.global_position.y:
		velocity.y = -$State.speed
	elif global_position.y < player_ref.global_position.y:
		velocity.y = $State.speed

func _move_slide():
	velocity = move_and_slide(velocity)
