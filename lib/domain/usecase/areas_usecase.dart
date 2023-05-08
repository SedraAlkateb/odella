import 'package:dartz/dartz.dart';
import 'package:odella_master/data/network/failure.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/repostitory/repository.dart';
import 'package:odella_master/domain/usecase/base_usecase.dart';

class AreasUseCase implements BaseUseCase<int,Areas>{
  Repository _repository;

  AreasUseCase(this._repository);

  @override
  Future<Either<Failure, Areas>> execute(int input) async{
    return await _repository.getAreasByCityId(input);

  }


}