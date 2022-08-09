import 'package:flutter/material.dart';
import 'package:unit_conversion_app/about.dart';
import 'package:unit_conversion_app/conversion_checker.dart';
import 'package:unit_conversion_app/history.dart';
import 'package:unit_conversion_app/unit_converter.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/splash.png'),
                  radius: 40,
                ),
                const Text(
                  'Unit Conversion App',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                const Divider(
                  height: 60,
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () {
                    if (name == 'Unit Converter') {
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const UnitConverter();
                      }));
                    }
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.autorenew,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 40),
                        Text(
                          'Unit Converter',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (name == 'Conversion Checker') {
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const ConversionChecker();
                      }));
                    }
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.compare_arrows,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 40),
                        Text(
                          'Conversion Checker',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (name == 'History') {
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const History();
                      }));
                    }
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.history,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 40),
                        Text(
                          'History',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (name == 'About') {
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const About();
                      }));
                    }
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.info,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 40),
                        Text(
                          'About',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
