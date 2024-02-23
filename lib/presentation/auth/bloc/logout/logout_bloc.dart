import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:point_of_sale_flutter/data/datasources/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LogoutBloc(
    this.authRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Logout>((event, emit) async {
      emit(const _Loading());
      final result = await authRemoteDatasource.logout();
      result.fold(
        (error) => emit(_Error(error)),
        (success) => emit(const _Success()),
      );
    });
  }
}
