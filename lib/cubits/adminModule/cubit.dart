import 'dart:async';
import 'package:diversity_challenge/api_services.dart';
import 'package:diversity_challenge/cubits/adminModule/state.dart';
import 'package:diversity_challenge/models/searched_user_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'repository.dart';


class SearchedUserResultCubit extends Cubit<SearchedUserResultState> {
  static SearchedUserResultCubit cubit(BuildContext context, [bool listen = false]) => BlocProvider.of<SearchedUserResultCubit>(context, listen: listen);

  SearchedUserResultCubit() : super(SearchedUserResultDefault());

  final _repository = SearchedUserResultDataRepository();

  SearchedUserResultDataRepository get repository => _repository;

  Future<void> fetchSearchedUser(userName, clear) async {
    emit(SearchedUserResultFetchLoading());
    try {
      if(clear == "null"){
        final result = await _repository.fetchSearchedUser(userName);
        emit(SearchedUserResultFetchSuccess(data: result));
      }
      else{
        emit(SearchedUserResultFetchSuccess());
      }
    } catch (e) {
      print(e);
      emit(SearchedUserResultFetchFailed(message: e.toString()));
    }
  }
}
