import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:tod_test/components/button_icon.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  Artboard? _riveArtboard;
  SMIInput<double>? _levelInput;

  var level = 0.0;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/tab_3.riv').then(
      (data) async {
        final file = RiveFile.import(data);

        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'Tab');
        if (controller != null) {
          artboard.addController(controller);
          _levelInput = controller.findInput('level');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff808080),
      body: Column(
        children: [
          Expanded(
            child: _riveArtboard == null
                ? const SizedBox()
                : Center(
                    child: SizedBox(
                      height: 172,
                      width: 200,
                      child: Rive(
                        artboard: _riveArtboard!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          Container(
            height: 120,
            color: const Color(0xffD9D9D9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonIcon(
                  background: Image.asset("assets/images/button.png").image,
                  padding: const EdgeInsets.only(top: 12, bottom: 20),
                  size: const Size(120, 70),
                  onTap: () {
                    if (level > 0) _levelInput?.value = --level;
                  },
                  child: Image.asset(
                    "assets/images/icon_down.png",
                    fit: BoxFit.contain,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ButtonIcon(
                  background: Image.asset("assets/images/button.png").image,
                  padding: const EdgeInsets.only(top: 12, bottom: 20),
                  size: const Size(120, 70),
                  onTap: () {
                    if (level < 11) _levelInput?.value = ++level;
                  },
                  child: Image.asset(
                    "assets/images/icon_up.png",
                    fit: BoxFit.contain,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
