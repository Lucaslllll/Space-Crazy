extends Node

var pre_efeito = preload("res://scenes/efeito.tscn")
var intervalo = 2

func _ready():
	set_process(true)
	pass # Replace with function body.


func _process(delta):
	
	if intervalo > 2:
		intervalo -= delta
	else:
		intervalo = rand_range(2,  6)
		var efeito = pre_efeito.instance()
		efeito.set_position(Vector2(rand_range(14.284, 1260.576), 16.325))
		get_owner().add_child(efeito)
	
	
	
	pass