import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsPerDay extends StatelessWidget {

  final DateTime date;
  final String lote;
  final String monto;
  final String terminal;

  TransactionsPerDay({
    required this.date,
    required this.lote,
    required this.monto,
    required this.terminal
  });

  @override
  Widget build(BuildContext context) {

    final DateFormat dateFormat = DateFormat("d MMMM yyyy", "es_ES");
    String formattedDate = dateFormat.format(date);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the box
        borderRadius: BorderRadius.circular(10), // Rounded corners
        border: Border.all(
          color: Colors.grey.shade300, // Border color
          width: 1, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            // First Row with no columns
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  formattedDate, // Display the provided text
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Spacing between the rows
            // Second Row with 2 columns
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOTE: $lote',
                        style: const TextStyle(
                          fontSize: 14
                        ),
                      ),
                      Text(
                        'TERMINAL: $terminal',
                        style: const TextStyle(
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'MONTO: S/.$monto',
                        style: const TextStyle(
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}