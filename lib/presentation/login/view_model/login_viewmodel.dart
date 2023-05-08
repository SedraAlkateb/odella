import 'package:flutter/cupertino.dart';
import 'package:odella_master/domain/models/models.dart';
import 'package:odella_master/domain/usecase/login_usecase.dart';
import 'package:odella_master/presentation/base/base_view_model.dart';
import 'package:odella_master/presentation/common/freezed_data.dart';
import 'package:odella_master/presentation/common/state_renderer/state_renderer.dart';
import 'package:odella_master/presentation/common/state_renderer/state_renderer_imp.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs ,LoginViewModelOutputs , ChangeNotifier{
  bool _isMounted = false;  // LoginViewModel _viewModel =instance<LoginViewModel>();

  final LoginUseCase _loginUseCase ;
  LoginViewModel(this._loginUseCase);
  Authentication ?_authentication;
var loginObject=LoginObject("","");

setAuth(Authentication authentication){
  _authentication=authentication;
  notifyListeners();
}/*

bool getM(){
 return _isMounted;
}
setM(bool b){
  _isMounted=b;
  notifyListeners();
}
*/

bool success(){
  if(_authentication?.status==1){
    return true;
  }
  return false;
}
Authentication? getAuth(){
  return _authentication;
}
String? getRole(){
  return _authentication?.userData?.userModel?.roleModel.first.name.toString();
}
  bool ifStudent(){
    return _authentication?.userData?.userModel?.roleModel.first.name == "student";
  }
  String? getToken(){
    return  _authentication?.userData?.access_token;
  }

@override
  void dispose() {
  _authentication=null;
  loginObject=LoginObject("","");
  super.dispose();
  }

  @override
  void start() {
    // view model should tell view please show content state
    inputState.add(ContentState());
  }


  //////////////////////////input////////////////////////
  login() async{
 inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));

 ( await _loginUseCase.execute(
        LoginUseCaseInput(
            loginObject.userName, loginObject.password
        ))).fold(

            (failure)  {
              inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
        },
            (data)  async{

              // await _appPreferences.setToken();
            inputState.add(ContentState());
            setAuth(data);

            });

 }



  @override
  setPassword(String password) {
    loginObject= loginObject.copyWith(password: password);
notifyListeners();
  }

  @override
  setUserName(String userName) {
    loginObject=loginObject.copyWith(userName: userName);
notifyListeners();
  }
/////////////////////////output//////////////////////////

  @override
  bool isPasswordValid() {
   return loginObject.password.isNotEmpty;

  }

  @override
  bool isUserValid() {
 return loginObject.userName.isNotEmpty;
  }
  bool areAllInputsValid(){
    return isPasswordValid()&&
        isUserValid();
  }
}

////////////////////////////////////////




abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();
}
abstract class LoginViewModelOutputs {
  bool isPasswordValid();
  bool isUserValid();


}