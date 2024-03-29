import 'package:flutter/material.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/model/details.dart';

equipmentTab(BuildContext context, ClassDetails detailsData) {
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
                  color: AppColors.purplePrimary,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Starting Equipment:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: detailsData.startingEquipment.isEmpty
                        ? [Text('This class does not have starting equipment')]
                        : detailsData.startingEquipment.map((e) => Text('${e.quantity}x - ${e.equipment.name}')).toList(),
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
