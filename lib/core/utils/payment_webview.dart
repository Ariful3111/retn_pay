import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String paymentUrl;
  final VoidCallback? onSuccess;
  final VoidCallback? onCancel;

  const PaymentWebView({
    super.key,
    required this.paymentUrl,
    this.onSuccess,
    this.onCancel,
  });

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress: $progress%)');
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
            _checkUrlForCompletion(url);
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            _checkUrlForCompletion(request.url);
            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  void _checkUrlForCompletion(String url) {
    // Prevent multiple triggers
    if (_isCompleted) return;

    debugPrint('Checking URL: $url');

    // Check for success redirect
    if (url.contains('deposit=success')) {
      debugPrint('Payment successful!');
      _isCompleted = true;
      widget.onSuccess?.call();
      if (mounted) {
        Get.back(); // Close the WebView
      }
      return;
    }

    // Check for cancel redirect
    if (url.contains('deposit=cancel')) {
      debugPrint('Payment cancelled!');
      _isCompleted = true;
      widget.onCancel?.call();
      if (mounted) {
        Get.back(); // Close the WebView
      }
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            widget.onCancel?.call();
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
