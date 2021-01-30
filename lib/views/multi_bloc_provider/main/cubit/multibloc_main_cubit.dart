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
        notFoundHandler: RouteMainMultiBloc.routeNotFoundHandler
    );

    appRouter.setupRoutes();
  }

  void getStatusLogin() async {
    await Future.delayed(Duration(seconds: 3));
    emit(IsLoginState(false, "zayed", "elfasa"));
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

class HydratedMainCubit extends HydratedCubit<MultiBlocMainState> {
  HydratedMainCubit() : super(LoadingIsLoginState()) {
    AppRouter appRouter = AppRouter(
        routes: RouteMainMultiBloc.routes,
        notFoundHandler: RouteMainMultiBloc.routeNotFoundHandler
    );

    appRouter.setupRoutes();
  }

  void getStatusLogin() async {
    await Future.delayed(Duration(seconds: 3));
    emit(IsLoginState(false, "zayed", "elfasa"));
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

  @override
  MultiBlocMainState fromJson(Map<String, dynamic> json) {
    return json['login'] as MultiBlocMainState;
  }

  @override
  Map<String, dynamic> toJson(MultiBlocMainState state) {
    return {'login': state};
  }
}

class HydraLogin extends HydratedCubit<String> {
  
  HydraLogin() : super("");

  getIdLogin(String text) {
    emit("1234567890");
  }

  @override
  String fromJson(Map<String, dynamic> json) {
    return json['idlogin'] as String;
  }

  @override
  Map<String, dynamic> toJson(String state) {
    return {'idlogin': state};
  }
}
