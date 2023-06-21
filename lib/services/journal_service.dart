import 'dart:convert';

import 'package:flutter_web_api_v1/models/journal.dart';
import 'package:flutter_web_api_v1/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String uri = "http://192.168.0.10:3000/";
  static const String resource = "journals";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$uri$resource";
  }

  // register(String content) {
  //   client.post(Uri.parse(getUrl()), body: {"content": content});
  // }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {'Content-type': 'application/json'},
      body: jsonJournal,
    );

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    return response.body;
  }
}
