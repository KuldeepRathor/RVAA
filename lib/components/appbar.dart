// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rvaa/profile/profile_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.backButton = false});
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Welcome, Aman',
        style: TextStyle(
          color: Color(0xFFD9D9D9),
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
      backgroundColor: Colors.black,
      automaticallyImplyLeading: backButton,
      actions: [
        // SvgPicture.asset('assets/svgs/help_and_support.svg'),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(
              Icons.headphones_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ignore: must_be_immutable
class AuthAppbar extends StatelessWidget {
  String pageName;
  AuthAppbar({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10),
          Text(
            pageName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: const Color(0xffD9D9D9),
            child: IconButton(
              icon: const Icon(
                Icons.headphones_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class ProfileAppbar extends StatelessWidget {
  String pageName;
  ProfileAppbar({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Text(
            pageName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: const Color(0xffF7F7F9),
            child: IconButton(
              icon: const Icon(
                Icons.mode_edit_outline_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
