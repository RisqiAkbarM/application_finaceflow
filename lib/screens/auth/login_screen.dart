import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../dashboard/dashboard_screen.dart';
import 'register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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

            //--------------------------------------------
            // BACKGROUND ATAS
            //--------------------------------------------

            Positioned(

              top: -140,

              right: -120,

              child: Container(

                width: 330,

                height: 330,

                decoration: BoxDecoration(

                  color: Colors.green.withOpacity(.08),

                  shape: BoxShape.circle,

                ),

              ),

            ),

            //--------------------------------------------
            // BACKGROUND BAWAH
            //--------------------------------------------

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

            //--------------------------------------------

            SingleChildScrollView(

              padding: const EdgeInsets.symmetric(

                horizontal: 28,

              ),

              child: Column(

                children: [

                  const SizedBox(height: 55),

                  //----------------------------------------
                  // LOGO
                  //----------------------------------------

                  Image.asset(

                    "assets/images/logo.png",

                    width: 240,

                  ),

                  const SizedBox(height: 40),

                  //----------------------------------------
                  // CARD LOGIN
                  //----------------------------------------

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

                          "Email",

                          style: TextStyle(

                            fontWeight: FontWeight.bold,

                            fontSize: 15,

                          ),

                        ),

                        const SizedBox(height: 10),

                        TextField(

                          controller: emailController,

                          decoration: InputDecoration(

                            hintText: "Masukkan email Anda",

                            prefixIcon: const Icon(

                              Icons.email,

                              color: AppColors.primary,

                            ),

                            filled: true,

                            fillColor: Colors.white,

                            border: OutlineInputBorder(

                              borderRadius:

                                  BorderRadius.circular(15),

                            ),

                          ),

                        ),

                        const SizedBox(height: 22),
                                                //----------------------------------------
                        // PASSWORD
                        //----------------------------------------

                        const Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            hintText: "Masukkan password Anda",

                            prefixIcon: const Icon(
                              Icons.lock_outline,
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
                                color: Colors.grey,
                              ),
                            ),

                            filled: true,
                            fillColor: Colors.white,

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        //----------------------------------------
                        // LOGIN BUTTON
                        //----------------------------------------

                        SizedBox(

                          width: double.infinity,

                          height: 55,

                          child: ElevatedButton(

                            onPressed: () async {

                            try {

                             await FirebaseAuth.instance
                          .signInWithEmailAndPassword(

                           email: emailController.text.trim(),
                           password: passwordController.text.trim(),

                          );

                           Navigator.pushReplacement(

                            context,

                            MaterialPageRoute(
                         builder: (_) => const DashboardScreen(),
                        ),

                       );

                    } on FirebaseAuthException catch (e) {

                        ScaffoldMessenger.of(context).showSnackBar(

                        SnackBar(
                      content: Text(
                      e.message ?? "Login gagal",
                     ),
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

                              "Login",

                              style: TextStyle(

                                color: Colors.white,

                                fontSize: 17,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                          ),

                        ),

                        const SizedBox(height: 18),

                        //----------------------------------------
                        // LUPA PASSWORD
                        //----------------------------------------

                        Align(

                          alignment: Alignment.centerRight,

                          child: TextButton(

                            onPressed: () {},

                            child: const Text(

                              "Lupa Password?",

                              style: TextStyle(

                                color: AppColors.primary,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                          ),

                        ),
                                                //----------------------------------------
                        // REGISTER
                        //----------------------------------------

                        const SizedBox(height: 10),

                        Row(

                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [

                            const Text(

                              "Belum punya akun?",

                              style: TextStyle(
                                fontSize: 15,
                              ),

                            ),

                            TextButton(

                              onPressed: () {

                                Navigator.push(

                                  context,

                                  MaterialPageRoute(

                                    builder: (_) =>
                                        const RegisterScreen(),

                                  ),

                                );

                              },

                              child: const Text(

                                "Daftar Sekarang",

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

    emailController.dispose();

    passwordController.dispose();

    super.dispose();

  }

}