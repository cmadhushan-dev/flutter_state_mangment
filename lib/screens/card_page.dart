import 'package:flutter/material.dart';
import 'package:flutter_dp_provider_application/model/card_model.dart';
import 'package:flutter_dp_provider_application/provider/card_provider.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Card page",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Consumer<CardProvider>(
        builder: (context, cardproviders, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cardproviders.items.length,
                  itemBuilder: (context, index) {
                    final CardItem cardItem = cardproviders.items.values
                        .toList()[index];

                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text(cardItem.itemName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "total qty: \$ ${cardItem.itemPrice} * ${cardItem.itemQuanitiy}",
                            ),
                            Text(
                              "Total Bill Rs. ${cardItem.itemPrice * cardItem.itemQuanitiy}",
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                //remove the single item
                                cardproviders.removeSingleitem(cardItem.id);
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: () {
                                //remoev the whole item
                                cardproviders.removeiItem(cardItem.id);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
