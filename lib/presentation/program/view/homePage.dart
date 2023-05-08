import 'package:flutter/material.dart';
import 'package:odella_master/presentation/program/view_model/program_viewmodel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late bool checked;

  @override
  Widget build(BuildContext context) {
    ProgramViewModel programViewModel = context.watch<ProgramViewModel>();
    //Future<StudentData2> futureModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Program'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  print('object');
                  programViewModel.getStudentdataList();
                },
                child: Icon(Icons.add)),
          )
        ],
      ),
      body: Container(
        height: 200,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Card(
              elevation: 3,
              child: DataTable(
                columnSpacing: 19,
                columns: const [
                  DataColumn(
                    label: Text("days"),
                  ),
                  DataColumn(
                    label: Text("time to go"),
                  ),
                  DataColumn(label: Text("time to arrive")),
                  DataColumn(
                    label: Text("position"),
                  ),
                  DataColumn(
                    label: Text("check go"),
                  ),
                  DataColumn(
                    label: Text("check back"),
                  ),
                ],
                rows: List.generate(programViewModel.studentdataList.length,
                    (index) {
                  final x = programViewModel.studentdataList[index].day?.name;
                  final y = programViewModel.studentdataList[index].start;
                  final z = programViewModel.studentdataList[index].end;
                  final w = programViewModel
                      .studentdataList[index].transfer_position?.name;
                  String? myString = programViewModel
                      .studentdataList[index].confirmAttendance1;
                  bool myBool = myString == '1' ? true : false;
                  String? myString2 = programViewModel
                      .studentdataList[index].confirmAttendance2;
                  bool myBool2 = myString == '1' ? true : false;

                  // final item = programViewModel.studentdataList[index].confirmAttendance1;
                  bool select;
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(x!),
                      ),
                      DataCell(
                        Text(y!),
                      ),
                      DataCell(
                        Text(z!),
                      ),
                      DataCell(Text(w!)),
                      DataCell(
                        Checkbox(
                          value: myBool,
                          onChanged: (bool? value) {
                            setState(() {
                              programViewModel.studentdataList[index]
                                      .confirmAttendance1 =
                                  value!
                                      .toString()
                                      .replaceAll('true', '1')
                                      .replaceAll('false', '0');
                              checked = value;
                            });
                          },
                        ),
                      ),
                      DataCell(
                        Checkbox(
                          value: myBool2,
                          onChanged: (bool? value) {
                            setState(() {
                              programViewModel.studentdataList[index]
                                      .confirmAttendance2 =
                                  value!
                                      .toString()
                                      .replaceAll('true', '1')
                                      .replaceAll('false', '0');
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            // ElevatedButton(onPressed: ()
            //     async {
            //       bool check=checked;
            //       Services.sendConfirmAttendence(check);
            //     }, child: Text('save')),
            //
          ],
        ),
      ),
    );
  }
}
