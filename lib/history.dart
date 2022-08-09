import 'package:flutter/material.dart';

import 'package:unit_conversion_app/navigation_drawer.dart';
import 'my_globals.dart' as globals;

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(name: 'History'),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'History',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text(
            'Unit Converter',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: globals.his1.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(globals.his1[index]),
                    leading: Text('${index + 1}'),
                    trailing: const Icon(Icons.autorenew),
                  );
                }),
          ),
          const Text(
            'Conversion Checker',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: globals.his2.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(globals.his2[index]),
                    leading: Text('${index + 1}'),
                    trailing: const Icon(Icons.compare_arrows),
                  );
                }),
          )
        ],
      ),
    );
  }
}
