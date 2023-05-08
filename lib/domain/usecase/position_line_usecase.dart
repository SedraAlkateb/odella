


import 'package:dartz/dartz.dart';
import 'package:odella_master/data/network/failure.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/repostitory/repository.dart';
import 'package:odella_master/domain/usecase/base_usecase.dart';

class PositionLineUseCase implements BaseUseCase<int,PositionLine>{
  Repository _repository;

  PositionLineUseCase(this._repository);

  @override
  Future<Either<Failure, PositionLine>> execute(int input) async{
    return await _repository.positionLine(input);

  }



}
