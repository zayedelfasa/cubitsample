import 'package:cubitloginsample/views/multi_bloc_provider/home/multi_bloc_home.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_cubit.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_state.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/mbp_routes/routes.main.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocMain extends StatelessWidget {
  final multiblocMainCubit = MultiBlocMainCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => multiblocMainCubit,
      child: MaterialApp(
        title: 'Multi Bloc Demo',
        debugShowCheckedModeBanner: false,
        home: BlocListener<MultiBlocMainCubit, MultiBlocMainState>(
          listener: (BuildContext context, MultiBlocMainState state) {
            if (state is IsLoginState) {
              if (state.isLogin) {
                multiblocMainCubit.appRouter().navigateTo(
                    context, 
                    RouteMainMultiBloc.mmultiblochomeRoute.route,
                    replace: true, transition: TransitionType.fadeIn);
              } else {
                multiblocMainCubit.appRouter().navigateTo(
                    context, 
                    RouteMainMultiBloc.multiblocloginRoute.route,
                    replace: true, transition: TransitionType.fadeIn);
              }
            }
          },
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
                body: Center(
                  child: Container()
                ),
              );
            },
          )),
        ),
        onGenerateRoute: multiblocMainCubit.appRouterGenerator(),
      ),
    );
  }
}
