import 'package:flutter/material.dart';

import '../../core/colors.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();
}

class _HistoryScreenState
    extends State<HistoryScreen> {

  final List<Map<String, dynamic>> transactions = [

    {
      "title": "Gaji Bulanan",
      "date": "26 Juni 2026",
      "amount": "+ Rp5.000.000",
      "income": true,
    },

    {
      "title": "Belanja",
      "date": "25 Juni 2026",
      "amount": "- Rp350.000",
      "income": false,
    },

    {
      "title": "Transport",
      "date": "25 Juni 2026",
      "amount": "- Rp50.000",
      "income": false,
    },

    {
      "title": "Bonus",
      "date": "24 Juni 2026",
      "amount": "+ Rp1.000.000",
      "income": true,
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(

        backgroundColor: AppColors.primary,

        foregroundColor: Colors.white,

        title: const Text(

          "Riwayat Transaksi",

          style: TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(20),

        itemCount: transactions.length,

        itemBuilder: (context,index){

          final item = transactions[index];
                    return Container(

            margin: const EdgeInsets.only(bottom: 15),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius: BorderRadius.circular(18),

              boxShadow: [

                BoxShadow(

                  color: Colors.black.withOpacity(.05),

                  blurRadius: 12,

                  offset: const Offset(0, 5),

                ),

              ],

            ),

            child: ListTile(

              contentPadding: const EdgeInsets.all(16),

              leading: CircleAvatar(

                radius: 24,

                backgroundColor: item["income"]
                    ? Colors.green.withOpacity(.15)
                    : Colors.red.withOpacity(.15),

                child: Icon(

                  item["income"]
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,

                  color: item["income"]
                      ? Colors.green
                      : Colors.red,

                ),

              ),

              title: Text(

                item["title"],

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 16,

                ),

              ),

              subtitle: Padding(

                padding: const EdgeInsets.only(top: 5),

                child: Text(

                  item["date"],

                  style: const TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ),

              trailing: Text(

                item["amount"],

                style: TextStyle(

                  color: item["income"]
                      ? Colors.green
                      : Colors.red,

                  fontWeight: FontWeight.bold,

                  fontSize: 15,

                ),

              ),

            ),

          );

        },

      ),
     );

  }

}