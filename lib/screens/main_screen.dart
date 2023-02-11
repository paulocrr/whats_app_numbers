import 'package:flutter/material.dart';
import 'package:whats_app_numbers/languages/whats_app_numbers_strings.dart';
import 'package:whats_app_numbers/screens/add_number_screen.dart';
import 'package:whats_app_numbers/screens/list_numbers_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
        body: const TabBarView(
          children: [
            AddNumberScreen(),
            ListNumberScreen(),
          ],
        ),
      ),
    );
  }
}
