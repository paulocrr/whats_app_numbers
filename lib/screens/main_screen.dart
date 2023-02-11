import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:whats_app_numbers/languages/whats_app_numbers_strings.dart';
import 'package:whats_app_numbers/models/phone_number.dart';
import 'package:whats_app_numbers/screens/add_number_screen.dart';
import 'package:whats_app_numbers/screens/list_numbers_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<PhoneNumber> phoneNumbers = [
    PhoneNumber(
      id: const Uuid().v1(),
      number: '(+51) 959 356 062',
      description: 'Prueba',
    ),
    PhoneNumber(
      id: const Uuid().v1(),
      number: '(+51) 959 356 062',
      description: 'Prueba',
    ),
    PhoneNumber(
      id: const Uuid().v1(),
      number: '(+51) 959 356 062',
      description: 'Prueba',
    ),
    PhoneNumber(
      id: const Uuid().v1(),
      number: '(+51) 959 356 062',
      description: 'Prueba',
    ),
    PhoneNumber(
      id: const Uuid().v1(),
      number: '(+51) 959 356 062',
      description: 'Prueba',
    ),
  ];

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
            const AddNumberScreen(),
            ListNumberScreen(
              phoneNumbers: phoneNumbers,
            ),
          ],
        ),
      ),
    );
  }
}
