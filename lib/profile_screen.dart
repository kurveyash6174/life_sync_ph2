// profile_screen.dart

import 'package:flutter/material.dart';
import 'package:life_sync_ph2/pallete.dart';
import 'package:life_sync_ph2/profile/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _friendsCountController = TextEditingController();
  final TextEditingController _familyMembersController =
      TextEditingController();
  final TextEditingController _bestFriendsCountController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with default values
    _usernameController.text = 'Yash Kurve';
    _ageController.text = '21';
    _genderController.text = 'Male';
    _friendsCountController.text = '21';
    _familyMembersController.text = '11';
    _bestFriendsCountController.text = '2';
    _addressController.text = 'Nagpur';
    _collegeController.text = 'Priyadarshani College of Engineering, Nagpur';
    _emailController.text = 'kurveyash6174@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Pallete.mainFontColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/wizgpt.png'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProfileScreenData()), // Replace 'NewScreen' with the actual screen you want to navigate to
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.popColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  'Complete Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Example of a custom text editing field
            CustomTextField(
              controller: _usernameController,
              label: 'Username',
            ),
            CustomTextField(
              controller: _ageController,
              label: 'Age',
            ),
            CustomTextField(
              controller: _genderController,
              label: 'Gender',
            ),
            CustomTextField(
              controller: _friendsCountController,
              label: 'Friends Count',
            ),
            CustomTextField(
              controller: _familyMembersController,
              label: 'Family Members Count',
            ),
            CustomTextField(
              controller: _bestFriendsCountController,
              label: 'Best Friends Count',
            ),
            CustomTextField(
              controller: _addressController,
              label: 'Address',
            ),
            CustomTextField(
              controller: _collegeController,
              label: 'College',
            ),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.popColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  'Save Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey,
        ),
      ),
    );
  }
}
