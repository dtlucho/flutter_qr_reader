import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiProvider uiProvider = Provider.of<UiProvider>(context);
    final int currentIndex = uiProvider.selectedMenuOption;

    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (index) => uiProvider.selectedMenuOption = index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'URLs',
        ),
      ],
    );
  }
}
