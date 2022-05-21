import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/shopapp/cubit/shopAppCubitData.dart';
import 'package:news_app/modules/shopapp/cubit/states.dart';

class ShopAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubitData, ShopAppDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopAppCubitData c = ShopAppCubitData.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: c.screens[c.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: c.currentIndex,
            onTap: (index) {
              c.ChangeShopAppHomeNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
