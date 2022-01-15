import 'package:flutter/material.dart';

class MapsHistoryPage extends StatelessWidget {
  const MapsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, int index) {
        return ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
          title: Text("https://google.com"),
          subtitle: Text("id"),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => print("open"),
        );
      },
    );
  }
}
