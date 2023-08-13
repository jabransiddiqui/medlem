import 'package:flutter/material.dart';
import 'package:medlem/core/core.dart';
import 'package:medlem/data/data.dart';
import 'package:medlem/extensions/extension.dart';
import 'package:medlem/services/serevices.dart';

class StoreListViewItem extends StatelessWidget {
  const StoreListViewItem(this.storeDetail, this.width, {super.key});
  final Store storeDetail;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Image.network(
                                "${ApiRoutes.originUrl}${storeDetail.chainImage}"),
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
                                      "${storeDetail.chain ?? ''} - ${storeDetail.name ?? ''}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      (storeDetail.address ?? '')
                                          .toLowerCase()
                                          .capitalize,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Divider(
                      height: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        storeDetail.openNow == true ? 'Open Now' : 'Closed',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Phone'),
                          Text(
                            storeDetail.phone ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.navigation_outlined),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      NavigationService.instance.navigateTo(storeDetails,
                          arguments: {'storeData': storeDetail.toJson()});
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, right: 10),
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.newspaper),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      NavigationService.instance.navigateTo(webView,
                          arguments: {
                            'url': storeDetail.newspaperUrl,
                            'title': 'News Papers'
                          });
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
