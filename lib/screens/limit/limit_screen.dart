import 'package:flutter/material.dart';

import '../../core/colors.dart';

class LimitScreen extends StatefulWidget {
  const LimitScreen({super.key});

  @override
  State<LimitScreen> createState() => _LimitScreenState();
}

class _LimitScreenState extends State<LimitScreen> {

  final limitController = TextEditingController();

  String selectedPeriod = "Harian";

  final List<String> periods = [

    "Harian",

    "Mingguan",

    "Bulanan",

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(

        backgroundColor: Colors.orange,

        foregroundColor: Colors.white,

        elevation: 0,

        title: const Text(

          "Batas Pengeluaran",

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
            // NOMINAL LIMIT
            //----------------------------------

            const Text(

              "Nominal Limit",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 16,

              ),

            ),

            const SizedBox(height: 10),

            TextField(

              controller: limitController,

              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Contoh : 250000",

                prefixIcon: const Icon(

                  Icons.flag,

                  color: Colors.orange,

                ),

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(15),

                ),

              ),

            ),

            const SizedBox(height: 25),

            //----------------------------------
            // PERIODE
            //----------------------------------

            const Text(

              "Periode",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 16,

              ),

            ),

            const SizedBox(height: 12),
                        DropdownButtonFormField<String>(

              value: selectedPeriod,

              decoration: InputDecoration(

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(15),

                ),

              ),

              items: periods.map((item) {

                return DropdownMenuItem(

                  value: item,

                  child: Text(item),

                );

              }).toList(),

              onChanged: (value) {

                setState(() {

                  selectedPeriod = value!;

                });

              },

            ),

            const SizedBox(height: 30),

            //----------------------------------
            // PROGRESS LIMIT
            //----------------------------------

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [

                  BoxShadow(

                    color: Colors.black.withOpacity(.05),

                    blurRadius: 12,

                    offset: const Offset(0,5),

                  ),

                ],

              ),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(

                    "Penggunaan Saat Ini",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize: 17,

                    ),

                  ),

                  const SizedBox(height: 15),

                  const Text(

                    "Rp150.000 dari Rp250.000",

                    style: TextStyle(

                      color: Colors.grey,

                    ),

                  ),

                  const SizedBox(height: 15),

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

                        Colors.orange,

                      ),

                    ),

                  ),

                  const SizedBox(height: 12),

                  const Align(

                    alignment: Alignment.centerRight,

                    child: Text(

                      "60%",

                      style: TextStyle(

                        color: Colors.orange,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                ],

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

                            "Limit berhasil disimpan",

                          ),

                        ),

                      );

                    },

                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.orange,

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

    limitController.dispose();

    super.dispose();

  }

}