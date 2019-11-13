extends "res://scripts/classes/chefao/classe_chefao.gd"

var pre_tiro2 = preload("res://scenes/tiro_inimigo_2.tscn")

func disparar(delta):
	if ultimoDisparo <= 0:
		criar_tiro(get_node("P_centro"))
		ultimoDisparo = intervalo
	else:
		ultimoDisparo -= delta

func criar_tiro(node):
	var tiro = pre_tiro2.instance()
	tiro.set_position(node.get_position())
	add_child(tiro)



#sempre necessario entrar na area da classe herdada
#func _on_inimigo_area_entered(area):
#	pass # Replace with function body.

#ou rescreve-la

func _on_inimigo_area_entered(area):
	if area.is_in_group(game.GRUPO_NAVE):
		dano = 2
		dano_recebido(dano)
		area.queue_free()
	elif area.is_in_group(game.CANHAO):
		dano = 5
		dano_recebido(dano)
		area.queue_free()



