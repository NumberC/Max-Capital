extends Space
class_name Shop

var value : float setget setValue, getValue;
var price : float setget setPrice, getPrice;
var maxCapital : float setget setMaxCapital, getMaxCapital;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _init(price : float, value : float):
	self.price = price;
	self.value = value;
	self.maxCapital = 0.5 * value;
	pass

func setPrice(newPrice : float):
	price = newPrice;

func getPrice() -> float:
	return price;

func setValue(newValue : float):
	value = newValue;

func getValue() -> float:
	return value;

func setMaxCapital(newMaxCapital : float):
	maxCapital = newMaxCapital;

func getMaxCapital() -> float:
	return maxCapital;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
