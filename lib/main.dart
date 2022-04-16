import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget _buildButton(Color color, String text, IconData icon) {
    return TextButton(
      onPressed: () => {},
      style: TextButton.styleFrom(shape: const CircleBorder()),
      child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    var buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(color, 'CALL', Icons.call),
        _buildButton(color, 'MAP', Icons.near_me),
        _buildButton(color, 'SHARE', Icons.share),
      ],
    );

    var textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    var imageSection = Image.asset(
      "assets/last_sunset_2020.jpg",
      fit: BoxFit.cover,
    );

    return MaterialApp(
      title: 'Hello, Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.travel_explore),
              Container(
                  child: const Text("How's your trip?"),
                  margin: const EdgeInsets.only(left: 10)),
            ],
          ),
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              imageSection,
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [titleSection, buttonSection, textSection],
        ),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController(text: pow(10000, 2).toString());

  void _decrementCounter() {
    setState(() {
      _controller.text = "${int.parse(_controller.text) - 1}";
    });
  }

  void _resetCounter() {
    setState(() {
      if (_controller.text == "0") {
        _controller.text = pow(10000, 2).toString();
      } else {
        _controller.text = "0";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Hello World"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The counter still:',
            ),
            TextFormField(
              controller: _controller,
            ),
            OutlinedButton(
              onPressed: _resetCounter,
              child: const Text("Reset"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
