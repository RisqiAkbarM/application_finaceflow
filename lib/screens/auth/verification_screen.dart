import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../dashboard/dashboard_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() =>
      _VerificationScreenState();
}

class _VerificationScreenState
    extends State<VerificationScreen> {

  final code1 = TextEditingController();
  final code2 = TextEditingController();
  final code3 = TextEditingController();
  final code4 = TextEditingController();
  final code5 = TextEditingController();
  final code6 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(

        child: Stack(

          children: [

            Positioned(

              top: -130,

              right: -120,

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

              bottom: -180,

              left: -180,

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
                    width: 210,
                  ),

                  const SizedBox(height: 40),

                  Container(

                    padding: const EdgeInsets.all(24),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(24),

                      boxShadow: [

                        BoxShadow(

                          color: Colors.black.withOpacity(.08),

                          blurRadius: 25,

                          offset: const Offset(0,8),

                        ),

                      ],

                    ),

                    child: Column(

                      children: [

                        const Icon(

                          Icons.mark_email_read,

                          color: AppColors.primary,

                          size: 80,

                        ),

                        const SizedBox(height: 20),

                        const Text(

                          "Verifikasi Email",

                          style: TextStyle(

                            fontSize: 22,

                            fontWeight: FontWeight.bold,

                          ),

                        ),

                        const SizedBox(height: 10),

                        const Text(

                          "Masukkan 6 digit kode yang telah dikirim ke email Anda.",

                          textAlign: TextAlign.center,

                        ),

                        const SizedBox(height: 30),

                        Row(

                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                          children: [

                            _otpBox(code1),

                            _otpBox(code2),

                            _otpBox(code3),

                            _otpBox(code4),

                            _otpBox(code5),

                            _otpBox(code6),

                          ],

                        ),

                        const SizedBox(height: 35),
                                                SizedBox(

                          width: double.infinity,

                          height: 55,

                          child: ElevatedButton(

                            onPressed: () {

                              Navigator.pushReplacement(

                                context,

                                MaterialPageRoute(

                                  builder: (_) =>
                                      const DashboardScreen(),

                                ),

                              );

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

                              "Verifikasi",

                              style: TextStyle(

                                color: Colors.white,

                                fontSize: 17,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                          ),

                        ),

                        const SizedBox(height: 15),

                        TextButton(

                          onPressed: () {},

                          child: const Text(

                            "Kirim Ulang Kode",

                            style: TextStyle(

                              color: AppColors.primary,

                              fontWeight: FontWeight.bold,

                            ),

                          ),

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

  Widget _otpBox(TextEditingController controller) {

    return SizedBox(

      width: 45,

      child: TextField(

        controller: controller,

        textAlign: TextAlign.center,

        keyboardType: TextInputType.number,

        maxLength: 1,

        decoration: InputDecoration(

          counterText: "",

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(12),

          ),

        ),

      ),

    );

  }

  @override
  void dispose() {

    code1.dispose();
    code2.dispose();
    code3.dispose();
    code4.dispose();
    code5.dispose();
    code6.dispose();

    super.dispose();

  }

}