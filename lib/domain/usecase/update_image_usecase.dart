import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:odella_master/data/network/failure.dart';
import 'package:odella_master/data/network/requests/requsets.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/repostitory/repository.dart';
import 'package:odella_master/domain/usecase/base_usecase.dart';

class UpdateImageUseCase implements BaseUseCase<UpdateImageUseCaseInput,UpdateStudentModel>{
  Repository _repository;
  UpdateImageUseCase(this._repository);

  @override
  Future<Either<Failure, UpdateStudentModel>> execute(UpdateImageUseCaseInput input) {
    return _repository.updateImage(
        UpdateImage(
          input.studentId,
          input.image
        ));
  }

}


class UpdateImageUseCaseInput {
  int studentId;
  File image;

  UpdateImageUseCaseInput(
      this.studentId,
      this.image
      );
}