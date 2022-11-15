import 'package:flutter/material.dart';

class UserListTile{
  static Widget userListTile(String avatarImage,
      String title,
      String subTitle,
      Icon trailingIcon,
      BuildContext context, {
        bool avatarBorder = false
    }){
    return ListTile(
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.all(0),
      leading: avatarBorder ?
      Container(
        child: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(avatarImage),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.green,
            width: 2.5,
          ),
        ),
      ) :
      CircleAvatar(backgroundImage: NetworkImage(avatarImage), radius: 40,),
      title: Text('$title'),
      subtitle: Text('$subTitle',),
      trailing: trailingIcon,
    );
  }
}