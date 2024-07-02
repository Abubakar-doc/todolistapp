import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/THEME/themeProvider.dart';
import 'package:todolistapp/UX/splash.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(), // Provide your light theme here
            darkTheme: ThemeData.dark(), // Provide your dark theme here
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
