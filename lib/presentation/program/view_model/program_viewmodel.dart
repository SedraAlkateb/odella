import 'package:flutter/cupertino.dart';
import 'package:odella_master/presentation/program/model/myData.dart';
import 'package:odella_master/presentation/program/repo/api_status.dart';
import 'package:odella_master/presentation/program/repo/service.dart';

class ProgramViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<StudentData> _studentdataList = [];

  bool get isLoading => _isLoading;

  List<StudentData> get studentdataList => _studentdataList;

  ProgramViewModel() {
    getStudentdataList();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setStudentdataList(List<StudentData> studentdataList) {
    _studentdataList = studentdataList;
  }

  getStudentdataList() async {
    setLoading(true);
    var response = await Services.getStudentData();
    if (response is Success) {
      setStudentdataList(response.response as List<StudentData>);
    }
    setLoading(false);
  }
// postStudentdataList()
// {
//
// }
}
