import 'package:dartz/dartz.dart';
import 'package:spotify/core/config/usercases.dart';
import 'package:spotify/data/models/auth/sigin_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';

import '../../../service_locator.dart';

class SignInUserCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthFirebaseService>().signIn(params!);
  }
}
