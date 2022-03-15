import 'package:desafio_flutter/app/view/login/login_view.dart';
import 'package:desafio_flutter/app/view/widgets/splashScreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const DesafioApp());
}

class DesafioApp extends StatelessWidget {
  const DesafioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio Sistema info',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFa0171e, {
          50: Color(0xFFa0171e),
          100: Color(0xFFa0171e),
          200: Color(0xFFa0171e),
          300: Color(0xFFa0171e),
          400: Color(0xFFa0171e),
          500: Color(0xFFa2161c),
          600: Color(0xFFa2161c),
          700: Color(0xFFa2161c),
          800: Color(0xFFa2161c),
          900: Color(0xFFa2161c),
        }),
        primaryColor: const Color.fromRGBO(160, 24, 28, 1),
        fontFamily: 'happymonkey',
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          minWidth: 480,
          defaultName: MOBILE,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(700, name: TABLET),
            const ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ]),
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
      ],
      home: SplashScreen(),
    );
  }
}
