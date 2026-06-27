import 'package:flutter/material.dart';

import '../../core/colors.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {

  final nominalController = TextEditingController();

  final catatanController = TextEditingController();

  int selectedCategory = 0;

  final List<Map<String, dynamic>> categories = [

    {
      "icon": Icons.restaurant,
      "title": "Makanan",
      "color": Colors.red,
    },

    {
      "icon": Icons.directions_car,
      "title": "Transport",
      "color": Colors.orange,
    },

    {
      "icon": Icons.shopping_bag,
      "title": "Belanja",
      "color": Colors.purple,
    },

    {
      "icon": Icons.home,
      "title": "Rumah",
      "color": Colors.blue,
    },

    {
      "icon": Icons.school,
      "title": "Pendidikan",
      "color": Colors.green,
    },

    {
      "icon": Icons.more_horiz,
      "title": "Lainnya",
      "color": Colors.grey,
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(

        backgroundColor: Colors.red,

        foregroundColor: Colors.white,

        elevation: 0,

        title: const Text(

          "Input Pengeluaran",

          style: TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            //----------------------------------
            // NOMINAL
            //----------------------------------

            const Text(

              "Nominal Pengeluaran",

              style: TextStyle(

                fontSize: 16,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 10),

            TextField(

              controller: nominalController,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Contoh : 150000",

                prefixIcon: const Icon(

                  Icons.payments,

                  color: Colors.red,

                ),

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(15),

                ),

              ),

            ),

            const SizedBox(height: 25),

            //----------------------------------
            // KATEGORI
            //----------------------------------

            const Text(

              "Kategori",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 16,

              ),

            ),

            const SizedBox(height: 15),
                        GridView.builder(

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: categories.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 3,

                crossAxisSpacing: 15,

                mainAxisSpacing: 15,

                childAspectRatio: .95,

              ),

              itemBuilder: (context, index) {

                final item = categories[index];

                final bool isSelected =
                    selectedCategory == index;

                return GestureDetector(

                  onTap: () {

                    setState(() {

                      selectedCategory = index;

                    });

                  },

                  child: AnimatedContainer(

                    duration:
                        const Duration(milliseconds: 250),

                    decoration: BoxDecoration(

                      color: isSelected
                          ? item["color"].withOpacity(.15)
                          : Colors.white,

                      borderRadius:
                          BorderRadius.circular(18),

                      border: Border.all(

                        color: isSelected
                            ? item["color"]
                            : Colors.grey.shade300,

                        width: 2,

                      ),

                      boxShadow: [

                        BoxShadow(

                          color: Colors.black.withOpacity(.04),

                          blurRadius: 10,

                          offset: const Offset(0, 5),

                        ),

                      ],

                    ),

                    child: Column(

                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        CircleAvatar(

                          radius: 24,

                          backgroundColor:
                              item["color"].withOpacity(.15),

                          child: Icon(

                            item["icon"],

                            color: item["color"],

                            size: 28,

                          ),

                        ),

                        const SizedBox(height: 10),

                        Text(

                          item["title"],

                          style: const TextStyle(

                            fontWeight: FontWeight.w600,

                          ),

                        ),

                      ],

                    ),

                  ),

                );

              },

            ),

            const SizedBox(height: 30),

            //----------------------------------
            // CATATAN
            //----------------------------------

            const Text(

              "Catatan",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 16,

              ),

            ),

            const SizedBox(height: 10),

            TextField(

              controller: catatanController,

              maxLines: 4,

              decoration: InputDecoration(

                hintText:
                    "Tambahkan catatan pengeluaran",

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(15),

                ),

              ),

            ),

            const SizedBox(height: 35),
                        Row(

              children: [

                Expanded(

                  child: OutlinedButton(

                    onPressed: () {

                      Navigator.pop(context);

                    },

                    style: OutlinedButton.styleFrom(

                      minimumSize: const Size(
                        double.infinity,
                        55,
                      ),

                      shape: RoundedRectangleBorder(

                        borderRadius:
                            BorderRadius.circular(15),

                      ),

                    ),

                    child: const Text(

                      "Batal",

                      style: TextStyle(

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                ),

                const SizedBox(width: 15),

                Expanded(

                  child: ElevatedButton(

                    onPressed: () {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(

                          content: Text(

                            "Data pengeluaran berhasil disimpan",

                          ),

                        ),

                      );

                    },

                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.red,

                      minimumSize: const Size(
                        double.infinity,
                        55,
                      ),

                      shape: RoundedRectangleBorder(

                        borderRadius:
                            BorderRadius.circular(15),

                      ),

                    ),

                    child: const Text(

                      "Simpan",

                      style: TextStyle(

                        color: Colors.white,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                ),

              ],

            ),

            const SizedBox(height: 30),

          ],

        ),

      ),

    );

  }

  @override
  void dispose() {

    nominalController.dispose();

    catatanController.dispose();

    super.dispose();

  }

}