import 'package:flutter/material.dart';

import '../../core/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState
    extends State<NotificationScreen> {

  final List<Map<String, dynamic>> notifications = [

    {
      "icon": Icons.add_circle,
      "title": "Pemasukan berhasil ditambahkan",
      "subtitle": "Rp 2.500.000 • Hari ini",
      "color": Colors.green,
    },

    {
      "icon": Icons.remove_circle,
      "title": "Pengeluaran berhasil ditambahkan",
      "subtitle": "Rp 150.000 • Hari ini",
      "color": Colors.red,
    },

    {
      "icon": Icons.flag,
      "title": "Limit harian hampir habis",
      "subtitle": "Sisa limit Rp100.000",
      "color": Colors.orange,
    },

    {
      "icon": Icons.notifications,
      "title": "Jangan lupa catat pengeluaran",
      "subtitle": "Kemarin pukul 19:30",
      "color": Colors.blue,
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(

        backgroundColor: AppColors.primary,

        foregroundColor: Colors.white,

        elevation: 0,

        title: const Text(

          "Notifikasi",

          style: TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(20),

        itemCount: notifications.length,

        itemBuilder: (context, index) {

          final item = notifications[index];
                    return Container(

            margin: const EdgeInsets.only(bottom: 16),

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

              contentPadding: const EdgeInsets.all(15),

              leading: CircleAvatar(

                radius: 25,

                backgroundColor:
                    item["color"].withOpacity(.15),

                child: Icon(

                  item["icon"],

                  color: item["color"],

                  size: 28,

                ),

              ),

              title: Text(

                item["title"],

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 15,

                ),

              ),

              subtitle: Padding(

                padding: const EdgeInsets.only(top: 6),

                child: Text(

                  item["subtitle"],

                  style: const TextStyle(

                    color: Colors.grey,

                    fontSize: 13,

                  ),

                ),

              ),

              trailing: const Icon(

                Icons.chevron_right,

                color: Colors.grey,

              ),

            ),

          );

        },

      ),
   );

  }

}