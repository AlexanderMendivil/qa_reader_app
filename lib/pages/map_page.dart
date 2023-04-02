import 'package:flutter/material.dart';

import '../models/scan_model.dart';

class MapPage extends StatelessWidget {
   
  const MapPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar( title: const Text('Coordenadas'),),
      body: Center(
         child: Text(scan.valor),
      ),
    );
  }
}