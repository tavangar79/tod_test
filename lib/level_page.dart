import 'package:flutter/material.dart';
import 'package:tod_test/components/button_icon.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            height: 208,
            color: const Color(0xffD9D9D9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonIcon(
                  background: Image.asset("assets/image/button.png").image,
                  child: Image.asset("assets/image/icon_down.png"),
                  onTap: () {
                    print("here");
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                ButtonIcon(
                  background: Image.asset("assets/image/button.png").image,
                  child: Image.asset("assets/image/icon_up.png"),
                  onTap: () {
                    print("here");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
