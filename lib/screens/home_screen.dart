import 'package:flutter/material.dart';
import 'package:flutter_dp_provider_application/data/flutter_shop_data.dart';
import 'package:flutter_dp_provider_application/model/flutter_shop_model.dart';
import 'package:flutter_dp_provider_application/widget/list_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FlutterShopModel> itemDetails = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      itemDetails = FlutterShopData.itemsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Shop",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: itemDetails.length,
                itemBuilder: (context, index) {
                  final FlutterShopModel itemDetail = itemDetails[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListItemWidget(
                      itemName: itemDetail.itemName,
                      itemPrice: itemDetail.itemPrice,
                      itemQuantity: itemDetail.itemQunatity,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.favorite_sharp, color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.shopping_cart_sharp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
