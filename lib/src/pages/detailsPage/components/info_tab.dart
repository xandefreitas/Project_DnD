import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:temis_front/model/details.dart';

infoTab(BuildContext context, Details detailsData) {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                  Text(
                    'Proficiencies:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: detailsData.proficiencies
                        .map((e) => Text(' - ${e.name}'))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xff4d3e7d),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subclasses:',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: detailsData.subclasses
                              .map((e) => Text(' - ${e.name}'))
                              .toList(),
                        ),
                      ],
                    ),
                    Icon(
                      LineIcons.angleRight,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
