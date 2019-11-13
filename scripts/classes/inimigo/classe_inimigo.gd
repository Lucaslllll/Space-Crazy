extends Area2D
#o que vai ser extendido tem o que era antes de ser

#quando voce coloca export na var ela fica alteravel para os objetos
#que herdam o o script
export var vida = 4

func _ready():
	set_process(true)
	_inicia()
	pass
	
	
func dano_recebido(dano):
	vida -= dano
	get_node("anima").play("hit")
	if vida <= 0:
		remove_from_group(game.GRUPO_INIMIGO)
		_destroi()
		_spawner_vida()
		_spawner_evolucao()
		game.score = 15
		set_process(false)
		

func _spawner_vida():
	var pre_vida = preload("res://scenes/up_vida.tscn")
	var aleatorio = range(1, 20)
	var valor = randi() % aleatorio.size()
	
	if valor > 16:
		var vida = pre_vida.instance()
		vida.set_position(get_position())
		get_parent().add_child(vida)

func _spawner_evolucao():
	var pre_canhao = preload("res://scenes/power_simples.tscn")
	var pre_duplo = preload("res://scenes/power_duplo.tscn")
	var escolha = [pre_canhao, pre_duplo]
	
	var aleatorio = range(1, 20)
	var valor = randi() % aleatorio.size()
	var opcao = randi() % escolha.size()
	
	if opcao == 0:
		if valor > 17:
			var poder = pre_canhao.instance()
			poder.set_position(get_position())
			get_parent().add_child(poder)
	elif opcao == 1:
		if valor > 17:
			var poder = pre_duplo.instance()
			poder.set_position(get_position())
			get_parent().add_child(poder)
			

func _inicia():
	pass

func _destroi():
	pass	