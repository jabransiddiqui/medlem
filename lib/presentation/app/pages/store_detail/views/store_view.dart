import 'package:flutter/material.dart';
import 'package:medlem/core/core.dart';
import 'package:medlem/data/data.dart';
import 'package:medlem/extensions/extension.dart';

class StoreView extends StatelessWidget {
  const StoreView(this.storeData, {super.key});
  final Store storeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 50,
          height: 50,
          child: Center(
            child:
                Image.network("${ApiRoutes.originUrl}${storeData.chainImage}"),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "${storeData.chain ?? ''} - ${storeData.name ?? ''}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      (storeData.address ?? '').toLowerCase().capitalize,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
