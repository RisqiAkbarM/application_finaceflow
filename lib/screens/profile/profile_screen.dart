import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(

        backgroundColor: AppColors.primary,

        foregroundColor: Colors.white,

        elevation: 0,

        title: const Text(

          "Profil",

          style: TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 15),

            const CircleAvatar(

              radius: 55,

              backgroundColor: AppColors.primary,

              child: Icon(

                Icons.person,

                color: Colors.white,

                size: 60,

              ),

            ),

            const SizedBox(height: 18),

            const Text(

              "Kim jong un",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 6),

            const Text(

              "testing@email.com",

              style: TextStyle(

                color: Colors.grey,

              ),

            ),

            const SizedBox(height: 35),

            _menuTile(

              Icons.person_outline,

              "Edit Profil",

              () {},

            ),

            _menuTile(

              Icons.lock_outline,

              "Ubah Password",

              () {},

            ),

            _menuTile(

              Icons.notifications_outlined,

              "Notifikasi",

              () {},

            ),

            _menuTile(

              Icons.info_outline,

              "Tentang Aplikasi",

              () {},

            ),

            _menuTile(

              Icons.logout,

              "Keluar",

              () {

                Navigator.pushAndRemoveUntil(

                  context,

                  MaterialPageRoute(

                    builder: (_) =>
                        const LoginScreen(),

                  ),

                  (route) => false,

                );

              },

            ),

            const SizedBox(height: 30),
                      ],

        ),

      ),

    );

  }

  Widget _menuTile(

    IconData icon,

    String title,

    VoidCallback onTap,

  ) {

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

        leading: CircleAvatar(

          backgroundColor:
              AppColors.primary.withOpacity(.12),

          child: Icon(

            icon,

            color: AppColors.primary,

          ),

        ),

        title: Text(

          title,

          style: const TextStyle(

            fontWeight: FontWeight.w600,

            fontSize: 16,

          ),

        ),

        trailing: const Icon(

          Icons.chevron_right,

          color: Colors.grey,

        ),

        onTap: onTap,

      ),

    );

  }

}