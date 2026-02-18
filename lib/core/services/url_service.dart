import 'package:url_launcher/url_launcher.dart';

class URLService {
  static Future<void> launchURL({
    required String url,
    bool isExternal = true,
  }) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: isExternal
          ? LaunchMode.externalApplication
          : LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<bool> launchDialpad({required String phone}) {
    final value = phone.trim();
    if (value.isEmpty) return Future.value(false);
    return launchUrl(
      Uri(scheme: 'tel', path: value),
      mode: LaunchMode.externalApplication,
    );
  }
}
