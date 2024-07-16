import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

Widget toggleButton(IconData i1, IconData i2) {
  return ToggleSwitch(
    minHeight: 30,
    minWidth: 40,
    activeFgColor: Colors.white,
    inactiveBgColor: Colors.black,
    inactiveFgColor: Colors.black,
    iconSize: 32,
    animate: true,
    animationDuration: 300,
    icons: [i1, i2],
    activeBgColor: const [Colors.blue],
    borderColor: const [Colors.grey],
    borderWidth: 1,
    
  );
}
