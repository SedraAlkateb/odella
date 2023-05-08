import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:odella_master/data/network/failure.dart';
import 'package:odella_master/data/network/requests/requsets.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/repostitory/repository.dart';
import 'package:odella_master/domain/usecase/base_usecase.dart';

class UpdateStudentUseCase implements BaseUseCase<UpdateStudentUseCaseInput,UpdateStudentModel>{
  Repository _repository;
  UpdateStudentUseCase(this._repository);

  @override
  Future<Either<Failure, UpdateStudentModel>> execute(UpdateStudentUseCaseInput input) {
    return _repository.updateStudent(
        UpdateStudentRequest(
          input.studentId,
          city_id:    input.city_id,
          area_id: input.area_id,
          street:   input.street,
          subscription_id:   input.subscription_id,
          firstName:   input.firstName,
          lastName:   input.lastName,
            phoneNumber:  input.phoneNumber,
          transportation_line_id:  input.transportation_line_id,
          transfer_position_id: input.transfer_position_id,
          image:   input.image,
          university_id: input.university_id,
        ));
  }

}


class UpdateStudentUseCaseInput {
  int studentId;
  int? city_id;
  int? area_id;
  String? street;
  String? subscription_id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? transportation_line_id;
  String? transfer_position_id;
  File? image;
  String? university_id ;

  UpdateStudentUseCaseInput(
      this.studentId,
  {
    this.city_id,
    this.area_id,
    this.street,
    this.subscription_id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.transportation_line_id,
    this.transfer_position_id,
    this.image,
    this.university_id
  });
}