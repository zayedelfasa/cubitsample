import 'package:cubitloginsample/views/fluro/config/app_router.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/login/cubit/multilogin_cubit.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/login/cubit/multilogin_state.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/mbp_routes/routes.main.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocLogin extends StatelessWidget {
  final MultiLoginCubit _multiLoginCubit = MultiLoginCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: BlocProvider(
            create: (BuildContext cxt) => _multiLoginCubit,
            child: BlocListener<MultiLoginCubit, MultiLoginState>(
              listener: (BuildContext ctx, MultiLoginState state) {
                if (state is SuccessLoginState) {
                  print('Value of SuccessLoginState ${state.isLogin.toString()}');
                  if (state.isLogin) {
                    AppRouter.router.navigateTo(
                        context, RouteMainMultiBloc.mmultiblochomeRoute.route,
                        transition: TransitionType.fadeIn, replace: true);
                  }
                }
              },
              child: BlocBuilder<MultiLoginCubit, MultiLoginState>(
                  builder: (BuildContext cntx, MultiLoginState state) {
                if (state is FetchMultiLoginState) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return RaisedButton(
                  onPressed: () {
                    _multiLoginCubit.getLogin();
                  },
                  child: Text("LOGIN"),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
