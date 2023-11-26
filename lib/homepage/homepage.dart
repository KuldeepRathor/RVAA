import 'package:flutter/material.dart';
import 'package:rvaa/components/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
              color: Colors.black87,
            ),
            // SvgPicture.asset('assets/svgs/activity.svg'),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black87,
            ),
            // SvgPicture.asset('assets/svgs/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black87,
            ),
            // SvgPicture.asset('assets/svgs/profile.svg'),
            label: 'Profile',
          ),
        ],
      ),
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OOPS!! No device found.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {},
              child: SizedBox(
                width: size.width * 0.35,
                height: size.height * 0.06,
                child: const Center(
                    child: Text(
                  'Add Device',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'or',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Don\'t have a device yet?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: () {},
              child: SizedBox(
                width: size.width * 0.35,
                height: size.height * 0.06,
                child: const Center(
                    child: Text(
                  'Buy',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
