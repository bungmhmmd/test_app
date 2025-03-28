import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/errors/user_exception.dart';
import 'package:test_app/data/models/user.dart';
import 'package:test_app/data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserState.initial()) {
    on<UserFetchEvent>((event, emit) async {
      await _fetchUsers(event, emit);
    });
  }

  Future<void> _fetchUsers(
    UserFetchEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final users = await userRepository.getUsers();
      emit(state.copyWith(status: UserStatus.success, users: users));
    } on UserException catch (e) {
      emit(state.copyWith(status: UserStatus.failure, message: e.message));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.failure, message: e.toString()));
    }
  }
}
