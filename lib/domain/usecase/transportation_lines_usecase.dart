import 'package:dartz/dartz.dart';
import 'package:odella_master/data/network/failure.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/repostitory/repository.dart';
import 'package:odella_master/domain/usecase/base_usecase.dart';

class TransportationLinesUseCase implements BaseUseCase<Null,TransportationLines>{
  Repository _repository;

  TransportationLinesUseCase(this._repository);

  @override
  Future<Either<Failure, TransportationLines>> execute(Null input) async{
    return await _repository.getTransportationLines();

  }


}