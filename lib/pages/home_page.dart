import 'package:flutter/material.dart';

import 'package:flutter_qr_reader/pages/maps_history_page.dart';
import 'package:flutter_qr_reader/pages/urls_history_page.dart';
import 'package:flutter_qr_reader/providers/ui_provider.dart';
import 'package:flutter_qr_reader/widgets/custom_bottom_navigator.dart';
import 'package:flutter_qr_reader/widgets/scan_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('History'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomBottomNavigator(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOption;

    switch (currentIndex) {
      case 0:
        return const MapsHistoryPage();
      case 1:
        return const UrlsHistoryPage();
      default:
        return const MapsHistoryPage();
    }
  }
}
