import 'package:diversity_challenge/utils/text_styles.dart';
import 'package:diversity_challenge/screens/search_page.dart';
import 'package:flutter/material.dart';

class SearchBox{
  static Widget searchBox(context, {
    bool readOnly = false,
    Function? onTap,
    TextEditingController? controller
  }) {
    return Container(
      height: 35,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        controller: controller ?? TextEditingController(),
        onTap: () => onTap!(),
        readOnly: readOnly,
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(0),
          fillColor: Colors.grey[800]!.withOpacity(0.7),
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          suffixIcon: controller!.text.isEmpty ?
          Text("") : Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.clear, size: 15, color: Colors.black,),
                color: Colors.white,
                onPressed: () {
                  controller.clear();
                },
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade800,),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade800),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static Widget searchBoxCustom(context, {
    TextEditingController? controller
  }) {
    return Row(
      children: [
        Expanded(child: searchBox(context, controller: controller)),
        controller!.text.isEmpty ? Container() :
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size(50, 30),
              alignment: Alignment.centerRight),
          child: Text('Cancel', style: TextStyles.textStyle1,),
          onPressed: (){
            controller.clear();
          },
        )
      ],
    );
  }
}