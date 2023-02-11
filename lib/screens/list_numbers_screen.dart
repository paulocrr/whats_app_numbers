import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_app_numbers/languages/whats_app_numbers_strings.dart';
import 'package:whats_app_numbers/models/phone_number.dart';
import 'package:whats_app_numbers/models/shared_preferences_key.dart';
import 'package:whats_app_numbers/widgets/phone_number_list_item.dart';

class ListNumberScreen extends StatefulWidget {
  final List<PhoneNumber> phoneNumbers;
  const ListNumberScreen({
    super.key,
    this.phoneNumbers = const [],
  });

  @override
  State<ListNumberScreen> createState() => _ListNumberScreenState();
}

class _ListNumberScreenState extends State<ListNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.phoneNumbers.isEmpty
        ? Center(
            child: Text(
              WhatsAppNumbersStrings.listPhoneNumbersScreen.emptyListText,
            ),
          )
        : ListView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            children: widget.phoneNumbers.reversed
                .map(
                  (phoneNumber) => PhoneNumberListItem(
                    phoneNumber: phoneNumber,
                    onDelete: (phoneNumber) async {
                      setState(() {
                        widget.phoneNumbers.removeWhere(
                            (element) => element.id == phoneNumber.id);
                      });

                      final sharedPreferences =
                          await SharedPreferences.getInstance();

                      sharedPreferences.setString(
                          SharedPreferencesKey.phoneNumberList,
                          PhoneNumber.listToString(widget.phoneNumbers));
                    },
                  ),
                )
                .toList(),
          );
  }
}
