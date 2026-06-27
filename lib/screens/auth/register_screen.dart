import 'package:flutter/material.dart';

import '../../core/colors.dart';
import 'verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(

        child: Stack(

          children: [

            //------------------------------------
            // BACKGROUND
            //------------------------------------

            Positioned(
              top: -120,
              right: -130,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.08),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              bottom: -170,
              left: -170,
              child: Container(
                width: 340,
                height: 340,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.08),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            SingleChildScrollView(

              padding: const EdgeInsets.symmetric(
                horizontal: 28,
              ),

              child: Column(

                children: [

                  const SizedBox(height: 40),

                  Image.asset(
                    "assets/images/logo.png",
                    width: 220,
                  ),

                  const SizedBox(height: 35),

                  Container(

                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(24),

                      boxShadow: [

                        BoxShadow(
                          color: Colors.black.withOpacity(.08),
                          blurRadius: 25,
                          offset: const Offset(0,8),
                        ),

                      ],

                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(

                          controller: namaController,

                          decoration: InputDecoration(

                            hintText: "Masukkan nama lengkap",

                            prefixIcon: const Icon(
                              Icons.person,
                              color: AppColors.primary,
                            ),

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                          ),

                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(

                          controller: emailController,

                          decoration: InputDecoration(

                            hintText: "Masukkan email",

                            prefixIcon: const Icon(
                              Icons.email,
                              color: AppColors.primary,
                            ),

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                          ),

                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),
                                                TextField(

                          controller: passwordController,

                          obscureText: obscurePassword,

                          decoration: InputDecoration(

                            hintText: "Masukkan password",

                            prefixIcon: const Icon(
                              Icons.lock,
                              color: AppColors.primary,
                            ),

                            suffixIcon: IconButton(

                              onPressed: () {

                                setState(() {

                                  obscurePassword =
                                      !obscurePassword;

                                });

                              },

                              icon: Icon(

                                obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,

                              ),

                            ),

                            border: OutlineInputBorder(

                              borderRadius:
                                  BorderRadius.circular(15),

                            ),

                          ),

                        ),

                        const SizedBox(height: 30),

                        SizedBox(

                          width: double.infinity,

                          height: 55,

                          child: ElevatedButton(

                            onPressed: () async {

                            try {

                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                             email: emailController.text.trim(),
                             password: passwordController.text.trim(),
                            );

                            Navigator.push(
                             context,
                             MaterialPageRoute(
                              builder: (_) => const VerificationScreen(),
                             ),
                           );

                          } on FirebaseAuthException catch (e) {

                            ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: Text(e.message ?? "Registrasi gagal"),
                             ),
                          );

                        }

                      },

                            style: ElevatedButton.styleFrom(

                              backgroundColor:
                                  AppColors.primary,

                              shape: RoundedRectangleBorder(

                                borderRadius:
                                    BorderRadius.circular(15),

                              ),

                            ),

                            child: const Text(

                              "Daftar",

                              style: TextStyle(

                                color: Colors.white,

                                fontWeight: FontWeight.bold,

                                fontSize: 17,

                              ),

                            ),

                          ),

                        ),

                        const SizedBox(height: 18),

                        Row(

                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [

                            const Text(

                              "Sudah punya akun?",

                            ),

                            TextButton(

                              onPressed: () {

                                Navigator.pop(context);

                              },

                              child: const Text(

                                "Login",

                                style: TextStyle(

                                  color: AppColors.primary,

                                  fontWeight: FontWeight.bold,

                                ),

                              ),

                            ),

                          ],

                        ),

                      ],

                    ),

                  ),

                  const SizedBox(height: 40),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

  @override
  void dispose() {

    namaController.dispose();

    emailController.dispose();

    passwordController.dispose();

    super.dispose();

  }

}