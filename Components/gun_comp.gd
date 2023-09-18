extends Node2D

var gun =null
func wield_gun(type:Global.gun_type): 
	var scene = ""
	match type: 
		Global.gun_type.HANDGUN: 
			scene="res://Guns/handgun.tscn"
		Global.gun_type.LONGGUN: 
			scene="res://Guns/longgun.tscn"
		Global.gun_type.MINIGUN: 
			scene="res://Guns/minigun.tscn"
	gun = load(scene).instantiate()
	add_child(gun)
	pass
func shoot(): 
	if gun: 
		gun.shoot()
