import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:fly_terminator/components/fly.dart';
import 'dart:math'; // for Random
import 'package:flame/gestures.dart'; // for TapDetector
import 'package:flutter/gestures.dart';

class FlyTerminator extends Game with TapDetector {
  Size? screenSize;
  double? tileSize;
  List<Fly>? flies;
  Random? rnd;

  FlyTerminator() {
    initialize();
  }

  void spawnFly() {
    double x = rnd!.nextDouble() * (screenSize!.width - tileSize!);
    double y = rnd!.nextDouble() * (screenSize!.height - tileSize!);
    flies!.add(Fly(this, x, y));
  }

  void initialize() async {
    // flies = List<Fly>(); // List constructor isnt available with null safety
    flies = List<Fly>.empty(growable: true);
    resize(await Flame.util.initialDimensions());
    rnd = Random();

    spawnFly();
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize!.width, screenSize!.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    flies!.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    flies!.forEach((Fly fly) => fly.update(t));
    flies!.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize!.width / 9; // TODO: change for web
  }

  void onTapDown(TapDownDetails tapDownDetails) {
    flies!.forEach((Fly fly) {
      if (fly.flyRect!.contains(tapDownDetails.globalPosition)) {
        fly.onTapDown();
      }
    });
    // for (int i = 0; i < flies!.length; i++) {
    //   if (flies![i].flyRect!.contains(tapDownDetails.globalPosition)) {
    //     flies![i].onTapDown();
    //   }
    // }
  }
}
