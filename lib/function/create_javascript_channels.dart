import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'get_battery_level.dart';
import 'get_qr_code.dart';
import 'on_page_event.dart';
import 'on_will_pop.dart';

// jsからの接続チャンネルを生成
Set<JavascriptChannel> createJavascriptChannels(
    BuildContext context, WebViewPlusController Function() controller) {
  return {
    getBatteryLevel(controller),
    getQRCode(controller, context),
    onPageEvent(controller),
    onWillPop(controller),
  };
}

// jsへのコールバック
void runJavascript<T>(
    WebViewPlusController controller, String proxy, T? callbackValue) {
  String js = callbackValue == null
      ? 'window.$proxy.callback()'
      : 'window.$proxy.callback(${callbackValue is String ? "'$callbackValue'" : callbackValue})';
  controller.webViewController.runJavascript(js);
}

// jsへのコールバック
Future<String> runJavascriptReturningResult<T>(
    WebViewPlusController controller, String proxy, T? callbackValue) {
  String js = callbackValue == null
      ? 'window.$proxy.callback()'
      : 'window.$proxy.callback(${callbackValue is String ? "'$callbackValue'" : callbackValue})';
  return controller.webViewController.runJavascriptReturningResult(js);
}
