extends "res://scripts/classes/chefao/classe_chefao.gd"


var aleatorio2 = 1

func _ready():
	pass 
	
	
func _process(delta):
	if get_position().x > 1260:
		aleatorio = -1
	elif get_position().x < 0:
		aleatorio = 1
	elif get_position().y > 720:
		aleatorio2 = -1
	elif get_position().y < 0:
		aleatorio2 = 1
		
	set_position(get_position() + Vector2(aleatorio, aleatorio2) * velocidade * delta)


func _on_inimigo_area_entered(area):
	if area.is_in_group(game.GRUPO_NAVE):
		dano = 2
		dano_recebido(dano)
		area.queue_free()
	if area.is_in_group(game.CANHAO):
		dano = 8
		dano_recebido(dano)
		area.queue_free()