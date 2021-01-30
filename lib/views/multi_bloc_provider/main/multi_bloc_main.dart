import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_cubit.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_state.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/mbp_routes/routes.main.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocMain extends StatelessWidget {
  final multiblocMainCubit = MultiBlocMainCubit();
  final hydratedLogin = HydraLogin();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MultiBlocMainCubit>(
          create: (BuildContext context) => multiblocMainCubit,
        ),
        BlocProvider<HydraLogin>(
          create: (BuildContext context) => hydratedLogin,
        )
      ],
      child: MaterialApp(
        title: 'Multi Bloc Demo',
        debugShowCheckedModeBanner: false,
        // home: BlocListener<MultiBlocMainCubit, MultiBlocMainState>(
        home: MultiBlocListener(
          listeners: [
            BlocListener<MultiBlocMainCubit, MultiBlocMainState>(
              listener: (BuildContext context, MultiBlocMainState state) {
                if (state is IsLoginState) {
                  if (state.isLogin) {
                    multiblocMainCubit.appRouter().navigateTo(
                        context, RouteMainMultiBloc.mmultiblochomeRoute.route,
                        replace: true, transition: TransitionType.fadeIn);
                  } else {
                    multiblocMainCubit.appRouter().navigateTo(
                        context, RouteMainMultiBloc.multiblocloginRoute.route,
                        replace: true, transition: TransitionType.fadeIn);
                  }
                }
              },
            ),
            BlocListener<HydraLogin, String>(
              listener: (BuildContext context, String val) {},
            )
          ],
          child: Container(
            child: BlocBuilder<MultiBlocMainCubit, MultiBlocMainState>(
            builder: (BuildContext context, MultiBlocMainState state) {
              if (state is LoadingIsLoginState) {
                return Scaffold(
                  body: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              }

              return Scaffold(
                body: Center(child: Container()),
              );
            },
          )),
        ),
        onGenerateRoute: multiblocMainCubit.appRouterGenerator(),
      ),
    );
  }
}
