import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entity/song/song.dart';
import 'package:spotify/domain/usecases/song/get_all_songs.dart';
import 'package:spotify/service_locator.dart';

part 'all_songs_state.dart';

class AllSongsCubit extends Cubit<AllSongsState> {
  AllSongsCubit() : super(AllSongsLoading());

  Future<void> getAllSongs() async {
    var returnedSongs = await sl<GetAllSongsUserCase>().call();
    returnedSongs.fold(
      (l) {
        emit(AllSongsLoadFailuer());
      },
      (r) {
        emit(AllSongsLoaded(songs: r));
      },
    );
  }
}
