import 'dart:io';

class Item {
  int id;
  String desc;
  int price;
  int quantity;
  Item(this.id, this.desc, this.price, this.quantity);
}

void main() {
  List<Item> products = [];
  var code;
  bool flag = true;
  do {
    print("What do you want to do?\n");
    print("Press 0 to exit");
    print("Press 1 to add.");
    code = stdin.readLineSync();
    print("code is: $code");

    if (code == 0) flag = false;

    if (code == 1) {
      print("Add item function...");

      var id, price, quantity;
      var desc;

      print("Item id:");
      id = stdin.readLineSync();

      print("Item desc/name:");
      desc = stdin.readLineSync();

      print("Item price:");
      price = stdin.readLineSync();

      print("Item quantity:");
      quantity = stdin.readLineSync();

      products.add(Item(id, desc, price, quantity));
      print("Item added!\n");
    }
  } while (flag);
}
