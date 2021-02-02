extends Node
class_name District

const Shop = preload("res://Scripts/Shop.gd");
const Stock = preload("res://Scripts/Stock.gd");

var districtStock : Stock = Stock.new() setget ,getStock;
var color : Color;
var shops : Array;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	#initialize all the shops in the district
	shops = [
		Shop.new(100, 200, 500),
		Shop.new(100, 200, 500),
		Shop.new(400, 900, 500),
		Shop.new(500, 1000, 500)
	];
	pass

func getStock() -> Stock:
	return districtStock;

func calculateStockPrice():
	#TODO: how to calculate stock price
	pass

#Possibly PlayerAction (under Input)
func buyShop(shop : Shop, money : float):
	if money >= shop.getBuyPrice():
		#TODO: replace with something else
		print("you got the shop!");
	pass

func getShop(index : int) -> Shop:
	if index < shops.size():
		return shops[index];
	else:
		return null;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
