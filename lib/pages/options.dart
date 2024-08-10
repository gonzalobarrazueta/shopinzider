import 'package:flutter/material.dart';

class OptionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OptionsPageState();
}


class OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options'),
      ),
      body: const Center(
        child: Text(
          'This is the Options page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}