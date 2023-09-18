extends Node2D

@export var BulletScene:PackedScene

@onready var shoot_pos = $shoot_pos
func shoot(): 
	var bullet:Bullet=BulletScene.instantiate()
	bullet.set_dir(global_position.direction_to(shoot_pos))
	add_child(bullet)
	bullet.global_position = shoot_pos.global_position
