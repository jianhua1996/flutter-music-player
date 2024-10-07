String durationToMMSS(Duration duration) {
  String formattedMin = duration.inMinutes.toString().padLeft(2, '0');
  String formattedSec =
      duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$formattedMin:$formattedSec';
}
