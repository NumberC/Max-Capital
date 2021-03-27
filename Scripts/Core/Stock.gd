extends Node
class_name Stock

const MINIMUM_PRICE : float = 1.00;
const LIMITING_FACTOR = 1/20;

var district : District;
var price : float setget setStockPrice, getStockPrice;
var basePrice = MINIMUM_PRICE;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(district : District):
	self.district = district;
	
func setStockPrice(newPrice : float):
	if newPrice >= MINIMUM_PRICE:
		price = newPrice;

func getStockPrice() -> float:
	return price;

func increaseStockPrice(increaseAmount : int):
	setStockPrice(getStockPrice() + increaseAmount);

func decreaseStockPrice(decreaseAmount : int):
	setStockPrice(getStockPrice() - decreaseAmount);

func priceFormula() -> int:
	var totalValue = 0;
	var shopCount = 0;
	
	for space in district.getSpaces():
		if space.typeof(Shop):
			var shop : Shop = space;
			shopCount += 1;
			totalValue += shop.getValue();
	return LIMITING_FACTOR * totalValue/shopCount;

func setStockPriceByValue():
	var newStockPrice = priceFormula();
	setStockPrice(newStockPrice);

func setStockPriceByDemand(qty : int):
	increaseStockPrice(int(qty/10));
