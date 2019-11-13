extends Node

# nota: fiquei hora só por causa de "/" depois de 'paths' abaixo
const path_dir = "res://paths/"
var paths = []

var texturas = [
"res://PNG/Enemies/enemyBlack1.png",
"res://PNG/Enemies/enemyBlue2.png",
"res://PNG/Enemies/enemyGreen3.png",
"res://PNG/Enemies/enemyRed4.png"
]

var evolucao = [
"res://PNG/playerShip1_blue.png",
"res://PNG/playerShip1_red.png",
"res://PNG/ufoYellow.png"
]

func _ready():
	carregaPaths()


func random_path():
	randomize()
	return paths[randi() % paths.size()]

func random_textura():
	randomize()
	#tenho vinte inimigos, mas por segurança vai isso mesmo
	return texturas[randi() % texturas.size()]

func carregaPaths():
	var dir = Directory.new()
	dir.change_dir(path_dir)
	dir.list_dir_begin()
	
	var path_file = dir.get_next()
	while path_file != "":
		var path = load(path_dir + path_file)
		if path && path is Curve2D:
			paths.append(path)
		path_file = dir.get_next()
		
