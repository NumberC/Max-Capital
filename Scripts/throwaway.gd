extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gameLoop;
var rnd : Round;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	var customMap : CustomMap = CustomMap.new(); 
	var players := [Player.new("Bob")];
	rnd = Round.new(customMap, players);
	
	gameLoop = rnd.gameLoop();

func _input(event):
	if event.is_action_pressed("ui_up"):
		gameLoop.resume(rnd.Directions.TOP);
	if event.is_action_pressed("ui_down"):
		gameLoop.resume(rnd.Directions.BOTTOM);
	if event.is_action_pressed("ui_left"):
		gameLoop.resume(rnd.Directions.LEFT);
	if event.is_action_pressed("ui_right"):
		gameLoop.resume(rnd.Directions.RIGHT);
	#if event.is_action_pressed("ui_down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
