import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0XFFA29AFE),
                  Color(0XFF8B86F9),
                  Color(0XFF7976F5),
                  Color(0XFF6162F0),
                ],
              ),
            ),
          ),
          FadeIn(
            animate: true,
            delay: const Duration(milliseconds: 1200),
            child: Image.asset(
              'assets/onboarding_logo.png',
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
