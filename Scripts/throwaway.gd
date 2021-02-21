extends Node

var gameLoop;
var rnd : Round;

func _ready():
	pass # Replace with function body.

func _init():
	var customMap : CustomMap = CustomMap.new(); 
	var players := [Player.new()];
	
	rnd = Round.new(customMap, players);
	add_child(rnd);


#func _input(event):
#	if event.is_action_pressed("ui_up"):
#		gameLoop.resume(rnd.Directions.TOP);
#	if event.is_action_pressed("ui_down"):
#		gameLoop.resume(rnd.Directions.BOTTOM);
#	if event.is_action_pressed("ui_left"):
#		gameLoop.resume(rnd.Directions.LEFT);
#	if event.is_action_pressed("ui_right"):
#		gameLoop.resume(rnd.Directions.RIGHT);
#	#if event.is_action_pressed("ui_down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
