import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';


import 'common/screens/splash_screen.dart';
import 'core/imports/core_imports.dart';
import 'core/translations/translations.dart';

Talker? talker;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  talker = TalkerFlutter.init();

  // Loading configurations
  EasyLoading.instance
    ..textStyle = globalTextStyle(fontSize: 12, color: Colors.white)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.black
    ..radius = 12
    ..contentPadding = const EdgeInsets.all(14)
    ..indicatorSize = 30
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..userInteractions = false
    ..displayDuration = const Duration(seconds: 1)
    ..dismissOnTap = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'E-SHOP UI',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          locale: const Locale('en_US'),
          fallbackLocale: const Locale('en_US'),
          translations: CustomTranslations(),
          defaultTransition: Transition.cupertino,
          builder: EasyLoading.init(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
