import 'package:cubitloginsample/views/fluro/config/app_router.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_state.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/mbp_routes/routes.main.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MultiBlocMainCubit extends Cubit<MultiBlocMainState> {
  MultiBlocMainCubit() : super(LoadingIsLoginState()) {
    getStatusLogin();

    AppRouter appRouter = AppRouter(
        routes: RouteMainMultiBloc.routes,
        notFoundHandler: RouteMainMultiBloc.routeNotFoundHandler);

    appRouter.setupRoutes();
  }

  void getStatusLogin() async {
    await Future.delayed(Duration(seconds: 3));
    emit(IsLoginState(false));
  }

  void getDataPayload() {
    emit(PayloadLoginState("Zayed", "Elfasa"));
  }

  FluroRouter appRouter() {
    return AppRouter.router;
  }

  appRouterGenerator() {
    return AppRouter.router.generator;
  }
}

class HydraMainCubit extends HydratedCubit<MultiBlocMainState> {
  HydraMainCubit(MultiBlocMainState state) : super(LoadingIsLoginState());

  @override
  MultiBlocMainState fromJson(Map<String, dynamic> json) {
    return json['login'] as MultiBlocMainState;
  }

  @override
  Map<String, dynamic> toJson(MultiBlocMainState state) {
    return {'login': state};
  }
}
