import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'my_globals.dart' as globals;

class SpeedUC extends StatefulWidget {
  const SpeedUC({Key? key}) : super(key: key);

  @override
  State<SpeedUC> createState() => _SpeedUCState();
}

class _SpeedUCState extends State<SpeedUC> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> units = [
    'km/h',
    'mph',
    'm/s',
  ];
  String? startUnit;
  String? endUnit;

  double? result;
  String? stringResult;

  double? userInput;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: TextField(
                  onChanged: (text) {
                    var input = double.tryParse(text);
                    setState(() {
                      userInput = input;
                    });
                  },
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Enter a value',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'From',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: startUnit,
                    isExpanded: true,
                    dropdownColor: Colors.black,
                    hint: const Text(
                      'Choose a unit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    items: units.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        startUnit = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'To',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: endUnit,
                    isExpanded: true,
                    dropdownColor: Colors.black,
                    hint: const Text(
                      'Choose a unit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    items: units.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        endUnit = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  if ((startUnit == null) ||
                      (endUnit == null) ||
                      (userInput == null)) {
                    setState(() {
                      stringResult = null;

                      Fluttertoast.showToast(
                          msg: "Invalid Input",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  } else if (startUnit == endUnit) {
                    if (startUnit == units[0]) {
                      setState(() {
                        stringResult = '$userInput km/h';
                        globals.his1
                            .insert(0, '$userInput km/h is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    } else if (startUnit == units[1]) {
                      setState(() {
                        stringResult = '$userInput mph';
                        globals.his1
                            .insert(0, '$userInput mph is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    } else {
                      setState(() {
                        stringResult = '$userInput m/s';
                        globals.his1
                            .insert(0, '$userInput m/s is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    }
                  } else if (startUnit == units[0]) {
                    if (endUnit == units[1]) {
                      setState(() {
                        result = (userInput)?.convertFromTo(
                            SPEED.kilometersPerHour, SPEED.milesPerHour);
                        stringResult = '$result mph';
                        globals.his1
                            .insert(0, '$userInput km/h is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    } else {
                      setState(() {
                        result = (userInput)?.convertFromTo(
                            SPEED.kilometersPerHour, SPEED.metersPerSecond);
                        stringResult = '$result m/s';
                        globals.his1
                            .insert(0, '$userInput km/h is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    }
                  } else if (startUnit == units[1]) {
                    if (endUnit == units[0]) {
                      setState(() {
                        result = (userInput)?.convertFromTo(
                            SPEED.milesPerHour, SPEED.kilometersPerHour);
                        stringResult = '$result km/h';
                        globals.his1
                            .insert(0, '$userInput mph is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    } else {
                      setState(() {
                        result = (userInput)?.convertFromTo(
                            SPEED.milesPerHour, SPEED.metersPerSecond);
                        stringResult = '$result m/s';
                        globals.his1
                            .insert(0, '$userInput mph is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    }
                  } else {
                    if (endUnit == units[0]) {
                      setState(() {
                        result = (userInput)?.convertFromTo(
                            SPEED.metersPerSecond, SPEED.kilometersPerHour);
                        stringResult = '$result km/h';
                        globals.his1
                            .insert(0, '$userInput m/s is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    } else {
                      setState(() {
                        result = (userInput)?.convertFromTo(
                            SPEED.metersPerSecond, SPEED.milesPerHour);
                        stringResult = '$result mph';
                        globals.his1
                            .insert(0, '$userInput m/s is $stringResult ');
                        Fluttertoast.showToast(
                            msg: "Success",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    }
                  }
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            const Text('Result',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text(
              (stringResult != null) ? '$stringResult' : '',
              style: const TextStyle(fontSize: 25),
            ),
          ]),
        ),
      ),
    );
  }
}
