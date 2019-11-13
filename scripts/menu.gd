extends Control

func _ready():
	game.salvar_dados()
	game.carregar_dados()
	var pontos = game.dados['pontuacao']
	get_node("pontos").set_text(str(pontos))
	if game.dados['desafio'] == true:
		get_node("TextureRect/CenterContainer/VBoxContainer/desafio").show()
	
func _on_comecar_pressed():
	get_tree().change_scene("res://scenes/main.tscn")


func _on_desafio_pressed():
	get_tree().change_scene("res://scenes/desafio/desafio.tscn")

func _on_opcoes_pressed():
	get_tree().change_scene("res://scenes/opcoes.tscn")


func _on_ajuda_pressed():
	get_tree().change_scene("res://scenes/fase_partes/ajuda.tscn")

func _on_sobre_pressed():
	get_tree().change_scene("res://scenes/creditos.tscn")
	pass

func _on_sair_pressed():
	get_tree().quit()










