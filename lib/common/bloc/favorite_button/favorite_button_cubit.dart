import 'package:bloc/bloc.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotify/service_locator.dart';

part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void favoriteButtonUpdate(String songId) async {
    var result = await sl<AddOrRemoveFavoriteSong>().call(params: songId);
    result.fold((ifLeft) {}, (ifRight) {
      emit(FavoriteButtonUpdated(isFavorite: ifRight));
    });
  }
}
