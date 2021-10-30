import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name;
  TextEditingController textControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field'),
        backgroundColor: Color(0xffffd700),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter Your Name',
                  hintText: 'Enter Your Full Name'),
              onChanged: (val) {
                name = val;
                print(name);
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Your Age',
                hintText: 'Enter Your Real Age',
              ),
              controller: textControl,
              keyboardType: TextInputType.number,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffffd700),
        child: Icon(
          Icons.text_fields,
          color: Colors.black,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: Color(0xffffd700),
              title: ListTile(
                title: Text(
                  'Hey! \nMr. $name',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Your Age is ${textControl.text}',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              actions: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffffd700)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Okay'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
