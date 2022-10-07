extends KinematicBody2D
class_name Arrow

var velocity = Vector2(1,0)
var speed : int = 250

var damage = 0
var x = true

func _process(delta):
	if x:
		look_at(get_global_mouse_position())
		visible = true
		x = false
	global_position += velocity.rotated(rotation) * speed * delta


func _on_SelfDestroyers_screen_exited():
		queue_free()
