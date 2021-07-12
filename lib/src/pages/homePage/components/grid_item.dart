import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String itemLabel;
  final Image itemImage;
  final Widget navigatorPage;
  const GridItem({
    Key key,
    @required this.itemImage,
    @required this.itemLabel,
    @required this.navigatorPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => navigatorPage,
        ),
      ),
      child: Container(
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
      ),
    );
  }
}
