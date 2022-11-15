import 'package:diversity_challenge/cubits/adminModule/cubit.dart';
import 'package:diversity_challenge/providers/admins_provider.dart';
import 'package:diversity_challenge/providers/coaches_provider.dart';
import 'package:diversity_challenge/providers/moderators_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderList{
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (_) => SearchedUserResultCubit()),
    ChangeNotifierProvider<AdminProvider>(create: (_) => AdminProvider()),
    ChangeNotifierProvider<ModeratorsProvider>(create: (_) => ModeratorsProvider()),
    ChangeNotifierProvider<CoachesProvider>(create: (_) => CoachesProvider()),
  ];
}