import 'package:bmi/pages/input_page.dart';
import 'package:bmi/provider/input_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InputPageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
        ),
        home: const InputPage(),
      ),
    );
  }
}
