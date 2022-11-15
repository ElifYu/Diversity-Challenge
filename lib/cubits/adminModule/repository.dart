part of 'cubit.dart';

class SearchedUserResultDataRepository {
  Future<SearchedUserResult> fetchSearchedUser(userName) => APIServices.fetchSearchedUser(userName);
}
