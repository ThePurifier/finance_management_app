import 'package:finance_management_app/screens/screens.dart';
import 'package:finance_management_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(appTheme: AppTheme(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key, 
    required this.appTheme,
    }) : super(key: key);

  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.light,
      title: 'Financial managment',
      home: HomeScreen(),
    );
  }
}