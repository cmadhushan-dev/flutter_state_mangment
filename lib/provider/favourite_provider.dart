import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  //state
  final Map<String, bool> _favourites = {};
  //getter
  Map<String, bool> get favourutes {
    return _favourites;
  }

  //method to toggle between favoutite
  void toggleFavourites(String productId) {
    if (_favourites.containsKey(productId)) {
      _favourites[productId] = !_favourites[productId]!;
    } else {
      _favourites[productId] = true;
    }
    notifyListeners();
  }

  //method to check whether favourite or not
  bool isfavourute(String productId) {
    return _favourites[productId] ?? false;
  }
}
