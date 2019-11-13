extends Area2D

var velocidade = 400
var dano = 4

func _ready():
	get_node("canhao").play()
	add_to_group(game.GRUPO_NAVE)
	add_to_group(game.CANHAO)
	set_process(true)
	

func _process(delta):
	set_position(get_position() + Vector2(0, -1) * velocidade * delta)
	
	if get_position().y < 30:
		queue_free()


func _on_canhao_area_entered(area):
	if area.is_in_group(game.GRUPO_INIMIGO):
		if area.has_method("dano_recebido"):
			area.dano_recebido(dano)
		else:	
			area.queue_free()
		queue_free()
	if area.is_in_group(game.TIRO_INIMIGO):
		area.queue_free()
