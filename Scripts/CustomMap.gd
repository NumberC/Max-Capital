extends Map
class_name CustomMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	createDistrictA();
	createDistrictB();
	createDistrictC();
	createDistrictD();
	districtConnections();
	pass

func createDistrictA():
	var a : District = District.new();
	
	var shop1 := Shop.new(6, 270);
	var shop2 := Shop.new(7, 270);
	var shop3 := Shop.new(8, 270);
	var shop4 := Shop.new(9, 300);
	
	shop1.setRight(shop2);
	shop2.setRight(shop3);
	shop3.setBottom(shop4);
	
	a.addSpaces(shop1);
	a.addSpaces(shop2);
	a.addSpaces(shop3);
	a.addSpaces(shop4);
	
	districts.append(a);

func createDistrictB():
	var b : District = District.new();
	
	var shop1 := Shop.new(10, 270);
	var shop2 := Shop.new(11, 270);
	var shop3 := Shop.new(12, 270);
	var shop4 := Shop.new(13, 300);
	
	shop1.setTop(shop2);
	shop2.setRight(shop3);
	shop3.setRight(shop4);
	
	b.addSpaces(shop1);
	b.addSpaces(shop2);
	b.addSpaces(shop3);
	b.addSpaces(shop4);
	
	districts.append(b);

func createDistrictC():
	var c : District = District.new();
	
	var shop1 := Shop.new(14, 270);
	var shop2 := Shop.new(15, 270);
	var shop3 := Shop.new(16, 270);
	var shop4 := Shop.new(17, 300);
	
	shop1.setBottom(shop2);
	shop2.setRight(shop3);
	shop3.setRight(shop4);
	
	c.addSpaces(shop1);
	c.addSpaces(shop2);
	c.addSpaces(shop3);
	c.addSpaces(shop4);
	
	districts.append(c);

func createDistrictD():
	var d : District = District.new();
	
	var shop1 := Shop.new(18, 270);
	var shop2 := Shop.new(19, 270);
	var shop3 := Shop.new(20, 270);
	var shop4 := Shop.new(21, 300);
	
	shop1.setRight(shop2);
	shop2.setRight(shop3);
	shop3.setTop(shop4);
	
	d.addSpaces(shop1);
	d.addSpaces(shop2);
	d.addSpaces(shop3);
	d.addSpaces(shop4);
	
	districts.append(d);

func districtConnections():
	var disA : District = districts[0];
	var disB : District = districts[1];
	var disC : District = districts[2];
	var disD : District = districts[3];
	
	var disASpace1 : Space = disA.getSpaces()[0];
	var disASpace2 : Space = disA.getSpaces()[3];
	var disBSpace1 : Space = disB.getSpaces()[0];
	var disBSpace2 : Space = disB.getSpaces()[3];
	var disCSpace1 : Space = disC.getSpaces()[0];
	var disCSpace2 : Space = disC.getSpaces()[3];
	var disDSpace1 : Space = disD.getSpaces()[0];
	var disDSpace2 : Space = disD.getSpaces()[3];
	
	disASpace1.setLeft(disBSpace2);
	disBSpace1.setBottom(disCSpace1);
	disCSpace2.setRight(disDSpace1);
	disDSpace2.setTop(disASpace2);
	
	bank.setTop(disASpace1);
	bank.setTopLeft(disASpace1.left);
	bank.setTopRight(disASpace1.right);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
