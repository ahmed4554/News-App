import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/shopAppCategoriesData/categoriesData.dart';
import 'package:news_app/models/shopAppDataModel/shopAppDataModel.dart';
import 'package:news_app/modules/shopapp/category/shopAppCategory.dart';
import 'package:news_app/modules/shopapp/cubit/states.dart';
import 'package:news_app/modules/shopapp/favourite/ShopAppFavorite.dart';
import 'package:news_app/modules/shopapp/products/products.dart';
import 'package:news_app/modules/shopapp/settings/settings.dart';
import 'package:news_app/network/end_points.dart';
import 'package:news_app/network/local/shared_preference.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class ShopAppCubitData extends Cubit<ShopAppDataStates> {
  ShopAppCubitData() : super(ShopAppDataIntitialState());
  static ShopAppCubitData get(context) => BlocProvider.of(context);
  List<Widget> screens = [ProductsScreen(), Category(), Favorite(), Settings()];
  int currentIndex = 0;
  void ChangeShopAppHomeNav(int index) {
    currentIndex = index;
    emit(ShopAppDataNavState());
  }

  var token = SharedHelper.getShared(key: 'token');

  ProductsDataModel? datamodel;
  void getHomeData() {
    emit(ShopAppDataLoadingState());
    DioHelper.getData(url: home, token: token).then((value) {
      datamodel = ProductsDataModel.fromJson(value.data);
      emit(ShopAppDataSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(ShopAppDataFailedState());
    });
  }

  CategoriesModel? categoriesDataModel;
  void getCategoriesData() {
    DioHelper.getData(url: getGategories).then((value) {
      categoriesDataModel = CategoriesModel.fromJson(value.data);
      emit(ShopAppCategoriesSuccessState());
    }).catchError((error) {
      emit(ShopAppCategoriesFailedState());
      print(error);
    });
  }
}
