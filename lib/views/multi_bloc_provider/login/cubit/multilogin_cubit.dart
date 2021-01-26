import 'package:cubitloginsample/views/multi_bloc_provider/login/cubit/multilogin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiLoginCubit extends Cubit<MultiLoginState> {
  MultiLoginCubit() : super(InitialMultiLoginState());

  void getLogin() async {
    emit(FetchMultiLoginState());
    await Future.delayed(Duration(seconds: 3));

    emit(SuccessLoginState(true, "Zayed Elfasa"));
  }
}
