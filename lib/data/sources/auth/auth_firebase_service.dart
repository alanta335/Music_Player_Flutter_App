import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/sigin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);

  Future<Either> signIn(SigninUserReq siginUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq siginUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: siginUserReq.email, password: siginUserReq.password);
      return const Right('SignIn was successfull');
    } on FirebaseException catch (ex) {
      return Left(ex.code);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      FirebaseFirestore.instance.collection('Users').add({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });
      return const Right('SignUp was successfull');
    } on FirebaseException catch (ex) {
      return Left(ex.code);
    }
  }
}
