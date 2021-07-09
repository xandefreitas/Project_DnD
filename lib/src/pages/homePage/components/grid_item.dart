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
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: itemImage,
            width: 100,
            height: 100,
          ),
          Text(itemLabel),
        ],
      ),
    );
  }
}
