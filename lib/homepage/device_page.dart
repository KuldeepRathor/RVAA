import 'package:flutter/material.dart';
import 'package:rvaa/components/activity_widget.dart';
import 'package:rvaa/components/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  bool isIgnitionOn = true;
  List<User> userList = [
    User(
      name: 'Vinayak',
      phoneNumber: '+91 84259 98424',
      carName: 'Suzuki Celerio',
      carNumber: 'MH 46 AT 0001',
    ),
    User(
      name: 'Kuldeep',
      phoneNumber: '+91 84829 74719',
      carName: 'Honda Accord',
      carNumber: 'MH 46 AB 1234',
    ),
    User(
      name: 'Ananya',
      phoneNumber: '+91 77384 40579',
      carName: 'Toyota Camry',
      carNumber: 'MH 46 XY 5678',
    ),
    User(
      name: 'Aman',
      phoneNumber: '+91 99677 85923',
      carName: 'Ford Mustang',
      carNumber: 'MH 46 ZA 9876',
    ),
  ];

  User selectedUser = User(
    name: 'Vinayak',
    phoneNumber: '+91 84259 98424',
    carName: 'Suzuki Celerio',
    carNumber: 'MH 46 AT 0001',
  );

  void showUserList(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (User user in userList)
                    ListTile(
                      title: Text(
                        '${user.name}\'s Car',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedUser = user;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void launchPhoneDialScreen(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        backButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${selectedUser.name}\'s Car',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text.rich(
                TextSpan(
                  text: '${selectedUser.carNumber}  |  ',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: selectedUser.carName,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showUserList(context);
                    },
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Other Vehicles',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Container(
                    height: size.height * 0.04,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: Text(
                        'online',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Hero(
                    tag: "clock",
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isIgnitionOn = !isIgnitionOn;
                            });
                          },
                          child: Container(
                            height: 135,
                            width: 135,
                            decoration: BoxDecoration(
                              color: isIgnitionOn
                                  ? Colors.green.withOpacity(0.3)
                                  : null,
                              border: Border.all(
                                color: isIgnitionOn ? Colors.green : Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Text(
                                isIgnitionOn ? 'Ignition On' : 'Ignition Off',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      isIgnitionOn ? Colors.green : Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 135,
                          width: 135,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  child:
                                      Image.asset('assets/images/location.png'),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                const Text(
                                  'Location Activity',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    ActivityWidget(
                      onPressed: () {},
                      size: size,
                      activityName: 'Recent Activity',
                      activityIcon: const Icon(
                        Icons.history_outlined,
                        size: 35,
                      ),
                    ),
                    ActivityWidget(
                      onPressed: () {
                        launchPhoneDialScreen(selectedUser.phoneNumber);
                      },
                      size: size,
                      activityIcon: const Icon(
                        Icons.phone_outlined,
                        size: 35,
                      ),
                      activityName: 'Call Driver',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String phoneNumber;
  final String carName;
  final String carNumber;

  User({
    required this.name,
    required this.phoneNumber,
    required this.carName,
    required this.carNumber,
  });
}
