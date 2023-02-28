import 'dart:ui';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'create_javascript_channels.dart';

const method = 'onPageEvent';
const proxy = 'flutter_$method';

JavascriptChannel onPageEvent(WebViewPlusController Function() controller) {
  return JavascriptChannel(
    name: proxy,
    onMessageReceived: (message) {},
  );
}

Future<String> risePageEvent(
    WebViewPlusController Function() controller, AppLifecycleState state) {
  var callbackValue = state.toString().split('.')[1];
  return runJavascriptReturningResult(controller(), proxy, callbackValue);
}
