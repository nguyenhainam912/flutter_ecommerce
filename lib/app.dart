// ignore_for_file: prefer_const_constructors

import 'package:ecommt/bindings/general_bindings.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ecommt/utils/constants/text_strings.dart';
import 'package:ecommt/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        home: Scaffold(
            backgroundColor: TColors.primary,
            body:
                Center(child: CircularProgressIndicator(color: Colors.white))));
  }
}
