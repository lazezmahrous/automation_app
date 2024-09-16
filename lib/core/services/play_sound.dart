import 'package:audioplayers/audioplayers.dart';

class PlaySound {
  static AudioPlayer? player;

  static void play_sound({required String soundSource}) async {
    if (player != null) {
      await player!.stop();
    }
    player = AudioPlayer();
    await player!.play((AssetSource(soundSource)));
  }

  static void stop_sound() async {
    if (player != null) {
      await player!.stop();
      player = null;
    }
  }

  static Future<void> rewind_sound({int seconds = 10}) async {
    if (player != null) {
      Duration? currentPosition = await player!.getCurrentPosition();
      if (currentPosition != null) {
        Duration newPosition = currentPosition - Duration(seconds: seconds);
        await player!.seek(newPosition);
      }
    }
  }

  static Future<void> fast_forward_sound({int seconds = 10}) async {
    if (player != null) {
      Duration? currentPosition = await player!.getCurrentPosition();
      if (currentPosition != null) {
        Duration newPosition = currentPosition + Duration(seconds: seconds);
        await player!.seek(newPosition);
      }
    }
  }
}
