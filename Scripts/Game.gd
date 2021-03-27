extends Node
class_name Game

var gameLoop;
var rnd : Round;

func _ready():
	pass # Replace with function body.

func _init():
	var customMap : CustomMap = CustomMap.new(); 
	var players := [Player.new()];
	
	rnd = Round.new(customMap, players);
	add_child(rnd);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
