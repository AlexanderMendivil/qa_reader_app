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

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
        if(barcodeScanRes == '-1') return;
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

        print(barcodeScanRes);
        scanListProvider.newScan(barcodeScanRes);
        final scan = await scanListProvider.newScan(barcodeScanRes);

        getLaunchUrl(context, scan);

      },
      child:  const Icon(Icons.filter_center_focus),);
  }
}