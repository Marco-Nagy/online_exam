import 'package:flutter/material.dart';

class ResultTab extends StatelessWidget {
  const ResultTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Text(
            "Result Tab",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          )),
    );
  }
}
