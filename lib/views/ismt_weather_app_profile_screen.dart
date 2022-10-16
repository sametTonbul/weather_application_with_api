import 'package:flutter/material.dart';

import 'ismt_weather_app_home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var tfUserEmailController = TextEditingController();
  var tfUserPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              controller: tfUserEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  size: 12,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              obscuringCharacter: '*',
              controller: tfUserPasswordController,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                ),
                prefixIcon: Icon(
                  Icons.key,
                  size: 12,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ImageIcon(
                color: Colors.green,
                size: 24,
                AssetImage('assets/register_logos/google_logo.png'),
              ),
              SizedBox(
                height: 15,
              ),
              /* facebook icon */ ImageIcon(
                color: Colors.blue,
                size: 24,
                AssetImage('assets/register_logos/facebook_logo.png'),
              ),
              SizedBox(
                height: 15,
              ),
              /* twitter icon */ ImageIcon(
                color: Colors.red,
                size: 24,
                AssetImage('assets/register_logos/twitter_logo.png'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomeScreen())),
            child: const Text(
              'Back Home Page',
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
