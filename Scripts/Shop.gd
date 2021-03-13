extends Space
class_name Shop

var value : float setget setValue, getValue;
var price : float setget setPrice, getPrice;
var maxCapital : float setget setMaxCapital, getMaxCapital;
var shopOwner : Player setget setOwner, getOwner;

const BUY_FACTOR = 5;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _init(price : float, value : float):
	self.price = price;
	self.value = value;
	self.maxCapital = 0.5 * value;

func setPrice(newPrice : float):
	price = newPrice;

func getPrice() -> float:
	return price;

func setValue(newValue : float):
	value = newValue;

func getValue() -> float:
	return value;

func setOwner(owner : Player):
	shopOwner = owner;

func getOwner() -> Player:
	return shopOwner;

func setMaxCapital(newMaxCapital : float):
	maxCapital = newMaxCapital;

func getMaxCapital() -> float:
	return maxCapital;
	
func upgradeShop(upgradeAmount : int):
	if maxCapital >= upgradeAmount:
		setMaxCapital(maxCapital - upgradeAmount);
		setValue(value + upgradeAmount);

func buyOutShop(newOwner : Player):
	var price = getValue();
	
	if shopOwner != null:
		price *= BUY_FACTOR;
	
	var newOwnerCash = newOwner.getCash();
	if newOwnerCash >= price:
		takeShopFromPlayer(price)
		givePlayerShop(newOwner, price)
		shopOwner = newOwner

func takeShopFromPlayer(price : int):
	if shopOwner != null:
		shopOwner.takeFromNetworth(value);
		shopOwner.addCash(price);

func givePlayerShop(player : Player, price : int):
	player.addToNetworth(value);
	player.spendCash(price);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
