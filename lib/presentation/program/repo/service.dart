import 'dart:convert';
import 'dart:developer';

import 'package:odella_master/presentation/program/constants.dart';
import 'package:odella_master/presentation/program/model/myData.dart';
import 'package:odella_master/presentation/program/repo/api_status.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<Object> getStudentData() async {
    //
    // SecurityContext context = SecurityContext();
    // context.setTrustedCertificates('././assets/ca/lets-encrypt-r3.pem');
    // HttpClient client = HttpClient(context: context);
    // HttpClientRequest request = await client.getUrl(Uri.parse('https://example.com/data'));
    // HttpClientResponse response = await request.close();
    // String responseBody = await response.transform(utf8.decoder).join();
    // print(responseBody);

    try {
      String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3lhYW1lbjEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgzNTQxMDUyLCJleHAiOjE2ODM1NDQ2NTIsIm5iZiI6MTY4MzU0MTA1MiwianRpIjoiOFpkc0VQdm82OXRPQjVvaCIsInN1YiI6IjE4IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.23WcHuNTAH0IN_wFm-WlzG6is3wkwcxLwsmacfC4j3g';
      var urll = Uri.parse(url);
      final response =
          await http.get(urll, headers: {'Authorization': 'Bearer $token'});
      log(response.toString());
      log(response.body.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // Payload payload = payloadFromJson(response.body);
        print(jsonDecode(response.body)['data']);
        return Success(response: payloadFromJson(response.body).data);
      }
      return Failure(code: 104, errorResponse: 'UnKnown Response');
    } catch (e) {
      return Failure(code: 100, errorResponse: 'invalid response');
    }
  }


