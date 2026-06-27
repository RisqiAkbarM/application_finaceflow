import 'package:flutter/material.dart';

import '../../core/colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() =>
      _CategoryScreenState();
}

class _CategoryScreenState
    extends State<CategoryScreen> {

  final List<Map<String, dynamic>> categories = [

    {
      "icon": Icons.restaurant,
      "title": "Makanan",
      "total": "Rp1.250.000",
      "color": Colors.red,
    },

    {
      "icon": Icons.directions_car,
      "title": "Transport",
      "total": "Rp450.000",
      "color": Colors.orange,
    },

    {
      "icon": Icons.shopping_bag,
      "title": "Belanja",
      "total": "Rp900.000",
      "color": Colors.purple,
    },

    {
      "icon": Icons.home,
      "title": "Rumah",
      "total": "Rp700.000",
      "color": Colors.blue,
    },

    {
      "icon": Icons.school,
      "title": "Pendidikan",
      "total": "Rp500.000",
      "color": Colors.green,
    },

    {
      "icon": Icons.more_horiz,
      "title": "Lainnya",
      "total": "Rp150.000",
      "color": Colors.grey,
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

          "Ringkasan Kategori",

          style: TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(20),

        itemCount: categories.length,

        itemBuilder: (context,index){

          final item = categories[index];
                    return Container(

            margin: const EdgeInsets.only(bottom: 16),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius: BorderRadius.circular(18),

              boxShadow: [

                BoxShadow(

                  color: Colors.black.withOpacity(.05),

                  blurRadius: 12,

                  offset: const Offset(0,5),

                ),

              ],

            ),

            child: Column(

              children: [

                Row(

                  children: [

                    CircleAvatar(

                      radius: 24,

                      backgroundColor:
                          item["color"].withOpacity(.15),

                      child: Icon(

                        item["icon"],

                        color: item["color"],

                      ),

                    ),

                    const SizedBox(width: 15),

                    Expanded(

                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(

                            item["title"],

                            style: const TextStyle(

                              fontWeight:
                                  FontWeight.bold,

                              fontSize: 16,

                            ),

                          ),

                          const SizedBox(height: 5),

                          Text(

                            item["total"],

                            style: TextStyle(

                              color: item["color"],

                              fontWeight:
                                  FontWeight.bold,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ],

                ),

                const SizedBox(height: 15),

                ClipRRect(

                  borderRadius:
                      BorderRadius.circular(20),

                  child: LinearProgressIndicator(

                    value: (categories.indexOf(item) + 1) / 6,

                    minHeight: 10,

                    backgroundColor:
                        Colors.grey.shade200,

                    valueColor:

                        AlwaysStoppedAnimation(

                      item["color"],

                    ),

                  ),

                ),

              ],

            ),

          );

        },

      ),

    );

  }

}