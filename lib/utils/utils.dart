import 'package:flutter/material.dart';
import 'package:qa_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> getLaunchUrl(BuildContext context, ScanModel scan ) async {
  final url = Uri.parse(scan.valor);

  if(scan.tipo == 'http'){
  if (!await canLaunchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  else{
    launchUrl(url);
  }
  }else{
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}