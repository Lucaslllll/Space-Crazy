extends Node

var pre_chefao_2 = preload("res://scenes/Chefao_2.tscn") 

func _ready():
	set_process(true)
	pass

func _process(delta):
	if game.getScore() > 2000:
		adicionaChefe()

func adicionaChefe():
	var chefe = pre_chefao_2.instance()
	chefe.set_position(Vector2(714.995, 150))
	get_owner().add_child(chefe)
	queue_free()
