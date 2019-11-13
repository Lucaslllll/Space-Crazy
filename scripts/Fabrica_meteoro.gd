extends Node



func GeraMeteoro(valor):
	return get_children()[valor].duplicate()

func GeraMeteoroRandomico():
	return get_children()[randi() % get_children().size()].duplicate()

