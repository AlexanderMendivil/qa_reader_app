import 'package:flutter/material.dart';
import 'package:qa_reader/widgets/widgets.dart';

class MapsPage extends StatelessWidget {
   
  const MapsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     return const ScanTiles(type: 'geo',);
  }
}