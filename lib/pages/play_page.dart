import 'package:flutter/material.dart';
import 'package:flutter_application_10/components/neu_box.dart';
import 'package:get/get.dart';

import '../controller/playlist_controller.dart';
import '../utils/utils.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final getPlaylist = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('播放页'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeuBox(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Obx(
                        () => Image.asset(getPlaylist.currentSong.coverPath,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 10.0, right: 15),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  getPlaylist.currentSong.songName,
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(getPlaylist.currentSong.artistName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                          const Icon(Icons.favorite_sharp)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 25, 28, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                          durationToMMSS(getPlaylist.currentPosition.value))),
                      const Icon(Icons.shuffle_sharp),
                      const Icon(Icons.repeat_sharp),
                      Obx(() => Text(
                          durationToMMSS(getPlaylist.totalDuration.value))),
                    ],
                  ),
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 0),
                    ),
                    child: Obx(() => Slider(
                          value: getPlaylist.currentPositionInSec,
                          min: 0,
                          max: getPlaylist.totalDurationInSec,
                          onChanged: (value) {
                            getPlaylist.currentPosition.value = Duration(
                              seconds: value.toInt(),
                            );
                          },
                          onChangeEnd: (value) {
                            getPlaylist.seek(Duration(seconds: value.toInt()));
                          },
                        ))),
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 30),
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                              onTap: getPlaylist.previous,
                              child: const NeuBox(
                                  child: Icon(Icons.skip_previous_sharp)))),
                      const SizedBox(width: 20),
                      Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: getPlaylist.pauseOrResume,
                            child: NeuBox(
                                child: Obx(() => Icon(
                                    getPlaylist.isPlaying.value
                                        ? Icons.pause_sharp
                                        : Icons.play_arrow_sharp))),
                          )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: GestureDetector(
                              onTap: getPlaylist.next,
                              child: const NeuBox(
                                  child: Icon(Icons.skip_next_sharp)))),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
