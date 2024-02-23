import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_it_task/application/binders/state_bindings.dart';
import 'package:future_it_task/presentation/ui/screens/homescreen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../presentation/ui/screens/auth/login_screen.dart';
import '../presentation/ui/screens/auth/profile_screen.dart';
import '../presentation/ui/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: !kReleaseMode,
        builder: (contex) => Sizer(builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                title: 'Customer Management',
                theme: ThemeData(
                  useMaterial3: false,
                  //primarySwatch: MaterialColor(0xFF07AEAF, AppColor().color),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                initialBinding: StateBindings(),
                initialRoute: '/',
                getPages: [
                  GetPage(name: '/', page: () => const SplashScreen()),
                  GetPage(name: '/homescreen', page: () => HomeScreen()),
                  GetPage(name: '/login', page: () => LoginScreen()),
                  GetPage(name: '/profile', page: () => ProfileScreen()),
                ],
              );
            }));
  }
}
