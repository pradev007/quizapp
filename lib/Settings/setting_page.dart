import 'package:flutter/material.dart';
import 'package:quizapp/Background%20Music/background_music.dart';
import 'package:quizapp/Custom/toggle_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BackgroundMusic backgroundMusic = BackgroundMusic();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        toolbarHeight: MediaQuery.sizeOf(context).height / 8,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.grey[250],
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Notification'),
                      trailing: toggleButton(
                        Icons.notifications_none_rounded,
                        Icons.notifications_off_outlined,
                      ),
                    ),
                    // ListTile(
                    //   title: const Text('Sound'),
                    //   trailing: IconButton(
                    //       onPressed: () {
                    //         if (backgroundMusic.playingMusic() == true) {
                    //           backgroundMusic.stopMusic();
                    //         }
                    //         backgroundMusic.playingMusic();
                    //       },
                    //       icon: const Icon(Icons.volume_off_sharp)),
                    // ),
                    SoundListTile(),
                    const ListTile(
                      title: Text('Terms and Conditions'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    const ListTile(
                      title: Text('Report'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    const ListTile(
                      title: Text('Rate'),
                      trailing: Icon(
                        Icons.star_border_rounded,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10.0),
          itemCount: 1,
        ),
      ),
    );
  }
}
