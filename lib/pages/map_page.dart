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

  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel;


    final CameraPosition _initPoint = CameraPosition(
      target: scan.getLatLng(), 
      zoom: 14);

    Set<Marker> markers = Set<Marker>();

    markers.add(Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng())
      );
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Coordenadas'), 
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: scan.getLatLng(), zoom: 15, tilt: 50)));
            }, 
            icon:Icon(Icons.location_city_outlined))
      ]
      ,),
      body: GoogleMap(
        mapType: mapType,
        initialCameraPosition: _initPoint,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(mapType == MapType.normal){
            mapType = MapType.satellite;
          }else{
            mapType = MapType.normal;
          }

          setState(() {});
        },
        child: Icon(Icons.layers),
      
      ),
    );
  }
}