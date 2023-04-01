import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class MapsPage extends StatelessWidget {
   
  const MapsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     final scanListProvider = Provider.of<ScanListProvider>(context);
      final scans = scanListProvider.scans;
    return ListView.builder(itemCount: scans.length, itemBuilder: (_, int i)=> 
    ListTile(
      leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
      title: Text(scans[i].valor),
      subtitle: Text(scans[i].id.toString()),
      trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey,),
      onTap: () => print('abrir algo'),
    ),
    );
  }
}