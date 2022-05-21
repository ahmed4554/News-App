import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constans/components.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitState>(
      listener: (BuildContext context, AppCubitState states) {},
      builder: (BuildContext context, AppCubitState states) {
        AppCubit c = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  c.getBusiness();
                  c.getScience();
                  c.getSport();
                },
                icon: Icon(
                  Icons.refresh,
                  size: 30.0,
                ),
              ),
              IconButton(
                onPressed: ()
                {
                  navigatetTo(context, widget: SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
              ),
              IconButton(
                onPressed: ()
                {
                  c.changeMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  size: 30.0,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              c.change(index);
            },
            items: c.items,
            currentIndex: c.currentIndex,
          ),
          body: c.screens[c.currentIndex],
        );
      },
    );
  }
}
