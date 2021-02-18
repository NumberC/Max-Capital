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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(choosenMap : Map, choosenPlayers : Array):
	map = choosenMap;
	players = choosenPlayers;
	
	var maxDieRoll := map.getMaxDiceRoll();
	die = Die.new(maxDieRoll);
	
	for i in players:
		playerControllers.append(PlayerController.new(i, map.getBank()));
	
	#gameLoop();
	

func gameLoop():
	for playerController in playerControllers:
		var roll := die.getDiceRoll();
		var remainingRoll := roll;
		var controller : PlayerController = playerController;
		
		while remainingRoll > 0:
			
			movePlayer(controller, yield());
			remainingRoll -= 1;
		
		#TODO: ask would you like to land here
		print("Would you like to land here?")
		var isLanding : bool = true;
		if isLanding:
			print("you landed")
			controller.getCurrentSpace().onLand();
		else:
			print("F")
			movePlayer(controller, yield())
			
func movePlayer(controller : PlayerController, userInput : int):
	var currentPosition : Space = controller.getCurrentSpace();
	
	#TODO: properly wait for user input
	while not userInput in getSpaceDirections(currentPosition):
		print("Try again!")
		userInput = yield();

	var newSpace : Space = getSpaceFromInput(userInput, currentPosition);
	controller.setCurrentSpace(newSpace);
	print(controller.getCurrentSpace());

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

#TODO: get actual user input
func getUserInput() -> int:
	return Directions.TOP;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
