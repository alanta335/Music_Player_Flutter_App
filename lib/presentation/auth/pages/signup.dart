import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/buttons/basic_button.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/root/pages/root.dart';

import '../../../service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const RegisterText(),
            const SizedBox(height: 30),
            const TopText(),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: 'Full name'),
              controller: _fullName,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: 'Email'),
              controller: _email,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: _password,
            ),
            const SizedBox(
              height: 30,
            ),
            BasicButton(
                onPressed: () async {
                  var result = await sl<SignUpUserCase>().call(
                    params: CreateUserReq(
                        fullName: _fullName.text,
                        password: _password.text,
                        email: _email.text),
                  );
                  result.fold((ifLeft) {
                    var snakbar = SnackBar(content: Text(ifLeft));
                    ScaffoldMessenger.of(context).showSnackBar(snakbar);
                  }, (ifRight) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                        (route) => false);
                  });
                },
                title: "Create Account"),
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
            'Do you have an account?',
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
                  builder: (BuildContext context) => const SignInPage(),
                ),
              );
            },
            child: const Text(
              'Sign in',
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

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Register",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }
}
