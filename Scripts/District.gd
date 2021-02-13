extends Node
class_name District

var districtStock : Stock = Stock.new() setget ,getStock;
var color : Color;
var spaces : Array setget ,getSpaces;
 # var suit : Suit;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func getStock() -> Stock:
	return districtStock;

func getSpaces() -> Array:
	return spaces;
	
func addSpaces(space : Space):
	spaces.append(space);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
