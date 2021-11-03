import 'package:flutter/material.dart';
import 'package:project_dd/model/auth.dart';

class GridItem extends StatelessWidget {
  final String itemLabel;
  final Image itemImage;
  final String navigatorPage;
  final Auth auth;
  const GridItem({
    Key key,
    @required this.itemImage,
    @required this.itemLabel,
    @required this.navigatorPage,
    @required this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        navigatorPage,
        arguments: auth,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            children: [
              Align(
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topCenter,
                  child: itemImage,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(itemLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
