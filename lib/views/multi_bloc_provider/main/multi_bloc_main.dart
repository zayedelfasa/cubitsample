import 'package:cubitloginsample/models/user.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_cubit.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_state.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/mbp_routes/routes.main.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MultiBlocMain extends StatelessWidget {
  final hydratedLogin = HydraLogin();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HydraLogin>(
      create: (BuildContext context) => hydratedLogin,
      child: MaterialApp(
        title: 'Multi Bloc Demo',
        debugShowCheckedModeBanner: false,
        // home: BlocListener<MultiBlocMainCubit, MultiBlocMainState>(
        home: BlocListener<HydraLogin, HydraLoginState>(
          listener: (BuildContext context, HydraLoginState state) {
            print('value of state : ${state.toString()}');
            if(state is HydraIsLoginState ) {
                hydratedLogin.appRouter().navigateTo(
                    context, RouteMainMultiBloc.mmultiblochomeRoute.route,
                    replace: true, 
                    transition: TransitionType.fadeIn
                );
            } else if(state is HydraNotLoginState) {
                hydratedLogin.appRouter().navigateTo(
                    context, RouteMainMultiBloc.multiblocloginRoute.route,
                    replace: true, 
                    transition: TransitionType.fadeIn
                );
            } else if(state is HydraLoadingLoginState) {
              print('masuk sini');
            }
          },
          child: Container(
              child: BlocBuilder<HydraLogin, HydraLoginState>(
              // builder: (BuildContext context, MultiBlocMainState state) {
              builder: (context, state) {
                  print("State on HydraLogin: ${state.toString()}");
                  return Scaffold(
                    body: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
              },
            )),
        ),
        onGenerateRoute: hydratedLogin.appRouterGenerator(),
      ),
    );
  }
}

// class MultiBlocMain extends StatelessWidget {
//   final multiblocMainCubit = MultiBlocMainCubit();
//   final hydratedLogin = HydraLogin();

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<HydraLogin>(
//           create: (BuildContext context) => hydratedLogin,
//         ),
//         BlocProvider<MultiBlocMainCubit>(
//           create: (BuildContext context) => multiblocMainCubit,
//         )
//       ],
//       child: MaterialApp(
//         title: 'Multi Bloc Demo',
//         debugShowCheckedModeBanner: false,
//         // home: BlocListener<MultiBlocMainCubit, MultiBlocMainState>(
//         home: MultiBlocListener(
//           listeners: [
//             BlocListener<MultiBlocMainCubit, MultiBlocMainState>(
//               listener: (BuildContext context, MultiBlocMainState state) {
//                 print('MultiBlocMainCubit state is: ${state.toString()}');
//                 // if (state is IsLoginState) {
//                 //   if (state.isLogin) {
//                 //     multiblocMainCubit.appRouter().navigateTo(
//                 //         context, RouteMainMultiBloc.mmultiblochomeRoute.route,
//                 //         replace: true, 
//                 //         transition: TransitionType.fadeIn);
//                 //   } else {
//                 //     multiblocMainCubit.appRouter().navigateTo(
//                 //         context, RouteMainMultiBloc.multiblocloginRoute.route,
//                 //         replace: true, 
//                 //         transition: TransitionType.fadeIn);
//                 //   }
//                 // }
//               },
//             ),
//             BlocListener<HydraLogin, HydraLoginState>(
//               listener: (BuildContext context, HydraLoginState state) {
//                 print('nilai val adalah ${state.toString()}');
//                 if(state is HydraIsLoginState ) {
//                     hydratedLogin.appRouter().navigateTo(
//                         context, RouteMainMultiBloc.mmultiblochomeRoute.route,
//                         replace: true, 
//                         transition: TransitionType.fadeIn
//                     );
//                 } else if(state is HydraNotLoginState) {
//                     hydratedLogin.appRouter().navigateTo(
//                         context, RouteMainMultiBloc.multiblocloginRoute.route,
//                         replace: true, 
//                         transition: TransitionType.fadeIn
//                     );
//                 }
//               }
//             )
//           ],
//           child: Container(
//             child: BlocBuilder<HydraLogin, HydraLoginState>(
//             // builder: (BuildContext context, MultiBlocMainState state) {
//             builder: (context, state) {
//                 print("State on HydraLogin: ${state.toString()}");
//                 return Scaffold(
//                   body: Center(
//                     child: CupertinoActivityIndicator(),
//                   ),
//                 );
              
//               // if (state is LoadingIsLoginState) {
//               //   return Scaffold(
//               //     body: Center(
//               //       child: CupertinoActivityIndicator(),
//               //     ),
//               //   );
//               // }

//               // return Scaffold(
//               //   body: Center(child: Container()),
//               // );
//             },
//           )),
//         ),
//         onGenerateRoute: hydratedLogin.appRouterGenerator(),
//       ),
//     );
//   }
// }
