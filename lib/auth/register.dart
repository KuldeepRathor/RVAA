import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rvaa/auth/login.dart';

import 'package:rvaa/components/appbar.dart';
import 'package:rvaa/components/text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Hero(
        tag: 'rvaa',
        child: Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: SvgPicture.asset(
            'assets/svgs/rvaa_logo.svg',
            height: size.height * 0.05,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthAppbar(
                pageName: 'Sign up',
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              const TextfieldsWidget(
                fieldName: 'Name',
                iconName: Icon(
                  Icons.person_3_outlined,
                ),
                isObscure: false,
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
              const TextfieldsWidget(
                fieldName: 'Confirm Password',
                isObscure: true,
              ),
              // const Padding(
              //   padding: EdgeInsets.only(right: 40),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text(
              //         'forgot password',
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: Color(0xff1773B6),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                width: size.width * 0.8,
                height: size.height * 0.07,
                child: Hero(
                  tag: "signup",
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 18,
                      ),
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
                  text: 'Already a user??   ',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: const TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xff1773B6),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Replace this with the action you want to perform on tap
                          debugPrint('Sign in text tapped!');
                          // For navigation example:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.4,
              )
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
