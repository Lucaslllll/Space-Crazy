extends "res://scripts/classes/chefao/classe_chefao.gd"

var pre_tiro1 = preload("res://scenes/tiro_inimigo.tscn")


func criar_tiro(node):
	var tiro = pre_tiro1.instance()
	tiro.set_position(node.get_position())
	add_child(tiro)