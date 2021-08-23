import 'dart:ui';
import 'package:fly_terminator/fly_terminator_game.dart';

class Fly {
  final FlyTerminator game;

  bool isDead = false;
  bool isOffScreen = false;

  Rect? flyRect;
  Paint flyPaint = Paint();

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize!, game.tileSize!);
    flyPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(flyRect!, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect!.translate(0, game.tileSize! * 12 * t);
    }
    if (flyRect!.top > game.screenSize!.height) {
      isOffScreen = true;
    }
  }

  void onTapDown() {
    flyPaint.color = Color(0xffff4757);
    isDead = true;
    game.spawnFly();
  }
}
