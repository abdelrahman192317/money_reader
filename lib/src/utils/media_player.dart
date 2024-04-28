import 'package:just_audio/just_audio.dart';

String audioFile = "assets/cash_recognition/audio/";

class MediaPlayer {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future playAudio(String name) async {
    await stopAudio();
    //if(name.split(' ')[0] == 'new')name = name.split(' ')[1];
    _audioPlayer.setAudioSource(AudioSource.asset('$audioFile$name.mp3'))
        .then((value) => _audioPlayer.play());
  }

  static stopAudio() => _audioPlayer.stop();
}
