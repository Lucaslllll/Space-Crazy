extends "res://scripts/classes/chefao/classe_chefao.gd"

var aleatorio2 = -1

var pre_tiro3 = preload("res://scenes/tiro_inimigo_3.tscn")


func _ready():
	pass

func disparar(delta):
	
	if ultimoDisparo <= 0:
		criar_tiro(get_node("P_ee"))
		criar_tiro(get_node("P_dd"))
		criar_tiro(get_node("P_ed"))
		criar_tiro(get_node("P_de"))
		ultimoDisparo = intervalo
	else:
		ultimoDisparo -= delta

func criar_tiro(node):
	var tiro = pre_tiro3.instance()
	tiro.set_position(node.get_position())
	add_child(tiro)

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
	if area.is_in_group(game.NAVE):
		area.dano_recebido(200)
	if area.is_in_group(game.GRUPO_NAVE):
		dano = 1.5
		dano_recebido(dano)
		area.queue_free()
	if area.is_in_group(game.CANHAO):
		dano = 10
		dano_recebido(dano)
		area.queue_free()

func _on_Timer_timeout():
	velocidade = 350
	intervalo = 0.3
	get_node("Anima").play("hiper-velocidade")
	yield(get_tree().create_timer(10), "timeout")
	velocidade = 200
	intervalo = 0.6
	get_node("Anima").play("default")