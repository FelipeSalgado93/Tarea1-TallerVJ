extends Spatial
var scene = preload("res://legoblin.tscn")

func _input(event):
	if event.is_action_released("jump"):
		var spawned_instance = scene.instance()
		spawned_instance.global_transform.origin=$Spawn.global_transform.origin
		add_child(spawned_instance)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
