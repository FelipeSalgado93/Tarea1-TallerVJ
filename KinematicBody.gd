extends KinematicBody
#
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


