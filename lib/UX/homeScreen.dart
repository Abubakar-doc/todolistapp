import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Ensure this import is present
import 'package:todolistapp/THEME/theme.dart';
import 'package:todolistapp/THEME/themeProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences _prefs;
  bool _isDarkMode = false; // Default to light theme

  @override
  void initState() {
    super.initState();
    _loadSelectedTheme();
  }

  Future<void> _loadSelectedTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs.getBool('isDarkMode');
    setState(() {
      _isDarkMode =
          savedTheme ?? false; // Default to light theme if no theme is saved
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: customDarkTextColor,
          fontSize: 30),
        ),
        backgroundColor: customPurple,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 36,
                color: customDarkTextColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.search, size: 32, color: customDarkTextColor),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text('Hello There 👋', style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.left,),
              Text('Organize your plans for today', style: Theme.of(context).textTheme.titleMedium, ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: customPurple,
              ),
              child: Text(
                'To Do',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) async {
                  setState(() {
                    _isDarkMode = value;
                  });
                  final themeProvider = Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  );
                  themeProvider.toggleTheme();
                  await _prefs.setBool('isDarkMode', value);
                },
                activeColor: customPurple,
              ),
            ),
            ListTile(
              title: const Text('App Developer'),
              onTap: () {
                // Implement action for Item 2
              },
            ),
          ],
        ),
      ),
    );
  }
}
