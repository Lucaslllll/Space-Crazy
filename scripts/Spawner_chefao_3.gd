extends Node

var pre_chefao_3 = preload("res://scenes/Chefao_3.tscn")

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	if game.getScore() > 3000:
		adicionaChefe()
		
func adicionaChefe():
	var chefe = pre_chefao_3.instance()
	chefe.set_position(Vector2(700, 150))
	get_owner().add_child(chefe)
	queue_free()
