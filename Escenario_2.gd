extends Spatial
var scene = preload("res://legoblin.tscn")
var delta=10

#func _input(event):
	#if event.is_action_released("jump"):
		#var spawned_instance = scene.instance()
		#spawned_instance.global_transform.origin=$Spawn.global_transform.origin
		#var deltaV3 = Vector3(0.0, 0.0, 0.0)
		#spawned_instance.global_transform.origin = $Mapa/Path/CharacterFollower/KinematicBody/goblin2.global_transform.origin - deltaV3
		#print($Mapa/Path/PathFollow/KinematicBody/goblin2.global_transform.origin - deltaV3)
		#print($Mapa/Path/PathFollow/KinematicBody/goblin2.global_transform.origin)
		#print(get_child(3).get_child(3).get_child(0).get_child(0).name)
		#get_child(3).get_child(3).get_child(0).get_child(0).add_child(spawned_instance)
		#add_child(spawned_instance)
	

#	elif event.is_action_released("camara"):
#		if $Camera1.is_current():
#			$Camera1.clear_current(true)
#		else:
#			$Camera2.clear_current(true)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
