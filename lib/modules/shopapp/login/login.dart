import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constans/components.dart';
import 'package:news_app/modules/shopapp/shopApp_cupit_login/shopAppCubit.dart';
import 'package:news_app/modules/shopapp/shopApp_cupit_login/shopAppStates.dart';
import 'package:news_app/network/local/shared_preference.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {
        if (state is LoginSucces) {
          if (state.loginModel!.status!) {
            SharedHelper.setData(
                key: 'token', value: state.loginModel!.data!.token);
            ScaffoldMessenger.of(context).showSnackBar(
              snackbar(massage: state.loginModel!.message, color: Colors.green),
            );
            print(state.loginModel!.message);
            print(state.loginModel!.data!.token);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              snackbar(massage: state.loginModel!.message, color: Colors.red),
            );
          }
        }
      },
      builder: (context, state) {
        ShopAppCubit c = ShopAppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.deepOrange, fontSize: 35.0),
                      ),
                      Text(
                        'login to show our products',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      textInput(
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            c.loginUser(
                              context,
                              email: emailController.text,
                              password: passController.text,
                            );
                          }
                        },
                        inputLabal: 'Email Address',
                        type: TextInputType.emailAddress,
                        isSave: false,
                        preffix: Icons.email_outlined,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'the email musn\'t be empty';
                          }
                        },
                        inputControler: emailController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      textInput(
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            c.loginUser(
                              context,
                              email: emailController.text,
                              password: passController.text,
                            );
                          }
                        },
                        suffix: c.suffixIconFromCubit,
                        inputLabal: 'Password',
                        type: TextInputType.visiblePassword,
                        isSave: c.isSecure,
                        preffix: Icons.lock_outline,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'the password musn\'t be empty';
                          }
                        },
                        inputControler: passController,
                        onSuffixPressed: () {
                          c.changeMode();
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(21.0)),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 50.0,
                        width: double.infinity,
                        child: state is LoadingState
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    c.loginUser(
                                      context,
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.deepOrange,
                              ),
                      ),
                      Row(
                        children: [
                          Text('Don\'t have an account '),
                          TextButton(
                            onPressed: () {},
                            child: Text('REGISTER'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
