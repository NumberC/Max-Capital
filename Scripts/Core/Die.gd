extends Node
class_name Die

var maxRoll : int;
var randomGenerator = RandomNumberGenerator.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	randomGenerator.randomize();
	pass # Replace with function body.
	
func _init(maxRoll : int):
	self.maxRoll = maxRoll;

func getDiceRoll() -> int:
	return randomGenerator.randi_range(1, maxRoll);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
