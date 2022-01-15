import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:flutter_qr_reader/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class ScanList extends StatelessWidget {
  const ScanList({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider =
        Provider.of<ScanListProvider>(context);

    final List<ScanModel> scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(color: Colors.red),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            Provider.of<ScanListProvider>(context, listen: false)
                .deleteScanById(scans[index].id!);
          },
          child: ListTile(
            leading: Icon(
              type == "http" ? Icons.link : Icons.map,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(scans[index].value),
            subtitle: Text(scans[index].id.toString()),
            trailing:
                const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: () => print(scans[index].id),
          ),
        );
      },
    );
  }
}
