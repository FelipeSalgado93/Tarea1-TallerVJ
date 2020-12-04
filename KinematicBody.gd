extends KinematicBody
var health=10
var max_health=10

func jaja(event):
	if event.is_action_pressed("ui_focus_next"):
		health -= 1
		$Vida3D.update(health, max_health)
		if health <= 0:
			queue_free()

		

	
	
#var target
#var path = []
#var nav
#
#
#func _ready():
#	nav=get_parent()
#	target=get_tree().get_nodes_in_group("objetivo")[0]
#	generar_path()
#
#
#func _physics_process(delta):
#	delta+=1
#	if(path.size()>0):
#		var d=global_transform.origin.distance_to(path[0])
#		if (d>5):
#			var vel = path[0]-global_transform.origin
#			translation+=vel
#		else:
#			path.remove()
#func generar_path():
#	path=nav.get_simple_path(global_transform.origin,target.global_transform.origin)
#	print(path)




func _on_legoblin_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			health -= 1
			$Sprite3D.update(health, max_health)
			if health <= 0:
				queue_free()
