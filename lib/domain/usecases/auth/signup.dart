import 'package:dartz/dartz.dart';
import 'package:spotify/core/config/usercases.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';

import '../../../service_locator.dart';

class SignUpUserCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthFirebaseService>().signUp(params!);
  }
}
