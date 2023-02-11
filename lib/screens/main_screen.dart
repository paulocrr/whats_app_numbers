import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_app_numbers/languages/whats_app_numbers_strings.dart';
import 'package:whats_app_numbers/models/phone_number.dart';
import 'package:whats_app_numbers/models/shared_preferences_key.dart';
import 'package:whats_app_numbers/screens/add_number_screen.dart';
import 'package:whats_app_numbers/screens/list_numbers_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<PhoneNumber> phoneNumbers = [];

  @override
  void initState() {
    loadPhoneNumbersList();
    super.initState();
  }

  void loadPhoneNumbersList() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      phoneNumbers = PhoneNumber.stringToList(
          sharedPreferences.getString(SharedPreferencesKey.phoneNumberList) ??
              '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(WhatsAppNumbersStrings.mainScreen.appBarTitle),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  WhatsAppNumbersStrings.mainScreen.openNumberTabTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child:
                    Text(WhatsAppNumbersStrings.mainScreen.listNumberTabTitle),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddNumberScreen(
              onSave: (phoneNumber) async {
                final sharedPreferences = await SharedPreferences.getInstance();
                setState(() {
                  phoneNumbers.add(phoneNumber);
                });

                await sharedPreferences.setString(
                  SharedPreferencesKey.phoneNumberList,
                  PhoneNumber.listToString(phoneNumbers),
                );
              },
            ),
            ListNumberScreen(
              phoneNumbers: phoneNumbers,
            ),
          ],
        ),
      ),
    );
  }
}
