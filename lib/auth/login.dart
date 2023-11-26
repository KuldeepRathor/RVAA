// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rvaa/components/appbar.dart';
import 'package:rvaa/components/text_field.dart';
import 'package:rvaa/homepage/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthAppbar(
                pageName: 'Sign in',
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              const TextfieldsWidget(
                fieldName: 'Phone Number',
                keyboardType: TextInputType.phone,
                iconName: Icon(Icons.phone_outlined),
                isObscure: false,
              ),
              const TextfieldsWidget(
                keyboardType: TextInputType.number,
                fieldName: 'Vehicle ID',
                iconName: Icon(Icons.car_rental),
                isObscure: false,
              ),
              const TextfieldsWidget(
                fieldName: 'Enter Password',
                isObscure: true,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff1773B6),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                width: size.width * 0.8,
                height: size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: 'not a user yet? ',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1773B6),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.28,
              ),
              // Spacer(),
              Hero(
                tag: 'rvaa',
                child: SvgPicture.asset(
                  'assets/svgs/rvaa_logo.svg',
                  height: size.height * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
