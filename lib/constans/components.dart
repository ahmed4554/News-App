import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constans/constans.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

Widget textInput(
    {inputControler,
    required String inputLabal,
    required TextInputType type,
    required bool isSave,
    required IconData preffix,
    IconData? suffix,
    required dynamic validate,
    VoidCallback? onSuffixPressed,
    change,
    dynamic onSubmit}) {
  return TextFormField(
    controller: inputControler,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      label: Text(inputLabal),
      prefixIcon: Icon(preffix),
      suffixIcon: IconButton(
        onPressed: onSuffixPressed,
        icon: Icon(suffix),
      ),
    ),
    keyboardType: type,
    obscureText: isSave,
    validator: validate,
    onChanged: change,
    onFieldSubmitted: onSubmit,
  );
}

void navigatetTo(context, {required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatetOff(context, {required Widget widget}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> router) => false);
}

Widget noResult(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 120.0,
        ),
        separator(),
        Text(
          'Search to view news',
          style: Theme.of(context).textTheme.headline3,
        )
      ],
    ),
  );
}

Widget pageViewItem(
  context,
  index, {
  model,
}) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              model[index].image,
            ),
          ),
        ),
        Text(
          '${model[index].title}',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    ),
  );
}

Widget indicator(context, {required PageController cont, len, isLast ,required Function submit}) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Row(
      children: [
        SmoothPageIndicator(
          controller: cont,
          count: len,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.deepOrange,
            expansionFactor: 4.0,
            spacing: 4.0,
          ),
        ),
        Spacer(),
        FloatingActionButton(
          onPressed: () {
            print('$isLast from the floating action button');
            if (isLast) {
              print('navigated');
              submit();
            } else {
              print('$isLast from the fucntion');
              cont.nextPage(
                  duration: Duration(milliseconds: 750),
                  curve: Curves.easeInOutQuart);
            }
          },
          child: Icon(Icons.arrow_forward_ios),
        ),
      ],
    ),
  );
}

SnackBar snackbar({required String massage, required Color color}) {
  return SnackBar(
    backgroundColor: color,
    duration: Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    content: Text(massage),
    dismissDirection: DismissDirection.down,
  );
}
