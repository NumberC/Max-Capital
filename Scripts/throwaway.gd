extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	var customMap : CustomMap = CustomMap.new(); 
	var rnd : Round = Round.new(customMap);

#func _input(event):
#	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass