class Song {
  String songName; // 歌曲名
  String artistName; // 歌手名
  String coverPath; // 专辑封面图路径
  String audioPath; // 音频路径

  Song(
      {required this.songName,
      required this.artistName,
      required this.coverPath,
      required this.audioPath});
}
