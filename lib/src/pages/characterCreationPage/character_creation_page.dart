import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_dd/src/pages/characterCreationPage/components/appBarWidget.dart';

import 'components/statsFieldWidget.dart';
import 'components/text_box_widget.dart';

class CharacterCreationPage extends StatelessWidget {
  const CharacterCreationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'classes'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: 'race'),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: 'alignment'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 7,
                            child: TextBoxWiget(
                              label: 'skills',
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextBoxWiget(
                          label: 'equipment',
                          maxLines: 6,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StatsFieldWidget(statName: 'STR'),
                              StatsFieldWidget(statName: 'DEX'),
                              StatsFieldWidget(statName: 'CON'),
                              StatsFieldWidget(statName: 'INT'),
                              StatsFieldWidget(statName: 'WIS'),
                              StatsFieldWidget(statName: 'CHA'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextBoxWiget(
                              label: 'personality traits',
                              maxLines: 4,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: TextBoxWiget(
                              label: 'ideals',
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextBoxWiget(
                              label: 'bonds',
                              maxLines: 4,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Flexible(
                            child: TextBoxWiget(
                              label: 'flaws',
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Done'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Tooltip(
                          message: 'Male',
                          child: Icon(LineIcons.mars),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Tooltip(
                          message: 'Female',
                          child: Icon(LineIcons.venus),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Tooltip(
                          message: 'Genderless',
                          child: Icon(LineIcons.genderless),
                        ),
                      ),
                    ],
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
