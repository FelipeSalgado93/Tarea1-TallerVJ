extends Camera

func _input(event):
	if(event is InputEventMouseButton):
		if(event.button_index == BUTTON_WHEEL_DOWN && self.fov < 40):
			#get_tree().get_nodes_in_group("palo")[0]
			self.fov += 1
		elif(event.button_index == BUTTON_WHEEL_UP && self.fov > 20):
			self.fov -= 1
	elif(event is InputEventKey):
		var delta = 0.2
		if(event.is_action_pressed("ui_up")):
			self.global_transform.origin = self.global_transform.origin + Vector3(0.0, 0.0, delta)
		elif(event.is_action_pressed("ui_down")):
			self.global_transform.origin = self.global_transform.origin - Vector3(0.0, 0.0, delta)
		elif(event.is_action_pressed("ui_right")):
			self.global_transform.origin = self.global_transform.origin - Vector3(delta, 0.0, 0.0)
		elif(event.is_action_pressed("ui_left")):
			self.global_transform.origin = self.global_transform.origin + Vector3(delta, 0.0, 0.0)
		

func _ready():
	pass # Replace with function body.

