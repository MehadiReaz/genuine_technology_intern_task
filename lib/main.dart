import 'package:flutter/material.dart';
import 'application/app.dart';
import 'presentation/ui/controllers/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load access token and user profile
  await AuthController.getAccessToken();
  await AuthController.getUserProfile();
  runApp(const App());
}
