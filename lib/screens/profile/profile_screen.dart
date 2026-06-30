import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../core/colors.dart';
import '../auth/login_screen.dart';
import '../notification/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
      File? _profileImage;
      final ImagePicker _picker = ImagePicker();
      Future<void> _pickImage() async {
  final XFile? image =
      await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    setState(() {
      _profileImage = File(image.path);
    });
  }
}

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

            GestureDetector(
              onTap: _pickImage,
                    child: CircleAvatar(
                    radius: 55,
                     backgroundColor: AppColors.primary,
                   backgroundImage:
                    _profileImage != null
                      ? FileImage(_profileImage!)
                     : null,
               child: _profileImage == null
                ? const Icon(
                   Icons.person,
                   color: Colors.white,
                  size: 60,
                )
        : null,
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

              () {ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                content: Text("Fitur Edit Profil segera hadir"),
                ),
               );
             },
            ),

            

           _menuTile(
  Icons.lock_outline,
  "Ubah Password",
  () {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Ubah Password"),
        content: const Text(
          "Fitur ubah password akan menggunakan Firebase Authentication.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  },
),
_menuTile(
  Icons.notifications_outlined,
  "Notifikasi",
  () {
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NotificationScreen(),
      ),
    );
  },
),

            _menuTile(

              Icons.info_outline,

              "Tentang Aplikasi",

              () {
                showAboutDialog(
      context: context,
      applicationName: "FinanceFlow",
      applicationVersion: "1.0.0",
      applicationLegalese:
          "Aplikasi manajemen keuangan pribadi untuk mencatat pemasukan, pengeluaran, dan memantau kondisi keuangan harian.",);
              },

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