extends Node2D

@export var BulletScene:PackedScene

@onready var shoot_pos = $shoot_pos
@onready var cooldown =$shoot_cooldown
func shoot(): 
	if !cooldown.is_stopped(): 
		return
	var bullet:Bullet=BulletScene.instantiate()
	bullet.set_dir(global_position.direction_to(shoot_pos.global_position))
	add_child(bullet)
	bullet.global_position = shoot_pos.global_position
	cooldown.start()
	
