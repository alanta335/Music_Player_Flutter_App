import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/buttons/basic_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/sigup_or_signin.dart';
import 'package:spotify/presentation/choise_mode/bloc/theme_cubit.dart';

class ChoiseModePage extends StatelessWidget {
  const ChoiseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.choiseBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.all(45),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const Spacer(),
                  const Text(
                    "Choose mode",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.dark);
                              },
                              child: ClipOval(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff30393C)
                                        .withOpacity(0.9),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: SvgPicture.asset(
                                    AppVectors.moon,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                "Dark Mode")
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.light);
                              },
                              child: ClipOval(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff30393C)
                                        .withOpacity(0.9),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: SvgPicture.asset(
                                    AppVectors.sun,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                "Light Mode")
                          ],
                        )
                      ],
                    ),
                  ),
                  BasicButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SigupOrSigInPage()));
                      },
                      title: "Continue")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
