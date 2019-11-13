extends Node

var pre_inimigo = preload("res://scenes/inimigo/path_inimigo.tscn")

func _ready():
	randomize_time()
	
func randomize_time():
	get_node("Timer").set_wait_time(rand_range(10, 30))
	

func _on_Timer_timeout():
	# pode ser get_parent() tambem
	var inimigo = pre_inimigo.instance()
	get_owner().add_child(inimigo)
	randomize_time()
