import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_new_songs.dart';
import 'package:spotify/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify/service_locator.dart';

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
