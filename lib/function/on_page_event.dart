import 'package:flutter/material.dart';
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

onPageEventHandler(
    AppLifecycleState state, WebViewPlusController Function() controller) {
  switch (state) {
    // 非アクティブ
    case AppLifecycleState.inactive:
      risePageEvent(controller, state);
      break;
    // 停止
    case AppLifecycleState.paused:
      risePageEvent(controller, state);
      break;
    // 再開
    case AppLifecycleState.resumed:
      risePageEvent(controller, state);
      break;
    // 破棄
    case AppLifecycleState.detached:
      risePageEvent(controller, state);
      break;
  }
}

risePageEvent(
    WebViewPlusController Function() controller, AppLifecycleState state) {
  var callbackValue = state.toString().split('.')[1];
  try {
    runJavascriptReturningResult(controller(), proxy, callbackValue);
  } catch (e) {
    debugPrint('$e');
  }
}
