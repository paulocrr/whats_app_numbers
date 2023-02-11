extension StringExtension on String {
  String formatPhoneNumber() {
    return replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '');
  }
}
