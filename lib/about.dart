import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unit_conversion_app/navigation_drawer.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(name: 'About'),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'About',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: const [
          Text(
            'The icons and symbols used in the application are from the following sources:',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            '1) https://icons8.com/\n2) http://www.entypo.com\n3) http://typicons.com/\n4) http://fortawesome.github.com/Font-Awesome/',
            style: TextStyle(fontSize: 20),
          )
        ]),
      ),
    );
  }
}
