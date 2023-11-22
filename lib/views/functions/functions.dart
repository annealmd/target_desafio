import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://google.com.br');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> callGoogle() async {
  await _launchUrl();
}
