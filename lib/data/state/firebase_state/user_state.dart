class UserState {}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccesState extends UserState {}

class UserErrState extends UserState {}

class UserLoginSuccessState extends UserState {
  final String uId;
  UserLoginSuccessState(this.uId);
}
