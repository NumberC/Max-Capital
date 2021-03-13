extends Node
class_name PlayerController

var player : Player setget ,getPlayer;
var currentSpace : Space setget setCurrentSpace, getCurrentSpace;
var previousSpace : Space setget setPreviousSpace, getPreviousSpace;
var originalSpace : Space setget setOriginalSpace, getOriginalSpace;
var previousSpaces : Array = [];

#direction while player is still moving
var currentDirection : int setget setCurrentDirection, getCurrentDirection;

#direction before player was moving 
var originalDirection : int setget setOriginalDirection, getOriginalDirection;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(player : Player, startingPosition : Space):
	self.player = player;
	currentSpace = startingPosition;

func getPlayer() -> Player:
	return player;

func getPreviousSpace() -> Space:
	return previousSpace

func setPreviousSpace(space : Space):
	previousSpace = space

func getCurrentSpace() -> Space:
	return currentSpace;

func setCurrentSpace(space : Space):
	currentSpace = space;

func getOriginalSpace() -> Space:
	return originalSpace;

func setOriginalSpace(origSpace : Space):
	originalSpace = origSpace

func addPreviousSpace(space : Space):
	previousSpaces.append(space);

func removePreviousSpace():
	if previousSpaces.size() > 0:
		previousSpaces.pop_back();

func clearPreviousSpaces():
	previousSpaces.clear();

func setCurrentDirection(newDirection : int):
	currentDirection = newDirection;

func getCurrentDirection() -> int:
	return currentDirection;

func setOriginalDirection(newDirection : int):
	originalDirection = newDirection;

func getOriginalDirection() -> int:
	return originalDirection

func moveBack(currentPosition : Space, newSpace : Space):
	if previousSpaces.size() > 0 and newSpace == previousSpaces.back():
		previousSpaces.pop_back();
	else:
		addPreviousSpace(currentPosition);
	print(previousSpaces);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
