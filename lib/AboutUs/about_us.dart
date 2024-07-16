import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent[50],
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        // width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ExpansionTile(
                    collapsedIconColor: Colors.red,
                    title: Text(
                      'Paradox Corp',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    children: [
                      Text(
                        "Welcome to Paradox Corp, where innovation meets excellence. Established in 2024, Paradox Corp is dedicated to creating cutting-edge mobile applications that transform the way you interact with technology and the world around you.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ]),
                const ExpansionTile(
                    collapsedIconColor: Colors.red,
                    title: Text(
                      'Our Story',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        // color: Colors.pink,
                        letterSpacing: 2.0,
                      ),
                    ),
                    children: [
                      Text(
                        'Paradox Corp was founded by a team of visionary entrepreneurs and tech enthusiasts in 2024. With a shared passion for leveraging technology to solve real-world problems, they embarked on a mission to develop mobile apps that are not only functional but also intuitive and user-friendly.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ]),
                const ExpansionTile(
                    collapsedIconColor: Colors.red,
                    title: Text(
                      'Our Mission',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        // color: Colors.pink,
                        letterSpacing: 2.0,
                      ),
                    ),
                    children: [
                      Text(
                        'At Paradox Corp, our mission is to design and develop mobile applications that enhance everyday life. We strive to deliver innovative solutions that are both practical and delightful, ensuring our users have a seamless and enjoyable experience.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ]),
                const ExpansionTile(
                    collapsedIconColor: Colors.red,
                    title: Text(
                      'Why choose Us?',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        // color: Colors.pink,
                        letterSpacing: 2.0,
                      ),
                    ),
                    children: [
                      Text(
                        '\u2022 ${"Innovative Solutions: Our apps are designed with the latest technologies to provide you with the best possible user experience\n "
                            '\u2022 User-Centric Design: We prioritize the needs and preferences of our users in every step of our development process\n'} \u2022 Security and Privacy: We take your security and privacy seriously, implementing robust measures to protect your data.\n\u2022 Exceptional Support: Our customer support team is available around the clock to assist you with any questions or issues.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ]),
                const ExpansionTile(
                    collapsedIconColor: Colors.red,
                    title: Text(
                      'Meet the Team',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        // color: Colors.pink,
                        letterSpacing: 2.0,
                      ),
                    ),
                    children: [
                      Text(
                        '\u2022 ${'[Name], Founder & CEO: [Brief bio, e.g., "With a strong background in technology and business \n\u2022 [Name] leads Paradox Corp with a vision for innovation and excellence."]\n\u2022[Name], CTO: [Brief bio, e.g., "An expert in mobile app development, \n\u2022[Name] ensures our apps are at the forefront of technology."][Name], Head of Design: [Brief bio, e.g., "With a keen eye for design, \n\u2022[Name] crafts user interfaces that are both beautiful and functional."]'}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ]),
                const ExpansionTile(
                  collapsedIconColor: Colors.red,
                  title: Text(
                    'Join Us',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.pink,
                      letterSpacing: 2.0,
                    ),
                  ),
                  children: [
                    Text(
                      "Join us on our journey to revolutionize the mobile app industry. Whether you're a user looking for exceptional apps or a developer with a passion for innovation, Paradox Corp is the place for you",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: IconButton(
                        onPressed: () async {
                          _lunchUrlFb();
                        },
                        icon: Image.asset(
                          'assets/logos/fb.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _lunchUrlInsta();
                      },
                      icon: Image.asset(
                        'assets/logos/insta.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/logos/twitter.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text('${"support@paradoxcorp.com"} '),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _lunchUrlFb() async {
  final Uri uri = Uri.parse('https://www.facebook.com/pradev007');
  if (!await launchUrl(uri)) {
    throw Exception('Couldnot: $uri');
  }
}

Future<void> _lunchUrlInsta() async {
  final Uri uri = Uri.parse('https://www.instagram.com/theverstand/');
  if (!await launchUrl(uri)) {
    throw Exception('Couldnot: $uri');
  }
}
