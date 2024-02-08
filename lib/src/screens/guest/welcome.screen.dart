import 'package:flutter/material.dart';
import 'package:onegaleon/src/widgets/index.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName='welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const TitlePrimary('Bienvenido'),
            const SizedBox(height: 48,),
            Container( margin: const EdgeInsets.all(12), child: const Image(image: AssetImage('assets/logo.png'))),
            const SizedBox(height: 48,),
            PrimaryButton(text: 'INICIAR', onTap: (){ Navigator.pushReplacementNamed(context, 'login'); },),
          ],
        ),
      ),
    );
  }
}