extends Area2D

var pre_tiro = preload("res://scenes/tiro_inimigo.tscn")
export var vida = 100
export var intervalo = .5
var ultimoDisparo = 1
var dano
var aleatorio
export var velocidade = 180

signal vida_mudou
signal morreu
 
func _ready():
	add_to_group(game.CHEFE)
	aleatorio = rand_range(-1, 2)
	set_process(true)
	pass

func _process(delta):
	if get_position().x > 1260:
		aleatorio = -1
	elif get_position().x < 0:
		aleatorio = 1
	set_position(get_position() + Vector2(aleatorio, 0) * velocidade * delta)
	disparar(delta)

func disparar(delta):
	if ultimoDisparo <= 0:
		criar_tiro(get_node("P_esquerda"))
		criar_tiro(get_node("P_centro"))
		criar_tiro(get_node("P_direita"))
		ultimoDisparo = intervalo
	else:
		ultimoDisparo -= delta

func criar_tiro(node):
	var tiro = pre_tiro.instance()
	tiro.set_position(node.get_position())
	add_child(tiro)

func dano_recebido(valor):
	vida -= valor
	emit_signal("vida_mudou")
	if vida <= 0:
		game.score = 1000
		destroi()

func destroi():
	remove_from_group(game.CHEFE)
	get_node("Sprite").hide()
	get_node("explosao").show()
	get_node("explosao/Anima").play("destroy")
	yield(get_tree().create_timer(1.0), "timeout")
	game.morreu_chefao(1)
	

func _on_inimigo_area_entered(area):
	if area.is_in_group(game.GRUPO_NAVE):
		dano = 5
		dano_recebido(dano)
		area.queue_free()
	elif area.is_in_group(game.CANHAO):
		dano = 7
		dano_recebido(dano)
		area.queue_free()