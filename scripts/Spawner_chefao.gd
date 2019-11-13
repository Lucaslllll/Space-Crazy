extends Node

var pre_chefao = preload("res://scenes/Chefao.tscn")

func _ready():
	print("ai")
	set_process(true)
	
func _process(delta):
	if game.getScore() > 1000:
		adiciona_chefe()
	
func adiciona_chefe():
	print("ai")
	var chefao = pre_chefao.instance()
	chefao.set_position(Vector2(714.995, 150))
	get_owner().add_child(chefao)
	queue_free()