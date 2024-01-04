import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:novandi/core_module/domain/usecases/core_usecase.dart';

part 'get_ip_event.dart';

class GetIpBloc extends Bloc<GetIpEvent, String?> {
  final CoreUsecase coreUsecase;

  GetIpBloc(this.coreUsecase) : super(null) {
    on<OnSearchIp>((event, emit) async {
      final bool isConnected = await InternetConnectionChecker().hasConnection;

      if (isConnected == true) {
        Either<String, Map<String, dynamic>> result =
            await coreUsecase.getApiUsecase();

        result.fold((left) {
          emit('Offline');
        }, (right) {
          emit(right['ip']);
        });
      }
    });
  }
}