extends Label

var goblins =30

func _ready():
	text=String(goblins)
	print(text)

func _on_legoblin_Muerte():
	goblins=goblins-1
	_ready()
