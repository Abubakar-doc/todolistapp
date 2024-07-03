import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolistapp/THEME/themeProvider.dart';
import 'package:todolistapp/UX/splashScreen.dart';
import 'package:todolistapp/MODEL/todoModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoTaskAdapter());
  var appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.openBox<TodoTask>('tasks', path: appDocumentDir.path);

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
