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
  var result = await riseWillPop(controller);
  return result == true.toString();
}

Future<String> riseWillPop(WebViewPlusController Function() controller) {
  try {
    return runJavascriptReturningResult(controller(), proxy, null);
  } catch (e) {
    debugPrint('$e');
    return Future.value(true.toString());
  }
}
