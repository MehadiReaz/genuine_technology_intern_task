import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

void goToNextScreen() async {
  await AuthController.getAccessToken();
  Future.delayed(const Duration(seconds: 1)).then((value) {
    Get.offAllNamed(AuthController.isLoggedIn ? '/homescreen' : '/login');
  });
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Developed by MehadiReaz ❤')),
    );
  }

  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }
}
