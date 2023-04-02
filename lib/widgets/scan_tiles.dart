import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {

  final String type;
  const ScanTiles({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
      final scans = scanListProvider.scans;
    return ListView.builder(itemCount: scans.length, itemBuilder: (_, int i)=> 
    Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: ( DismissDirection direction ) => scanListProvider.deleteScanById(scans[i].id!),
      child: ListTile(
        leading: Icon(
          type != 'http' ?
          Icons.map : Icons.directions, 
          color: Theme.of(context).primaryColor,),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey,),
        onTap: () => print('abrir algo'),
      ),
    ),
    );
  }
}