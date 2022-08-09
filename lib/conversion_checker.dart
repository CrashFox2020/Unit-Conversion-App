import 'package:flutter/material.dart';
import 'package:unit_conversion_app/lengthcc.dart';
import 'package:unit_conversion_app/speedcc.dart';
import 'package:unit_conversion_app/temperaturecc.dart';
import 'package:unit_conversion_app/unit_icons_icons.dart';
import 'package:unit_conversion_app/weightcc.dart';
import 'navigation_drawer.dart';

class ConversionChecker extends StatefulWidget {
  const ConversionChecker({Key? key}) : super(key: key);

  @override
  State<ConversionChecker> createState() => _ConversionCheckerState();
}

class _ConversionCheckerState extends State<ConversionChecker> {
  int currentPage = 0;
  List<Widget> pages = [
    const LengthCC(),
    const WEIGHTCC(),
    const TemperatureCC(),
    const SpeedCC()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(name: 'Conversion Checker'),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Conversion Checker',
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
