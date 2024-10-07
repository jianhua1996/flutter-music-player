import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_10/model/song.dart';
import 'package:get/get.dart';

class PlaylistController extends GetxController {
  PlaylistController() {
    audioPlayerEventInit();
  }

  final playlist = <Song>[
    Song(
        songName: "周杰伦-最伟大的作品",
        artistName: "周杰伦",
        audioPath: 'assets/audio/周杰伦-最伟大的作品.mp3',
        coverPath: 'assets/images/周杰伦-最伟大的作品.jpg'),
    Song(
        songName: "周杰伦-园游会",
        artistName: "周杰伦",
        audioPath: 'assets/audio/周杰伦-园游会.mp3',
        coverPath: 'assets/images/周杰伦-园游会.jpg'),
    Song(
        songName: "周杰伦-威廉古堡",
        artistName: "周杰伦",
        audioPath: 'assets/audio/周杰伦-威廉古堡.mp3',
        coverPath: 'assets/images/周杰伦-威廉古堡.jpg'),
  ];

  var currentIndex = 0.obs;

  Song get currentSong => playlist[currentIndex.value];

  late final AudioPlayer _audioPlayer;

  var currentPosition = Duration.zero.obs;
  double get currentPositionInSec => currentPosition.value.inSeconds.toDouble();
  var totalDuration = Duration.zero.obs;
  double get totalDurationInSec => totalDuration.value.inSeconds.toDouble();

  var isPlaying = false.obs;

  audioPlayerEventInit() {
    AudioCache.instance = AudioCache(prefix: '');
    _audioPlayer = AudioPlayer();
    _audioPlayer.onDurationChanged.listen((duration) {
      totalDuration.value = duration;
    });

    _audioPlayer.onPositionChanged.listen((position) {
      if (position.inSeconds.toDouble() < totalDurationInSec) {
        currentPosition.value = position;
        // print(currentPositionInSec);
      }
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      next();
    });
  }

  Future<void> play() async {
    await _audioPlayer.stop(); // 停止当前播放的
    final playPath = currentSong.audioPath;
    await _audioPlayer.play(AssetSource(playPath)); // 开始新的播放
    isPlaying.value = true;
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    isPlaying.value = false;
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
    isPlaying.value = true;
  }

  Future<void> pauseOrResume() async {
    if (isPlaying.value) {
      await pause();
    } else {
      await resume();
    }
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  Future<void> next() async {
    if (currentIndex.value < playlist.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
    await play();
  }

  Future<void> previous() async {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    } else {
      currentIndex.value = playlist.length - 1;
    }
    await play();
  }
}
