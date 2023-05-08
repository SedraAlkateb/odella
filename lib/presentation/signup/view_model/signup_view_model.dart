
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/usecase/Universities_usecase.dart';
import 'package:odella_master/domain/usecase/cities_usecase.dart';
import 'package:odella_master/domain/usecase/position_line_usecase.dart';
import 'package:odella_master/domain/usecase/signup_usecase.dart';
import 'package:odella_master/domain/usecase/subscriptions_usecase.dart';
import 'package:odella_master/domain/usecase/transfer_positions_usecase.dart';
import 'package:odella_master/domain/usecase/transportation_lines_usecase.dart';
import 'package:odella_master/presentation/base/base_view_model.dart';
import 'package:odella_master/presentation/common/freezed_data.dart';
import 'package:odella_master/presentation/common/image/image.dart';
import 'package:odella_master/presentation/common/state_renderer/state_renderer.dart';
import 'package:odella_master/presentation/common/state_renderer/state_renderer_imp.dart';

import '../../../domain/usecase/areas_usecase.dart';


class SignUpViewModel extends BaseViewModel
    with ChangeNotifier{
  final SubscriptionsUseCase _subscriptionsUseCase;
  final UniversitiesUsecase _universitiesUsecase;
  final TransferPositionsUseCase _transferPositionsUseCase;
  final TransportationLinesUseCase _transportationLinesUseCase;
  final PositionLineUseCase _positionLineUseCase;
  final CitiesUseCase _citiesUseCase;
  final AreasUseCase _areasUseCase;
  final SignUpUseCase _signUpUseCase;
  SignUpViewModel(this._universitiesUsecase,
      this._subscriptionsUseCase,
      this._transportationLinesUseCase,
      this._transferPositionsUseCase,
      this._positionLineUseCase,
      this._areasUseCase,
      this._citiesUseCase,
      this._signUpUseCase

      );
  List<DataModel> _dataModel=[];
  List<DataSubscriptions> _dataSubscriptions=[];
  List<DataTransferPositions> _dataTransferPositions=[];
  List<DataTransportationLines> _dataTransportationLines=[];
  List<From> _position=[];
  List<City> _cities=[];
  List<Area> _areas=[];

  var signUpObject=SignUpObject(2,1,"asddassad",0,"","","","","",0,0,null,0);
  var isLog=false;
  var isLin=false;
  var isSub =false;
  var isUn=false;
  var isCities=false;
  File ?image1;
var _nnum=0;
  From? positionValue=null;
  Area? areaValue;


int getNum(){
 return _nnum;
}
/*

popPosition(){
  _position=[];
  positionValue=null;
  notifyListeners();
}
  popArea(){
    _areas=[];
    areaValue=null;
    notifyListeners();

  }

setPositionValue(From value){
    positionValue=value;
    notifyListeners();
}
setAreaValue(Area value){
areaValue=value;
notifyListeners();
}

 From? getPositionValue(){
  return  positionValue;

  }
  Area? getAreaValue(String value){
   return areaValue;

  }
 */
setNum(int n){
  _nnum=n;
  notifyListeners();
}
 // bool _disposed = false;
  void setIsLog(bool isLog1){
    isLog =isLog1;
    notifyListeners();
  }
  bool getIsLog(){
    return isLog;
  }
  @override
  void start() {
    getAllInf();
  }
  @override
  void dispose() {
//    _disposed = true;

    super.dispose();
  }
  var index1=100000;
  setC(int index,int id){
    index1=index;
    setSubscriptionId( id);
    notifyListeners();
  }
  @override
 /*
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
  */
  //////////////////////////////////////setter and getter/////////////////

  /////////////////////get
  List<DataModel> getUniversities(){
    return _dataModel;
  }
  List<DataSubscriptions> getDataSubscriptions(){
    return _dataSubscriptions;
  }
  List<DataTransferPositions> getDataTransferPositions(){
    return _dataTransferPositions;
  }
  List<DataTransportationLines> getDataTransportationLines(){
    return _dataTransportationLines;
  }
  List<From> getPosition(){
    return _position;
  }
  List<City> getCities(){
    return _cities;
  }
  List<Area> getAreas(){
    return _areas;
  }
/////////////////////////////////////get
  int getC(){
    return index1;
  }
//////////////////////image////////////////
  setImageFromGallory()async{
    signUpObject= signUpObject.copyWith(image: await pickImage());
    notifyListeners();
  }
  File? getImage(){
    return signUpObject.image;
  }

  /////////////////set

 setUniversities(List<DataModel>universities ){
    _dataModel=universities;
  //  notifyListeners();
  }
  setCities(List<City>cities ){
    _cities=cities;
    //  notifyListeners();
  }
 setDataSubscriptions(  List<DataSubscriptions> subscription){
    _dataSubscriptions=subscription;
    notifyListeners();
  }
   setDataTransferPositions(List<DataTransferPositions> transferPosition){
    _dataTransferPositions=transferPosition;
    notifyListeners();
   }
 setDataTransportationLines( List<DataTransportationLines> transportationLines){
     _dataTransportationLines=transportationLines;
    // notifyListeners();
  }
   setPosition( List<From> posit){
     _position=posit;
     notifyListeners();
  }
  setAreas( List <Area> ListAreas){
    _areas=ListAreas;
    notifyListeners();
  }
  setCityId(int cityId){
    signUpObject= signUpObject.copyWith(city_id: cityId);
    notifyListeners();
  }
  setAreaId(int areaId){
    signUpObject= signUpObject.copyWith(area_id: areaId);
    notifyListeners();
  }
  setStreet(String street){
    signUpObject= signUpObject.copyWith(street: street);
    notifyListeners();
  }
  setSubscriptionId(int subscriptionId){
    signUpObject= signUpObject.copyWith(subscription_id: subscriptionId);
    notifyListeners();
  }
  ///////////////////////////////setSignUp//////////
  setFirstName(String firstName){
    signUpObject= signUpObject.copyWith(firstName: firstName);
    print(signUpObject.firstName);
    notifyListeners();
  }
  setLastName(String lastName){
    signUpObject= signUpObject.copyWith(lastName: lastName);
    notifyListeners();
  }
  setEmail(String email){
    signUpObject= signUpObject.copyWith(email: email);
    notifyListeners();
  }
  setPassword(String password){
    signUpObject= signUpObject.copyWith(password: password);
    notifyListeners();
  }
  setPhoneNumber(String phoneNumber){
    signUpObject= signUpObject.copyWith(phoneNumber: phoneNumber);
    notifyListeners();
  }
  settImage(File image){
    signUpObject= signUpObject.copyWith(image: image);
 //   notifyListeners();
  }
  setTransportationLineId(int transportationLineId){
    signUpObject= signUpObject.copyWith(transportation_line_id: transportationLineId);
  }
  setCitiesId(int citiesId){
    signUpObject= signUpObject.copyWith(city_id: citiesId);
  }
  setTransferPositionId(int transferPositionId){
    signUpObject= signUpObject.copyWith(transfer_position_id: transferPositionId);
  }
  setUniversityId(int universityId){
    signUpObject= signUpObject.copyWith(university_id: universityId);
  }
/*

setPositionValue(From value){
    positionValue=value;
    notifyListeners();
}
setAreaValue(Area value){
areaValue=value;
notifyListeners();
}

 From? getPositionValue(){
  return  positionValue;

  }
  Area? getAreaValue(String value){
   return areaValue;

  }
 */

  /////////////////////async function//////////////////////////////////////////////////
  getSignUp()async{
  //  inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    ( await _signUpUseCase.execute(
        SignUpCaseInput(signUpObject.city_id, signUpObject.area_id, signUpObject.street, signUpObject.subscription_id,
            signUpObject.firstName, signUpObject.lastName, signUpObject.email, signUpObject.password,
            signUpObject.phoneNumber,
            signUpObject.transportation_line_id, signUpObject.transfer_position_id, signUpObject.image,
            signUpObject.university_id)
    ))
        .fold(
            (failure)  {
    //      inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  {
              isLog=true;
             // inputState.add(ContentState());
          notifyListeners();
        });

  }
  //////////////////////////////////////////////////////////////////////
  getPositionLineData(int id)async{

    ( await _positionLineUseCase.execute(id))
        .fold(
            (failure)  {
      //    inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
      //    inputState.add(ContentState());
          setPosition(data.positionLine);
          notifyListeners();
        });

  }
  getUniversitiesData()async{
    ( await _universitiesUsecase.execute(null))
        .fold(
            (failure)  {
        //  inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
              isUn=true;
              setUniversities(data.dataModel);
        });

  }
  getSubscriptionsData()async{
    ( await _subscriptionsUseCase.execute(null))
        .fold(
            (failure)  {
     //     inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
              isSub=true;

              setDataSubscriptions(data.dataSubscriptions);
        });

  }
  getTransferPositionsData()async{
   // inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    ( await _transferPositionsUseCase.execute(null))
        .fold(
            (failure)  {
     //     inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  {
       //   inputState.add(ContentState());
          setDataTransferPositions(data.dataTransfer);
        });

  }
  getTransportationLinesData()async{
    ( await _transportationLinesUseCase.execute(null))
        .fold(
            (failure)  {
         // inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
              isLin=true;
              setDataTransportationLines(data.dataTransportationLines);
        });

  }
  Future<bool> get()async{
    await  getUniversitiesData();
    await getSubscriptionsData();
    await getTransportationLinesData();
    await getCitiesData();
    if(isLin && isSub && isUn &&isCities){
      return true;
    }
    return false;
  }
  getAllInf()async{
//    inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    ( get()).then(
            (value){
          if(value) {
            print(isLin && isSub && isUn && isCities);
  //          inputState.add(ContentState());
          }
        }


    );
  }
////////////////////////////city//
  getAreasByIdCity(int id)async{
    ( await _areasUseCase.execute(id))
        .fold(
            (failure)  {
    //      inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
          //    inputState.add(ContentState());
          setAreas(data.areas!);
          notifyListeners();
        });

  }

  getCitiesData()async{
    ( await _citiesUseCase.execute(null))
        .fold(
            (failure)  {
      //    inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
        },
            (data)  {
          isCities=true;
          setCities(data.cities!);
        });

  }
}

