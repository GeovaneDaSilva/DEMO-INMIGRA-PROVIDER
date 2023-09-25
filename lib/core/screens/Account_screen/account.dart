import 'package:flutter/material.dart';
import 'package:inmigra_user/authentication/view/authentication_screen.dart';

import '../Edit_profile_screen/edit_profile.dart';
import '../Settings_screen/settings.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: Colors.pink),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: Colors.pink),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditProfileScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Edit Info',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                const Text(
                  'The Rock',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Actor & Producer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 2,
                  color: Colors.pink,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => AccountScreen(),
                            //   ),
                            // );
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.people_alt_outlined,
                                color: Colors.pink,
                                size: 28,
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Followers',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '0',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.people_alt_outlined,
                              color: Colors.pink,
                              size: 28,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Following',
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              '0',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.post_add_rounded,
                              color: Colors.pink,
                              size: 28,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Posts',
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              '3',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.dashboard_outlined,
                              color: Colors.pink,
                              size: 28,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'My Services',
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.pink,
                              size: 28,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'My Bookings',
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              '10',
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.list,
                              color: Colors.pink,
                              size: 28,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Interest',
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.login_outlined,
                                color: Colors.pink,
                                size: 28,
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Logout',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  // Add more row items here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
