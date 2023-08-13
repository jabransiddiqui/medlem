import 'package:flutter/material.dart';
import 'package:medlem/data/data.dart';

class OpeningHoursView extends StatelessWidget {
  const OpeningHoursView(this.openingHour, {super.key});
  final OpeningHour openingHour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                openingHour.day ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    openingHour.openString ?? '',
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
