// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rvaa/components/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            ProfileAppbar(
              pageName: "Profile",
            ),
            SizedBox(height: size.height * 0.02),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/profile.png'),
            ),
            SizedBox(height: size.height * 0.02),
            const Text(
              'Aman',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            const Text(
              '+91 88981 88981',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileAttributes(
                  size: size,
                  attributeName: 'Reward Points',
                  attributePoints: '120',
                ),
                Container(
                  height: 70,
                  width: 1,
                  color: Colors.grey,
                ),
                ProfileAttributes(
                  size: size,
                  attributeName: 'Distance',
                  attributePoints: '127',
                ),
                Container(
                  height: 70,
                  width: 1,
                  color: Colors.grey,
                ),
                ProfileAttributes(
                  size: size,
                  attributeName: 'Vehicles',
                  attributePoints: '4',
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              height: size.height * 0.4,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ProfileFields(
                    size: size,
                    fieldName: 'Profile details',
                    fieldIcon: Icons.person_outline,
                  ),
                  // Divider(
                  //   c lor: Colors.grey,
                  //   thickness: 0.2,
                  // ),
                  ProfileFields(
                    size: size,
                    fieldName: 'Location history',
                    fieldIcon: Icons.location_on_outlined,
                  ),
                  ProfileFields(
                    size: size,
                    fieldName: 'Economy',
                    fieldIcon: Icons.money_outlined,
                  ),
                  ProfileFields(
                    size: size,
                    fieldName: 'Settings',
                    fieldIcon: Icons.settings_outlined,
                  ),
                  ProfileFields(
                    size: size,
                    fieldName: 'Blogs',
                    fieldIcon: Icons.article_outlined,
                  ),
                  ProfileFields(
                    size: size,
                    fieldName: 'Help and Support',
                    fieldIcon: Icons.help_outline_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileFields extends StatelessWidget {
  final String fieldName;
  final IconData fieldIcon;
  ProfileFields({
    super.key,
    required this.size,
    required this.fieldName,
    required this.fieldIcon,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                fieldIcon,
                color: Color(0xff7D848D),
                size: 30,
              ),
              SizedBox(width: size.width * 0.05),
              Text(
                fieldName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Color(0xff7D848D),
            size: 16,
            // color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class ProfileAttributes extends StatelessWidget {
  final String attributeName;
  final String attributePoints;

  ProfileAttributes({
    Key? key,
    required this.attributeName,
    required this.size,
    required this.attributePoints,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1EBDC5D3),
            blurRadius: 16,
            offset: Offset(0, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            attributeName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            attributePoints,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
