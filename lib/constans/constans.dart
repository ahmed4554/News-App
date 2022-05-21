import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constans/components.dart';
import 'package:news_app/modules/web_view/web_view.dart';

Widget buildBusinessItem(article, context) {
  return InkWell(
    onTap: () {
      navigatetTo(
        context,
        widget: WebViewScreen(article['url']),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          separator(),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget separator() {
  return SizedBox(
    width: 20.0,
  );
}

//https://newsapi.org/v2/everything?q=tesla&apiKey=8ca455dadafb4eb5b0d0c44c52514c24
