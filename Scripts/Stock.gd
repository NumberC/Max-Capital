extends Node
class_name Stock

const MINIMUM_PRICE : float = 1.00;
var price : float setget setStockPrice, getStockPrice;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass
	
func setStockPrice(newPrice : float):
	if newPrice >= MINIMUM_PRICE:
		price = newPrice;

func getStockPrice() -> float:
	return price;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
