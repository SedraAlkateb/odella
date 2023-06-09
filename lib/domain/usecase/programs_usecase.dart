
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';

class ProgramsUseCase implements BaseUseCase<Null,Program>{
  Repository _repository;

  ProgramsUseCase(this._repository);

  @override
  Future<Either<Failure, Program>> execute(Null input) async{
    return await _repository.programs();
  }


}
