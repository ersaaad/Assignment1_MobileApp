import 'dart:io';

class Item {
  int id;
  String desc;
  double price;
  int quantity;
  Item(this.id, this.desc, this.price, this.quantity);

  void read() {
    print("\n====================================");
    print("Product ID: ${this.id}");
    print("Product description: ${this.desc}");
    print("Product price: ${this.price}");
    print("Product quantity: ${this.quantity}");
    print("====================================\n");
  }
}

String checkValue(var property, String prompt, int code) {
  bool checkFlag = true;
  do {
    try {
      checkFlag = true;
      stdout.write(prompt);
      property = stdin.readLineSync()!;
      if (code == 1 || code == 4) //id or price
        property = int.parse(property);
      else if (code == 2) //desc
        ;
      else if (code == 3) //price
        property = double.parse(double.parse(property).toStringAsFixed(2));
    } catch (e) {
      print("\nError! Please input the correct value!");
      checkFlag = false;
    }
  } while (!checkFlag);
  return property.toString();
}

void main() {
  List<Item> products = [];
  var code;
  bool flag = true;
  do {
    print("\nWhat do you want to do?\n");
    print("Press 0 to exit");
    print("Press 1 to add.");
    print("Press 2 to display all items");
    print("Press 3 to remove items");
    code = stdin.readLineSync();

    if (code == "0") {
      String confirm = '';
      stdout.write("\nAre you sure you want to exit? (y/n): ");
      confirm = stdin.readLineSync()!;
      if (confirm == 'y') flag = false;
    } else if (code == "1") {
      print("Insert item function...");

      var id, price, quantity;
      var desc;

      id = int.parse(checkValue(id, "Item id: ", 1));
      desc = checkValue(desc, "Item desc/name: ", 2);
      price = double.parse(checkValue(price, "Item price: ", 3));
      quantity = int.parse(checkValue(quantity, "Item quantity: ", 4));

      products.add(Item(id, desc, price, quantity));
      print("Item added!\n");
    } else if (code == "2") {
      products.forEach((element) {
        element.read();
      });

      // Amirul
    } else if (code == "3") {
      products.forEach((element) {
        element.read();
      });

      print("\nInput Id of item that you want to remove...\n");
      var id;

      id = int.parse(checkValue(id, "Item id: ", 1));
      products.removeWhere((item) => item.id == id);
      print("\nItem Removed!");
    }
    ;
  } while (flag);
}
