import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constans/components.dart';
import 'package:news_app/constans/constans.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var controller = TextEditingController();
  var type = TextInputType.text;
  var icon = Icons.search;
  var isSave = false;
  var label = 'Search For News';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> search = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: textInput(
                    type: type,
                    preffix: icon,
                    inputControler: controller,
                    inputLabal: label,
                    isSave: isSave,
                    change: (value) {
                      AppCubit.get(context).getSearch(value);
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'The Search Box Must Not Empty';
                      }
                    }),
              ),
              search.length > 0
                  ? Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              buildBusinessItem(search[index], context),
                          separatorBuilder: (context, index) => separator(),
                          itemCount: search.length),
                    )
                  : Expanded(child: noResult(context)),
            ],
          ),
        );
      },
    );
  }
}
