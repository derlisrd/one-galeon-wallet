import 'package:flutter/material.dart';
import 'package:onegaleon/src/screens/index.dart';




class Routes{

  String initialRoute = 'thinking';


  Map<String, Widget Function(BuildContext)> routes(BuildContext context){
    return {
      'thinking': (context)=> const ThinkingScreen(),
        'welcome' :(context) => const WelcomeScreen(),
        "login":(context) => const LoginScreen(),
        "register":(context) => const RegisterScreen(),
        "authmain":(context) => const AuthScreen(),
        "home":(context) => const HomeScreen(),
        "settings":(context) => const SettingScreen(),
        "add": (context) => const AddScreen()
      };
  }
}