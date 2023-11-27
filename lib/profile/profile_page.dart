import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rvaa/components/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          ProfileAppbar(
            pageName: "Profile",
          ),
          SizedBox(height: size.height * 0.02),
          const CircleAvatar(
            radius: 50,
            // backgroundColor: Color(0xff),
            // backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Aman',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
