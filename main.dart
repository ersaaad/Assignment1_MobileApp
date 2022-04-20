import 'dart:io';

class Item {
  late int id;
  late String desc;
  late double price;
  late int quantity;
  late int discount;
  Item(this.id, this.desc, this.price, this.quantity, this.discount);

  void read() {
    print("\n====================================");
    print("Product ID: ${this.id}");
    print("Product description: ${this.desc}");
    print("Product price: ${this.price}");
    print("Product quantity: ${this.quantity}");
    print("Product discount: ${this.discount}%");
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
      if (code == 1 || code == 4 || code == 5) //id or price or discount
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

class Storage {
  late int id;
  List<Item> products = [];
  Storage(this.id, this.products);
}

void main() {
  late List<Item> products = [];
  late List<Storage> rows = [];
  var code;
  int counter = 1;
  bool flag = true;
  do {
    print("\nWelcome, Customer #$counter!");
    print("What do you want to do?\n");
    print("Press 0 to exit this menu.");
    print("Press 1 to add.");
    print("Press 2 to display all items.");
    print("Press 3 to remove items.");
    print("Press 4 if you are done.");
    code = stdin.readLineSync();

    if (code == "0") {
      String confirm = '';
      stdout.write("\nAre you sure you want to exit? (y/n): ");
      confirm = stdin.readLineSync()!;
      if (confirm == 'y') flag = false;
    } else if (code == "1") {
      print("Insert item function...");

      var id, price, quantity, desc, discount;

      id = int.parse(checkValue(id, "Item id: ", 1));
      desc = checkValue(desc, "Item desc/name: ", 2);
      price = double.parse(checkValue(price, "Item price: ", 3));
      quantity = int.parse(checkValue(quantity, "Item quantity: ", 4));
      discount =
          int.parse(checkValue(discount, "Item discount in percentage(%):", 5));

      products.add(Item(id, desc, price, quantity, discount));
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
    } else if (code == "4") {
      rows.add(Storage(counter, products));
      products = [];
      counter++;
      print("====================\n");
      print("Next customer!");
    }
    ;
  } while (flag);
  for (int i = 1; i < counter; i++) {
    print("Customer #$i items are:\n");
    rows[i - 1].products.forEach((element) {
      element.read();
    });
  }
}
