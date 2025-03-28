part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class UserFetchEvent extends UserEvent {
  const UserFetchEvent();

  @override
  List<Object> get props => [];
}
