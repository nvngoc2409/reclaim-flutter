import 'package:flutter/material.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/app/design_system/page_transition.dart';

final ThemeData appTheme = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: ReclaimColors.pink,
    primary: ReclaimColors.yellow,
    onPrimary: ReclaimColors.neutral[10],
    secondary: ReclaimColors.green,
    onSecondary: ReclaimColors.green[100],
    tertiary: ReclaimColors.lavender,
    onTertiary: ReclaimColors.lavender[100],
    surface: ReclaimColors.neutral[10],
    onSurface: ReclaimColors.neutral[100],
    error: ReclaimColors.red,
    onError: ReclaimColors.red[100],
  ),
  textTheme: reclaimTextTheme,
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.iOS: ReclaimCupertinoPageTransitionsBuilder(),
      TargetPlatform.android: ReclaimCupertinoPageTransitionsBuilder(),
    },
  ),
);
