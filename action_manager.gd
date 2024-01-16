class_name ActionManager extends Control

var combos = []
var actions = []

func _init():
	pass
	
func _input(event):
	print(event)
		
func add(action, combo, duration):
	combos.append([action, combo, duration])
