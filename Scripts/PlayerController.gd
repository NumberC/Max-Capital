extends Node
class_name PlayerController

var player : Player setget ,getPlayer;
var currentSpace : Space setget setCurrentSpace, getCurrentSpace;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(player : Player, startingPosition : Space):
	self.player = player;
	currentSpace = startingPosition;

func getPlayer() -> Player:
	return player;

func getCurrentSpace() -> Space:
	return currentSpace;

func setCurrentSpace(space : Space):
	currentSpace = space;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
