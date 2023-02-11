import 'package:flutter/material.dart';
import 'package:whats_app_numbers/models/phone_number.dart';
import 'package:whats_app_numbers/widgets/phone_number_list_item.dart';

class ListNumberScreen extends StatelessWidget {
  final List<PhoneNumber> phoneNumbers;
  const ListNumberScreen({
    super.key,
    this.phoneNumbers = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      children: phoneNumbers.reversed
          .map((phoneNumber) => PhoneNumberListItem(phoneNumber: phoneNumber))
          .toList(),
    );
  }
}
