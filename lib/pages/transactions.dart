import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_inzider/widgets/transactions_per_day.dart';

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


  List<DateTime> _getDateRange(DateTime start, DateTime end) {
    List<DateTime> dateRange = [];
    DateTime current = start;
    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      dateRange.add(current);
      current = current.add(Duration(days: 1));
    }
    return dateRange;
  }

  @override
  Widget build(BuildContext context) {

    List<DateTime> dateRange = (startDate != null && endDate != null)
        ? _getDateRange(startDate!, endDate!)
        : [];

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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,              
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
                          backgroundColor: const WidgetStatePropertyAll(
                            Color(0xFF78E1CA)
                          )
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Hoy",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Roboto',
                          ),
                        )
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
                          backgroundColor: const WidgetStatePropertyAll(
                            Color(0xFF78E1CA)
                          )
                        ),
                        onPressed: () async {
                          await _selectStartDate(context);
                          await _selectEndDate(context);
                          // Handle date range selection
                        },
                        child: const Text(
                          'Rango de fechas',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Roboto',
                          ),
                        )
                      ),
                    )   
                  ],
                ),
              ),
              const SizedBox(                
                height: 20,
              ),
              Expanded(              
                child: (dateRange.isEmpty) 
                ? Center(
                    child: Icon(
                      Icons.insert_chart,
                      size: 80,
                      color: Colors.grey.shade200,
                    )
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      double containerWidth = constraints.maxWidth * 0.9;
                      return SingleChildScrollView(
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: dateRange.map((date) {
                              return Column(
                                children: [
                                  TransactionsPerDay(
                                    date: date,
                                    lote: 'TEST-0001',
                                    monto: '100.00',
                                    terminal: 'Terminal 1',
                                  ),
                                  const SizedBox(height: 15)
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}