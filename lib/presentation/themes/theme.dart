import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff911f34),
      surfaceTint: Color(0xffaa3245),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc24456),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff8a4d52),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffb9bd),
      onSecondaryContainer: Color(0xff5d292e),
      tertiary: Color(0xff743e00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa95d00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff241919),
      onSurfaceVariant: Color(0xff574142),
      outline: Color(0xff8b7172),
      outlineVariant: Color(0xffdebfc0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3a2d2e),
      inversePrimary: Color(0xffffb2b7),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff40000e),
      primaryFixedDim: Color(0xffffb2b7),
      onPrimaryFixedVariant: Color(0xff89182f),
      secondaryFixed: Color(0xffffdadb),
      onSecondaryFixed: Color(0xff380b12),
      secondaryFixedDim: Color(0xffffb2b7),
      onSecondaryFixedVariant: Color(0xff6e363b),
      tertiaryFixed: Color(0xffffdcc2),
      onTertiaryFixed: Color(0xff2e1500),
      tertiaryFixedDim: Color(0xffffb77a),
      onTertiaryFixedVariant: Color(0xff6d3a00),
      surfaceDim: Color(0xffebd5d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f0),
      surfaceContainer: Color(0xffffe9e9),
      surfaceContainerHigh: Color(0xfffae3e3),
      surfaceContainerHighest: Color(0xfff4ddde),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff84142c),
      surfaceTint: Color(0xffaa3245),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc24456),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff693238),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa46267),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff673600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa95d00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff241919),
      onSurfaceVariant: Color(0xff533d3f),
      outline: Color(0xff71595a),
      outlineVariant: Color(0xff8e7475),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3a2d2e),
      inversePrimary: Color(0xffffb2b7),
      primaryFixed: Color(0xffc7485a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffa72f43),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffa46267),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff874a50),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffae6106),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff8b4c00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffebd5d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f0),
      surfaceContainer: Color(0xffffe9e9),
      surfaceContainerHigh: Color(0xfffae3e3),
      surfaceContainerHighest: Color(0xfff4ddde),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4d0012),
      surfaceTint: Color(0xffaa3245),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff84142c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff411218),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff693238),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff381b00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff673600),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff311f20),
      outline: Color(0xff533d3f),
      outlineVariant: Color(0xff533d3f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3a2d2e),
      inversePrimary: Color(0xffffe6e7),
      primaryFixed: Color(0xff84142c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff60001a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff693238),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e1c22),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff673600),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff472400),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffebd5d5),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f0),
      surfaceContainer: Color(0xffffe9e9),
      surfaceContainerHigh: Color(0xfffae3e3),
      surfaceContainerHighest: Color(0xfff4ddde),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb2b7),
      surfaceTint: Color(0xffffb2b7),
      onPrimary: Color(0xff67001c),
      primaryContainer: Color(0xffb73c4e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffb2b7),
      onSecondary: Color(0xff522026),
      secondaryContainer: Color(0xff662f35),
      onSecondaryContainer: Color(0xffffc8cb),
      tertiary: Color(0xffffb77a),
      onTertiary: Color(0xff4c2700),
      tertiaryContainer: Color(0xff9c5500),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1b1011),
      onSurface: Color(0xfff4ddde),
      onSurfaceVariant: Color(0xffdebfc0),
      outline: Color(0xffa68a8b),
      outlineVariant: Color(0xff574142),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff4ddde),
      inversePrimary: Color(0xffaa3245),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff40000e),
      primaryFixedDim: Color(0xffffb2b7),
      onPrimaryFixedVariant: Color(0xff89182f),
      secondaryFixed: Color(0xffffdadb),
      onSecondaryFixed: Color(0xff380b12),
      secondaryFixedDim: Color(0xffffb2b7),
      onSecondaryFixedVariant: Color(0xff6e363b),
      tertiaryFixed: Color(0xffffdcc2),
      onTertiaryFixed: Color(0xff2e1500),
      tertiaryFixedDim: Color(0xffffb77a),
      onTertiaryFixedVariant: Color(0xff6d3a00),
      surfaceDim: Color(0xff1b1011),
      surfaceBright: Color(0xff443636),
      surfaceContainerLowest: Color(0xff160b0c),
      surfaceContainerLow: Color(0xff241919),
      surfaceContainer: Color(0xff291d1d),
      surfaceContainerHigh: Color(0xff342727),
      surfaceContainerHighest: Color(0xff3f3132),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb9bd),
      surfaceTint: Color(0xffffb2b7),
      onPrimary: Color(0xff36000a),
      primaryContainer: Color(0xffec6474),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffb9bd),
      onSecondary: Color(0xff31060d),
      secondaryContainer: Color(0xffc47d83),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffbd86),
      onTertiary: Color(0xff261100),
      tertiaryContainer: Color(0xffd17c27),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1b1011),
      onSurface: Color(0xfffff9f9),
      onSurfaceVariant: Color(0xffe3c3c4),
      outline: Color(0xffb99c9d),
      outlineVariant: Color(0xff977d7e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff4ddde),
      inversePrimary: Color(0xff8b1a30),
      primaryFixed: Color(0xffffdadb),
      onPrimaryFixed: Color(0xff2d0007),
      primaryFixedDim: Color(0xffffb2b7),
      onPrimaryFixedVariant: Color(0xff720220),
      secondaryFixed: Color(0xffffdadb),
      onSecondaryFixed: Color(0xff2a0308),
      secondaryFixedDim: Color(0xffffb2b7),
      onSecondaryFixedVariant: Color(0xff5a262b),
      tertiaryFixed: Color(0xffffdcc2),
      onTertiaryFixed: Color(0xff1f0c00),
      tertiaryFixedDim: Color(0xffffb77a),
      onTertiaryFixedVariant: Color(0xff552c00),
      surfaceDim: Color(0xff1b1011),
      surfaceBright: Color(0xff443636),
      surfaceContainerLowest: Color(0xff160b0c),
      surfaceContainerLow: Color(0xff241919),
      surfaceContainer: Color(0xff291d1d),
      surfaceContainerHigh: Color(0xff342727),
      surfaceContainerHighest: Color(0xff3f3132),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb2b7),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb9bd),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb9bd),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffbd86),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1b1011),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffe3c3c4),
      outlineVariant: Color(0xffe3c3c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff4ddde),
      inversePrimary: Color(0xff5b0018),
      primaryFixed: Color(0xffffdfe0),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb9bd),
      onPrimaryFixedVariant: Color(0xff36000a),
      secondaryFixed: Color(0xffffdfe0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb9bd),
      onSecondaryFixedVariant: Color(0xff31060d),
      tertiaryFixed: Color(0xffffe1cc),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffbd86),
      onTertiaryFixedVariant: Color(0xff261100),
      surfaceDim: Color(0xff1b1011),
      surfaceBright: Color(0xff443636),
      surfaceContainerLowest: Color(0xff160b0c),
      surfaceContainerLow: Color(0xff241919),
      surfaceContainer: Color(0xff291d1d),
      surfaceContainerHigh: Color(0xff342727),
      surfaceContainerHighest: Color(0xff3f3132),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
