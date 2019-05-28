import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHandler {

    Future<dynamic> getJson(Uri uri) async {
        http.Response response = await http.get(uri);
        return json.decode(response.body).toString();
    }

}