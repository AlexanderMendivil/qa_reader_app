import 'package:flutter/material.dart';
import 'package:qa_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan( String valor ) async {
    final newScan = ScanModel(valor: valor);

    final id = await DBProvider.db.nuevoScan(newScan);
    newScan.id = id;

    if(selectedType == newScan.tipo){
      scans.add(newScan);
      notifyListeners();
    }
    
    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...scans!];
    notifyListeners();
  }

  loadScansByType( String type ) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = scans != null ? [...scans] : this.scans;
    selectedType = type; 
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    scans = scans.where((scan) => scan.id != id).toList();
    notifyListeners();
  }
}