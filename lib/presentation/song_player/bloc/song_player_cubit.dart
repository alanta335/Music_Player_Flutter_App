import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlaterSate> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        audioPlayer.seek(const Duration(seconds: 0));
        stopSong();
      }
    });
  }

  void updateSongPlayer() {
    emit(SongPlayerLoaded());
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailuer());
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    }
    audioPlayer.dispose();
    return super.close();
  }

  void stopSong() {
    audioPlayer.stop();
    emit(SongPlayerStopped());
  }
}
