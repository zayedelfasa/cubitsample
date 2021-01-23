import 'package:cubitloginsample/views/multi_bloc_provider/home/multi_bloc_home.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_cubit.dart';
import 'package:cubitloginsample/views/multi_bloc_provider/main/cubit/multibloc_main_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocMain extends StatelessWidget {

  final multiblocMainCubit = MultiBlocMainCubit(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Bloc Demo',
      debugShowCheckedModeBanner: false,
      home: Container(
        child: BlocProvider(
          create: (BuildContext ctx) => multiblocMainCubit,
          child: BlocBuilder<MultiBlocMainCubit, MultiBlocMainState>(
            builder: (BuildContext context, MultiBlocMainState state) {
              if(state is LoadingIsLoginState) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is IsLoginState) {
                if(state.isLogin) {
                  return MultiBlocHome();
                } else {
                  return Center(child: Text("Login Salah"),);       
                }
              } else {
                return Container();
              }
            },
          )
        ),
      ),
    );
  }
}
