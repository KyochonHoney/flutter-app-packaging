import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url; // 웹뷰에 로드할 URL
  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // WebViewController 초기화
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 활성화
      ..loadRequest(Uri.parse(widget.url)); // URL 로드

    // Android 플랫폼에서만 해당 설정을 적용
    /*
    if (WebView.platform is SurfaceAndroidWebView) {
      _controller.setMediaPlaybackRequiresUserGesture(false);
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    // WebView 위젯에 컨트롤러를 전달하여 UI 렌더링
    return WebViewWidget(controller: _controller);
  }
}

class WebViewApp extends StatelessWidget {
  const WebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const WebViewScreen(
          url: 'https://www.naver.com/',
        ),
      ),
    );
  }
}

void main() {
  runApp(const WebViewApp());
}
