import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class DirectionPage extends StatelessWidget {
   
  const DirectionPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
      final scans = scanListProvider.scans;
    return ListView.builder(itemCount: scans.length, itemBuilder: (_, int i)=> 
    ListTile(
      leading: Icon(Icons.home, color: Theme.of(context).primaryColor,),
      title: Text(scans[i].valor),
      subtitle: Text(scans[i].id.toString()),
      trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey,),
      onTap: () => print('abrir algo'),
    ),
    );
  }
}