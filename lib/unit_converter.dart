import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:unit_conversion_app/lengthuc.dart';
import 'package:unit_conversion_app/speeduc.dart';
import 'package:unit_conversion_app/temperatureuc.dart';
import 'package:unit_conversion_app/unit_icons_icons.dart';
import 'package:unit_conversion_app/weightuc.dart';

import 'navigation_drawer.dart';

class UnitConverter extends StatefulWidget {
  const UnitConverter({Key? key}) : super(key: key);

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  int currentPage = 0;
  List<Widget> pages = [
    const LengthUC(),
    const WeightUC(),
    const TemperatureUC(),
    const SpeedUC()
  ];

  @override
  void initState() {
    super.initState();

    /// whenever your initialization is completed, remove the splash screen:
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(name: 'Unit Converter'),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Unit Converter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(UnitIcons.ruler), label: 'Length'),
          NavigationDestination(
              icon: Icon(UnitIcons.weight_hanging), label: 'Weight'),
          NavigationDestination(
              icon: Icon(UnitIcons.temperatire), label: 'Temperature'),
          NavigationDestination(icon: Icon(UnitIcons.gauge), label: 'Speed'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
