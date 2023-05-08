import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:odella_master/data/network/failure.dart';
import 'package:odella_master/data/network/requests/requsets.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/repostitory/repository.dart';
import 'package:odella_master/domain/usecase/base_usecase.dart';

class UpdatePasswordUseCase implements BaseUseCase<UpdatePasswordUseCaseInput,UpdateStudentModel>{
  Repository _repository;
  UpdatePasswordUseCase(this._repository);

  @override
  Future<Either<Failure, UpdateStudentModel>> execute(UpdatePasswordUseCaseInput input) {
    return _repository.updatePassword(
        UpdatePasswordRequest(
          input.studentId,
            input.oldPassword,
          input.newPassword,
          input.newPassword_confirmation,
          ));
  }

}


class UpdatePasswordUseCaseInput {
  int studentId;
  String newPassword_confirmation;
  String oldPassword;
  String newPassword;

  UpdatePasswordUseCaseInput(
      this.studentId,
      this.oldPassword,
        this.newPassword,
        this.newPassword_confirmation
      );
}