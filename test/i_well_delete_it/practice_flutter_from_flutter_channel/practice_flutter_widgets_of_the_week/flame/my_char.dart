// import 'dart:async';

// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';

// import 'flame_game.dart';

// class MyCharacter extends SpriteComponent
//     with HasGameRef<MyGame>, CollisionCallbacks {
//   var jumHeight = 0.0;
//   var jumpVelocity = 0.0;
//   var gameWidth = 0.0;
//   var gameHeight = 0.0;
//   late ShapeHitbox hitbox;

//   @override
//   FutureOr<void> onLoad() async {
//     sprite = await gameRef.loadSprite('dash.png');
//     add(hitbox);
//   }

//   @override
//   void update(double dt) {
//     jumHeight = dt * jumpVelocity;
//   }

//   bool isInbound() {
//     gameWidth = gameRef.size.x;
//     gameHeight = gameRef.size.y;
//   }

//   @override
//   onCollisionStart(intersectionPoints, other) {
//     if (other is Enum) {
//       gameOver();
//       return;
//     }
//   }
// }
