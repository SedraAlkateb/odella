import 'package:dartz/dartz.dart';
import 'package:odella_master/data/network/failure.dart';
import 'package:odella_master/data/responses/responses.dart';
import 'package:odella_master/domain/repostitory/repository.dart';
import 'package:odella_master/domain/usecase/base_usecase.dart';

class LogoutUseCase extends BaseUseCase<Null,LogOutResponse> {
  Repository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, LogOutResponse>> execute(Null input)async {
   return await _repository.logout();
  }

}