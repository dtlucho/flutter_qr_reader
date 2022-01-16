import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Map'),
      ),
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}
