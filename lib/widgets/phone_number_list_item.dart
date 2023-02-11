import 'package:flutter/material.dart';
import 'package:whats_app_numbers/extensions/phone_number_extension.dart';
import '../models/phone_number.dart';

class PhoneNumberListItem extends StatelessWidget {
  final PhoneNumber phoneNumber;

  const PhoneNumberListItem({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(phoneNumber.number),
        subtitle: Text(phoneNumber.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                phoneNumber.openWhatsAppWebPage();
              },
              icon: const Icon(
                Icons.person_add_alt,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
