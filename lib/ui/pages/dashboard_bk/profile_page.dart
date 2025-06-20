import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/sign_in_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/edit_profile_page.dart';

class ProfileBKPage extends StatelessWidget {
  const ProfileBKPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 37),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/ic_kiri.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Profile Konseling',
                      style: TextStyle(
                        color: Color(0xFF00A896),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFF00A896),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFF0F8B4),
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Budi Pratama',
                    style: TextStyle(
                      color: Color(0xFFF0F8B4),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ListTile(
                    leading: Image.asset(
                      'assets/ic_edit.png',
                      width: 25,
                      height: 25,
                      color: Color(0xFFF0F8B4),
                    ),
                    title: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Color(0xFFF0F8B4)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/ic_logout.png',
                      width: 25,
                      height: 25,
                      color: Color(0xFFF0F8B4),
                    ),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(color: Color(0xFFF0F8B4)),
                    ),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
