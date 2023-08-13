import 'package:flutter/material.dart';
import 'package:medlem/data/data.dart';

class StoreContactView extends StatelessWidget {
  const StoreContactView(this.storeData, {super.key});
  final Store storeData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          storeData.openNow == true ? 'Open Now' : 'Closed',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('City'),
            Text(
              storeData.city ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Phone'),
            Text(
              storeData.phone ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
