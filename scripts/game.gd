extends Node

const ARQUIVO = "user://save.data"

#inimigo = meteoros
#amigos = tiro
#nave = nave
const GRUPO_INIMIGO = "amigos_inimigos"
const INIMIGO = "inimigo"
const TIRO_INIMIGO = "tiro_inimigo"
const CHEFE = "chefe"

const GRUPO_NAVE = "amigos_nave"
const NAVE = "nave"

const CANHAO = "canhao"

var score = 0 setget setScore, getScore
signal score_mudou


var nave_vida = 10 setget setNaveVida, getNaveVida
signal nave_vida_mudou
signal morreu_chefao

var dados = {}
var desafio = false setget setDesafio, getDesafio
# posso instanciar um arquivo assim:
#var camera = load("res://scripts/arquivo.gd").new()


func _ready():
	pass


func salvar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	
	
	dados = {'pontuacao' : getScore(), 'desafio': getDesafio()}
		
	if not erro:
		arquivo.store_var(dados)
	else:
		print("Erro ao salvar dados")
	
	arquivo.close()
	
func carregar_dados():
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	var visualizar
	
	if not erro:
		var dados_salvos = arquivo.get_var()
		dados['pontuacao'] = dados_salvos["pontuacao"]
		dados['desafio'] = dados_salvos["desafio"]
	else:
		print("Erro ao salvar dados")
		
	arquivo.close()
	
	
func setNaveVida(valor):
	if nave_vida <= 0:
		nave_vida = 10
		emit_signal("nave_vida_mudou")
	else:
		nave_vida -= valor
		emit_signal("nave_vida_mudou")
	
func getNaveVida():
	return nave_vida

func getScore():
	return score
func setScore(valor):
	if valor >= 0:
		score += valor
		emit_signal("score_mudou")

func getDesafio():
	return desafio
func setDesafio(valor):
	desafio = valor

func setScoreReset():
	score = 0
func setVidaReset():
	nave_vida = 10
	
func setVidaAdicionar(valor):
	nave_vida += valor
	if nave_vida > 20:
		nave_vida = 20
	emit_signal("nave_vida_mudou")

func setFixarVida(valor):
	nave_vida = valor
	emit_signal("nave_vida_mudou")
	
func morreu_chefao(valor):
	if valor == 1:
		emit_signal("morreu_chefao")

func getPower_canhao():
	return get_tree().get_root().get_node("main").get_node("power_simples")

func getPower_duplo():
	return get_tree().get_root().get_node("main").get_node("power_duplo")	

	
	
	
	
	