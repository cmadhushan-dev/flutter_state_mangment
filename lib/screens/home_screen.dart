import 'package:flutter/material.dart';
import 'package:flutter_dp_provider_application/data/flutter_shop_data.dart';
import 'package:flutter_dp_provider_application/model/flutter_shop_model.dart';
import 'package:flutter_dp_provider_application/provider/card_provider.dart';
import 'package:flutter_dp_provider_application/screens/card_page.dart';
import 'package:flutter_dp_provider_application/screens/favourite_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FlutterShopModel> prodcuts = FlutterShopData().itemsList;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Favourite_page_button",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouritePage()),
              );
            },

            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.favorite, color: Colors.white),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: "Card_page_button",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardPage()),
              );
            },
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Flutter Shop",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: prodcuts.length,
        itemBuilder: (context, index) {
          final FlutterShopModel productsItem = prodcuts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Consumer<CardProvider>(
                //value=provider class for widget
                builder: (context, cardProviders, child) {
                  return ListTile(
                    title: Row(
                      children: [
                        Text(
                          productsItem.itemName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        //to do:fill this
                        Text(
                          "${cardProviders.items[productsItem.id]?.itemQuanitiy ?? 0} ",
                        ),
                      ],
                    ),
                    subtitle: Text("\$ ${productsItem.itemPrice.toString()}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                        ),
                        IconButton(
                          onPressed: () {
                            //accses the value in the provider
                            cardProviders.addItemsToCard(
                              productsItem.id,
                              productsItem.itemPrice,
                              productsItem.itemName,
                            );
                          },
                          icon: Icon(Icons.shopping_cart),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
