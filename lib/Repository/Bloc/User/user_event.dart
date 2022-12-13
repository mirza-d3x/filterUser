part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetAllUserDetailsEvent extends UserEvent {}

class SearchUsers extends UserEvent {
  final String query;

  SearchUsers(this.query);
}
