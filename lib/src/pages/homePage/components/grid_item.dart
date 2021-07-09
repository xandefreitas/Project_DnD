import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String itemLabel;
  final Image itemImage;
  const GridItem({
    Key key,
    @required this.itemImage,
    @required this.itemLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: itemImage,
            ),
            Text(itemLabel),
          ],
        ),
      ),
    );
  }
}
