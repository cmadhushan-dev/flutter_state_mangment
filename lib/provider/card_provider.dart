import 'package:flutter/material.dart';
import 'package:flutter_dp_provider_application/model/card_model.dart';

class CardProvider extends ChangeNotifier {
  //card item state
  Map<String, CardItem> _items = {};

  //getter the items
  Map<String, CardItem> get items {
    return {..._items};
  }

  //method to add item
  void addItemsToCard(String productId, double price, String productName) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (excsitingCardItem) => CardItem(
          id: excsitingCardItem.id,
          itemName: excsitingCardItem.itemName,
          itemPrice: excsitingCardItem.itemPrice,
          itemQuanitiy: excsitingCardItem.itemQuanitiy + 1,
        ),
      );
      print("increase the qty,add exscting data");
    }
    //if item is brandnew
    else {
      _items.putIfAbsent(
        productId,
        () => CardItem(
          id: productId,
          itemName: productName,
          itemPrice: price,
          itemQuanitiy: 1,
        ),
      );
      print("add new data");
    }
    notifyListeners();
  }

  //method to remove the item from the card
  void removeiItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  //method to single item from card(reduse the quantity)
  void removeSingleitem(String productid) {
    if (!_items.containsKey(productid)) {
      return;
    }
    //go to if item is qty is leass than 1
    if (_items[productid]!.itemQuanitiy > 1) {
      _items.update(
        productid,
        (excisitingcardItem) => CardItem(
          id: excisitingcardItem.id,
          itemName: excisitingcardItem.itemName,
          itemPrice: excisitingcardItem.itemPrice,
          itemQuanitiy: excisitingcardItem.itemQuanitiy - 1,
        ),
      );
    } else {
      _items.remove(productid);
    }
    notifyListeners();
  }

  //method to claer all card items
  void clearAll() {
    _items = {};
    notifyListeners();
  }

  //method to cal total
  double get totalamount {
    var total = 0.0;
    _items.forEach((key, cardItems) {
      total += cardItems.itemPrice * cardItems.itemQuanitiy;
    });
    notifyListeners();
    return total;
  }
}
