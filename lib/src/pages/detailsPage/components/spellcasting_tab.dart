import 'package:flutter/material.dart';
import 'package:project_dd/model/details.dart';

spellcastingTab(BuildContext context, Details detailsData) {
  return SingleChildScrollView(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xff4d3e7d),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailsData.name == 'Barbarian' || detailsData.name == 'Fighter' || detailsData.name == 'Monk' || detailsData.name == 'Rogue'
                      ? Text(
                          'Spellcasting:',
                          style: TextStyle(fontSize: 18),
                        )
                      : Text(
                          'Spellcasting (${detailsData.spellcasting.spellcastingAbility.name}):',
                          style: TextStyle(fontSize: 18),
                        ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        detailsData.name == 'Barbarian' || detailsData.name == 'Fighter' || detailsData.name == 'Monk' || detailsData.name == 'Rogue'
                            ? [Text('This class does not have magic')]
                            : detailsData.spellcasting.info
                                .map((e) => ListTile(
                                      title: Text(' - ${e.name}'),
                                      subtitle: Column(
                                        children: e.desc.map((e) => Text('$e\n')).toList(),
                                      ),
                                    ))
                                .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
