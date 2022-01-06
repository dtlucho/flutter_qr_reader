import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/widgets/custom_bottom_navigator.dart';
import 'package:flutter_qr_reader/widgets/scan_button.dart';

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
      body: Center(
        child: Container(
          child: Text('Hello world'),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigator(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
