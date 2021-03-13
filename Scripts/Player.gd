extends Node
class_name Player

const START_CASH = 2000;

var stocks : Dictionary = {} setget ,getStocks;
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
	var prevCash = cash;
	cash = newCash;
	setNetworth(getNetworth() + (newCash-prevCash));

func addCash(addedCash : int):
	cash += addedCash;

func spendCash(spentCash : int):
	cash -= spentCash;

#TODO: networth is just adding up all assets
func getNetworth() -> int:
	return networth;

func addToNetworth(addedWorth : int):
	networth += addedWorth

func takeFromNetworth(takenWorth : int):
	networth -= takenWorth

func setNetworth(newNetworth : int):
	networth = newNetworth;

#Should we have a refresh networth?

func getStocks() -> Dictionary:
	return stocks;

func getStock(district) -> int:
	return stocks[district];
	
func getSuits() -> Array:
	return suits;
	
func addSuit(suit):
	if !suits.has(suit):
		suits.append(suit);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
