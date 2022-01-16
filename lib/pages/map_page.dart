import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    const CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
