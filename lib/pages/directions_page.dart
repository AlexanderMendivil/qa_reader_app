import 'package:flutter/material.dart';
import 'package:qa_reader/widgets/widgets.dart';

class DirectionPage extends StatelessWidget {
   
  const DirectionPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: 'http');
  }
}