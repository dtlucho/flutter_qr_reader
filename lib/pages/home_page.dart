import 'package:flutter/material.dart';

import 'package:flutter_qr_reader/pages/maps_history_page.dart';
import 'package:flutter_qr_reader/pages/urls_history_page.dart';
import 'package:flutter_qr_reader/providers/scan_list_provider.dart';
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
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteAllScans();
            },
          )
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
    final UiProvider uiProvider = Provider.of<UiProvider>(context);
    final int currentIndex = uiProvider.selectedMenuOption;

    final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(
      context,
      listen: false,
    );

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType("geo");
        return const MapsHistoryPage();
      case 1:
        scanListProvider.loadScansByType("http");
        return const UrlsHistoryPage();
      default:
        return const MapsHistoryPage();
    }
  }
}
