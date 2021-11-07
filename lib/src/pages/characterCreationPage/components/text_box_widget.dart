import 'package:flutter/material.dart';
import 'package:project_dd/core/app_colors.dart';

class TextBoxWiget extends StatelessWidget {
  final String label;
  final int maxLines;
  List<String> content;
  TextBoxWiget({
    Key key,
    this.label,
    this.maxLines,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.purplePrimary),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.purplePrimary),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.purplePrimary),
                  ),
                  labelStyle: TextStyle(color: AppColors.purplePrimary),
                  alignLabelWithHint: true,
                  labelText: label,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.purplePrimary,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onSaved: (value) => content = <String>[value],
                maxLines: maxLines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
