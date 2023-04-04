import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/scan_model.dart';

class MapPage extends StatefulWidget {
   
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {


    final CameraPosition _initPoint = CameraPosition(target: LatLng(37, -122), zoom: 14);
    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar( title: const Text('Coordenadas'),),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _initPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}