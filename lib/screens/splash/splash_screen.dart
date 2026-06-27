import 'dart:async';

import 'package:flutter/material.dart';

import '../auth/login_screen.dart';
import '../../core/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Icon(
              Icons.account_balance_wallet,
              size: 90,
              color: Colors.white,
            ),

            SizedBox(height: 25),

            Text(
              "FinanceFlow",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Atur Keuangan, Raih Masa Depan",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

          ],
        ),
      ),
    );
  }
}