// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  final UserStatus status;
  final List<User> users;
  final String message;

  const UserState({
    required this.status,
    required this.users,
    required this.message,
  });

  factory UserState.initial() {
    return const UserState(status: UserStatus.initial, users: [], message: '');
  }

  @override
  List<Object> get props => [status, users, message];

  UserState copyWith({UserStatus? status, List<User>? users, String? message}) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;
}
