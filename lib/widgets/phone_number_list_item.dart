import 'package:flutter/material.dart';
import 'package:whats_app_numbers/extensions/phone_number_extension.dart';
import '../models/phone_number.dart';

class PhoneNumberListItem extends StatefulWidget {
  final PhoneNumber phoneNumber;
  final void Function(PhoneNumber phoneNumber)? onDelete;

  const PhoneNumberListItem(
      {super.key, required this.phoneNumber, this.onDelete});

  @override
  State<PhoneNumberListItem> createState() => _PhoneNumberListItemState();
}

class _PhoneNumberListItemState extends State<PhoneNumberListItem> {
  var supportCalls = true;

  @override
  void initState() {
    checkCallSupport();
    super.initState();
  }

  void checkCallSupport() async {
    supportCalls = await widget.phoneNumber.hasCallSupport();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.phoneNumber.number),
        subtitle: Text(widget.phoneNumber.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: supportCalls
                  ? () {
                      widget.phoneNumber.makePhoneCall();
                    }
                  : null,
              icon: const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                widget.phoneNumber.openWhatsAppWebPage();
              },
              icon: const Icon(
                Icons.person_add_alt,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                final onDeleteFunction = widget.onDelete;
                if (onDeleteFunction != null) {
                  onDeleteFunction(widget.phoneNumber);
                }
              },
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
