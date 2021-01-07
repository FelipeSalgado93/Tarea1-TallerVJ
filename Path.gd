extends Path

var walkergoblin = preload("res://CharacterFollower.tscn")
var can_spawn = true
var cooldown_spawn = 1

func _input(event):
	if event.is_action_released("jump") and can_spawn:
		can_spawn = false
		var newgoblin = walkergoblin.instance()
		#spawned_instance.global_transform.origin=$Spawn.global_transform.origin
		var deltaV3 = Vector3(0.0, 0.0, 0.0)
		#newgoblin.global_transform.origin = $Mapa/Path/CharacterFollower/KinematicBody/goblin2.global_transform.origin - deltaV3
		#print($Mapa/Path/CharacterFollower.global_transform.origin)
		add_child(newgoblin)
		yield(get_tree().create_timer(cooldown_spawn), "timeout")
		can_spawn = true
