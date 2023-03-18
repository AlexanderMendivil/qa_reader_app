import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_reader/pages/home_page.dart';
import 'package:qa_reader/pages/map_page.dart';
import 'package:qa_reader/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UIProvider() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QA reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'mapa': (_) => const MapPage(),
        },
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple)
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('QA reader'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}