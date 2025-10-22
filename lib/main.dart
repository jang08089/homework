import 'package:flutter/material.dart';
import 'package:flutter_newtask/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[300],),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey,
        brightness: Brightness.light),
        dividerColor: Colors.grey,
        textTheme: TextTheme(
          
        )
      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900],),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.dark
          ),
          dividerColor: Colors.black,
          scaffoldBackgroundColor: Colors.black
      ),
      
      home: Homepage()
    );
  }
}



