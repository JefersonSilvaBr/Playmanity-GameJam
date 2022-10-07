extends EnemyTemplate
class_name SimpleRobot

func _process(delta):
	_moves()
	_move_slide()
	if $State.life <= 0:
		player_ref.kill += 1
		queue_free()

func _on_HurtBox_body_entered(body):
	var arrow_ref = body as Arrow
	$State.life -= body.damage
	print(body.damage)
	print($State.life)
	arrow_ref.queue_free()
