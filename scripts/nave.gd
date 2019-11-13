extends Area2D

export var velocidade = 400
#var tam_tela = get_viewport_rect().size
var arma
var arma2

onready var sprite = $Sprite

var tiro_simples = preload("res://scripts/classes/armas/tiro_simples.gd")
var tiro_duplo = preload("res://scripts/classes/armas/tiro_duplo.gd")
var tiro_canhao = preload("res://scripts/classes/armas/tiro_canhao.gd")
var tiro_divino = preload("res://scripts/classes/armas/tiro_divino.gd")

var armas = [
	tiro_simples.new(self),
	tiro_duplo.new(self),
	tiro_canhao.new(self),
	tiro_divino.new(self),
]

func _ready():
	arma = tiro_simples.new(self)
	arma2 = tiro_canhao.new(self)
	add_to_group(game.NAVE)

	
func _process(delta):
	var d = 0
	var e = 0
	var c = 0
	var b = 0

	if Input.is_action_pressed("esquerda"):
        e = -1
	if Input.is_action_pressed("direita"):
		d = 1
	if Input.is_action_pressed("cima"):
		c = -1
	if Input.is_action_pressed("baixo"):
		b = 1
	
	
	if get_position().x > 1222.704:
		d = 0
	if get_position().x < 54.704:
		e = 0
	if get_position().y < 40.75:
		c = 0
	if get_position().y > 670.749:
		b = 0
	
	
	set_position(get_position() + Vector2(0, 1) * velocidade * delta * (c + b))
	set_position(get_position() + Vector2(1, 0) * velocidade * delta * (d + e))
	

	
	if Input.is_action_pressed("tiro"):
		arma.disparar()
	arma.atualiza(delta)
	
	if Input.is_action_pressed("canhao"):
		if velocidade == 400:
			velocidade = 1000
			mostra()
		else:
			esconde()
			velocidade = 400
	#	arma2.disparar()
	#arma2.atualiza(delta)	

func mostra():
	get_node("propulsor").show()
	get_node("P_foguete").show()
	get_node("propulsor2").show()
	get_node("P_foguete2").show()
func esconde():
	get_node("propulsor").hide()
	get_node("P_foguete").hide()
	get_node("propulsor2").hide()
	get_node("P_foguete2").hide()

func set_arma(valor):
	arma = armas[valor]

func dano_recebido(valor):
	if game.getNaveVida() <= 0:
		get_node("Anima").play("destroy")	
	else:
		game.setNaveVida(valor)
		if game.getNaveVida() < 4:
			ativa_escudo()
		
func menu():
	game.carregar_dados()
	if game.dados['pontuacao'] < game.getScore():
		game.salvar_dados()
	game.setNaveVida(0)
	game.setScoreReset()
	get_tree().change_scene("res://scenes/menu.tscn")

func _on_nave_area_entered(area):
	if area.is_in_group(game.INIMIGO):
		dano_recebido(5)
		get_owner().shake(0.5)
	elif area.is_in_group(game.TIRO_INIMIGO):
		dano_recebido(2)
		area.queue_free()
	elif area.is_in_group(game.CHEFE):
		get_owner().shake(1)
		get_node("Anima").play("destroy")
	elif area.is_in_group(game.GRUPO_INIMIGO):
		get_owner().shake(0.2)

func ativa_escudo():
	get_node("escudo").ativa(8)


