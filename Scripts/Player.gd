extends Node
class_name Player

const START_CASH = 2000;

var stocks : Dictionary = {} setget ,getStocks;
var shops : Array;
var suits : Array;
var cash : int = START_CASH setget setCash, getCash;
var networth : int = START_CASH setget setNetworth, getNetworth;
var promotionLevel : int = 0 setget setPromotionLevel, getPromotionLevel;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	#self.name ?
	pass

func setPromotionLevel(newPromotion : int):
	promotionLevel = newPromotion;

func getPromotionLevel() -> int:
	return promotionLevel;
	
func getCash() -> int:
	return cash;
	
func setCash(newCash : int):
	cash = newCash;

#TODO: networth is just adding up all assets
func getNetworth() -> int:
	return networth;
	
func setNetworth(newNetworth : int):
	networth = newNetworth;
	
func getShops() -> Array:
	return shops;
	
func addShop(shop : Shop):
	shops.append(shop);
	
func removeShop(shop : Shop):
	if shops.has(shop):
		shops.remove(shops.find(shop));

func hasShop(shop : Shop):
	return shops.has(shop);

func getStocks() -> Dictionary:
	return stocks;
	
func getSuits() -> Array:
	return suits;
	
func addSuit(suit):
	if !suits.has(suit):
		suits.append(suit);
	
func _input(event):
	if event.is_action("ui_up"):
		print("WOO");

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
