import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutProductScreen extends StatefulWidget {
  AboutProductScreen({super.key});

  @override
  State<AboutProductScreen> createState() => _AboutProductScreenState();
}

class _AboutProductScreenState extends State<AboutProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: WebViewExample());
  }
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({
    Key? key,
    this.cookieManager,
  }) : super(key: key);

  final CookieManager? cookieManager;

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  TextEditingController _controllerText = TextEditingController();
  bool _fet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                child: WebView(
                  initialUrl:
                      'https://xn--90aia9aifhdb2cxbdg.xn--p1ai/ru/product/fast-report-cloud/', //'https://flutter.dev',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {},
                  onProgress: (int progress) {
                    print('WebView is loading (progress : $progress%)');
                  },
                  javascriptChannels: <JavascriptChannel>{
                    _toasterJavascriptChannel(context),
                  },
                  navigationDelegate: (NavigationRequest request) {
                    //  "https://www.merchant-website.com/return_url", // if (request.url.startsWith('https://www.youtube.com/')) {

                    /// Если он нажмет на кнопку вернуться в магазин то срботает этот роут
                    if (request.url.startsWith(
                        'https://www.merchant-website.com/return_url')) {
                      print('blocking navigation to $request}');
                      Navigator.of(context).pop();
                      // setState(() {
                      //   _fet = true;
                      // });
                      return NavigationDecision
                          .prevent; //NavigationDecision.prevent;
                    }
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) {
                    print('Page finished loading: $url');
                  },
                  gestureNavigationEnabled: true,
                  backgroundColor: const Color(0x00000000),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: favoriteButton(),
    );
  }

  _onKeyPress(writeKeyboard) {}

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(builder:
        (BuildContext context, AsyncSnapshot<WebViewController> controller) {
      return FloatingActionButton(
        onPressed: () async {
          String? url;
          if (controller.hasData) {
            url = await controller.data!.currentUrl();
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                controller.hasData ? 'Favorited $url' : 'Unable to favorite',
              ),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      );
    });
  }
}
