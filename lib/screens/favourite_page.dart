import 'package:flutter/material.dart';
import 'package:flutter_dp_provider_application/data/flutter_shop_data.dart';
import 'package:flutter_dp_provider_application/model/flutter_shop_model.dart';
import 'package:flutter_dp_provider_application/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite Page",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Consumer<FavouriteProvider>(
        builder: (context, favProvider, child) {
          //convert the every things to  list show in this page
          final favItems = favProvider.favourutes.entries
              .where((enrty) => enrty.value)
              .map((entry) => entry.key)
              .toList();

          if (favItems.isEmpty) {
            return Center(child: Text("No Favourited Added yet"));
          }

          return ListView.builder(
            itemCount: favItems.length,
            itemBuilder: (context, index) {
              final productId = favItems[index];
              final FlutterShopModel product = FlutterShopData().products
                  .firstWhere((product) => product.id == productId);

              return Card(
                child: ListTile(
                  title: Text(product.itemName),
                  subtitle: Text("\$ ${product.itemPrice.toString()} "),
                  trailing: IconButton(
                    onPressed: () {
                      favProvider.toggleFavourites(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Remove from favourite"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
