extends Node
class_name StockPricer

# factor to make sure stock price doesn't go too high
const limitingFactor = 1/20;

func _init():
	pass

#works with negative qty (selling)
static func setStockPriceByDemand(stock : Stock, qty : int):
	var currentStockPrice = stock.getStockPrice();
	stock.setStockPrice(currentStockPrice + int(qty/10));

static func setStockPriceByValue(district : District):
	var stock = district.getStock();
	var shops = [];
	for i in district.getSpaces():
		if i.typeof(Shop):
			shops.append(i);
	var newStockPrice = priceFormula(shops);
	stock.setStockPrice(newStockPrice);

static func priceFormula(shops : Array) -> int:
	var totalValue = 0;
	for i in shops:
		if i.typeof(Shop):
			var shop : Shop = i;
			totalValue += shop.getValue();
	return limitingFactor * totalValue/shops.size();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
