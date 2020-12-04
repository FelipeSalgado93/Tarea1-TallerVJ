extends KinematicBody

var character = null
onready var BULLET_SCENE = preload("res://Bala.tscn")

func _on_Area_body_entered(body):
	print("cuerpo entro")
	if body != self:
		character = body


func _on_Area_body_exited(body):
	print("cuerpo salio")
	character = null

func fire():
	var bullet = BULLET_SCENE.instance()
	bullet.global_transform.origin = global_transform.origin
	bullet.character = character
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)
	

func _on_Timer_timeout():
	if character != null:
		fire()
