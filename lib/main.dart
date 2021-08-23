import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:fly_terminator/fly_terminator_game.dart';

void main() async {
  // NO EFFECT ON WEB APP
  // Util flameUtil = Util();
  // await flameUtil.fullScreen();
  // await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  FlyTerminator game = FlyTerminator();
  runApp(game.widget);
}
