import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 1,
          children: List.generate(3, (index) {
            return Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          width: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 300,
                color: Colors.red,
              ),
              Container(
                width: 300,
                color: Colors.blue,
              ),
              Container(
                width: 300,
                color: Colors.green,
              ),
              Container(
                width: 300,
                color: Colors.yellow,
              ),
              Container(
                width: 300,
                color: Colors.orange,
              )
            ],
          ),
            );
          }
        ),
        ),
      ),
    );
  }
}