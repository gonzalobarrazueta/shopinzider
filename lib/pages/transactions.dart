import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransactionsPageState();
}


class TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: const Center(
        child: Text(
          'This is the transactions page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}