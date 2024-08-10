import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransactionsPageState();
}


class TransactionsPageState extends State<TransactionsPage> {
  DateTime? startDate;
  DateTime? endDate;

  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFFFFF),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        backgroundColor: const Color(0xFFFF4A4A),
        title: const Text(
          'Reporte Total',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,              
                children: [
                  SizedBox(
                    width: 130,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Hoy")
                    ),
                  ),
                  // space
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                        ),
                      ),
                      onPressed: () async {
                        await _selectStartDate(context);
                        await _selectEndDate(context);
                        // Handle date range selection
                      },
                      child: const Text('Rango de fechas'),
                    ),
                  ),
                  //Text('Start Date: ${startDate != null ? formatter.format(startDate!) : 'Not selected'}'),
                  //Text('End Date: ${endDate != null ? formatter.format(endDate!) : 'Not selected'}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}