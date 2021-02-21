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
var pauseSignalName := "pauseForInput";
var movedSignalName := "playerMoved";

onready var playerSprite := get_parent().get_node("PlayerS");
#Priorities:
#	- initialize all players at Bank
#	- roll die
#	- let players move in available directions
#	- confirm landing
#	- move on to next player and repeat

# Called when the node enters the scene tree for the first time.
func _ready():
	#TODO: get rid of playersprite from here
	playerSprite.position.x = 550;
	playerSprite.position.y = 100;
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
	

func gameLoop():
	while true:
		for playerController in playerControllers:
			var roll := die.getDiceRoll();
			var remainingRoll := roll;
			var controller : PlayerController = playerController;
			print("You rolled a " + str(roll));
			
			while remainingRoll > 0:
				movePlayer(controller);
				yield(self, movedSignalName);
				remainingRoll -= 1;
			
			#TODO: ask would you like to land here
			print("Would you like to land here?")
			var isLanding : bool = true;
			if isLanding:
				print("you landed")
				controller.getCurrentSpace().onLand();
			else:
				print("F")
				movePlayer(controller);
				yield(self, movedSignalName);
			
func movePlayer(controller : PlayerController):
	var userInput : int = yield(self, pauseSignalName);
	var currentPosition : Space = controller.getCurrentSpace();
	
	while not userInput in getSpaceDirections(currentPosition):
		print("Try again!")
		userInput = yield(self, pauseSignalName);
	
	#TODO: delete
	match userInput:
		Directions.TOP:
			playerSprite.position.y -= 50;
		Directions.LEFT:
			playerSprite.position.x -= 50;
		Directions.RIGHT:
			playerSprite.position.x += 50;
		Directions.BOTTOM:
			playerSprite.position.y += 50;

	var newSpace : Space = getSpaceFromInput(userInput, currentPosition);
	controller.setCurrentSpace(newSpace);
	print(controller.getCurrentSpace());
	emit_signal(movedSignalName);

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

func _input(event):
	if event.is_action("ui_up"):
		emit_signal(pauseSignalName, Directions.TOP)
	if event.is_action("ui_right"):
		emit_signal(pauseSignalName, Directions.RIGHT)
	if event.is_action("ui_left"):
		emit_signal(pauseSignalName, Directions.LEFT)
	if event.is_action("ui_down"):
		emit_signal(pauseSignalName, Directions.BOTTOM)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
