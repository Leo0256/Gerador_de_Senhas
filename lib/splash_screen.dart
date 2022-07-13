import 'package:flutter/material.dart';

import 'mfpassword.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navToHome();
  }

  _navToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const MFPassword())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Image.asset(
            'images/logo_mf.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}