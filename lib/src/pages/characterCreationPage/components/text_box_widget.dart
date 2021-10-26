import 'package:flutter/material.dart';

class TextBoxWiget extends StatelessWidget {
  final String label;
  final int maxLines;
  const TextBoxWiget({
    Key key,
    this.label,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              child: TextFormField(
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: label,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff9F9F9F),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                maxLines: maxLines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
