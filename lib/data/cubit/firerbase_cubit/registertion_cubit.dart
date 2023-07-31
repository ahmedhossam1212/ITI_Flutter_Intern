import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter_intern/data/state/firebase_state/user_state.dart';
import 'package:iti_flutter_intern/models/user_model.dart';

class SocialRegisterCubit extends Cubit<UserState> {
  SocialRegisterCubit() : super(UserInitState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(UserLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(email: email, name: name, phone: phone, uId: value.user!.uid);
    }).catchError((error) {
      emit(UserErrState());
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(UserSuccesState());
    }).catchError((error) {
      emit(UserErrState());
    });
  }
}
