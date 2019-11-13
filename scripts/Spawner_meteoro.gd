extends Node2D

var pre_fabrica = preload("res://scenes/Fabrica_meteoro.tscn")
var fabrica
var intervalo = 2

func _ready():
	set_process(true)

func _process(delta):
	
	if intervalo > 2:
		intervalo -= delta
	else:
		intervalo = rand_range(2, 3)
		var fabrica = pre_fabrica.instance()
		var meteoro = fabrica.GeraMeteoroRandomico()
		meteoro.set_position(Vector2(rand_range(40, 1270), -60.875))
		get_owner().add_child(meteoro)
	

