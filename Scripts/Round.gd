extends Node
class_name Round

enum Directions{
	TOP,
	BOTTOM,
	LEFT,
	RIGHT,
	TOP_LEFT,
	TOP_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_RIGHT
}

var map : Map;
var players : Array;
var playerControllers : Array;
var die : Die;

var currentPlayer : Player;
var currentRemainingRoll : int;
var currentRoll : int;

signal pauseForInput(direction);
signal playerMoved;
signal turnComplete;

var pauseSignalName := "pauseForInput";
var movedSignalName := "playerMoved";
var turnSignalName := "turnComplete";

#Priorities:
#	- initialize all players at Bank
#	- roll die
#	- let players move in available directions
#	- confirm landing
#	- move on to next player and repeat

# Called when the node enters the scene tree for the first time.
func _ready():
	#TODO: get rid of playersprite from here
	spriteInit();
	pass # Replace with function body.

func _init(choosenMap : Map, choosenPlayers : Array):
	map = choosenMap;
	players = choosenPlayers;

	var maxDieRoll := map.getMaxDiceRoll();
	die = Die.new(maxDieRoll);

	#set all players at bank and create controllers
	for i in players:
		playerControllers.append(PlayerController.new(i, map.getBank()));

	print("Starting game loop")
	gameLoop();

#Starts the game loop
func gameLoop():
	while true:
		for playerController in playerControllers:
			var controller : PlayerController = playerController;
			turn(controller);
			yield(self, turnSignalName);

#Handle each players turn
func turn(controller : PlayerController):
	#roll the die
	var roll := die.getDiceRoll();
	var remainingRoll := roll-controller.previousSpaces.size();

	print("You rolled a " + str(roll));

	#the player can move around until the remaining die roll is 0
	while remainingRoll > 0:
		movePlayer(controller);
		yield(self, movedSignalName);
		remainingRoll = roll-controller.previousSpaces.size();
		print("Remaining ROll: " + str(remainingRoll));

	#TODO: ask would you like to land here
	print("Would you like to land here?")
	var isLanding : bool = true;
	if isLanding:
		landPlayer(controller)
	else:
		print("F")
		movePlayer(controller);
		yield(self, movedSignalName);

	controller.clearPreviousSpaces();
	return emit_signal(turnSignalName);

func landPlayer(controller : PlayerController):
	print("you landed")
	var currentSpace := controller.getCurrentSpace();
	currentSpace.onLand();
	controller.setOriginalSpace(currentSpace);
	controller.originalDirection = controller.currentDirection;
	#controller.setPreviousSpace()

func movePlayer(controller : PlayerController):
	var userInput : int = yield(self, pauseSignalName);
	var currentPosition : Space = controller.getCurrentSpace();

	var isOnOriginalSpace := controller.getCurrentSpace() == controller.getOriginalSpace();
	var isGoingBack := controller.currentDirection == getOppositeDirection(controller.originalDirection);

	while not userInput in getSpaceDirections(currentPosition) or (isOnOriginalSpace and isGoingBack):
		print("Try again!")
		userInput = yield(self, pauseSignalName);
		isGoingBack = userInput == getOppositeDirection(controller.originalDirection);

	controller.currentDirection = userInput;
	print("Current: " + str(controller.currentDirection));
	print("Orig: " + str(controller.originalDirection));

	#TODO: delete
	spriteMover(userInput);

	#controller.setPreviousSpace(currentPosition);

	var newSpace : Space = getSpaceFromInput(userInput, currentPosition);
	controller.setCurrentSpace(newSpace);

	#if they move back, change the list
	if controller.previousSpaces.size() > 0 and newSpace == controller.previousSpaces.back():
		controller.previousSpaces.pop_back();
	else:
		controller.addPreviousSpace(currentPosition);
	print(controller.previousSpaces);

	emit_signal(movedSignalName);

