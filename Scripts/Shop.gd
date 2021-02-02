extends Node
class_name Shop

const BUY_FACTOR = 5;
var value : float setget setValue, getValue;
var price : float setget setPrice, getPrice;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _init(givenPrice : float, givenValue : float):
	price = givenPrice;
	value = givenValue;
	pass

func setPrice(newPrice : float):
	price = newPrice;

func getPrice() -> float:
	return price;

func setValue(newValue : float):
	value = newValue;

func getValue() -> float:
	return value;
	
func getBuyPrice() -> float:
	return BUY_FACTOR * value;



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
