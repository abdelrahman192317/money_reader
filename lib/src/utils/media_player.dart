

import 'package:just_audio/just_audio.dart';

class MediaPlayer {
  /// An AudioPlayer Widget that can be reused for different components
  ///
  /// To add more features for a component, inherit and override this class
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future playAudio(String path) async {
    // stop currently playing audios, if any
    await stopAudio();
    // play the audio from the given path
    await _audioPlayer.setAudioSource(AudioSource.asset(path))
        .then((value) => _audioPlayer.play());
  }

  static stopAudio() {
    // stop a currently playing audio
    _audioPlayer.stop();
  }
}
