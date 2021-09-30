// import 'package:audio_service/audio_service.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:get/get.dart';

// class AudioPlayerTask extends BackgroundAudioTask {
//   final _player = AudioPlayer(); // e.g. just_audio

//   // Implement callbacks here. e.g. onStart, onStop, onPlay, onPause
//   @override
//   Future<void> onStart(Map<String, dynamic>? params) {
//     print(params);
//     return super.onStart(params);
//   }
// }

// class AudioCtl extends GetxController {

//   void _entrypoint() => AudioServiceBackground.run(() => AudioPlayerTask());

//   @override
//   void onInit() {
//     AudioService.start(backgroundTaskEntrypoint: _entrypoint);
//     super.onInit();
//   }
//   @override
//   void onReady() {
//     onReady();
//   }
// }
