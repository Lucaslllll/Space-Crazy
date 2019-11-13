extends Area2D

var pre_tiro = preload("res://scenes/tiro_inimigo.tscn")
var vida = 10
var intervalo = .55
var ultimoDisparo = 1
var dano
onready var sprite = $Sprite
signal destruiu

func _ready():
	add_to_group(game.INIMIGO)
	sprite.texture = load(recursos.random_textura())
	#aleatorio = rand_range(-1, 2)
	set_process(true)
 

func _process(delta):
	
	#set_position(get_position() + Vector2(aleatorio, 1) * velocidade * delta)
	disparar(delta)
	pass

func disparar(delta):
	if ultimoDisparo <= 0:
		criar_tiro(get_node("PosC"), delta)
		ultimoDisparo = intervalo
	else:
		ultimoDisparo -= delta
		
func criar_tiro(node, delta):
	var tiro = pre_tiro.instance()
	tiro.set_global_position(node.get_global_position())
	get_owner().add_child(tiro)

func dano_recebido(valor):
	vida -= valor
	if vida <= 0:
		game.score = 100
		destroi()
		
func destroi():
	emit_signal("destruiu")
	get_node("Sprite").hide()
	get_node("explosao/Anima").play("destroy")
	
func _on_inimigo_area_entered(area):
	if area.is_in_group(game.GRUPO_NAVE):
		dano = 2
		dano_recebido(dano)
		area.queue_free()
	elif area.is_in_group(game.NAVE):
		game.score = 200
		destroi()
	if area.is_in_group(game.CANHAO):
		dano = 5
		dano_recebido(dano)
		area.queue_free()
