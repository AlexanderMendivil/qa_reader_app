import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_reader/pages/directions_page.dart';
import 'package:qa_reader/pages/maps_page.dart';
import 'package:qa_reader/providers/db_provider.dart';
import 'package:qa_reader/providers/ui_provider.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomePageBody(),
      

      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {

    final tempScan = ScanModel(valor: 'https://www.udemy.com');
    DBProvider.db.nuevoScan(tempScan);
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;


    switch (currentIndex) {
      case 0:
        return const MapsPage();

      case 1:
        return const DirectionPage();
              
      default:
      return const DirectionPage();
    }
  }
}