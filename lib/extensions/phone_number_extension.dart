import 'package:url_launcher/url_launcher.dart';
import 'package:whats_app_numbers/extensions/string_extension.dart';
import 'package:whats_app_numbers/models/phone_number.dart';

extension PhoneNumberExtension on PhoneNumber {
  void openWhatsAppWebPage() {
    launchUrl(
      Uri(
        scheme: 'https',
        host: 'wa.me',
        path: number.formatPhoneNumber(),
      ),
      mode: LaunchMode.externalApplication,
    );
  }

  void makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(launchUri);
  }

  Future<bool> hasCallSupport() async {
    final result = await canLaunchUrl(Uri(scheme: 'tel', path: '123'));

    return result;
  }
}
