extends MeshInstance

var disparo = preload("res://Disparo.tscn")
var can_fire = true
var fire_rate = 0.9
var gob = []
var goblins = 0
var ps = 3
#func _process(delta):
#	SkillLoop()

func shoot(posX, posZ):
	var disp_instance = disparo.instance()
	disp_instance.global_transform.origin = global_transform.origin
	#**********corregir este parametro para que apunte al goblin****************
	#disp_instance.apply_impulse(Vector3(), Vector3(proyectile_speed, 0, proyectile_speed)*Vector3(20*posX,0,20*posZ))
	disp_instance.apply_impulse(Vector3(), Vector3(ps, 0, ps) * (Vector3(posX, 0, posZ) - Vector3(self.global_transform.origin[0], 0, self.global_transform.origin[2])))  
	get_parent().get_parent().add_child(disp_instance)
	
func SkillLoop():
	while goblins > 0 and can_fire == true:
		var body = gob.back()
		can_fire = false
		if not body.is_queued_for_deletion() and body.health > 0:
			shoot(body.global_transform.origin[0], body.global_transform.origin[2])
		if body.health <= 0:
			gob.pop_back()
			goblins -= 1
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true

func _on_Area_body_entered(body):
	if not body.is_queued_for_deletion() and body.disparo == false:
		gob.append(body)
		goblins += 1
		SkillLoop()


func _on_Area_body_exited(body):
	goblins -= 1
