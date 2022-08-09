import 'package:flutter/material.dart';
import 'package:unit_conversion_app/unit_converter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UnitConverter(),
  ));
}
