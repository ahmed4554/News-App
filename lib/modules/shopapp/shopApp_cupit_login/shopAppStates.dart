import 'package:news_app/models/Shop_app_model/shopAppModel.dart';

abstract class ShopAppStates {}

class ShopAppInitialState extends ShopAppStates {}

class LoadingState extends ShopAppStates {}

class LoginSucces extends ShopAppStates {
  final ShopAppModel? loginModel;
  LoginSucces(this.loginModel);
}

class LoginFailed extends ShopAppStates 
{
  final ShopAppModel? loginModel;
  LoginFailed(this.loginModel);
}

class ChangeMode extends ShopAppStates {}


class ChangeMessageContent extends ShopAppStates {}
