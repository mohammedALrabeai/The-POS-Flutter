// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:thepos/core/init_app.dart';
import 'package:thepos/routes/app_pages.dart';

import 'localization/localization_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      getPages: routes,
      initialRoute: initial,
      locale: LocalizationService.locale,
      navigatorKey: navigatorKey,
      translations: LocalizationService(),
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: widget!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(23, 143, 73, 1.0),
        ),
        dividerColor: const Color.fromRGBO(218, 218, 218, 1),
        primaryColor: const Color.fromRGBO(23, 143, 73, 1.0),
        scaffoldBackgroundColor: const Color.fromRGBO(244, 245, 250, 1),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromRGBO(252, 189, 24, 1),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(252, 189, 24, 1),
          sizeConstraints: BoxConstraints(
            minWidth: 80,
            minHeight: 80,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: GoogleFonts.cairo(
              textStyle: const TextStyle(
                  color: Color.fromRGBO(23, 143, 73, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(23, 143, 73, 1)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(23, 143, 73, 1)),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