#getting rid of this later
onready var playerSprite := get_parent().get_node("PlayerS");
func spriteInit():
	playerSprite.position.x = 550;
	playerSprite.position.y = 100;
func spriteMover(userInput):
	match userInput:
		Directions.TOP:
			playerSprite.position.y -= 70;
		Directions.LEFT:
			playerSprite.position.x -= 70;
		Directions.RIGHT:
			playerSprite.position.x += 70;
		Directions.BOTTOM:
			playerSprite.position.y += 70;
		Directions.TOP_LEFT:
			playerSprite.position.y -= 70;
			playerSprite.position.x -= 70;
		Directions.TOP_RIGHT:
			playerSprite.position.y -= 70;
			playerSprite.position.x += 70;
		Directions.BOTTOM_LEFT:
			playerSprite.position.y += 70;
			playerSprite.position.x -= 70;
		Directions.BOTTOM_RIGHT:
			playerSprite.position.y += 70;
			playerSprite.position.x += 70;

func getSpaceDirections(space : Space) -> Array:
	var directions := [];

	if space.top != null:
		directions.append(Directions.TOP);
	if space.bottom != null:
		directions.append(Directions.BOTTOM);
	if space.left != null:
		directions.append(Directions.LEFT);
	if space.right != null:
		directions.append(Directions.RIGHT);
	if space.topLeft != null:
		directions.append(Directions.TOP_LEFT);
	if space.topRight != null:
		directions.append(Directions.TOP_RIGHT);
	if space.bottomLeft != null:
		directions.append(Directions.BOTTOM_LEFT);
	if space.bottomRight != null:
		directions.append(Directions.BOTTOM_RIGHT);

	return directions;

const DIRECTION_ERROR_CODE = 504;
func getOppositeDirection(direction : int) -> int:
	match direction:
		Directions.TOP:
			return Directions.BOTTOM;
		Directions.BOTTOM:
			return Directions.TOP;
		Directions.LEFT:
			return Directions.RIGHT;
		Directions.RIGHT:
			return Directions.LEFT;
		Directions.TOP_LEFT:
			return Directions.BOTTOM_RIGHT;
		Directions.BOTTOM_RIGHT:
			return Directions.TOP_LEFT;
		Directions.TOP_RIGHT:
			return Directions.BOTTOM_LEFT;
		Directions.BOTTOM_LEFT:
			return Directions.TOP_RIGHT;
	return DIRECTION_ERROR_CODE;

func getSpaceFromInput(input : int, space : Space) -> Space:
	match input:
		Directions.TOP:
			return space.top;
		Directions.BOTTOM:
			return space.bottom;
		Directions.LEFT:
			return space.left;
		Directions.RIGHT:
			return space.right;
		Directions.TOP_LEFT:
			return space.topLeft;
		Directions.TOP_RIGHT:
			return space.topRight;
		Directions.BOTTOM_LEFT:
			return space.bottomLeft;
		Directions.BOTTOM_RIGHT:
			return space.bottomRight;
	return null;

#Possibly different clas?
func _input(event):
	if event.is_action("MoveUp"):
		emit_signal(pauseSignalName, Directions.TOP)
	if event.is_action("MoveRight"):
		emit_signal(pauseSignalName, Directions.RIGHT)
	if event.is_action("MoveLeft"):
		emit_signal(pauseSignalName, Directions.LEFT)
	if event.is_action("MoveDown"):
		emit_signal(pauseSignalName, Directions.BOTTOM)
	if event.is_action("MoveLeftUp"):
		emit_signal(pauseSignalName, Directions.TOP_LEFT)
	if event.is_action("MoveRightUp"):
		emit_signal(pauseSignalName, Directions.TOP_RIGHT)
	if event.is_action("MoveLeftDown"):
		emit_signal(pauseSignalName, Directions.BOTTOM_LEFT)
	if event.is_action("MoveRightDown"):
		emit_signal(pauseSignalName, Directions.BOTTOM_RIGHT)
