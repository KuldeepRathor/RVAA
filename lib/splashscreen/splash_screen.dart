import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.45,
          ),
          Hero(
            tag: "rvaa",
            child: SvgPicture.asset('assets/svgs/rvaa_logo.svg'),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Remote Vehicle Authentication & Access',
            style: TextStyle(
              fontSize: 14,
              // fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.3,
          ),
          const Column(
            children: [
              Text(
                'Project by',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'VAAK',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          )
        ],
      ),
    ));
  }
}
