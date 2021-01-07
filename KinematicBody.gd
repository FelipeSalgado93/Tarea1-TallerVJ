extends RigidBody

var health=10
var max_health=10
var disparo = false
var life_time = 1

func jaja(event):
	if event.is_action_pressed("bajarVida"):
		health -= 1
		$Sprite3D.update(health, max_health)
		if health <= 0:
			queue_free()


func _on_legoblin_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			health -= 1
			$Sprite3D.update(health, max_health)
			if health <= 0:
				queue_free()
	elif event.is_action_pressed("bajarVida"):
		health -= 1
		$Sprite3D.update(health, max_health)
		if health <= 0:
			queue_free()

func _on_KinematicBody_body_entered(body):
	if body.disparo == true:
		var dam = body.damage
		body.queue_free()
		health -= dam
		$Sprite3D.update(health, max_health)
		if health <= 0:
			self.hide()
			#yield(get_tree().create_timer(life_time), "timeout")
			#queue_free()
