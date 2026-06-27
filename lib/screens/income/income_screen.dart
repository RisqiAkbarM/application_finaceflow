import 'package:flutter/material.dart';

import '../../core/colors.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {

  final nominalController = TextEditingController();

  final catatanController = TextEditingController();

  int selectedCategory = 0;

  final List<Map<String, dynamic>> categories = [

    {
      "icon": Icons.work,
      "title": "Gaji",
      "color": Colors.green,
    },

    {
      "icon": Icons.store,
      "title": "Bisnis",
      "color": Colors.blue,
    },

    {
      "icon": Icons.card_giftcard,
      "title": "Hadiah",
      "color": Colors.purple,
    },

    {
      "icon": Icons.attach_money,
      "title": "Bonus",
      "color": Colors.orange,
    },

    {
      "icon": Icons.savings,
      "title": "Investasi",
      "color": Colors.red,
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

        elevation: 0,

        backgroundColor: AppColors.primary,

        foregroundColor: Colors.white,

        title: const Text(

          "Input Pemasukan",

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

              "Nominal Pemasukan",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 16,

              ),

            ),

            const SizedBox(height: 10),

            TextField(

              controller: nominalController,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Contoh : 500000",

                prefixIcon: const Icon(

                  Icons.payments,

                  color: AppColors.primary,

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
                    "Tambahkan catatan (opsional)",

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

                            "Data pemasukan berhasil disimpan",

                          ),

                        ),

                      );

                    },

                    style: ElevatedButton.styleFrom(

                      backgroundColor:
                          AppColors.primary,

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