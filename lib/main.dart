import 'package:flutter/material.dart';
import 'package:office_furniture/core/app_theme.dart';
import 'package:office_furniture/src/business_logic/provider/furniture_provider.dart';
import 'package:office_furniture/src/data/repository/repository.dart';
import 'package:office_furniture/src/presentation/screen/intro_screen.dart';
import 'package:provider/provider.dart';
import 'dart:ui' show PointerDeviceKind;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OFFICE Furniture',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: MultiProvider(
        providers: [
          Provider<Repository>(create: (context) => Repository()),
          ChangeNotifierProvider<FurnitureProvider>(
            create: (context) => FurnitureProvider(
              repository: context.read<Repository>(),
            ),
          )
        ],
        child: const IntroScreen(),
      ),
      theme: AppTheme.lightTheme,
    );
  }
}
