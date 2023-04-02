import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qa_reader/providers/scan_list_provider.dart';
import 'package:qa_reader/utils/utils.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String value = 'https://www.google.com'; 
        String valueGeo = 'geo:29.096772,-111.005617'; 

        if(value == '-1') return;
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.newScan(value);
        final scan = await scanListProvider.newScan(valueGeo);

        getLaunchUrl(context, scan);

      },
      child:  const Icon(Icons.filter_center_focus),);
  }
}