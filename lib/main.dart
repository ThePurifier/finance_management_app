import 'package:finance_management_app/screens/screens.dart';
import 'package:finance_management_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      initialRoute: '/signin',
      home: const SignInScreen(),
      routes: <String, WidgetBuilder>{
        '/home' : (BuildContext context) => HomeScreen(),
        '/signin' : (BuildContext context) => const SignInScreen(),
        '/signup' : (BuildContext context) => const SignUpScreen(),
        '/addexp' : (BuildContext context) => const AddExpenseScreen(),
      },
    );
  }
}