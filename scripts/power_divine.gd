extends Area2D



func _ready():
	pass



func _on_power_divine_area_entered(area):
	if area.is_in_group(game.NAVE):
		area.set_arma(3)
		game.setFixarVida(3)
		area.sprite.texture = load(recursos.evolucao[2])
		area.get_node("canhaoD").hide()
		area.get_node("canhaoE").hide()
		#get_owner().get_node("power_simples").queue_free()
		queue_free()



func _on_Timer_timeout():
	queue_free()