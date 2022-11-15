//@dart=2.9
import 'package:diversity_challenge/models/manage_admins.dart';
import 'package:diversity_challenge/models/searched_user_result.dart';
import 'package:diversity_challenge/models/searched_user_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


/// ======================= SearchedUserResultState ================== ////

@immutable
class SearchedUserResultState extends Equatable {
  final bool error;
  final bool loading;
  final SearchedUserResult data;
  final String errorMessage;

  const SearchedUserResultState({
    this.data,
    this.errorMessage,
    this.error = false,
    this.loading = false,
  });

  @override
  List<Object> get props => [error, loading, data, errorMessage];
}

class SearchedUserResultDefault extends SearchedUserResultState {}

class SearchedUserResultFetchLoading extends SearchedUserResultState {
  const SearchedUserResultFetchLoading() : super(loading: true);
}

class SearchedUserResultFetchSuccess extends SearchedUserResultState {
  const SearchedUserResultFetchSuccess({SearchedUserResult data}) : super(loading: false, data: data);
}

class SearchedUserResultFetchFailed extends SearchedUserResultState {
  const SearchedUserResultFetchFailed({String message})
      : super(loading: false, errorMessage: message, error: true);
}
