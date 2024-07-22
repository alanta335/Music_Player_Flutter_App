part of 'all_songs_cubit.dart';

abstract class AllSongsState {}

class AllSongsLoading extends AllSongsState {}

class AllSongsLoaded extends AllSongsState {
  final List<SongEntity> songs;

  AllSongsLoaded({required this.songs});
}

class AllSongsLoadFailuer extends AllSongsState {}
