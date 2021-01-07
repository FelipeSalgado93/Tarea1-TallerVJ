extends RigidBody

var proyectile_speed = 3
var life_time = 1
var damage = 1
var disparo = true

func _ready():
	self.gravity_scale = 0
	#apply_impulse(Vector3(), Vector3(proyectile_speed, 0, 0))
	SelfDestruct()

func SelfDestruct():
	yield(get_tree().create_timer(life_time), "timeout")
	queue_free()


