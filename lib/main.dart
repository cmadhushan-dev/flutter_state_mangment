import 'package:flutter/material.dart';
import 'package:flutter_dp_provider_application/provider/card_provider.dart';
import 'package:flutter_dp_provider_application/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //wrap whole app via provider
    MultiProvider(providers:
    [
      ChangeNotifierProvider(create: (context)=>CardProvider()),
    ],child: const MyApp(),)
      
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
