import 'package:bloc/bloc.dart';
import 'package:spotify/domain/entity/song/song.dart';
import 'package:spotify/domain/usecases/song/get_new_songs.dart';

import '../../../service_locator.dart';

part 'new_songs_state.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsLoading());

  Future<void> getNewSongs() async {
    var returnedSongs = await sl<GetNewSongsUserCase>().call();
    returnedSongs.fold(
      (l) {
        emit(NewSongsLoadFailuer());
      },
      (r) {
        emit(NewSongsLoaded(songs: r));
      },
    );
  }
}
