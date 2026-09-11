import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  final String itemName;
  final double itemPrice;
  final int itemQuantity;
  const ListItemWidget({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
  });

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text("\$${widget.itemPrice}"),
              ],
            ),
            const SizedBox(width: 60),
            Text(
              widget.itemQuantity.toString(),
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.heart_broken_sharp),
                  const SizedBox(width: 24),
                  Icon(Icons.card_giftcard),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
