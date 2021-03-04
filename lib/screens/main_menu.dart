import 'package:flutter/material.dart';
import 'new_game.dart';
import 'how_to_play.dart';
import 'package:things_humans_google/main_menu_button.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wierd Things Humans Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonMainMenu(
              buttonName: 'new game...',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewGame();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonMainMenu(
              buttonName: 'how to play...',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HowToPlay();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
