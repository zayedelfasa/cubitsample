import 'package:cubitloginsample/views/login/login_cubit.dart';
import 'package:cubitloginsample/views/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final formState = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final loginCubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: BlocProvider(
          create: (context) => loginCubit,
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is FailurLoginState) {
                scaffoldState.currentState.showSnackBar(SnackBar(content: Text(state.errorMessage)));
              } else if (state is SuccessLoginState) {
                scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Succes Login")));
              }
            },
            child: Stack(
              children: [
                Form(
                    key: formState,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controllerUsername,
                            decoration: InputDecoration(
                              hintText: 'Username',
                            ),
                            validator: (value) {
                              return value.isEmpty ? 'Username is empty' : null;
                            },
                          ),
                          TextFormField(
                            controller: controllerPassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) => value.isEmpty ? 'Password is empty' : null,
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              child: Text('LOGIN'),
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: () {
                                if (formState.currentState.validate()) {
                                  String username = controllerUsername.text.trim();
                                  String password = controllerPassword.text.trim();
                                  loginCubit.login(username, password);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
                  if (state is LoadingLoginState) {
                    return Container(
                      color: Colors.black.withOpacity(.5),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
        ));
  }
}
