import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> launchUrlInBrowser(String url) async {
    try {
      final Uri urlParsed = Uri.parse(url);
      if (await canLaunchUrl(urlParsed)) {
        await launchUrl(urlParsed, mode: LaunchMode.externalApplication);
      } else {
        log("Could not launch url: $url");
      }
    } catch (e) {
      log(Future.error(e).toString());
    }
  }
}
