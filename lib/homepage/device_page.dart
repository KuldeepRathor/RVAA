import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rvaa/components/activity_widget.dart';

import 'package:rvaa/components/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  bool isIgnitionOn = true;
  List<String> userList = [
    'Vinayak',
    'Kuldeep',
    'Ananya',
    'Aman',
  ];
  String selectedUser = 'Vinayak\'s Car';

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
                  for (String user in userList)
                    ListTile(
                      title: Text('$user\'s Car'),
                      onTap: () {
                        setState(() {
                          selectedUser = user;
                        });
                        Navigator.pop(context);
                      },
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
                '$selectedUser\'s Car',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Text.rich(
                TextSpan(
                  text: 'MH 46 AT 0001  |  ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Suzuki Celerio',
                      style: TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w600,
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
                        // color: Colors.grey[300],
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
                      // color: Colors.grey[300],
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
                  SizedBox(
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
                              // color: Colors.grey[300],
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
                                  // height: size.height * 0.1,
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
                        launchPhoneDialScreen('8482974719');
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
