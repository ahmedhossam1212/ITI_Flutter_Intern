import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = "";
  String password = "";

  Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('email') ?? " nullable email ";
    password = sharedPreferences.getString('password') ?? "nullable password";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // CircleAvatar(
            //   backgroundImage: NetworkImage(""),
            //   radius: 50,
            // ),
            const SizedBox(
              height: 20,
            ),
            Text("Email: $email"),
            const SizedBox(
              height: 20,
            ),
            Text("Password: $password"),
          ]),
        ),
      ),
    );
  }
}
