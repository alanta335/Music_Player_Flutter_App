import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entity/song/song.dart';
import 'package:spotify/home/pages/bloc/new_songs_cubit.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongsCubit()..getNewSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewSongsCubit, NewSongsState>(
            builder: (context, state) {
              if (state is NewSongsLoaded) {
                return songs(state.songs);
              }
              if (state is NewSongsLoading) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              return Container();
            },
          )),
    );
  }

  Widget songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(songs[index].coverUrl))),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: songs.length,
    );
  }
}
