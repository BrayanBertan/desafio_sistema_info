import 'dart:async';

import 'package:desafio_flutter/app/banco/banco.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashScreenTempo() {
    return Timer(const Duration(seconds: 1), mudarTela);
  }

  mudarTela() async {
    Get.offNamed('/login');
  }

  inicializaBanco() async {
    await Get.putAsync(() => BancoService().db);
    splashScreenTempo();
  }

  @override
  void initState() {
    super.initState();
    inicializaBanco();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/imagens/logo.png'),
            ],
          ),
        ),
      ),
    );
  }
}
