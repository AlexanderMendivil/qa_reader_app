import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qa_reader/providers/scan_list_provider.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String value = 'http://www.google.com'; 
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.newScan(value);
        scanListProvider.newScan('geo:15.33,15.66');

      },
      child:  const Icon(Icons.filter_center_focus),);
  }
}