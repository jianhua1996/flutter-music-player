import 'package:flutter/material.dart';
import 'package:flutter_application_10/components/my_drawer.dart';
import 'package:get/get.dart';

import '../controller/playlist_controller.dart';
import '../model/song.dart';
import 'play_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getPlaylist = Get.put(PlaylistController());

  void selectSong(int index) {
    if (index != getPlaylist.currentIndex.value ||
        getPlaylist.isPlaying.value == false) {
      //  如果当前歌曲不是选中的歌曲或者当前歌曲没有在播放，则更新当前歌曲的索引并播放
      getPlaylist.currentIndex.value = index;
      getPlaylist.play();
    }
    Get.to(() => const PlayPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('播放列表'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: getPlaylist.playlist.length,
          itemBuilder: (context, index) {
            final Song song = getPlaylist.playlist[index];
            return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(
                  song.coverPath,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  selectSong(index);
                });
          }),
      drawer: const MyDrawer(),
    );
  }
}
