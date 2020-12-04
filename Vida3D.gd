extends Sprite3D

onready var bar = $Viewport/progreso2d

func _ready():
	texture = $Viewport.get_texture()
	
func update(value, full):
	bar.update_bar(value, full)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
