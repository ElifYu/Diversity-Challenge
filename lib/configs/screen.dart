import 'package:diversity_challenge/utils/text_styles.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  Widget child;
  String? appBarTitle;
  bool? titleCenter;
  bool automaticallyImplyLeading;
  Screen({Key? key,
    required this.child,
    this.appBarTitle = "",
    this.titleCenter = true,
    this.automaticallyImplyLeading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: titleCenter,
        leading: !automaticallyImplyLeading ?
        Container() : IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(appBarTitle.toString(), style: TextStyles.heading1,),
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            child: Image.network("https://cdn-icons-png.flaticon.com/512/1612/1612619.png",
              color: Theme.of(context).textTheme.headline6!.color,
              fit: BoxFit.cover,
            ),
          ),
        ],
        toolbarHeight: 50,),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: child,
      ),
    );
  }
}
