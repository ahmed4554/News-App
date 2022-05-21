import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constans/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit c = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  c.submit(context);
                },
                child: Text('SKIP'),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    c.changeIndicatorBehavior(index);
                  },
                  controller: c.controller,
                  itemBuilder: (context, index) {
                    return pageViewItem(
                      context,
                      index,
                      model: c.model,
                    );
                  },
                  itemCount: 3,
                ),
              ),
              indicator(
                context,
                cont: c.controller,
                len: c.model.length,
                isLast: c.isLast,
                submit: () {
                  c.submit(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
