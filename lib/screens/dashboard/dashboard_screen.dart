import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../income/income_screen.dart';
import '../expense/expense_screen.dart';
import '../history/history_screen.dart';
import '../profile/profile_screen.dart';
import '../notification/notification_screen.dart';
import '../category/category_screen.dart';
import '../limit/limit_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              //----------------------------------
              // HEADER
              //----------------------------------

              Container(

                width: double.infinity,

                padding: const EdgeInsets.fromLTRB(
                  25,
                  25,
                  25,
                  35,
                ),

                decoration: const BoxDecoration(

                  color: AppColors.primary,

                  borderRadius: BorderRadius.only(

                    bottomLeft: Radius.circular(35),

                    bottomRight: Radius.circular(35),

                  ),

                ),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(

                      children: [

                        const CircleAvatar(

                          radius: 28,

                          backgroundColor: Colors.white,

                          child: Icon(

                            Icons.person,

                            color: AppColors.primary,

                            size: 30,

                          ),

                        ),

                        const SizedBox(width: 15),

                        Expanded(

                          child: Column(

                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: const [

                              Text(

                                "Selamat Datang",

                                style: TextStyle(

                                  color: Colors.white70,

                                  fontSize: 15,

                                ),

                              ),

                              SizedBox(height: 4),

                              Text(

                                "Kim Jong Un",

                                style: TextStyle(

                                  color: Colors.white,

                                  fontWeight:
                                      FontWeight.bold,

                                  fontSize: 22,

                                ),

                              ),

                            ],

                          ),

                        ),

                        IconButton(

                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const NotificationScreen(),
                              ),
                            );
                          },

                          icon: const Icon(

                            Icons.notifications,

                            color: Colors.white,

                          ),

                        ),

                      ],

                    ),

                    const SizedBox(height: 30),
                    
                    //----------------------------------
                    // CARD SALDO
                    //----------------------------------

                    Container(

                      width: double.infinity,

                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.circular(22),

                      ),

                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          const Text(

                            "Total Saldo",

                            style: TextStyle(

                              color: Colors.grey,

                              fontSize: 15,

                            ),

                          ),

                          const SizedBox(height: 8),

                          const Text(

                            "Rp 10.500.000",

                            style: TextStyle(

                              fontSize: 30,

                              fontWeight: FontWeight.bold,

                              color: AppColors.primary,

                            ),

                          ),

                          const SizedBox(height: 20),

                          Row(

                            children: [

                              Expanded(

                                child: Container(

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(

                                    color: Colors.green.shade50,

                                    borderRadius:
                                        BorderRadius.circular(15),

                                  ),

                                  child: Column(

                                    children: const [

                                      Icon(

                                        Icons.arrow_downward,

                                        color: Colors.green,

                                      ),

                                      SizedBox(height: 8),

                                      Text(

                                        "Pemasukan",

                                        style: TextStyle(

                                          fontWeight:
                                              FontWeight.bold,

                                        ),

                                      ),

                                      SizedBox(height: 5),

                                      Text(

                                        "Rp 12.000.000",

                                        style: TextStyle(

                                          color: Colors.green,

                                        ),

                                      ),

                                    ],

                                  ),

                                ),

                              ),

                              const SizedBox(width: 15),

                              Expanded(

                                child: Container(

                                  padding: const EdgeInsets.all(14),

                                  decoration: BoxDecoration(

                                    color: Colors.red.shade50,

                                    borderRadius:
                                        BorderRadius.circular(15),

                                  ),

                                  child: Column(

                                    children: const [

                                      Icon(

                                        Icons.arrow_upward,

                                        color: Colors.red,

                                      ),

                                      SizedBox(height: 8),

                                      Text(

                                        "Pengeluaran",

                                        style: TextStyle(

                                          fontWeight:
                                              FontWeight.bold,

                                        ),

                                      ),

                                      SizedBox(height: 5),

                                      Text(

                                        "Rp 1.500.000",

                                        style: TextStyle(

                                          color: Colors.red,

                                        ),

                                      ),

                                    ],

                                  ),

                                ),

                              ),

                            ],

                          ),

                        ],

                      ),

                    ),

                    const SizedBox(height: 25),
                      ], // children Header

                ), // Column Header

              ), // Container Header

                  
              //----------------------------------
              // CONTENT
              //----------------------------------

              Padding(

                padding: const EdgeInsets.all(20),

                child: Column(

                  children: [

                    //----------------------------------
                    // BATAS HARIAN
                    //----------------------------------

                    Container(

                      width: double.infinity,

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.black.withOpacity(.05),

                            blurRadius: 15,

                            offset: const Offset(0, 5),

                          ),

                        ],

                      ),

                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          const Text(

                            "Batas Pengeluaran Harian",

                            style: TextStyle(

                              fontSize: 17,

                              fontWeight: FontWeight.bold,

                            ),

                          ),

                          const SizedBox(height: 15),

                          const Text(

                            "Rp 150.000 / Rp 250.000",

                            style: TextStyle(

                              color: Colors.grey,

                            ),

                          ),

                          const SizedBox(height: 12),

                          ClipRRect(

                            borderRadius:
                                BorderRadius.circular(20),

                            child: const LinearProgressIndicator(

                              value: .60,

                              minHeight: 12,

                              backgroundColor:

                                  Color(0xffE5E7EB),

                              valueColor:

                                  AlwaysStoppedAnimation(

                                AppColors.primary,

                              ),

                            ),

                          ),

                        ],

                      ),

                    ),

                    const SizedBox(height: 28),
                    Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      "Ringkasan Kategori (Bulan Ini)",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    TextButton(
      onPressed: () {},
      child: const Text("Lihat Semua"),
    ),
  ],
),

