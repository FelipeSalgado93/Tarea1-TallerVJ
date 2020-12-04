extends Sprite3D

onready var bar = $Viewport/ProgressBar

func _ready():
	texture = $Viewport.get_texture()
	
func update(value, full):
	bar.update_bar(value, full)
