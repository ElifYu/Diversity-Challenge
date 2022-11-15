import 'package:diversity_challenge/configs/screen.dart';
import 'package:diversity_challenge/utils/text_styles.dart';
import 'package:diversity_challenge/models/manage_admins.dart';
import 'package:diversity_challenge/providers/admins_provider.dart';
import 'package:diversity_challenge/providers/coaches_provider.dart';
import 'package:diversity_challenge/providers/moderators_provider.dart';
import 'package:diversity_challenge/screens/search_page.dart';
import 'package:diversity_challenge/utils/search_box.dart';
import 'package:diversity_challenge/utils/titles.dart';
import 'package:diversity_challenge/utils/user_listtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    TextStyles.init();
    super.initState();
    var adminProvider = Provider.of<AdminProvider>(context, listen: false);
    var moderatorsProvider = Provider.of<ModeratorsProvider>(context, listen: false);
    var coachesProvider = Provider.of<CoachesProvider>(context, listen: false);
    adminProvider.fetchAdmins(context);
    moderatorsProvider.fetchModerators(context);
    coachesProvider.fetchCoaches(context);
  }


  @override
  Widget build(BuildContext context) {
    return Screen(
      appBarTitle: 'Manage Admins',
      child: Consumer3<AdminProvider, ModeratorsProvider, CoachesProvider>(
          builder: (context, adminsModel, moderatorsModel, coachesModel, child){
            print(moderatorsModel.allModerators);
            print('+++++++++++++++++');
            return CustomScrollView(
              slivers: [
               SliverToBoxAdapter(child: SearchBox.searchBox(context, readOnly: true, controller: controller, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
               })),
                // Loader
                SliverToBoxAdapter(child: Titles.titleWithIcon('Admins', (){})),

                moderatorsModel.allModerators == null ? _circularProgressIndicator() :
                _userList(adminsModel.allAdmins!.toList()),

                SliverToBoxAdapter(child: Titles.titleWithIcon('Moderators', (){})),

                moderatorsModel.allModerators == null ? _circularProgressIndicator() :
                _userList(moderatorsModel.allModerators!.toList()),

                SliverToBoxAdapter(child: Titles.titleWithIcon('Coaches', (){})),

                coachesModel.allCoaches == null ? _circularProgressIndicator() :
                _userList(coachesModel.allCoaches!.toList())
              ],
            );
          }
      ),
    );
  }

  Widget _userList(List<ManageAdminsModel> data){
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return UserListTile.userListTile(
            data[index].userImage.toString(),
            data[index].userName.toString(),
            "Admin Since ${data[index].userDate.toString()}",
            Icon(Icons.more_horiz, size: 40,),
            context);
      },
        // 40 list items
        childCount: data.length,
      ),
    );
  }

  Widget _circularProgressIndicator(){
    return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
  }
}