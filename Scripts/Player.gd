extends Node
class_name Player

const Shop = preload("res://Scripts/Shop.gd");
var stocks : Array setget ,getShops;
var shops : Array;
var suits : Array;
var cash : float setget setCash, getCash;
var networth : float setget setNetworth, getNetworth;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass
	
func getCash() -> float:
	return cash;
	
func setCash(newCash : float):
	cash = newCash;
	
func getNetworth() -> float:
	return networth;
	
func setNetworth(newNetworth : float):
	networth = newNetworth;
	
func getShops() -> Array:
	return shops;
	
func addShop(shop : Shop):
	shops.append(shop);
	
func removeShop(shop : Shop):
	if shops.has(shop):
		shops.remove(shops.find(shop));

func getStocks() -> Array:
	return stocks;
	
#setStocks fuction
	
func getSuits() -> Array:
	return suits;
	
func addSuit(suit):
	if !suits.has(suit):
		suits.append(suit);
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
