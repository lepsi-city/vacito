import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  ResultItem({Key? key, this.name, this.value}) : super(key: key);

  final name;
  final value;

  @override
  Widget build(BuildContext context) {
    return  Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Color(0xFFF5F5F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                name
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
              child: Text(
                value,
                textAlign: TextAlign.start
              ),
            )
          ],
        ),
      ),
    );
  }
}