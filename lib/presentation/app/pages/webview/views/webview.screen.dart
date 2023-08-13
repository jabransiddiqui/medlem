import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:medlem/presentation/presentation.dart';
import 'package:medlem/services/serevices.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  final String title;
  const WebviewScreen({required this.url, required this.title, Key? key})
      : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final appBarSize = AppBar().preferredSize.height;
    //final topPadding = data.viewPadding.top;
    final bottomPadding = data.viewPadding.bottom;
    return Container(
        color: const Color.fromARGB(255, 247, 246, 246),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 247, 246, 246),
          body: Column(
            children: [
              SizedBox(
                height: appBarSize + 50,
                child: Stack(
                  children: [
                    Positioned(
                      top: appBarSize - 15,
                      left: 25,
                      child: RoundButtonWidget(
                        onPressed: () {
                          NavigationService.instance.goBack();
                        },
                        iconName: Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: InAppWebView(
                          initialUrlRequest:
                              URLRequest(url: Uri.parse(widget.url)),
                          initialOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                                preferredContentMode:
                                    UserPreferredContentMode.MOBILE),
                          ),
                          onProgressChanged: (InAppWebViewController controller,
                              int progress) {
                            setState(() {
                              this.progress = progress / 100;
                            });
                          },
                        ),
                      ),
                      if (progress != 1.0)
                        const Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: CircularProgressIndicator(),
                            )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
