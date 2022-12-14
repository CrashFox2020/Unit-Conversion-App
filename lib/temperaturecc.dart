import 'package:flutter/material.dart';
import 'my_globals.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:units_converter/units_converter.dart';
import 'package:vibration/vibration.dart';

class TemperatureCC extends StatefulWidget {
  const TemperatureCC({Key? key}) : super(key: key);

  @override
  State<TemperatureCC> createState() => _TemperatureCCState();
}

class _TemperatureCCState extends State<TemperatureCC> {
  @override
  double? userInput1;
  double? userInput2;
  final List<String> units = ['Celsius', 'Kelvin', 'Fahrenheit'];
  String? startUnit;
  String? endUnit;
  double? correctAns;
  bool? result;
  String stringResult = '';
  String? stringCorrectAns;
  Color myColor = Colors.white;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: TextField(
                    onChanged: (text) {
                      var input = double.tryParse(text);
                      setState(() {
                        userInput1 = input;
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
                'Is',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: TextField(
                    onChanged: (text) {
                      var input = double.tryParse(text);
                      setState(() {
                        userInput2 = input;
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
              TextButton(
                onPressed: () {
                  if ((startUnit == null) ||
                      (endUnit == null) ||
                      (userInput1 == null) ||
                      (userInput2 == null)) {
                    setState(() {
                      stringCorrectAns = null;
                      stringResult = '';
                      myColor = Colors.white;

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
                      correctAns = userInput1;
                      stringCorrectAns = 'Ans : $correctAns ??C';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 ??C is $userInput2 ??C => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          Vibration.vibrate(duration: 1000);
                          globals.his2.insert(0,
                              '$userInput1 ??C is $userInput2 ??C => $stringResult\n$stringCorrectAns');
                        });
                      }
                    } else if (startUnit == units[1]) {
                      correctAns = userInput1;
                      stringCorrectAns = 'Ans : $correctAns K';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 K is $userInput2 K => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          Vibration.vibrate(duration: 1000);
                          globals.his2.insert(0,
                              '$userInput1 K is $userInput2 K => $stringResult\n$stringCorrectAns');
                        });
                      }
                    } else {
                      correctAns = userInput1;
                      stringCorrectAns = 'Ans : $correctAns ??F';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 ??F is $userInput2 ??F => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          Vibration.vibrate(duration: 1000);
                          globals.his2.insert(0,
                              '$userInput1 ??F is $userInput2 ??F => $stringResult\n$stringCorrectAns');
                        });
                      }
                    }
                  } else if (startUnit == units[0]) {
                    if (endUnit == units[1]) {
                      correctAns = userInput1?.convertFromTo(
                          TEMPERATURE.celsius, TEMPERATURE.kelvin);
                      stringCorrectAns = 'Ans : $correctAns K';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 ??C is $userInput2 K => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          globals.his2.insert(0,
                              '$userInput1 ??C is $userInput2 K => $stringResult\n$stringCorrectAns');
                          Vibration.vibrate(duration: 1000);
                        });
                      }
                    } else {
                      correctAns = userInput1?.convertFromTo(
                          TEMPERATURE.celsius, TEMPERATURE.fahrenheit);
                      stringCorrectAns = 'Ans : $correctAns ??F';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 ??C is $userInput2 ??F => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          globals.his2.insert(0,
                              '$userInput1 ??C is $userInput2 ??F => $stringResult\n$stringCorrectAns');
                          Vibration.vibrate(duration: 1000);
                        });
                      }
                    }
                  } else if (startUnit == units[1]) {
                    if (endUnit == units[0]) {
                      correctAns = userInput1?.convertFromTo(
                          TEMPERATURE.kelvin, TEMPERATURE.celsius);
                      stringCorrectAns = 'Ans : $correctAns ??C';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 K is $userInput2 ??C => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          globals.his2.insert(0,
                              '$userInput1 K is $userInput2 ??C => $stringResult\n$stringCorrectAns');
                          Vibration.vibrate(duration: 1000);
                        });
                      }
                    } else {
                      correctAns = userInput1?.convertFromTo(
                          TEMPERATURE.kelvin, TEMPERATURE.fahrenheit);
                      stringCorrectAns = 'Ans : $correctAns ??F';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 K is $userInput2 ??F => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          globals.his2.insert(0,
                              '$userInput1 K is $userInput2 ??F => $stringResult\n$stringCorrectAns');
                          Vibration.vibrate(duration: 1000);
                        });
                      }
                    }
                  } else {
                    if (endUnit == units[0]) {
                      correctAns = userInput1?.convertFromTo(
                          TEMPERATURE.fahrenheit, TEMPERATURE.celsius);
                      stringCorrectAns = 'Ans : $correctAns ??C';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 ??F is $userInput2 ??C => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          globals.his2.insert(0,
                              '$userInput1 ??F is $userInput2 ??C => $stringResult\n$stringCorrectAns');
                          Vibration.vibrate(duration: 1000);
                        });
                      }
                    } else {
                      correctAns = userInput1?.convertFromTo(
                          TEMPERATURE.fahrenheit, TEMPERATURE.kelvin);
                      stringCorrectAns = 'Ans : $correctAns K';
                      if (correctAns == userInput2) {
                        setState(() {
                          myColor = Colors.green;
                          stringResult = 'Correct';
                          globals.his2.insert(0,
                              '$userInput1 ??F is $userInput2 K => $stringResult\n$stringCorrectAns');
                        });
                      } else {
                        setState(() {
                          myColor = Colors.red;
                          stringResult = 'Wrong';
                          globals.his2.insert(0,
                              '$userInput1 ??F is $userInput2 K => $stringResult\n$stringCorrectAns');
                          Vibration.vibrate(duration: 1000);
                        });
                      }
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
                    'Check',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(stringResult,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              Text(
                (stringCorrectAns != null) ? '$stringCorrectAns' : '',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
