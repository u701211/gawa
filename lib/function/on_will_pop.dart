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

Future<String> riseWillPop(WebViewPlusController Function() controller) {
  return runJavascriptReturningResult(controller(), proxy, null);
}
