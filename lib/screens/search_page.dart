import 'package:diversity_challenge/configs/screen.dart';
import 'package:diversity_challenge/cubits/adminModule/cubit.dart';
import 'package:diversity_challenge/cubits/adminModule/state.dart';
import 'package:diversity_challenge/models/searched_user_result.dart';
import 'package:diversity_challenge/utils/search_box.dart';
import 'package:diversity_challenge/utils/user_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController controller = TextEditingController();

  int countController = 0;

  @override
  void initState() {
    super.initState();
    final searchedUserResultCubit = SearchedUserResultCubit.cubit(context);
    searchedUserResultCubit.fetchSearchedUser(controller.text, "clear");

    controller.addListener(() async{
      print(controller.text);
      if (controller.text.length > 3) {
        if(countController != controller.text.length){
          await Future.delayed(Duration(seconds: 1), () {
            countController = controller.text.length;
            searchedUserResultCubit.fetchSearchedUser(controller.text, "null").then((value){
            });
          });
        }
      }
      else{
        searchedUserResultCubit.fetchSearchedUser(controller.text, "clear");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBarTitle: "Add an Admin",
      automaticallyImplyLeading: true,
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: BlocBuilder<SearchedUserResultCubit, SearchedUserResultState>(
            builder: (context, data) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SearchBox.searchBoxCustom(context, controller: controller)),
                  if(data.loading) SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
                  if(data.error) SliverFillRemaining(child: Center(child: Text("Oops! ${data.errorMessage}"))),
                  if(data.data != null && data.data.name != null)
                    SliverToBoxAdapter(
                      child: UserListTile.userListTile(
                      data.data.avatarUrl.toString(),
                      data.data.name.toString(),
                      "Member Since ${data.data.createdAt!.toLocal().toString().substring(0, 11)}",
                      Icon(Icons.more_horiz, size: 40,),
                      context,
                      avatarBorder: true
                     ),
                   ),
                ],
              );
            }
        ),
      ),
    );
  }
}
