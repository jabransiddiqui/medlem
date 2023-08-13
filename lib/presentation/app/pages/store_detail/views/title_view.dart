import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: const Divider(),
        ),
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
