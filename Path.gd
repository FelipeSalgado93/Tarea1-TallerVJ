extends Path

var walkergoblin = preload("res://CharacterFollower.tscn")

func _input(event):
	if event.is_action_released("jump"):
		var newgoblin = walkergoblin.instance()
		#spawned_instance.global_transform.origin=$Spawn.global_transform.origin
		var deltaV3 = Vector3(0.0, 0.0, 0.0)
		#newgoblin.global_transform.origin = $Mapa/Path/CharacterFollower/KinematicBody/goblin2.global_transform.origin - deltaV3
		#print($Mapa/Path/CharacterFollower.global_transform.origin)
		add_child(newgoblin)
