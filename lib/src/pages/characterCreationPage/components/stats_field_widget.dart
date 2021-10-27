import 'package:flutter/material.dart';

class StatsFieldWidget extends StatelessWidget {
  final String statName;
  const StatsFieldWidget({
    Key key,
    this.statName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        height: 80,
        width: 30,
        child: Column(
          children: [
            Text(statName),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextFormField(
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
