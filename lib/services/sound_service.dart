import 'package:audioplayers/audioplayers.dart';

class SoundService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playCardDetectedSound() async {
    await _player.stop();

    await _player.play(
      AssetSource(
        'sounds/card_detected.mp3',
      ),
    );
  }

  Future<void> playSuccessSound() async {
    await _player.stop();

    await _player.play(
      AssetSource(
        'sounds/payment_success.mp3',
      ),
    );
  }

  void dispose() {
    _player.dispose();
  }
}