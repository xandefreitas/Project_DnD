import 'package:flutter/material.dart';
import 'package:project_dd/src/pages/classesPage/classes_list_page.dart';

import '../encyclopedia_page.dart';

class EncyclopediaCard extends StatelessWidget {
  final int imageValue;
  final String cardName;
  final Widget cardPage;
  const EncyclopediaCard({
    Key key,
    @required this.imageValue,
    @required this.cardName,
    @required this.cardPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => cardPage,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xff4d3e7d),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              Text(
                cardName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Divider(
                height: 36,
                thickness: 2,
                color: Color(0xff4d3e7d),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imgList[imageValue],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
