import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'create_javascript_channels.dart';

const method = 'onWillPop';
const proxy = 'flutter_$method';

JavascriptChannel onWillPop(WebViewPlusController Function() controller) {
  return JavascriptChannel(
    name: proxy,
    onMessageReceived: (message) {},
  );
}

Future<bool> onWillPopHandler(
    WebViewPlusController Function() controller) async {
  try {
    String result =
        await runJavascriptReturningResult(controller(), proxy, null);
    return result == 'null' ? true : result == true.toString();
  } catch (e) {
    debugPrint('$e');
    return true;
  }
}
