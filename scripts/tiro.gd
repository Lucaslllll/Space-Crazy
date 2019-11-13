extends Area2D

var velocidade = 400
var dano = 1

func _ready():
	get_node("laser").play()
	add_to_group(game.GRUPO_NAVE)
	set_process(true)

func _process(delta):
	set_position(get_position() + Vector2(0, -1) * velocidade * delta)
	
	if get_position().y < 30:
		#print("Menos um tiro")
		queue_free()
		
	
	pass


func _on_tiro_area_entered(area):
	#print(area.get_groups())
	if area.is_in_group(game.GRUPO_INIMIGO):
		if area.has_method("dano_recebido"):
			area.dano_recebido(dano)
		else:	
			area.queue_free()
		queue_free()
	elif area.is_in_group(game.TIRO_INIMIGO):
		area.queue_free()
	pass
