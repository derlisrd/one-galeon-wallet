import 'package:flutter/material.dart';
import 'package:onegaleon/src/providers/info.providers.dart';
import 'package:provider/provider.dart';
import 'package:onegaleon/src/providers/auth.provider.dart';
import 'package:onegaleon/src/routes/routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => InfoProviders()),
      ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.green,
              onSecondary: Colors.red,
              error: Colors.red,
              onError: Colors.red,
              background: Colors.white10,
              onBackground: Colors.deepPurple,
              surface: Colors.black45,
              onSurface: Colors.white)
              ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes().initialRoute,
      routes: Routes().routes(context),
    );
  }
}