const SizedBox(height: 15),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    _categoryItem(
      Icons.fastfood,
      "Makanan",
      "Rp 85.000",
      Colors.orange,
    ),
    _categoryItem(
      Icons.directions_bus,
      "Transportasi",
      "Rp 60.000",
      Colors.blue,
    ),
    _categoryItem(
      Icons.shopping_bag,
      "Belanja",
      "Rp 500.000",
      Colors.purple,
    ),
    _categoryItem(
      Icons.sports_esports,
      "Hiburan",
      "Rp 300.000",
      Colors.orangeAccent,
    ),
  ],
),
const SizedBox(height: 30),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      "Transaksi Terbaru",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    TextButton(
      onPressed: () {},
      child: const Text("Lihat Semua"),
    ),
  ],
),

Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Column(
    children: const [
      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.fastfood),
        ),
        title: Text("Makan Siang"),
        subtitle: Text("Hari Ini"),
        trailing: Text(
          "- Rp 25.000",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Divider(height: 1),

      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.directions_bus),
        ),
        title: Text("Transportasi"),
        subtitle: Text("Hari Ini"),
        trailing: Text(
          "- Rp 10.000",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Divider(height: 1),

      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.account_balance_wallet),
        ),
        title: Text("Gaji Bulanan"),
        subtitle: Text("Kemarin"),
        trailing: Text(
          "+ Rp 5.000.000",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 20),
          
                  ],

                ),

              ),

            ],

          ),

        ),

      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,

        selectedItemColor: AppColors.primary,

        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

       onTap: (index) {

  if (index == 0) {

    // Dashboard
    return;

  } else if (index == 1) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LimitScreen(),
      ),
    );

  } else if (index == 2) {

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(
                leading: const Icon(Icons.arrow_downward),
                title: const Text("Pemasukan"),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IncomeScreen(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.arrow_upward),
                title: const Text("Pengeluaran"),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExpenseScreen(),
                    ),
                  );
                },
              ),

            ],
          ),
        );
      },
    );

  } else if (index == 3) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HistoryScreen(),
      ),
    );

  } else if (index == 4) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      ),
    );

  }

},

        items: const [

          BottomNavigationBarItem(

            icon: Icon(Icons.dashboard),

            label: "Dashboard",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.bar_chart),

            label: "Batas",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.add_circle),

            label: "Tambah",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.history),

            label: "Riwayat",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.person),

            label: "Profil",

          ),

        ],

      ),

    );

  }

  Widget _menuItem(

    IconData icon,

    String title,

    Color color,

    VoidCallback onTap,

  ) {

    return InkWell(

      onTap: onTap,

      borderRadius: BorderRadius.circular(18),

      child: Container(

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: [

            BoxShadow(

              color: Colors.black.withOpacity(.05),

              blurRadius: 12,

              offset: const Offset(0, 4),

            ),

          ],

        ),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            CircleAvatar(

              radius: 24,

              backgroundColor: color.withOpacity(.15),

              child: Icon(

                icon,

                color: color,

                size: 28,

              ),

            ),

            const SizedBox(height: 10),

            Text(

              title,

              textAlign: TextAlign.center,

              style: const TextStyle(

                fontSize: 13,

                fontWeight: FontWeight.w600,

              ),

            ),

          ],

        ),

      ),

    );


  }
// ==============================
// CATEGORY ITEM
// ==============================

Widget _categoryItem(
  IconData icon,
  String title,
  String amount,
  Color color,
) {
  return Column(
    children: [
      CircleAvatar(
        radius: 22,
        backgroundColor: color.withOpacity(.15),
        child: Icon(
          icon,
          color: color,
        ),
      ),

      const SizedBox(height: 6),

      Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),

      Text(
        amount,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

}