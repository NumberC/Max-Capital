extends Node
class_name StockTransaction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func buyStock(stock : Stock, player : Player, qty : int):
	var totalCost = qty * stock.getStockPrice();
	var playerCash = player.getCash();
	
	if playerCash >= totalCost:
		player.setCash(playerCash - totalCost);
	player.stocks[stock] += qty;
	
	#buying can affect price
	#StockPricer.setStockPriceByDemand(stock, qty);

func sellStock(stock : Stock, player : Player, qty : int):
	var totalGain = qty * stock.getStockPrice();
	var playerCash = player.getCash();
	
	player.setCash(playerCash + totalGain);
	player.stocks[stock] -= qty;
	
	#selling can affect price
	#StockPricer.setStockPriceByDemand(stock, -qty);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
