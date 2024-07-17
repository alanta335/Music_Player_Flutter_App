class CreateUserReq {
  final String fullName;

  final String password;

  final String email;

  CreateUserReq(
      {required this.fullName, required this.password, required this.email});
}
