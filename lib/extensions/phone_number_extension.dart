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
}
