extends Area

var move = Vector3.ZERO
var look_vec = Vector3.ZERO
var character = null
var speed = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	look_vec = character.global_transform.origin - global_transform.origin
	
func _physics_process(delta):
	move = Vector3.ZERO
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	global_transform.origin += move
