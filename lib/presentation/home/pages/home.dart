import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/home/pages/widgets/all_songs.dart';
import 'package:spotify/presentation/home/pages/widgets/new_songs.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBackButton: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 40,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(controller: _tabController, children: [
                const NewSongs(),
                Container(),
                Container(),
                Container(),
              ]),
            ),
            const AllSongs(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 188,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(AppVectors.homeArtist)),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Image.asset(AppImages.homeArtist),
                )),
          ],
        ),
      ),
    );
  }

  Widget tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      child: TabBar(
          isScrollable: true,
          labelColor: context.isDarkMode ? Colors.white : Colors.black,
          controller: _tabController,
          indicatorColor: AppColors.primary,
          tabs: const [
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              'Videos',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              'Artist',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              'Podcast',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ]),
    );
  }
}
