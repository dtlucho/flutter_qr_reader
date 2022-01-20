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
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition _initialCameraPosition = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.00,
    );

    // Markers
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: MarkerId(UniqueKey().toString()),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialCameraPosition,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
