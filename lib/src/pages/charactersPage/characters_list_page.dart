import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'components/character_creation_page.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) {
                return Card(
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text('item ${i + 1}'),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Stack(
                children: [
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Stack(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Color(0xff4d3e7d),
                          size: 20,
                        ),
                        Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Add character',
                    padding: EdgeInsets.zero,
                    iconSize: 48,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterCreationPage(),
                      ),
                    ),
                    icon: LineIcon(
                      LineIcons.diceD20,
                      size: 48,
                      color: Color(0xff4d3e7d),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
