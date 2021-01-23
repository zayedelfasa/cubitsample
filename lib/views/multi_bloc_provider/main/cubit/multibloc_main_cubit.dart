import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocMainCubit extends Cubit<MultiBlocMainState> {
  MultiBlocMainCubit() : super(LoadingIsLoginState()) {
    getStatusLogin();
  }

  void getStatusLogin() async {
    await Future.delayed(Duration(seconds: 3));
    emit(IsLoginState(true));
  }

  void getDataPayload() {
    emit(PayloadLoginState("Zayed", "Elfasa"));
  }
}