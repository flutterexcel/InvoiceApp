// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invoice_maker/constants.dart';
import 'package:invoice_maker/firstLoadingScreen.dart';
import 'package:invoice_maker/provider/invoiceProvider.dart';
import 'package:invoice_maker/provider/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  String currentTheme = "light";
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    theme: currentTheme,
  ));
}

class MyApp extends StatelessWidget {
  final String theme;

  MyApp({required this.theme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {}

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<ThemeProvider>(
                  create: (context) => ThemeProvider(theme),
                ),
                ChangeNotifierProvider<InvoiceProvider>(
                    create: (context) => InvoiceProvider()),
              ],
              child: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                return MaterialApp(
                  title: 'Invoice Maker',
                  debugShowCheckedModeBanner: false,
                  themeMode: themeProvider.themeMode,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  home: FirstLoadingScreen(),
                );
              }));
        }

        //// Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
