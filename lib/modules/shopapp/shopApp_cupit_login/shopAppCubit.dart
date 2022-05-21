import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/shopApp/shop_app_layout.dart';
import 'package:news_app/constans/components.dart';
import 'package:news_app/models/Shop_app_model/shopAppModel.dart';
import 'package:news_app/modules/shopapp/shopApp_cupit_login/shopAppStates.dart';
import 'package:news_app/network/end_points.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(ShopAppInitialState());
  static ShopAppCubit get(context) => BlocProvider.of(context);
  bool isSecure = true;
  IconData suffixIconFromCubit = Icons.visibility;
  ShopAppModel? loginModel;
  void changeMode() {
    isSecure = !isSecure;
    isSecure == true
        ? suffixIconFromCubit = Icons.visibility
        : suffixIconFromCubit = Icons.visibility_off_rounded;
    emit(ChangeMode());
  }

  void loginUser(context, {required String email, required password}) {
    emit(LoadingState());
    DioHelper.postData(
      url: login,
      data: {'email': email, 'password': password},
    ).then((value) {
      loginModel = ShopAppModel.init(map: value.data);
      navigatetOff(context, widget: ShopAppHome());
      print(value.data);
      emit(LoginSucces(loginModel));
    }).catchError((error) {
      print(error);
      emit(LoginSucces(loginModel));
    });
  }
}
