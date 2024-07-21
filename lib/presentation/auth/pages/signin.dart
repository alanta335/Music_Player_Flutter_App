import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/buttons/basic_button.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/sigin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/home/pages/home.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

import '../../../service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomText(),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 40,
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SignInText(),
            const SizedBox(height: 30),
            const TopText(),
            const SizedBox(height: 20),
            TextField(
              controller: _email,
              decoration:
                  const InputDecoration(hintText: 'Enter username or email'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _password,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 30,
            ),
            BasicButton(
                onPressed: () async {
                  var result = await sl<SignInUserCase>().call(
                    params: SigninUserReq(
                      email: _email.text,
                      password: _password.text,
                    ),
                  );
                  result.fold((ifLeft) {
                    var snackBar = SnackBar(
                        content: Text(ifLeft),
                        behavior: SnackBarBehavior.floating);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, (ifRight) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (root) => false);
                  });
                },
                title: "Sign In"),
          ],
        ),
      ),
    );
  }
}

class TopText extends StatelessWidget {
  const TopText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "If you need any support",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "click here",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'not a member ?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignUpPage(),
                ),
              );
            },
            child: const Text(
              'register now',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Sign in",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }
}
