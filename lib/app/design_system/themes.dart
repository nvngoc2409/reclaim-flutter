/// define custom themes here
import 'package:flutter/material.dart';
import 'package:reclaim/app/app.dart';

final ThemeData appTheme = ThemeData.from(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: ReclaimColors.lightPrimary,
    onPrimary: ReclaimColors.lightOnPrimary,
    primaryContainer: ReclaimColors.lightPrimaryContainer,
    onPrimaryContainer: ReclaimColors.lightOnPrimaryContainer,
    primaryFixed: ReclaimColors.lightPrimaryFixed,
    primaryFixedDim: ReclaimColors.lightPrimaryFixedDim,
    onPrimaryFixed: ReclaimColors.lightOnPrimaryFixed,
    onPrimaryFixedVariant: ReclaimColors.lightOnPrimaryFixedVariant,
    secondary: ReclaimColors.lightSecondary,
    onSecondary: ReclaimColors.lightOnSecondary,
    secondaryContainer: ReclaimColors.lightSecondaryContainer,
    onSecondaryContainer: ReclaimColors.lightOnSecondaryContainer,
    secondaryFixed: ReclaimColors.lightSecondaryFixed,
    secondaryFixedDim: ReclaimColors.lightSecondaryFixedDim,
    onSecondaryFixed: ReclaimColors.lightOnSecondaryFixed,
    onSecondaryFixedVariant: ReclaimColors.lightOnSecondaryFixedVariant,
    tertiary: ReclaimColors.lightTertiary,
    onTertiary: ReclaimColors.lightOnTertiary,
    tertiaryContainer: ReclaimColors.lightTertiaryContainer,
    onTertiaryContainer: ReclaimColors.lightOnTertiaryContainer,
    tertiaryFixed: ReclaimColors.lightTertiaryFixed,
    tertiaryFixedDim: ReclaimColors.lightTertiaryFixedDim,
    onTertiaryFixed: ReclaimColors.lightOnTertiaryFixed,
    onTertiaryFixedVariant: ReclaimColors.lightOnTertiaryFixedVariant,
    error: ReclaimColors.lightError,
    onError: ReclaimColors.lightOnError,
    errorContainer: ReclaimColors.lightErrorContainer,
    onErrorContainer: ReclaimColors.lightOnErrorContainer,
    surface: ReclaimColors.lightSurface,
    onSurface: ReclaimColors.lightOnSurface,
    surfaceDim: ReclaimColors.lightSurfaceDim,
    surfaceBright: ReclaimColors.lightSurfaceBright,
    surfaceContainerLowest: ReclaimColors.lightSurfaceContainerLowest,
    surfaceContainerLow: ReclaimColors.lightSurfaceContainerLow,
    surfaceContainer: ReclaimColors.lightSurfaceContainer,
    surfaceContainerHigh: ReclaimColors.lightSurfaceContainerHigh,
    surfaceContainerHighest: ReclaimColors.lightSurfaceContainerHighest,
    onSurfaceVariant: ReclaimColors.lightOnSurfaceVariant,
    outline: ReclaimColors.lightOutline,
    outlineVariant: ReclaimColors.lightOutlineVariant,
    shadow: ReclaimColors.lightShadow,
    scrim: ReclaimColors.lightScrim,
    inverseSurface: ReclaimColors.lightInverseSurface,
    onInverseSurface: ReclaimColors.lightInverseOnSurface,
    inversePrimary: ReclaimColors.lightInversePrimary,
    surfaceTint: ReclaimColors.lightPrimary,
  ),
  textTheme: ReclaimTextTheme,
).copyWith(
  highlightColor: ReclaimColors.lightPrimary.withValues(alpha: 0.2),
  splashColor: ReclaimColors.lightPrimary.withValues(alpha: 0.2),
  appBarTheme: const AppBarTheme(
    centerTitle: false,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: ReclaimColors.lightPrimary,
    indicatorColor: Colors.white.withValues(alpha: 0.5),
  ),
  inputDecorationTheme: InputDecorationTheme(
    errorStyle: ReclaimTextTheme.bodySmall?.copyWith(color: ReclaimColors.lightError),
  ),
  // For filledButtonTheme, statedButtonTheme, textButtonTheme
  // This will apply to the theme, but I'm still considering whether to include them in each buttons.dart widget.
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return ReclaimColors.green[10];
          if (states.contains(WidgetState.pressed)) return ReclaimColors.lightPrimary;
          return ReclaimColors.neutral[15];
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return ReclaimColors.green;
          return ReclaimColors.green[100];
        },
      ),
      side: WidgetStateProperty.resolveWith<BorderSide?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return const BorderSide(color: ReclaimColors.lightPrimaryFixedDim, width: 2);
          if (states.contains(WidgetState.pressed)) return const BorderSide(color: ReclaimColors.lightPrimaryFixedDim, width: 2);
          return BorderSide(color: ReclaimColors.neutral[15]!, width: 2);
        },
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return ReclaimColors.green[98];
          if (states.contains(WidgetState.pressed)) return ReclaimColors.green[98];
          return ReclaimColors.green[100];
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return ReclaimColors.neutral[80];
          if (states.contains(WidgetState.pressed)) return ReclaimColors.green;
          return ReclaimColors.neutral[15];
        },
      ),
      side: WidgetStateProperty.resolveWith<BorderSide?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) return const BorderSide(color: ReclaimColors.lightOutlineVariant, width: 2);
          if (states.contains(WidgetState.pressed)) return BorderSide(color: ReclaimColors.green[70]!, width: 2);
          return const BorderSide(color: ReclaimColors.lightOutline, width: 2);
        },
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal),
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) return ReclaimColors.lightPrimary;
          return ReclaimColors.lightOnTertiaryFixedVariant;
        },
      ),
    ),
  ),
);
